	const_def 2 ; object constants
	const VERMILIONDIGLETTSCAVESPEECHHOUSE_GENTLEMAN

VermilionDiglettsCaveSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VermilionDiglettsCaveSpeechHouseGentlemanScript:
	jumptextfaceplayer VermilionDiglettsCaveSpeechHouseGentlemanText

VermilionDiglettsCaveSpeechHouseGentlemanText:
	text "디그다가 몇 년에 걸쳐서"
	line "판 지하의 통로는"
	cont "먼 마을까지 통해져 있단다"
	done

VermilionDiglettsCaveSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, VERMILION_CITY, 6
	warp_event  3,  7, VERMILION_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  1,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionDiglettsCaveSpeechHouseGentlemanScript, -1
