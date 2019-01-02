	const_def 2 ; object constants
	const SAFARIZONEWARDENSHOME_LASS

SafariZoneWardensHome_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WardensGranddaughter:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	iftrue .AlreadyMet
	writetext WardensGranddaughterText1
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	end
.AlreadyMet:
	writetext WardensGranddaughterText2
	waitbutton
	closetext
	end

WardenPhoto:
	jumptext WardenPhotoText

SafariZonePhoto:
	jumptext SafariZonePhotoText

WardensHomeBookshelf:
	jumpstd picturebookshelf

WardensGranddaughterText1:
	text "나의 할아버지는"
	line "사파리존의 할아버지야!"
	
	para "…… 그랬었는데"
	line "지금 외국을 여행중이야"
	cont "「여행을 떠난다!」라고 하시며"
	cont "혼자 가버리셨어!"
	
	para "그때 사파리존을"
	line "그만뒀어!"
	done

WardensGranddaughterText2:
	text "사파리존이 없어져서"
	line "안타까워하는 사람이 있지만"
	cont "할아버지가 완고하셔서!"
	done

WardenPhotoText:
	text "많은 포켓몬에 둘러싸여"
	line "웃는 얼굴의 할아버지가 찍혀있다!"
	done

SafariZonePhotoText:
	text "어딘가의 대 초원에서"
	line "희귀한 포켓몬이 찍혀 있어!"
	done

SafariZoneWardensHome_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, FUCHSIA_CITY, 6
	warp_event  3,  7, FUCHSIA_CITY, 6

	db 0 ; coord events

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, WardensHomeBookshelf
	bg_event  1,  1, BGEVENT_READ, WardensHomeBookshelf
	bg_event  7,  0, BGEVENT_READ, WardenPhoto
	bg_event  9,  0, BGEVENT_READ, SafariZonePhoto

	db 1 ; object events
	object_event  2,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WardensGranddaughter, -1
