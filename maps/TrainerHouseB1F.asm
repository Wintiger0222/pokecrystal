	const_def 2 ; object constants
	const TRAINERHOUSEB1F_RECEPTIONIST
	const TRAINERHOUSEB1F_CHRIS

TrainerHouseB1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end

TrainerHouseReceptionistScript:
	turnobject PLAYER, UP
	opentext
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .FoughtTooManyTimes
	writetext TrainerHouseB1FIntroText
	buttonsound
	special TrainerHouse
	iffalse .GetCal3Name
	trainertotext CAL, CAL2, MEM_BUFFER_0
	jump .GotName

.GetCal3Name:
	trainertotext CAL, CAL3, MEM_BUFFER_0
.GotName:
	writetext TrainerHouseB1FYourOpponentIsText
	buttonsound
	writetext TrainerHouseB1FAskWantToBattleText
	yesorno
	iffalse .Declined
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	writetext TrainerHouseB1FGoRightInText
	waitbutton
	closetext
	applymovement PLAYER, Movement_EnterTrainerHouseBattleRoom
	opentext
	writetext TrainerHouseB1FCalBeforeText
	waitbutton
	closetext
	special TrainerHouse
	iffalse .NoSpecialBattle
	winlosstext TrainerHouseB1FCalBeatenText, 0
	setlasttalked TRAINERHOUSEB1F_CHRIS
	loadtrainer CAL, CAL2
	startbattle
	reloadmapafterbattle
	iffalse .End
.NoSpecialBattle:
	winlosstext TrainerHouseB1FCalBeatenText, 0
	setlasttalked TRAINERHOUSEB1F_CHRIS
	loadtrainer CAL, CAL3
	startbattle
	reloadmapafterbattle
.End:
	applymovement PLAYER, Movement_ExitTrainerHouseBattleRoom
	end

.Declined:
	writetext TrainerHouseB1FPleaseComeAgainText
	waitbutton
	closetext
	applymovement PLAYER, Movement_TrainerHouseTurnBack
	end

.FoughtTooManyTimes:
	writetext TrainerHouseB1FSecondChallengeDeniedText
	waitbutton
	closetext
	applymovement PLAYER, Movement_TrainerHouseTurnBack
	end

Movement_EnterTrainerHouseBattleRoom:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	turn_head RIGHT
	step_end

Movement_ExitTrainerHouseBattleRoom:
	step UP
	step UP
	step UP
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

Movement_TrainerHouseTurnBack:
	step RIGHT
	turn_head LEFT
	step_end

TrainerHouseB1FIntroText:
	text "이곳은 연습장!"
	line "하루에 한번입니다만"
	cont "트레이너를 상대로"
	cont "대전할 수 있습니다!"
	done
	
TrainerHouseB1FYourOpponentIsText:
;확인필요;앞에 아무말도 없음?
	text_ram wStringBuffer3
	text "님 입니다"
	done

TrainerHouseB1FAskWantToBattleText:
	text "대전을 하겠습니까?"
	done

TrainerHouseB1FGoRightInText:
	text "어서 들어가세요"
	line "바로 대전이 시작됩니다!"
	done

TrainerHouseB1FPleaseComeAgainText:
	text "연습 시합을"
	line "하시려는 트레이너만"
	cont "들어가실 수 있습니다!"
	done
	
TrainerHouseB1FSecondChallengeDeniedText:
	text "손님"
	line "오늘은 두번째이군요!"
	
	para "대전은 하루에 한번씩 입니다"
	line "대단히 죄송합니다"
	done

TrainerHouseB1FCalBeatenText:
	text "졌다……"
	line "유감이다……!"
	done

TrainerHouseB1FCalBeforeText:
	text "너랑 싸우기 위하여"
	line "멀리서 찾아왔다!"
	done

TrainerHouseB1F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9,  4, TRAINER_HOUSE_1F, 3

	db 1 ; coord events
	coord_event  7,  3, SCENE_DEFAULT, TrainerHouseReceptionistScript

	db 0 ; bg events

	db 2 ; object events
	object_event  7,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6, 11, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
