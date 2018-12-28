Route7_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route7UndergroundPathSign:
	jumptext Route7UndergroundPathSignText

Route7LockedDoor:
	jumptext Route7LockedDoorText

Route7UndergroundPathSignText:
	text "…… 알림 전단지다!"
	
	para "최근 지하통로에서"
	line "매너가 나쁜 트레이너들이"
	cont "포켓몬 승부를 하고 있습니다"
	
	para "이웃 주민들로부터"
	line "불만이 있어서"
	cont "지하통로를 폐쇄했습니다!"
	
	para "…… 무지개시티 경찰 알림"
	done

Route7LockedDoorText:
	text "열쇠가 잠겨있다"
	line "……열리지않는다!"
	done
	
Route7_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 15,  6, ROUTE_7_SAFFRON_GATE, 1
	warp_event 15,  7, ROUTE_7_SAFFRON_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5, 11, BGEVENT_READ, Route7UndergroundPathSign
	bg_event  6,  9, BGEVENT_READ, Route7LockedDoor

	db 0 ; object events
