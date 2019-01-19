	const_def 2 ; object constants
	const ROUTE8_BIKER1
	const ROUTE8_BIKER2
	const ROUTE8_BIKER3
	const ROUTE8_SUPER_NERD1
	const ROUTE8_SUPER_NERD2
	const ROUTE8_FRUIT_TREE

Route8_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBikerDwayne:
	trainer BIKER, DWAYNE, EVENT_BEAT_BIKER_DWAYNE, BikerDwayneSeenText, BikerDwayneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerDwayneAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerHarris:
	trainer BIKER, HARRIS, EVENT_BEAT_BIKER_HARRIS, BikerHarrisSeenText, BikerHarrisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerHarrisAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerZeke:
	trainer BIKER, ZEKE, EVENT_BEAT_BIKER_ZEKE, BikerZekeSeenText, BikerZekeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerZekeAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdSam:
	trainer SUPER_NERD, SAM, EVENT_BEAT_SUPER_NERD_SAM, SupernerdSamSeenText, SupernerdSamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdSamAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdTom:
	trainer SUPER_NERD, TOM, EVENT_BEAT_SUPER_NERD_TOM, SupernerdTomSeenText, SupernerdTomBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdTomAfterBattleText
	waitbutton
	closetext
	end

Route8LockedDoor:
	jumptext Route8LockedDoorText

Route8UndergroundPathSign:
	jumptext Route8UndergroundPathSignText

Route8FruitTree:
	fruittree FRUITTREE_ROUTE_8

BikerDwayneSeenText:
	text "우리들 트레이너 그룹"
	line "「관동 포켓몬 연합」!"
	cont "너같은건 이거닷!"
	done

BikerDwayneBeatenText:
	text "미 미안해요-!"
	done

BikerDwayneAfterBattleText:
	text "「관동 포켓몬 연합」은"
	line "영원불멸이닷!"
	done

BikerHarrisSeenText:
	text "우리들의 세력권"
	line "지하통로를 폐쇄했겠다!"
	cont "못 참겠다!"
	done

BikerHarrisBeatenText:
	text "요 용서해주세요!"
	done

BikerHarrisAfterBattleText:
	text "성도의 녀석에게"
	line "져버렸다……!"
	done

BikerZekeSeenText:
	text "「관동 포켓몬 연합」"
	line "잘 부탁한다!"
	done

BikerZekeBeatenText:
	text "죄 죄송해요!"
	done

BikerZekeAfterBattleText:
	text "이제부터는 그다지"
	line "사람들에게 실례를"
	cont "범하지 않도록 하겠어요……네"
	done

SupernerdSamSeenText:
	text "리니어 기차의 메카니즘은"
	line "어떻게 생겼을까?"
	done

SupernerdSamBeatenText:
	text "리니어 기차를 한번만이라도"
	line "보고싶었다 …… ……"
	done

SupernerdSamAfterBattleText:
	text "자석의 힘이란"
	line "대단해-!"
	done

SupernerdTomSeenText:
	text"ほぅ…　きみは　ジムバッジを"
	line"たくさん　もっている　ようだね"
	done

SupernerdTomBeatenText:
	text"おもった　とおりだ…　つよい!"
	done

SupernerdTomAfterBattleText:
	text"ジムバッジを　もっていると"
	line"たいせんが　ゆうりになるんだよ"
	done

Route8LockedDoorText:
	text "열쇠가 잠겨있다!"
	line "……열리지않는다!"
	done
	
Route8UndergroundPathSignText:
	text "…… 전단지가 붙어있다"
	line "읽을 수 없다……!"
	done

Route8_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  4, ROUTE_8_SAFFRON_GATE, 3
	warp_event  4,  5, ROUTE_8_SAFFRON_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event 11,  7, BGEVENT_READ, Route8UndergroundPathSign
	bg_event 10,  5, BGEVENT_READ, Route8LockedDoor

	db 6 ; object events
	object_event 10,  8, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerBikerDwayne, -1
	object_event 10,  9, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerBikerHarris, -1
	object_event 10, 10, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerBikerZeke, -1
	object_event 23,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdSam, -1
	object_event 31, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerSupernerdTom, -1
	object_event 33,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route8FruitTree, -1
