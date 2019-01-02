	const_def 2 ; object constants
	const UNIONCAVE1F_POKEFAN_M1
	const UNIONCAVE1F_SUPER_NERD
	const UNIONCAVE1F_POKEFAN_M2
	const UNIONCAVE1F_FISHER1
	const UNIONCAVE1F_FISHER2
	const UNIONCAVE1F_POKE_BALL1
	const UNIONCAVE1F_POKE_BALL2
	const UNIONCAVE1F_POKE_BALL3
	const UNIONCAVE1F_POKE_BALL4

UnionCave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerPokemaniacLarry:
	trainer POKEMANIAC, LARRY, EVENT_BEAT_POKEMANIAC_LARRY, PokemaniacLarrySeenText, PokemaniacLarryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacLarryAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerRussell:
	trainer HIKER, RUSSELL, EVENT_BEAT_HIKER_RUSSELL, HikerRussellSeenText, HikerRussellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerRussellAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerDaniel:
	trainer HIKER, DANIEL, EVENT_BEAT_HIKER_DANIEL, HikerDanielSeenText, HikerDanielBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerDanielAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherBill:
	trainer FIREBREATHER, BILL, EVENT_BEAT_FIREBREATHER_BILL, FirebreatherBillSeenText, FirebreatherBillBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBillAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherRay:
	trainer FIREBREATHER, RAY, EVENT_BEAT_FIREBREATHER_RAY, FirebreatherRaySeenText, FirebreatherRayBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherRayAfterBattleText
	waitbutton
	closetext
	end

UnionCave1FGreatBall:
	itemball GREAT_BALL

UnionCave1FXAttack:
	itemball X_ATTACK

UnionCave1FPotion:
	itemball POTION

UnionCave1FAwakening:
	itemball AWAKENING

UnionCave1FUnusedSign:
; unused
	jumptext UnionCave1FUnusedSignText

HikerRussellSeenText:
	text "고동마을에 가는거니?"
	line "이곳을 빠져나갈 수 있을까"
	cont "내 포켓몬으로 시험해보겠다!"
	done

HikerRussellBeatenText:
	text "어이쿠……"
	done

HikerRussellAfterBattleText:
	text "우-음! 결정했어!"
	
	para "내 포켓몬이 강해질때까지"
	line "여기서 한 발짝도 나가지 않겠어!"
	done

PokemaniacLarrySeenText:
	text "포켓몬 찾으러 동서남북"
	line "너도 포켓몬 찾으러왔니?"
	
	para "그럼 나의 포켓몬 수집"
	line "경쟁상대로군!"
	done

PokemaniacLarryBeatenText:
	text "아아 내 포켓몬……"
	done

PokemaniacLarryAfterBattleText:
	text "금요일이 될 때마다"
	line "동굴 저편으로부터"
	cont "포켓몬의 울음소리가 들려온다"
	done

HikerDanielSeenText:
	text "우왓 깜짝이야"
	line "이런곳에 사람이 있다니!"
	done

HikerDanielBeatenText:
	text "우왓, 깜짝, 화들짝"
	line "이렇게 강한 사람이 있다니!"
	done

HikerDanielAfterBattleText:
	text "속았었나? 멍청하게"
	line "야돈의 꼬리를 사버렸어"
	cont "어쩐지 야돈이 불쌍한 것 같아"
	done

FirebreatherBillSeenText:
	text "주뱃의 초음파로"
	line "혼란스러워져서"
	cont "어쩐지 화가나!"
	done

FirebreatherBillBeatenText:
	text "불이 옮겨 붙었다"
	done

FirebreatherBillAfterBattleText:
	text "주말이 되면"
	line "동굴 저편으로부터"
	cont "이상한 울음소리가 들린단다"
	done

FirebreatherRaySeenText:
	text "주위가 밝다면 동굴은 무섭지 않지"
	line "강하다면 포켓몬도 무섭지 않아"
	done

FirebreatherRayBeatenText:
	text "플래-시!!"
	done

FirebreatherRayAfterBattleText:
	text "내 포켓몬이"
	line "불꽃으로 불을 밝히고 있으니까"
	cont "이 동굴은 밝은 것이지!"
	done

UnionCave1FUnusedSignText:
	text "연결동굴"
	done

UnionCave1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5, 19, UNION_CAVE_B1F, 3
	warp_event  3, 33, UNION_CAVE_B1F, 4
	warp_event 17, 31, ROUTE_33, 1
	warp_event 17,  3, ROUTE_32, 4

	db 0 ; coord events

	db 0 ; bg events

	db 9 ; object events
	object_event  3,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerDaniel, -1
	object_event  4, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacLarry, -1
	object_event 11,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerHikerRussell, -1
	object_event 15, 27, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerFirebreatherRay, -1
	object_event 14, 19, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerFirebreatherBill, -1
	object_event 17, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FGreatBall, EVENT_UNION_CAVE_1F_GREAT_BALL
	object_event  4,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FXAttack, EVENT_UNION_CAVE_1F_X_ATTACK
	object_event  4, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FPotion, EVENT_UNION_CAVE_1F_POTION
	object_event 12, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FAwakening, EVENT_UNION_CAVE_1F_AWAKENING
