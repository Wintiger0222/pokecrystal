	const_def 2 ; object constants
	const ROUTE2GATE_SCIENTIST

Route2Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route2GateScientistScript:
	jumptextfaceplayer Route2GateScientistText

Route2GateScientistText:
	text "네가 <PLAY_G>?"
	
	para "오박사님의 조수로"
	line "일하고 있는 사람입니다"
	
	para "벌써 여기까지 와있었군요!"
	line "오박사님의 연구소는"
	cont "이 근처의 태초마을입니다"
	done

Route2Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_2, 3
	warp_event  5,  0, ROUTE_2, 4
	warp_event  4,  7, ROUTE_2, 2
	warp_event  5,  7, ROUTE_2, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  6,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route2GateScientistScript, -1
