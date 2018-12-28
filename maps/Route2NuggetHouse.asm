	const_def 2 ; object constants
	const ROUTE2NUGGETHOUSE_FISHER

Route2NuggetHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route2NuggetHouseFisherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_NUGGET_FROM_GUY
	iftrue .GotNugget
	writetext Route2NuggetHouseFisherText
	buttonsound
	verbosegiveitem NUGGET
	iffalse .NoRoom
	setevent EVENT_GOT_NUGGET_FROM_GUY
.GotNugget:
	writetext Route2NuggetHouseFisherText_GotNugget
	waitbutton
.NoRoom:
	closetext
	end

Route2NuggetHouseBookshelf:
; unused
	jumpstd difficultbookshelf

Route2NuggetHouseFisherText:
	text "이야이야 잘 왔다!"
	line "오랜만의 손님이다!"
	
	para "아저씨는 매우 기쁘단다!"
	line "이것을 너에게 주마!"
	done

Route2NuggetHouseFisherText_GotNugget:
	text "그것은 아저씨의 금구슬!"
	line "유용한데 쓰거라!"
	cont "아저씨의 금구슬이니까!"
	done
	
Route2NuggetHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_2, 1
	warp_event  3,  7, ROUTE_2, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  4, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route2NuggetHouseFisherScript, -1
