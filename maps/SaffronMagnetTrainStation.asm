	const_def 2 ; object constants
	const SAFFRONMAGNETTRAINSTATION_OFFICER
	const SAFFRONMAGNETTRAINSTATION_GYM_GUY
	const SAFFRONMAGNETTRAINSTATION_TEACHER
	const SAFFRONMAGNETTRAINSTATION_LASS

SaffronMagnetTrainStation_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end

SaffronMagnetTrainStationOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .MagnetTrainToGoldenrod
	writetext UnknownText_0x18a8a9
	waitbutton
	closetext
	end

.MagnetTrainToGoldenrod:
	writetext UnknownText_0x18a8dd
	yesorno
	iffalse .DecidedNotToRide
	checkitem PASS
	iffalse .PassNotInBag
	writetext UnknownText_0x18a917
	waitbutton
	closetext
	applymovement SAFFRONMAGNETTRAINSTATION_OFFICER, MovementData_0x18a88f
	applymovement PLAYER, MovementData_0x18a898
	setval TRUE
	special MagnetTrain
	warpcheck
	newloadmap MAPSETUP_TRAIN
	applymovement PLAYER, .MovementBoardTheTrain
	wait 20
	end

.MovementBoardTheTrain:
	turn_head DOWN
	step_end

.PassNotInBag:
	writetext UnknownText_0x18a956
	waitbutton
	closetext
	end

.DecidedNotToRide:
	writetext UnknownText_0x18a978
	waitbutton
	closetext
	end

Script_ArriveFromGoldenrod:
	applymovement SAFFRONMAGNETTRAINSTATION_OFFICER, MovementData_0x18a88f
	applymovement PLAYER, MovementData_0x18a8a1
	applymovement SAFFRONMAGNETTRAINSTATION_OFFICER, MovementData_0x18a894
	opentext
	writetext UnknownText_0x18a993
	waitbutton
	closetext
	end

SaffronMagnetTrainStationGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronMagnetTrainStationGymGuyText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronMagnetTrainStationGymGuyText_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronMagnetTrainStationTeacherScript:
	jumptextfaceplayer SaffronMagnetTrainStationTeacherText

SaffronMagnetTrainStationLassScript:
	jumptextfaceplayer SaffronMagnetTrainStationLassText

MovementData_0x18a88f:
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

MovementData_0x18a894:
	step LEFT
	step DOWN
	step DOWN
	step_end

MovementData_0x18a898:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

MovementData_0x18a8a1:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	turn_head UP
	step_end

UnknownText_0x18a8a9:
	text "죄송합니다"
	line "리니어 기차는"
	cont "현재 운행하고 있지 않습니다"
	done

UnknownText_0x18a8dd:
	text "금빛시티행"
	line "이제 곧 출발합니다"
	cont "승차하시겠습니까?"
	done

UnknownText_0x18a917:
	text "승차권을 확인하겠습니다!"
	
	para "네!"
	line "이쪽으로 타십시오!"
	done

UnknownText_0x18a956:
	text "허허 손님"
	line "승차권을 소지하지 않으셨군요"
	done

UnknownText_0x18a978:
	text "다음에 이용을"
	line "부탁드리겠습니다!"
	done

UnknownText_0x18a993:
	text "감사합니다"
	line "노랑시티 도착입니다"
	
	para "다음에도 이용을"
	line "부탁드리겠습니다!"
	done

SaffronMagnetTrainStationGymGuyText:
	text "리니어 기차는"
	line "전기랑 자석의 힘으로"
	cont "달리는 꿈의 초특급열차!"
	
	para "그러나 전기가 없다면……"
	done

SaffronMagnetTrainStationGymGuyText_ReturnedMachinePart:
	text "후우-……"
	
	para "관동과 성도를"
	line "어떡게 왕복을 했을까?"
	done

SaffronMagnetTrainStationTeacherText:
	text "리니어 기차역이 생기기 전에"
	line "이 장소에는 흉내내기 아가씨라는"
	cont "여자아이의 집이 있었단다"
	done

SaffronMagnetTrainStationLassText:
	text "오빠 정기권은 가지고 있어?"
	line "나는 가지고 있어!"
	
	para "노랑시티의 사람들은 모두"
	line "정기권으로"
	cont "리니어 기차에 탄다!"
	done
	
SaffronMagnetTrainStation_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  8, 17, SAFFRON_CITY, 6
	warp_event  9, 17, SAFFRON_CITY, 6
	warp_event  6,  5, GOLDENROD_MAGNET_TRAIN_STATION, 4
	warp_event 11,  5, GOLDENROD_MAGNET_TRAIN_STATION, 3

	db 1 ; coord events
	coord_event 11,  6, SCENE_DEFAULT, Script_ArriveFromGoldenrod

	db 0 ; bg events

	db 4 ; object events
	object_event  9,  9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationOfficerScript, -1
	object_event 10, 14, SPRITE_GYM_GUY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationGymGuyScript, -1
	object_event  6, 11, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationTeacherScript, EVENT_SAFFRON_TRAIN_STATION_POPULATION
	object_event  6, 10, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationLassScript, EVENT_SAFFRON_TRAIN_STATION_POPULATION
