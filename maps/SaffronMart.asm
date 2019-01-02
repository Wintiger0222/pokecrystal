	const_def 2 ; object constants
	const SAFFRONMART_CLERK
	const SAFFRONMART_COOLTRAINER_M
	const SAFFRONMART_COOLTRAINER_F

SaffronMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SaffronMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_SAFFRON
	closetext
	end

SaffronMartCooltrainerMScript:
	jumptextfaceplayer SaffronMartCooltrainerMText

SaffronMartCooltrainerFScript:
	jumptextfaceplayer SaffronMartCooltrainerFText

SaffronMartCooltrainerMText:
	text "보라타운에는"
	line "커다란 라디오타워가 있다!"
	done
	
SaffronMartCooltrainerFText:
	text "더욱 강해지고 싶은데"
	line "아직도 멀었어……"
	
	para "다음에는 강해지는 비결을"
	line "가르쳐 주었으면 좋겠어"
	done

SaffronMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SAFFRON_CITY, 3
	warp_event  3,  7, SAFFRON_CITY, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMartClerkScript, -1
	object_event  7,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SaffronMartCooltrainerMScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronMartCooltrainerFScript, -1
