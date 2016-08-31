dofile('opts.lua')
dofile('util.lua')
dofile('dataset.lua')
threads = require 'threads'

overlap_threshold = 0.4
score_threshold = 1e-3 / (2 * 5)
output_field = 'output_prod'
local subset = 'test'

opts.SCORES_FILES = #arg >= 1 and arg or {opts.PATHS.SCORES_PATTERN:format(subset)}
rois = hdf5_load(opts.SCORES_FILES[1], 'rois')

scores = {}
for i = 1, #opts.SCORES_FILES do
	scores_i = hdf5_load(opts.SCORES_FILES[i], 'outputs/' .. output_field)
	for exampleIdx = 1, #scores_i do
		scores[exampleIdx] = (scores[exampleIdx] or scores_i[exampleIdx]:clone():zero()):add(scores_i[exampleIdx]:div(#opts.SCORES_FILES))
	end
end

local detrespath = dataset_tools.package_submission(opts.PATHS.DATA, dataset, opts.DATASET, subset, 'comp4_det', rois, scores, nms_mask(rois, scores, overlap_threshold, score_threshold))
local opts = opts

if dataset['test'].objectBoxes == nil then
	print('detection mAP cannot be computed for ' .. opts.DATASET .. '. Quitting.')
	print('VOC submission saved in ' .. detrespath)
	os.exit(0)
end

res = {[output_field] = {_mean = nil, by_class = {}}}
APs = torch.FloatTensor(numClasses):zero()

jobQueue = threads.Threads(numClasses)
for classLabelInd, classLabel in ipairs(classLabels) do
	jobQueue:addjob(function()
		os.execute(('matlab -nodisplay -nojvm -nosplash -r "classLabel = \'%s\'; cd(\'%s\'); addpath(\'VOCcode\'); VOCinit; VOCopts.testset = \'%s\'; VOCopts.detrespath = \'%s\'; [rec, prec, ap] = VOCevaldet_fast(VOCopts, \'comp4\', classLabel, false); dlmwrite(sprintf(VOCopts.detrespath, \'resu4\', classLabel), ap); quit;"'):format(classLabel, paths.dirname(opts.PATHS.VOC_DEVKIT_VOCYEAR), subset, detrespath))
		return tonumber(io.open(detrespath:format('resu4', classLabel)):read('*all'))
	end, function(ap) res[output_field].by_class[classLabel] = ap; APs[classLabelInd] = ap; end)
end
jobQueue:synchronize()
os.execute('[ -t 1 ] && reset')

res[output_field]._mean = APs:mean()

json_save(opts.PATHS.DETECTION_MAP, res)
print('result in ' .. opts.PATHS.DETECTION_MAP)
