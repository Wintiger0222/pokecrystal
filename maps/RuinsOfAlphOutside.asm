	const_def 2 ; object constants
	const RUINSOFALPHOUTSIDE_YOUNGSTER1
	const RUINSOFALPHOUTSIDE_SCIENTIST
	const RUINSOFALPHOUTSIDE_FISHER
	const RUINSOFALPHOUTSIDE_YOUNGSTER2
	const RUINSOFALPHOUTSIDE_YOUNGSTER3

RuinsOfAlphOutside_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_RUINSOFALPHOUTSIDE_NOTHING
	scene_script .DummyScene1 ; SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ScientistCallback

.DummyScene0:
	end

.DummyScene1:
	end

.ScientistCallback:
	checkflag ENGINE_UNOWN_DEX
	iftrue .NoScientist
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .MaybeScientist
	jump .NoScientist

.MaybeScientist:
	checkcode VAR_UNOWNCOUNT
	ifgreater 2, .YesScientist
	jump .NoScientist

.YesScientist:
	appear RUINSOFALPHOUTSIDE_SCIENTIST
	setscene SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX
	return

.NoScientist:
	disappear RUINSOFALPHOUTSIDE_SCIENTIST
	setscene SCENE_RUINSOFALPHOUTSIDE_NOTHING
	return

RuinsOfAlphOutsideScientistScene1:
	turnobject RUINSOFALPHOUTSIDE_SCIENTIST, UP
	turnobject PLAYER, DOWN
	jump RuinsOfAlphOutsideScientistSceneContinue

RuinsOfAlphOutsideScientistScene2:
	turnobject RUINSOFALPHOUTSIDE_SCIENTIST, LEFT
	turnobject PLAYER, RIGHT
	jump RuinsOfAlphOutsideScientistSceneContinue

RuinsOfAlphOutsideScientistScript:
	faceplayer
RuinsOfAlphOutsideScientistSceneContinue:
	opentext
	writetext RuinsOfAlphOutsideScientistText
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow RUINSOFALPHOUTSIDE_SCIENTIST, PLAYER
	applymovement RUINSOFALPHOUTSIDE_SCIENTIST, MovementData_0x580ba
	disappear RUINSOFALPHOUTSIDE_SCIENTIST
	stopfollow
	applymovement PLAYER, MovementData_0x580c5
	setmapscene RUINS_OF_ALPH_RESEARCH_CENTER, SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX
	warpcheck
	end

RuinsOfAlphOutsideFisherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_RUINS_COWARD
	iftrue .Next
	setevent EVENT_TALKED_TO_RUINS_COWARD
	writetext RuinsOfAlphOutsideFisherText1
	buttonsound
.Next:
	writetext RuinsOfAlphOutsideFisherText2
	waitbutton
	closetext
	end

RuinsOfAlphOutsideYoungster1Script:
	faceplayer
	opentext
	writetext RuinsOfAlphOutsideYoungster1Text
	waitbutton
	closetext
	end

RuinsOfAlphOutsideYoungster2Script:
	faceplayer
	opentext
	writetext RuinsOfAlphOutsideYoungster2Text
	waitbutton
	closetext
	turnobject RUINSOFALPHOUTSIDE_YOUNGSTER3, UP
	end

TrainerPsychicNathan:
	trainer PSYCHIC_T, NATHAN, EVENT_BEAT_PSYCHIC_NATHAN, PsychicNathanSeenText, PsychicNathanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNathanAfterBattleText
	waitbutton
	closetext
	end

TrainerSuperNerdStan:
	trainer SUPER_NERD, STAN, EVENT_BEAT_SUPER_NERD_STAN, SuperNerdStanSeenText, SuperNerdStanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdStanAfterBattleText
	waitbutton
	closetext
	end

RuinsOfAlphOutsideMysteryChamberSign:
	jumptext RuinsOfAlphOutsideMysteryChamberSignText

RuinsOfAlphSign:
	jumptext RuinsOfAlphSignText

RuinsOfAlphResearchCenterSign:
	jumptext RuinsOfAlphResearchCenterSignText

MovementData_0x580ba:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

MovementData_0x580c5:
	step UP
	step_end

RuinsOfAlphOutsideScientistText:
	text "응?"
	line "그건 포켓몬 도감이구나!"
	cont "좀 보여주지 않을래?"
	
	para "흐음"
	line "여러가지 포켓몬이 있군"
	
	para "아니!!"
	
	para "이 포켓몬은?"
	
	para "유적의 벽에 그려져 있는"
	line "수수께끼의 문양과 닮아있군……"
	
	para "그 모양이 포켓몬이라고 한다면"
	line "더욱더 많이 있을 텐데……"
	
	para "좋아! 내가 너의 도감을"
	line "파워업해서 줄께!"
	cont "따라와!"
	done

SuperNerdStanSeenText:
	text "뭐야 너는?"
	line "연구에 방해되는 일은 곤란하지!"
	done
	
SuperNerdStanBeatenText:
	text "미안……"
	
	para "알 수 없는 것이 많아서"
	line "화가 치밀어 못 견디겠어서……"
	done
	
SuperNerdStanAfterBattleText:
	text "이 유적이 만들어진 것은"
	line "지금으로부터 1500년쯤 전이다"
	
	para "하지만 누가 만들었나 하는 것과"
	line "포켓몬 동상에 의미가 있는가 같은"
	cont "모르는 것만 있어서말야……"
	done
	
PsychicNathanSeenText:
	text "…… 움-"
	line "여기는 이상한곳이구나"
	done
	

PsychicNathanBeatenText:
	text "…… …… ……"
	done

PsychicNathanAfterBattleText:
	text "유적에서 생각에 잠기는 것을"
	line "아주 좋아해"
	done

RuinsOfAlphOutsideMysteryChamberSignText:
	text "수수께끼 석판의 방"
	done
	
RuinsOfAlphSignText:
	text "알프의 유적"
	line "견학중입니다"
	done
	
RuinsOfAlphResearchCenterSignText:
	text "알프의 유적 연구소"
	line "유적의 질문 접수중!"
	done

RuinsOfAlphOutsideFisherText1:;TRNASLATED
	text"유적을　보는　중에"
	line"뭔가의 기척을 느꼈어…"

	para"모두들　겁먹어서　도망쳤다고!"
	line"きみも　きを　つけなよ"
	done

RuinsOfAlphOutsideFisherText2:;TRNASLATED
	text"이　유적에는　뭔가　거대한"
	line"비밀이　숨겨져 있다!"
	cont"…고 생각해…"
	done

RuinsOfAlphOutsideYoungster1Text:;TRNASLATED
	text"안농은 종류가　잔뜩　있으니까"
	line"우리들의 비밀 암호로"
	cont"쓰고 있어!"
	done

RuinsOfAlphOutsideYoungster2Text:;TRNASLATED
	text"ㅇ…ㅣ…　ㅇ…ㅏ…ㅍ…　ㅇ…ㅔ…"
	line"으-음"

	para"응?"

	para"암호를　해독하고 있어!"
	done

RuinsOfAlphOutside_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event  2, 17, RUINS_OF_ALPH_HO_OH_CHAMBER, 1
	warp_event 14,  7, RUINS_OF_ALPH_KABUTO_CHAMBER, 1
	warp_event  2, 29, RUINS_OF_ALPH_OMANYTE_CHAMBER, 1
	warp_event 16, 33, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 1
	warp_event 10, 13, RUINS_OF_ALPH_INNER_CHAMBER, 1
	warp_event 17, 11, RUINS_OF_ALPH_RESEARCH_CENTER, 1
	warp_event  6, 19, UNION_CAVE_B1F, 1
	warp_event  6, 27, UNION_CAVE_B1F, 2
	warp_event  7,  5, ROUTE_36_RUINS_OF_ALPH_GATE, 3
	warp_event 13, 20, ROUTE_32_RUINS_OF_ALPH_GATE, 1
	warp_event 13, 21, ROUTE_32_RUINS_OF_ALPH_GATE, 2

	db 2 ; coord events
	coord_event 11, 14, SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX, RuinsOfAlphOutsideScientistScene1
	coord_event 10, 15, SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX, RuinsOfAlphOutsideScientistScene2

	db 3 ; bg events
	bg_event 16,  8, BGEVENT_READ, RuinsOfAlphOutsideMysteryChamberSign
	bg_event 12, 16, BGEVENT_READ, RuinsOfAlphSign
	bg_event 18, 12, BGEVENT_READ, RuinsOfAlphResearchCenterSign

	db 5 ; object events
	object_event  4, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerPsychicNathan, -1
	object_event 11, 15, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideScientistScript, EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST
	object_event 13, 17, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideFisherScript, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	object_event 14, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideYoungster1Script, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	object_event 12,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideYoungster2Script, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
