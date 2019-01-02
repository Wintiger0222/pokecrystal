	const_def 2 ; object constants
	const VIRIDIANNICKNAMESPEECHHOUSE_POKEFAN_M
	const VIRIDIANNICKNAMESPEECHHOUSE_LASS
	const VIRIDIANNICKNAMESPEECHHOUSE_SPEARY
	const VIRIDIANNICKNAMESPEECHHOUSE_RATTEY

ViridianNicknameSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ViridianNicknameSpeechHousePokefanMScript:
	jumptextfaceplayer ViridianNicknameSpeechHousePokefanMText

ViridianNicknameSpeechHouseLassScript:
	jumptextfaceplayer ViridianNicknameSpeechHouseLassText

Speary:
	opentext
	writetext SpearyText
	cry SPEAROW
	waitbutton
	closetext
	end

Rattey:
	opentext
	writetext RatteyText
	cry RATTATA
	waitbutton
	closetext
	end

ViridianNicknameSpeechHousePokefanMText:
	text "포켓몬의 별명"
	line "잘 생각해서 붙이고 있냐?"
	
	para "별명을 붙여 놓으면"
	line "다른 사람과 교환할 때"
	cont "즐겁지!"
	done

ViridianNicknameSpeechHouseLassText:
	text "깨비참인 깨비꼬랑"
	line "꼬렛인 꼬지다!"
	done

SpearyText:
	text "깨비꼬『참 참참!"
	done

RatteyText:
	text "꼬지『꼬-렛!"
	done

ViridianNicknameSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, VIRIDIAN_CITY, 2
	warp_event  3,  7, VIRIDIAN_CITY, 2

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  2,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianNicknameSpeechHousePokefanMScript, -1
	object_event  5,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianNicknameSpeechHouseLassScript, -1
	object_event  5,  2, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Speary, -1
	object_event  6,  3, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Rattey, -1
