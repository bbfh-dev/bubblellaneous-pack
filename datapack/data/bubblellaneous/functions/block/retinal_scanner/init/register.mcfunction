function bubblellaneous:player/check/is_face_covered
execute if score $Boolean bubblellaneous matches 1 run function bubblellaneous:block/retinal_scanner/message/face_not_recognizable
execute if score $Boolean bubblellaneous matches 0 run function bubblellaneous:block/retinal_scanner/action/register