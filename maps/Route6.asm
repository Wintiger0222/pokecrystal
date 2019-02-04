	const_def 2 ; object constants
	const ROUTE6_POKEFAN_M1
	const ROUTE6_POKEFAN_M2
	const ROUTE6_POKEFAN_M3

Route6_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerPokefanmRex:
	trainer POKEFANM, REX, EVENT_BEAT_POKEFANM_REX, PokefanmRexSeenText, PokefanmRexBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmRexAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmAllan:
	trainer POKEFANM, ALLAN, EVENT_BEAT_POKEFANM_ALLAN, PokefanmAllanSeenText, PokefanmAllanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmAllanAfterBattleText
	waitbutton
	closetext
	end

Route6PokefanMScript:
	jumptextfaceplayer Route6PokefanMText

Route6UndergroundPathSign:
	jumptext Route6UndergroundPathSignText

Route6PokefanMText:
	text "발전소의 사고가"
	line "해결될 때까지"
	cont "통행금지라고 하더군!"
	done

Route6UndergroundPathSignText:
	text "여기서부터 지하통로"
	line "블루시티 …… 갈색시티"
	done
	
PokefanmRexSeenText:;TRANSLATED
	text"그러니까 제 코코리가"
	line"세계에서　제일　귀엽다고요!"
	done

PokefanmRexBeatenText:;TRANSLATED
	text"나의 코코리가-!"
	done

PokefanmRexAfterBattleText:;TRANSLATED
	text"봐주세요 이"
	line"코코리가 어리광부리는 모습을!"

	para"너무 귀엽고 귀여워서"
	line"심정지가 느껴지지 않나요?"
	done

PokefanmAllanSeenText:;TRANSLATED
	text"그러니까 제 깜지곰이"
	line"세계에서　제일　귀엽다고요!"
	done

PokefanmAllanBeatenText:;TRANSLATED
	text"나의 깜지곰이-!"
	done

PokefanmAllanAfterBattleText:;TRANSLATED
	text"봐주세요 이"
	line"깜지곰이 어리광부리는 모습을!"

	para"너무 귀엽고 귀여워서"
	line"심정지가 느껴지지 않나요?"
	done

Route6_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17,  3, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event  6,  1, ROUTE_6_SAFFRON_GATE, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event 19,  5, BGEVENT_READ, Route6UndergroundPathSign

	db 3 ; object events
	object_event 17,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 2, Route6PokefanMScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event  9, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerPokefanmRex, -1
	object_event 10, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerPokefanmAllan, -1
