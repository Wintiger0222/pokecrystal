	const_def 2 ; object constants
	const ROUTE40BATTLETOWERGATE_ROCKER
	const ROUTE40BATTLETOWERGATE_TWIN

Route40BattleTowerGate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ShowSailor

.ShowSailor:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	return

Route40BattleTowerGateRockerScript:
IF DEF(_MOBILE)
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer UnknownText_0x9f66f
.mobile
	jumptextfaceplayer UnknownText_0x9f6ba
ELSE

	jumptextfaceplayer Route40BattleTowerGateRockerText
ENDC

Route40BattleTowerGateTwinScript:
IF DEF(_MOBILE)
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer UnknownText_0x9f783
.mobile
ENDC
	jumptextfaceplayer Route40BattleTowerGateTwinText


UnknownText_0x9f66f:;TRANSLATED
	text "너도 배틀타워　보러왔어?"
	line "그런데 아직 못 들어가겠네…"
	done

UnknownText_0x9f6ba:;TRANSLATED
	text "배틀타워가 오픈 했으니까"
	line "빨리 가보고 싶긴 한데"

	para "이겼을 때 어떤"
	line "멋진 대사를 쓸 지를 아직"
	cont "정하지 못해서 말이야"
	done
	
Route40BattleTowerGateRockerText:;TRANSLATED
	text "배틀타워 가려는 거야?"

	para "비밀인데 많이 이기면"
	line "특별한 선물이 있다는 거 같아"
	done

UnknownText_0x9f783:;TRANSLATED
	text "배틀타워에서 승부할 수 있을"
	line "그때를 대비해서"
	cont "포켓몬을 훈련시킨다!"
	done

Route40BattleTowerGateTwinText:;TRANSLATED
	text "쓰고 싶은 포켓몬들"
	line "레벨이 제각각이니까"
	cont "지금부터 훈련하러 가는 거야!"
	done

Route40BattleTowerGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  7, ROUTE_40, 1
	warp_event  5,  7, ROUTE_40, 1
	warp_event  4,  0, BATTLE_TOWER_OUTSIDE, 1
	warp_event  5,  0, BATTLE_TOWER_OUTSIDE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateRockerScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	object_event  7,  5, SPRITE_TWIN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateTwinScript, -1
