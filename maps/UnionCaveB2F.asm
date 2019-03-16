	const_def 2 ; object constants
	const UNIONCAVEB2F_ROCKER
	const UNIONCAVEB2F_COOLTRAINER_F1
	const UNIONCAVEB2F_COOLTRAINER_F2
	const UNIONCAVEB2F_POKE_BALL1
	const UNIONCAVEB2F_POKE_BALL2
	const UNIONCAVEB2F_LAPRAS

UnionCaveB2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Lapras

.Lapras:
	checkflag ENGINE_UNION_CAVE_LAPRAS
	iftrue .NoAppear
	readvar VAR_WEEKDAY
	ifequal FRIDAY, .Appear
.NoAppear:
	disappear UNIONCAVEB2F_LAPRAS
	return

.Appear:
	appear UNIONCAVEB2F_LAPRAS
	return

UnionCaveLapras:
	faceplayer
	cry LAPRAS
	loadwildmon LAPRAS, 20
	startbattle
	disappear UNIONCAVEB2F_LAPRAS
	setflag ENGINE_UNION_CAVE_LAPRAS
	reloadmapafterbattle
	end

TrainerCooltrainermNick:
	trainer COOLTRAINERM, NICK, EVENT_BEAT_COOLTRAINERM_NICK, CooltrainermNickSeenText, CooltrainermNickBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermNickAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfGwen:
	trainer COOLTRAINERF, GWEN, EVENT_BEAT_COOLTRAINERF_GWEN, CooltrainerfGwenSeenText, CooltrainerfGwenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfGwenAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfEmma:
	trainer COOLTRAINERF, EMMA, EVENT_BEAT_COOLTRAINERF_EMMA, CooltrainerfEmmaSeenText, CooltrainerfEmmaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfEmmaAfterBattleText
	waitbutton
	closetext
	end

UnionCaveB2FElixer:
	itemball ELIXER

UnionCaveB2FHyperPotion:
	itemball HYPER_POTION

CooltrainermNickSeenText:
	text "세상에는 2종류의"
	line "인간이 있지"
	cont "센스가 있는 자와 없는 자"
	
	para "너는 어떨까?"
	done
	
CooltrainermNickBeatenText:
	text "아름답게 빛나고 있다!"
	done

CooltrainermNickAfterBattleText:
	text "너의 포켓몬 센스"
	line "장래가 있어 보인다"
	cont "반드시 강하게 될꺼야!"
	done

CooltrainerfGwenSeenText:
	text "현재 여기서 특훈을 하고있어"
	line "너 상대해주지 않을래?"
	done

CooltrainerfGwenBeatenText:
	text "아앙 졌어!"
	line "너무 강하잖아!"
	done

CooltrainerfGwenAfterBattleText:
	text "강해질 때까지"
	line "남몰래 특훈을 할꺼야!"
	done
	
CooltrainerfEmmaSeenText:
	text "좋아하는 포켓몬이 있다면"
	line "어떠한 곳이든 갈꺼야"
	cont "그것이 트레이너라는 것이지!"
	done

CooltrainerfEmmaBeatenText:
	text "나는 승부하는 것보다 포켓몬을"
	line "귀여워하는 것을 좋아하는지도 몰라"
	done
CooltrainerfEmmaAfterBattleText:
	text "매주 딱 한번씩만"
	line "물가에 포켓몬이 찾아와"
	
	para "그 포켓몬을 만나고싶은데……"
	line "라고 생각하고 있어"
	done

UnionCaveB2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  3, UNION_CAVE_B1F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event 15, 19, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermNick, -1
	object_event  5, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfGwen, -1
	object_event  3, 30, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfEmma, -1
	object_event 16,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCaveB2FElixer, EVENT_UNION_CAVE_B2F_ELIXER
	object_event 12, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCaveB2FHyperPotion, EVENT_UNION_CAVE_B2F_HYPER_POTION
	object_event 11, 31, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, UnionCaveLapras, EVENT_UNION_CAVE_B2F_LAPRAS
