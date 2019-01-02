	const_def 2 ; object constants
	const VIRIDIANCITY_GRAMPS1
	const VIRIDIANCITY_GRAMPS2
	const VIRIDIANCITY_FISHER
	const VIRIDIANCITY_YOUNGSTER

ViridianCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VIRIDIAN
	return

ViridianCityCoffeeGramps:
	faceplayer
	opentext
	writetext ViridianCityCoffeeGrampsQuestionText
	yesorno
	iffalse .no
	writetext ViridianCityCoffeeGrampsBelievedText
	waitbutton
	closetext
	end

.no:
	writetext ViridianCityCoffeeGrampsDoubtedText
	waitbutton
	closetext
	end

ViridianCityGrampsNearGym:
	faceplayer
	opentext
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue .BlueReturned
	writetext ViridianCityGrampsNearGymText
	waitbutton
	closetext
	end

.BlueReturned:
	writetext ViridianCityGrampsNearGymBlueReturnedText
	waitbutton
	closetext
	end

ViridianCityDreamEaterFisher:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM42_DREAM_EATER
	iftrue .GotDreamEater
	writetext ViridianCityDreamEaterFisherText
	buttonsound
	verbosegiveitem TM_DREAM_EATER
	iffalse .NoRoomForDreamEater
	setevent EVENT_GOT_TM42_DREAM_EATER
.GotDreamEater:
	writetext ViridianCityDreamEaterFisherGotDreamEaterText
	waitbutton
.NoRoomForDreamEater:
	closetext
	end

ViridianCityYoungsterScript:
	jumptextfaceplayer ViridianCityYoungsterText

ViridianCitySign:
	jumptext ViridianCitySignText

ViridianGymSign:
	jumptext ViridianGymSignText

ViridianCityWelcomeSign:
	jumptext ViridianCityWelcomeSignText

TrainerHouseSign:
	jumptext TrainerHouseSignText

ViridianCityPokecenterSign:
	jumpstd pokecentersign

ViridianCityMartSign:
	jumpstd martsign

ViridianCityCoffeeGrampsQuestionText:
	text "우익-! 힉…… 기다리거라!"
	line "내 이야기를 잘 들어라!"
	
	para "이렇게 보여도 옛날에는"
	line "포켓몬을 잡는 것에"
	cont "솜씨가 좋았단다"
	
	para "믿어주겠니?"
	done

ViridianCityCoffeeGrampsBelievedText:
	text "그렇지 그렇단다"
	line "음음"
	done

ViridianCityCoffeeGrampsDoubtedText:
	text "뭔소리냐 이녀석아!"
	
	para "내가 조금만 더 젊었어도"
	line "실력을 보여줄 수 있을텐데"
	done

ViridianCityGrampsNearGymText:
	text "최근까지 이 체육관은"
	line "관장이 없었단다"
	
	para "최근 태초마을의 젊은이가"
	line "관장이 되었다는 것 같은데"
	cont "……그런데 지금은 부재중이란다"
	done

ViridianCityGrampsNearGymBlueReturnedText:
	text "관장이랑 싸울텐가"
	line "힘내거라"
	done

ViridianCityDreamEaterFisherText:
	text "후아-!"
	line "햇볕을 쪼이고 있다가"
	cont "잠들어버렸다!"
	
	para "…… 이상한 꿈을 꿨다"
	line "슬리프가 꿈을 먹고 있었다!"
	cont "……오잉? 나 언제부턴가"
	cont "기술머신을 가지고 있었는데?"
	
	para "움"
	line "뭔가 불길해!"
	cont "이거 너 줄께!"
	done

ViridianCityDreamEaterFisherGotDreamEaterText:
	text "기술머신42의 내용물은……"
	line "꿈먹기란다……"
	cont "…… 쿨-……"
	done

ViridianCityYoungsterText:
	text "상록숲에는"
	line "못보던 도구가 잔뜩"
	cont "떨어져 있다는 이야기가 있다!"
	done

ViridianCitySignText:
	text "이곳은 상록시티"
	line "상록은 녹색 영원한 색깔"
	done
	
ViridianGymSignText:
	text "상록시티 포켓몬 체육관"
	line "관장 ……"
	cont "다음은 글을 읽을 수 없다!"
	done

ViridianCityWelcomeSignText:
	text "석영고원 입구의 마을"
	line "상록시티에 어서오세요!"
	done

TrainerHouseSignText:
	text "트레이너 하우스"
	line "용사들이 모이는 장소"
	done

ViridianCity_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 32,  7, VIRIDIAN_GYM, 1
	warp_event 21,  9, VIRIDIAN_NICKNAME_SPEECH_HOUSE, 1
	warp_event 23, 15, TRAINER_HOUSE_1F, 1
	warp_event 29, 19, VIRIDIAN_MART, 2
	warp_event 23, 25, VIRIDIAN_POKECENTER_1F, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event 17, 17, BGEVENT_READ, ViridianCitySign
	bg_event 27,  7, BGEVENT_READ, ViridianGymSign
	bg_event 19,  1, BGEVENT_READ, ViridianCityWelcomeSign
	bg_event 21, 15, BGEVENT_READ, TrainerHouseSign
	bg_event 24, 25, BGEVENT_READ, ViridianCityPokecenterSign
	bg_event 30, 19, BGEVENT_READ, ViridianCityMartSign

	db 4 ; object events
	object_event 18,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityCoffeeGramps, -1
	object_event 30,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianCityGrampsNearGym, -1
	object_event  6, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianCityDreamEaterFisher, -1
	object_event 17, 21, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianCityYoungsterScript, -1
