	const_def 2 ; object constants
	const OLIVINEGOODRODHOUSE_FISHING_GURU

OlivineGoodRodHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoodRodGuru:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOOD_ROD
	iftrue .AlreadyGotItem
	writetext OfferGoodRodText
	yesorno
	iffalse .DontWantIt
	writetext GiveGoodRodText
	buttonsound
	verbosegiveitem GOOD_ROD
	writetext GaveGoodRodText
	waitbutton
	closetext
	setevent EVENT_GOT_GOOD_ROD
	end

.DontWantIt:
	writetext DontWantGoodRodText
	waitbutton
	closetext
	end

.AlreadyGotItem:
	writetext HaveGoodRodText
	waitbutton
	closetext
	end

GoodRodHouseBookshelf:
; unused
	jumpstd picturebookshelf

OfferGoodRodText:
	text "담청이라고 하면 바다!"
	line "바다라고 하면 낚시!"
	
	para "나는 여기서 30년"
	line "낚시를 하고 있단다"
	
	para "너도 바다를 향해"
	line "낚시로 도전을 해보면 어떻겠니?"
	done

GiveGoodRodText:
	text "오호!"
	line "낚시꾼 탄생이구나!"
	done

GaveGoodRodText:
	text "바다뿐만 아니라"
	line "물이 있는 곳이라면"
	cont "어디든 낚싯대를 사용해도 좋다"
	done

DontWantGoodRodText:
	text "뭐라고!"
	line "낚시가 싫어! 믿을 수 없구만"
	done

HaveGoodRodText:
	text "어때? 큰 놈을 낚았느냐?"
	done

OlivineGoodRodHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, OLIVINE_CITY, 6
	warp_event  3,  7, OLIVINE_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoodRodGuru, -1
