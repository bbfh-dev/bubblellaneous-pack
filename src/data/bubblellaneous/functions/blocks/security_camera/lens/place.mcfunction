$data merge entity @s {Tags: ["+bubblellaneous", "local.camera_lens", "--local.new"], item: {id: "item_frame", Count: 1b, tag:{CustomModelData: $(custom_model_data), block_data:{id: "$(id)", sound: "$(sound)", base: "$(base)", name: "$(name)", facing: "$(facing)", custom_model_data: $(custom_model_data), material_count: $(material_count)}}}, transformation: {translation: [0f, 0.5f, 0f], scale: [1.01f, 1.01f, 1.01f]}}
function bubblellaneous:blocks/security_camera/blockstate/set_camera {rotate: 0}

#!/overlay 1.20.2-LATEST | data modify entity @s teleport_duration set value 2
