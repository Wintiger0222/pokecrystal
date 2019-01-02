	const_def 2 ; object constants
	const VIOLETMART_CLERK
	const VIOLETMART_GRANNY
	const VIOLETMART_COOLTRAINER_M

VioletMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VioletMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_VIOLET
	closetext
	end

VioletMartGrannyScript:
	jumptextfaceplayer VioletMartGrannyText

VioletMartCooltrainerMScript:
	jumptextfaceplayer VioletMartCooltrainerMText

VioletMartGrannyText:
	text "잡은지 얼마 안 되었어도"
	line "약한 포켓몬도 키우면"
	cont "언젠가 강해질 것입니다"
	
	para "중요한 것은 포켓몬에 대한"
	line "애정이라고 생각합니다"
	done

VioletMartCooltrainerMText:
	text "포켓몬도 도구를 지니고 있지만"
	line "상처약이라든가 해독제라든가"
	cont "사람이 만든 도구는"
	cont "사용방법을 모르는 것 같다"
	done

VioletMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, VIOLET_CITY, 1
	warp_event  3,  7, VIOLET_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletMartClerkScript, -1
	object_event  7,  6, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletMartGrannyScript, -1
	object_event  5,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletMartCooltrainerMScript, -1
