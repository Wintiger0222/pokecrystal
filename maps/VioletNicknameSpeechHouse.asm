	const_def 2 ; object constants
	const VIOLETNICKNAMESPEECHHOUSE_TEACHER
	const VIOLETNICKNAMESPEECHHOUSE_LASS
	const VIOLETNICKNAMESPEECHHOUSE_BIRD

VioletNicknameSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VioletNicknameSpeechHouseTeacherScript:
	jumptextfaceplayer VioletNicknameSpeechHouseTeacherText

VioletNicknameSpeechHouseLassScript:
	jumptextfaceplayer VioletNicknameSpeechHouseLassText

VioletNicknameSpeechHouseBirdScript:
	faceplayer
	opentext
	writetext VioletNicknameSpeechHouseBirdText
	cry PIDGEY
	waitbutton
	closetext
	end

VioletNicknameSpeechHouseTeacherText:
	text "좋아하는 음식의 이름을"
	line "붙이고 있단다"
	
	para "우리 딸이 붙이고 있는 것은"
	line "포켓몬의 별명이란다"
	done

VioletNicknameSpeechHouseLassText:
	text "내 구구"
	line "딸기이라고 하는 이름이야!"
	done

VioletNicknameSpeechHouseBirdText:
	text "딸기『구-구!"
	done

VioletNicknameSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, VIOLET_CITY, 4
	warp_event  4,  7, VIOLET_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  2,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletNicknameSpeechHouseTeacherScript, -1
	object_event  6,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletNicknameSpeechHouseLassScript, -1
	object_event  5,  2, SPRITE_BIRD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VioletNicknameSpeechHouseBirdScript, -1
