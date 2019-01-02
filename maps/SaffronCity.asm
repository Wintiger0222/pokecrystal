	const_def 2 ; object constants
	const SAFFRONCITY_LASS1
	const SAFFRONCITY_POKEFAN_M
	const SAFFRONCITY_COOLTRAINER_M
	const SAFFRONCITY_COOLTRAINER_F
	const SAFFRONCITY_FISHER
	const SAFFRONCITY_YOUNGSTER1
	const SAFFRONCITY_YOUNGSTER2
	const SAFFRONCITY_LASS2

SaffronCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_SAFFRON
	return

SaffronCityLass1Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronCityLass1Text
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronCityLass1Text_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronCityPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronCityPokefanMText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronCityPokefanMText_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronCityCooltrainerMScript:
	jumptextfaceplayer SaffronCityCooltrainerMText

SaffronCityCooltrainerFScript:
	jumptextfaceplayer SaffronCityCooltrainerFText

SaffronCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronCityFisherText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronCityFisherText_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronCityYoungster1Script:
	jumptextfaceplayer SaffronCityYoungster1Text

SaffronCityYoungster2Script:
	jumptextfaceplayer SaffronCityYoungster2Text

SaffronCityLass2Script:
	jumptextfaceplayer SaffronCityLass2Text

SaffronCitySign:
	jumptext SaffronCitySignText

SaffronGymSign:
	jumptext SaffronGymSignText

FightingDojoSign:
	jumptext FightingDojoSignText

SilphCoSign:
	jumptext SilphCoSignText

MrPsychicsHouseSign:
	jumptext MrPsychicsHouseSignText

SaffronCityMagnetTrainStationSign:
	jumptext SaffronCityMagnetTrainStationSignText

SaffronCityPokecenterSign:
	jumpstd pokecentersign

SaffronCityMartSign:
	jumpstd martsign

SaffronCityLass1Text:
	text "이곳은 흉내내기가 뛰어난"
	line "여자아이의 집이란다"
	
	para "사람들의 흉내를 내서 말하니까"
	line "말을 하면 곤란해지지"
	done

SaffronCityLass1Text_ReturnedMachinePart:
	text "흉내내기 잘하는 여자아이"
	line "소중히 여기던"
	cont "삐삐인형을 잃어버려서"
	cont "낙심하고 있어"
	done

SaffronCityPokefanMText:
	text "성도에서 왔는가?"
	
	para "리니어 기차가 움직인다면"
	line "바로 성도에 돌아갈 수 있는데!"
	done

SaffronCityPokefanMText_ReturnedMachinePart:
	text "성도에서 왔는가?"
	
	para "리니어에 타면 눈 깜짝할 새에"
	line "성도에 돌아갈 수 있지!"
	done

SaffronCityCooltrainerMText:
	text "자 체육관 트레이너랑 싸우자!"
	line "라는건 체육관에 들어와서……"
	
	para "지금은 하고 있지 않다"
	line "옆의 체육관에 들어가버렸다……"
	cont "좀 창피했었어……"
	done

SaffronCityCooltrainerFText:
	text "이곳은 포켓몬 제품으로"
	line "유명한 실프주식회사!"
	
	para "그래서 예전에"
	line "로켓단에게 표적이 되었었단다"
	done

SaffronCityFisherText:
	text "우걱우걱……"
	
	para "발전소 큰일난 것 같군"
	line "쩝 쩝……"
	done

SaffronCityFisherText_ReturnedMachinePart:
	text "쩝 쩝……"
	
	para "발전소에 큰일이 났었다"
	line "는 것 같아 우걱우걱……"
	cont "배가 빵빵해졌다……!"
	done

SaffronCityYoungster1Text:
	text "처음 들어가는 뒷골목이라"
	line "약간 두근거리네!"
	done

SaffronCityYoungster2Text:
	text "트레이너가 많이 모이는"
	line "트레이너 하우스라는 건물이"
	cont "상록시티에 있데!"
	done
	
SaffronCityLass2Text:
	text "라디오 방송에서 이 마을이"
	line "소개되었단다"
	
	para "살고있는 마을을 칭찬받아서"
	line "약간 부끄러워!"
	done

SaffronCitySignText:
	text "이곳은 노랑시티"
	line "노랑은 금빛으로 빛나는 색깔"
	done
	
SaffronGymSignText:
	text "노랑시티 포켓몬 체육관"
	line "관장 초련"
	cont "에스퍼 레이디"
	done

FightingDojoSignText:
	text "누구든지 오세요"
	line "격투 도장!"
	done

SilphCoSignText:
	text "실프주식회사"
	line "본사 빌딩"
	done

MrPsychicsHouseSignText:
	text "에스퍼 아저씨의 집"
	done
	
SaffronCityMagnetTrainStationSignText:
	text "이곳은 노랑시티"
	line "리니어 기차역"
	done

SaffronCity_MapEvents:
	db 0, 0 ; filler

	db 15 ; warp events
	warp_event 26,  3, FIGHTING_DOJO, 1
	warp_event 34,  3, SAFFRON_GYM, 1
	warp_event 25, 11, SAFFRON_MART, 2
	warp_event  9, 29, SAFFRON_POKECENTER_1F, 1
	warp_event 27, 29, MR_PSYCHICS_HOUSE, 1
	warp_event  8,  3, SAFFRON_MAGNET_TRAIN_STATION, 2
	warp_event 18, 21, SILPH_CO_1F, 1
	warp_event  9, 11, COPYCATS_HOUSE_1F, 1
	warp_event 18,  3, ROUTE_5_SAFFRON_GATE, 3
	warp_event  0, 24, ROUTE_7_SAFFRON_GATE, 3
	warp_event  0, 25, ROUTE_7_SAFFRON_GATE, 4
	warp_event 16, 33, ROUTE_6_SAFFRON_GATE, 1
	warp_event 17, 33, ROUTE_6_SAFFRON_GATE, 2
	warp_event 39, 22, ROUTE_8_SAFFRON_GATE, 1
	warp_event 39, 23, ROUTE_8_SAFFRON_GATE, 2

	db 0 ; coord events

	db 8 ; bg events
	bg_event 21,  5, BGEVENT_READ, SaffronCitySign
	bg_event 33,  5, BGEVENT_READ, SaffronGymSign
	bg_event 25,  5, BGEVENT_READ, FightingDojoSign
	bg_event 15, 21, BGEVENT_READ, SilphCoSign
	bg_event 25, 29, BGEVENT_READ, MrPsychicsHouseSign
	bg_event 11,  5, BGEVENT_READ, SaffronCityMagnetTrainStationSign
	bg_event 10, 29, BGEVENT_READ, SaffronCityPokecenterSign
	bg_event 26, 11, BGEVENT_READ, SaffronCityMartSign

	db 8 ; object events
	object_event  7, 14, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityLass1Script, -1
	object_event 19, 30, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SaffronCityPokefanMScript, -1
	object_event 32,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityCooltrainerMScript, -1
	object_event 20, 24, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityCooltrainerFScript, -1
	object_event 27, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityFisherScript, -1
	object_event 15, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronCityYoungster1Script, -1
	object_event 35, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityYoungster2Script, -1
	object_event 19,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityLass2Script, -1
