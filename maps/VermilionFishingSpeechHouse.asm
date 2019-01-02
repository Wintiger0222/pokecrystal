	const_def 2 ; object constants
	const VERMILIONFISHINGSPEECHHOUSE_FISHING_GURU

VermilionFishingSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FishingDude:
	jumptextfaceplayer FishingDudeText

FishingDudesHousePhoto:
	jumptext FishingDudesHousePhotoText

FishingDudesHouseBookshelf:
; unused
	jumpstd picturebookshelf

FishingDudeText:
	text "나는 낚시아저씨"
	line "낚시 형제의 형"

	para "너는 분노의 호수에 있던"
	line "낚시꾼을 알고있니?"

	para "그녀석은 세상에서 가장"
	line "엄청난 잉어킹을 잡고싶어해"

	para "혹시 너가 낚아올린 잉어킹을"
	line "보여주는건 어떠니?"
	cont "그가 꿈꾸던 것일지도 몰라!"
	done

FishingDudesHousePhotoText:
	text "낚시를 하고 있는 사람이"
	line "찍혀있다……"
	cont "매우 즐거운 것 같다"
	done
	
VermilionFishingSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, VERMILION_CITY, 1
	warp_event  3,  7, VERMILION_CITY, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, FishingDudesHousePhoto

	db 1 ; object events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FishingDude, -1
