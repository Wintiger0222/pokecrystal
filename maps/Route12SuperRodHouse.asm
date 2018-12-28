	const_def 2 ; object constants
	const ROUTE12SUPERRODHOUSE_FISHING_GURU

Route12SuperRodHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route12SuperRodHouseFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUPER_ROD
	iftrue .GotSuperRod
	writetext OfferSuperRodText
	yesorno
	iffalse .Refused
	writetext GiveSuperRodText
	buttonsound
	verbosegiveitem SUPER_ROD
	iffalse .NoRoom
	setevent EVENT_GOT_SUPER_ROD
.GotSuperRod:
	writetext GaveSuperRodText
	waitbutton
	closetext
	end

.Refused:
	writetext DontWantSuperRodText
	waitbutton
.NoRoom:
	closetext
	end

SuperRodHouseBookshelf:
; unused
	jumpstd picturebookshelf

OfferSuperRodText:
	text "나는 낚시아저씨의 동생"
	line "너는 낚시를 좋아할 만한"
	cont "얼굴을 하고 있구나!"
	cont "내 눈이 틀린 적이 없다!"
	
	para "어떠냐?"
	line "맞았지?"
	done
	
GiveSuperRodText:
	text "움 움!"
	line "생각한대로군!"
	cont "낚시를 좋아하는 너에게 이걸주마!"
	cont "이름하여 대단한 낚싯대란다!"
	done
	
GaveSuperRodText:
	text "여러 장소에서"
	line "낚시를 즐기길 바란다!"
	
	para "사용하는 낚싯대에 따라"
	line "잡히는 포켓몬이 다르단다!"
	done

DontWantSuperRodText:
	text "얼라리?"
	line "나의 예상이 빗나갔군……"
	done

Route12SuperRodHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_12, 1
	warp_event  3,  7, ROUTE_12, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route12SuperRodHouseFishingGuruScript, -1
