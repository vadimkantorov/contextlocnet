function load_base_model(modelPath)
	local vggf = torch.load(modelPath)

	local conv_layers = nn.Sequential()
	for i = 1, 14 do
		conv_layers:add(vggf:get(i))
	end

	local fc_layers = nn.Sequential()
	for i = 17, 22 do
		fc_layers:add(vggf:get(i))
	end

	return {
		conv_layers = conv_layers, 
		fc_layers = fc_layers, 
		channel_order = 'bgr', 
		spatial_scale = 1 / 16, 
		fc7_output_size = 4096,
		pooled_height = 6, 
		pooled_width = 6, 
		spp_correction_params = {offset0 = -18, offset = 0.0}
		--spp_correction_params = {offset0 = -18.0, offset = 9.5}
	}
end
