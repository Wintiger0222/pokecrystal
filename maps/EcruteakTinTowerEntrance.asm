	const_def 2 ; object constants
	const ECRUTEAKTINTOWERENTRANCE_SAGE1
	const ECRUTEAKTINTOWERENTRANCE_SAGE2
	const ECRUTEAKTINTOWERENTRANCE_SAGE3
	const ECRUTEAKTINTOWERENTRANCE_GRAMPS

EcruteakTinTowerEntrance_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .InitializeSages

.DummyScene0:
	end

.DummyScene1:
	end

.InitializeSages:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .DontBlockTower
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .DontBlockTower
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .BlockTower
	return

.BlockTower:
	clearevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_RANG_CLEAR_BELL_2
	setevent EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_WANDERING_SAGE
	checkitem CLEAR_BELL
	iftrue .NoClearBell
	setscene SCENE_DEFAULT
.NoClearBell:
	return

.DontBlockTower:
	clearevent EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_WANDERING_SAGE
	return

EcruteakTinTowerEntrance_CoordEvent1:
	checkevent EVENT_RANG_CLEAR_BELL_2
	iftrue EcruteakTinTowerEntrance_CoordEvent_DontMove
	applymovement ECRUTEAKTINTOWERENTRANCE_SAGE2, MovementData_0x980c7
	moveobject ECRUTEAKTINTOWERENTRANCE_SAGE1, 4, 6
	appear ECRUTEAKTINTOWERENTRANCE_SAGE1
	pause 5
	disappear ECRUTEAKTINTOWERENTRANCE_SAGE2
	end

EcruteakTinTowerEntrance_CoordEvent2:
	checkevent EVENT_RANG_CLEAR_BELL_1
	iftrue EcruteakTinTowerEntrance_CoordEvent_DontMove
	applymovement ECRUTEAKTINTOWERENTRANCE_SAGE1, MovementData_0x980cc
	moveobject ECRUTEAKTINTOWERENTRANCE_SAGE2, 5, 6
	appear ECRUTEAKTINTOWERENTRANCE_SAGE2
	pause 5
	disappear ECRUTEAKTINTOWERENTRANCE_SAGE1
	end

EcruteakTinTowerEntrance_CoordEvent_DontMove:
	end

EcruteakTinTowerEntranceSageScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .CheckForClearBell
	checkflag ENGINE_FOGBADGE
	iftrue .BlockPassage_GotFogBadge
	writetext EcruteakTinTowerEntranceSageText
	waitbutton
	closetext
	end

.BlockPassage_GotFogBadge:
	writetext EcruteakTinTowerEntranceSageText_GotFogBadge
	waitbutton
	closetext
	end

.CheckForClearBell:
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .AllowedThrough
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .RangClearBell
	checkitem CLEAR_BELL
	iftrue .GotClearBell
	writetext EcruteakTinTowerEntranceSageText_NoClearBell
	waitbutton
	closetext
	end

.GotClearBell:
	writetext EcruteakTinTowerEntranceSageText_HearsClearBell
	waitbutton
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_RANG_CLEAR_BELL_2
	clearevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

.AllowedThrough:
	writetext EcruteakTinTowerEntranceSageText_PleaseDoGoOn
	waitbutton
	closetext
	end

.RangClearBell:
	writetext EcruteakTinTowerEntranceSageText_HeardClearBell
	waitbutton
	closetext
	end

EcruteakTinTowerEntranceWanderingSageScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_CLEAR_BELL
	iftrue .GotClearBell
	writetext EcruteakTinTowerEntranceWanderingSageText
	waitbutton
	closetext
	end

.GotClearBell:
	writetext EcruteakTinTowerEntranceWanderingSageText_GotClearBell
	waitbutton
	closetext
	end

EcruteakTinTowerEntranceGrampsScript:
	jumptextfaceplayer EcruteakTinTowerEntranceGrampsText

MovementData_0x980c7:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	turn_head DOWN
	step_end

MovementData_0x980cc:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	turn_head DOWN
	step_end

EcruteakTinTowerEntranceSageText:
	text "방울탑은 인주시티의"
	line "체육관 배지를 가진 사람만이"
	cont "올라갈 수 있는 신성한 탑"

	para "죄송합니다만"
	line "물러나 주십시오"
	done

EcruteakTinTowerEntranceSageText_GotFogBadge:
	text "방울탑은 인주시티의"
	line "체육관 배지를 가진 사람만이"
	cont "오를 수 있는 신성한 탑"

	para "오오!"

	para "그것은 인주시티의 체육관 배지!"

	para "어서 지나가십시오"
	done

EcruteakTinTowerEntranceSageText_NoClearBell:
	text"큰일이 났습니다"

	para"죄송합니다만"
	line"물러나 주십시오"

	para"……마음을 평안하게 하는것"

	para"3인방은"
	line"어려운 말씀을 하시는군"
	done
	
EcruteakTinTowerEntranceSageText_HearsClearBell:
	text"큰일이 났습니다"

	para"죄송합니다만"
	line"물러나 주십시오"

	para"………"

	para"오오!"

	para"그 소리는 투명한 방울!"

	para"이 얼마나 아름다운 소리입니까"

	para"이런 깨끗한 음색은 지금까지"
	line"한 번도 들어보질 못했어요"

	para"그 방울은 가진 사람의 마음을"
	line"소리로 맑게 씻겨줍니다"

	para"당신이라면…"

	para"방울소리처럼 나아갈 수"
	line"있을지도 모르겠습니다"

	para"어서 지나가십시오"
	done

EcruteakTinTowerEntranceSageText_PleaseDoGoOn:
	text"어서 지나가십시오"
	done

EcruteakTinTowerEntranceSageText_HeardClearBell:
	text"그 방울은 가진 사람의 마음을"
	line"소리로 맑게 씻겨줍니다"

	para"당신이라면…"

	para"방울소리처럼 나아갈 수"
	line"있을지도 모르겠습니다"

	para"어서 지나가십시오"
	done
	
EcruteakTinTowerEntranceWanderingSageText:
	text"이 앞에 있는 방울탑은"
	line"신성하고 마음이 평안해지는"
	cont"9층탑 입니다"
	done

EcruteakTinTowerEntranceWanderingSageText_GotClearBell:
	text "방울탑이 흔들렸습니다!"

	para "틀림없이 제일 꼭대기에"
	line "포켓몬이 돌아왔을 것 입니다"
	done

EcruteakTinTowerEntranceGrampsText:
	text "2개의 탑에"
	line "2마리의 포켓몬……"

	para "그러나 탑 하나가 불에 탄 뒤에"
	line "포켓몬도 날아간 채 돌아오지않아."
	done

EcruteakTinTowerEntrance_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  4, 17, ECRUTEAK_CITY, 3
	warp_event  5, 17, ECRUTEAK_CITY, 3
	warp_event  5,  3, ECRUTEAK_TIN_TOWER_ENTRANCE, 4
	warp_event 17, 15, ECRUTEAK_TIN_TOWER_ENTRANCE, 3
	warp_event 17,  3, WISE_TRIOS_ROOM, 3

	db 2 ; coord events
	coord_event  4,  7, SCENE_DEFAULT, EcruteakTinTowerEntrance_CoordEvent1
	coord_event  5,  7, SCENE_DEFAULT, EcruteakTinTowerEntrance_CoordEvent2

	db 0 ; bg events

	db 4 ; object events
	object_event  4,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceSageScript, EVENT_RANG_CLEAR_BELL_1
	object_event  5,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceSageScript, EVENT_RANG_CLEAR_BELL_2
	object_event  6,  9, SPRITE_SAGE, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceWanderingSageScript, EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_WANDERING_SAGE
	object_event  3, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceGrampsScript, EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_WANDERING_SAGE
