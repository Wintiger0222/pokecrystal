	const_def 2 ; object constants
	const SOULHOUSE_MRFUJI
	const SOULHOUSE_TEACHER
	const SOULHOUSE_LASS
	const SOULHOUSE_GRANNY

SoulHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MrFuji:
	jumptextfaceplayer MrFujiText

SoulHouseTeacherScript:
	jumptextfaceplayer SoulHouseTeacherText

SoulHouseLassScript:
	jumptextfaceplayer SoulHouseLassText

SoulHouseGrannyScript:
	jumptextfaceplayer SoulHouseGrannyText

MrFujiText:
	text "등나무노인『야아 잘 왔단다"
	
	para "흠흠…… 너는 포켓몬을"
	line "소중하게 키우고 있는 것 같구나"
	
	para "이곳은 포켓몬을 사랑하는 사람들이"
	line "모이는 장소"
	
	para "어떠냐 너도 기도해주겠느냐"
	line "포켓몬들이 기뻐할께야"
	done

SoulHouseTeacherText:
	text "포켓몬의 묘지는"
	line "이것만이 아닌 것 같아"
	
	para "등나무노인만 들어갈 수 있는"
	line "방이 많이 있다고 하던데"
	done

SoulHouseLassText:
	text "엄마랑 함께"
	line "성묘하러 왔단다……"
	done
	
SoulHouseGrannyText:
	text "함께 지냈던"
	line "포켓몬은"
	cont "손자같은 것이지……"
	done

SoulHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, LAVENDER_TOWN, 6
	warp_event  5,  7, LAVENDER_TOWN, 6

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  4,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFuji, -1
	object_event  7,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseTeacherScript, -1
	object_event  2,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseLassScript, -1
	object_event  1,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseGrannyScript, -1
