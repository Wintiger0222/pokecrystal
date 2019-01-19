	const_def 2 ; object constants
	const BLACKTHORNDRAGONSPEECHHOUSE_GRANNY
	const BLACKTHORNDRAGONSPEECHHOUSE_EKANS

BlackthornDragonSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlackthornDragonSpeechHouseGrannyScript:
	jumptextfaceplayer BlackthornDragonSpeechHouseGrannyText

BlackthornDragonSpeechHouseDratiniScript:
	opentext
	writetext BlackthornDragonSpeechHouseDratiniText
	cry DRATINI
	waitbutton
	closetext
	end

; unused
BlackthornDragonSpeechHousePictureBookshelf:
	jumpstd picturebookshelf

; unused
BlackthornDragonSpeechHouseMagazineBookshelf:
	jumpstd magazinebookshelf

BlackthornDragonSpeechHouseGrannyText:
	text "이 검은먹시티에는"
	line "드래곤을 자유롭게 다루는"
	cont "일족이 살고있어"

	para "그때문에 이 마을에는"
	line "드래곤에 관한 전설들이"
	cont "많이 남아있는 것같아"
	done

BlackthornDragonSpeechHouseDratiniText:
	text "미뇽『미뇽-"
	done

BlackthornDragonSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, BLACKTHORN_CITY, 2
	warp_event  3,  7, BLACKTHORN_CITY, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornDragonSpeechHouseGrannyScript, -1
	object_event  5,  5, SPRITE_EKANS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornDragonSpeechHouseDratiniScript, -1
