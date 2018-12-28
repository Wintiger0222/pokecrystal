	const_def 2 ; object constants
	const ROUTE41_OLIVINE_RIVAL1
	const ROUTE41_OLIVINE_RIVAL2
	const ROUTE41_OLIVINE_RIVAL3
	const ROUTE41_OLIVINE_RIVAL4
	const ROUTE41_OLIVINE_RIVAL5
	const ROUTE41_SWIMMER_GIRL1
	const ROUTE41_SWIMMER_GIRL2
	const ROUTE41_SWIMMER_GIRL3
	const ROUTE41_SWIMMER_GIRL4
	const ROUTE41_SWIMMER_GIRL5

Route41_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmerfKaylee:
	trainer SWIMMERF, KAYLEE, EVENT_BEAT_SWIMMERF_KAYLEE, SwimmerfKayleeSeenText, SwimmerfKayleeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKayleeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfSusie:
	trainer SWIMMERF, SUSIE, EVENT_BEAT_SWIMMERF_SUSIE, SwimmerfSusieSeenText, SwimmerfSusieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfSusieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfDenise:
	trainer SWIMMERF, DENISE, EVENT_BEAT_SWIMMERF_DENISE, SwimmerfDeniseSeenText, SwimmerfDeniseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDeniseAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfKara:
	trainer SWIMMERF, KARA, EVENT_BEAT_SWIMMERF_KARA, SwimmerfKaraSeenText, SwimmerfKaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKaraAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfWendy:
	trainer SWIMMERF, WENDY, EVENT_BEAT_SWIMMERF_WENDY, SwimmerfWendySeenText, SwimmerfWendyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfWendyAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermCharlie:
	trainer SWIMMERM, CHARLIE, EVENT_BEAT_SWIMMERM_CHARLIE, SwimmermCharlieSeenText, SwimmermCharlieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCharlieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermGeorge:
	trainer SWIMMERM, GEORGE, EVENT_BEAT_SWIMMERM_GEORGE, SwimmermGeorgeSeenText, SwimmermGeorgeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermGeorgeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermBerke:
	trainer SWIMMERM, BERKE, EVENT_BEAT_SWIMMERM_BERKE, SwimmermBerkeSeenText, SwimmermBerkeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermBerkeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermKirk:
	trainer SWIMMERM, KIRK, EVENT_BEAT_SWIMMERM_KIRK, SwimmermKirkSeenText, SwimmermKirkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermKirkAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermMathew:
	trainer SWIMMERM, MATHEW, EVENT_BEAT_SWIMMERM_MATHEW, SwimmermMathewSeenText, SwimmermMathewBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermMathewAfterBattleText
	waitbutton
	closetext
	end

Route41Rock:
; unused
	jumpstd smashrock

Route41HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_41_HIDDEN_MAX_ETHER

SwimmermCharlieSeenText:
	text "이곳의 바다는 따뜻하다"
	line "몸도 풀리고 좋은 기분이다"
	cont "잠시 상대를 해주겠다!"
	done

SwimmermCharlieBeatenText:
	text "물에 너무 오래 있었더니……"
	done

SwimmermCharlieAfterBattleText:
	text "이렇게 멍하게 있으면"
	line "기분이 좋지"
	done

SwimmermGeorgeSeenText:
	text "약간 지쳐있는"
	line "내가 이기면"
	cont "너의 포켓몬을 빌려주지 않을래?"
	done

SwimmermGeorgeBeatenText:
	text "하아 하아"
	done

SwimmermGeorgeAfterBattleText:
	text "진청시티까지는 멀구나"
	line "담청시티까지 돌아가는 것도"
	cont "힘들 것 같고 어떡게 할까?"
	done

SwimmermBerkeSeenText:
	text "소용돌이에 둘러싸인 섬"
	line "비밀이 있다고 생각하지 않니?"
	done

SwimmermBerkeBeatenText:
	text "너의 강함은"
	line "꼭 비밀이 있을꺼야!"
	done

SwimmermBerkeAfterBattleText:
	text "폭풍이 치던 밤의 이야기다"
	
	para "소용돌이 섬으로부터"
	line "커다란 포켓몬이"
	cont "은빛 날개를 펼치며"
	cont "날고 있던 것을 본적이 있어"
	done
	
SwimmermKirkSeenText:
	text "이 바다는 파도가 험해서"
	line "헤엄치기도 힘들단다"
	done
	
SwimmermKirkBeatenText:
	text "지 지쳤다"
	done

SwimmermKirkAfterBattleText:
	text "바닷물의 흐름에 방해를 받아서"
	line "저 섬에 올라갈 수가 없단다"
	done

SwimmermMathewSeenText:
	text "너도 소용돌이 섬의 비밀을"
	line "찾으러 왔는가?"
	done
	
SwimmermMathewBeatenText:
	text "우우 겁난다"
	done
	
SwimmermMathewAfterBattleText:
	text "소용돌이 섬의 비밀……"
	line "어쨌든간에 안에는 캄캄하다"
	done
	
SwimmerfKayleeSeenText:
	text "친구와 함께"
	line "소용돌이 섬을 탐험할꺼야!"
	done
	
SwimmerfKayleeBeatenText:
	text "흐-응 그렇구나"
	done
	
SwimmerfKayleeAfterBattleText:
	text "소용돌이 섬의 지하에는"
	line "커다란 포켓몬이 있다는데"
	cont "어떤 포켓몬일까?"
	done
	
SwimmerfSusieSeenText:
	text "엥? 포켓몬을 타서"
	line "어쩐지 우아하게 보이는구나"
	done
	
SwimmerfSusieBeatenText:
	text "실망이예요"
	done

SwimmerfSusieAfterBattleText:
	text "라프라스에 타고있는 소년"
	line "그런 노래 없었던가?"
	done

SwimmerfDeniseSeenText:
	text "좋은 날씨로구나……"
	line "잠이 오기 딱 좋겠어"
	done

SwimmerfDeniseBeatenText:
	text "히-잉"
	done

SwimmerfDeniseAfterBattleText:
	text "직사광선은 피부의 천적"
	
	para "그렇다고 크림은 바르지 않았어"
	line "바다가 오염이 될 테니까 "
	done

SwimmerfKaraSeenText:
	text "헤엄치면서 쉴 때는"
	line "배영을 하는 것이 좋아"
	cont "피로도 풀리고 기분도 좋아지지!"
	done

SwimmerfKaraBeatenText:
	text "당신쪽이 오히려"
	line "힘이 넘치는군!"
	done

SwimmerfKaraAfterBattleText:
	text "그러고보니까 섬의 저편으로부터"
	line "무언가의 울음소리가 들려왔단다"
	done
	
SwimmerfWendySeenText:
	text "밤이되면"
	line "별가사리가 수면 근처에"
	cont "모인단다"
	done

SwimmerfWendyBeatenText:
	text "……에고에고"
	done

SwimmerfWendyAfterBattleText:
	text "모인 별가사리들이"
	line "일제히 빛을 뿜는다!"
	cont "무서울 정도로 아름다웠단다!"
	done

Route41_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 12, 17, WHIRL_ISLAND_NW, 1
	warp_event 36, 19, WHIRL_ISLAND_NE, 1
	warp_event 12, 37, WHIRL_ISLAND_SW, 1
	warp_event 36, 45, WHIRL_ISLAND_SE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  9, 35, BGEVENT_ITEM, Route41HiddenMaxEther

	db 10 ; object events
	object_event 32,  6, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCharlie, -1
	object_event 46,  8, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermGeorge, -1
	object_event 20, 26, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermBerke, -1
	object_event 32, 30, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermKirk, -1
	object_event 19, 46, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermMathew, -1
	object_event 17,  4, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKaylee, -1
	object_event 23, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfSusie, -1
	object_event 27, 34, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDenise, -1
	object_event 44, 28, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfKara, -1
	object_event  9, 50, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerSwimmerfWendy, -1
