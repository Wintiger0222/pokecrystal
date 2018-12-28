	const_def 2 ; object constants
	const ROUTE11_YOUNGSTER1
	const ROUTE11_YOUNGSTER2
	const ROUTE11_YOUNGSTER3
	const ROUTE11_YOUNGSTER4
	const ROUTE11_FRUIT_TREE

Route11_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerYoungsterOwen:
	trainer YOUNGSTER, OWEN, EVENT_BEAT_YOUNGSTER_OWEN, YoungsterOwenSeenText, YoungsterOwenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterOwenAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterJason:
	trainer YOUNGSTER, JASON, EVENT_BEAT_YOUNGSTER_JASON, YoungsterJasonSeenText, YoungsterJasonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJasonAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicHerman:
	trainer PSYCHIC_T, HERMAN, EVENT_BEAT_PSYCHIC_HERMAN, PsychicHermanSeenText, PsychicHermanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicHermanAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicFidel:
	trainer PSYCHIC_T, FIDEL, EVENT_BEAT_PSYCHIC_FIDEL, PsychicFidelSeenText, PsychicFidelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFidelAfterBattleText
	waitbutton
	closetext
	end

Route11Sign:
	jumptext Route11SignText

Route11FruitTree:
	fruittree FRUITTREE_ROUTE_11

Route11HiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_11_HIDDEN_REVIVE

YoungsterOwenSeenText:
	text "포켓몬에게 교활함이란 없다!"
	line "정정당당하게 싸우자!"
	done

YoungsterOwenBeatenText:
	text "얼레?"
	line "이럴리가……"
	done

YoungsterOwenAfterBattleText:
	text "정정당당하게 싸웠다!"
	line "그래서 나는 후회하지 않아!"
	done

YoungsterJasonSeenText:
	text "짧은바지로 풀숲을 걸으면"
	line "잎사귀가 찔러서 간지러워!"
	done

YoungsterJasonBeatenText:
	text "으아-악!"
	line "졌-다!"
	done

YoungsterJasonAfterBattleText:
	text "풀숲에서 더욱 포켓몬을"
	line "많이 잡으려고!"
	done

PsychicHermanSeenText:
	text "…… …… ……"
	done
	
PsychicHermanBeatenText:
	text "…… …… ……"
	done
	
PsychicHermanAfterBattleText:
	text "…… …… ……"
	
	para "눈을 감고있는 사이에"
	line "져버렸다……"
	done
	
PsychicFidelSeenText:
	text "나에게는 보인다……"
	line "그대의 모든 것이……"
	done
	

PsychicFidelBeatenText:
	text "그대의 강함은"
	line "예지 할 수 없었다……"
	done

PsychicFidelAfterBattleText:
	text "믿음의 힘……"
	
	para "포겟몬들을 믿고있기 때문에"
	line "너는 강한 것이군……"
	done

Route11SignText:
	text "이곳은 11번 도로"
	done

Route11_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3,  7, BGEVENT_READ, Route11Sign
	bg_event 32,  5, BGEVENT_ITEM, Route11HiddenRevive

	db 5 ; object events
	object_event 22, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterOwen, -1
	object_event 20,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterJason, -1
	object_event 28,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicHerman, -1
	object_event  8,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicFidel, -1
	object_event 32,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route11FruitTree, -1
