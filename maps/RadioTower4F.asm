	const_def 2 ; object constants
	const RADIOTOWER4F_FISHER
	const RADIOTOWER4F_TEACHER
	const RADIOTOWER4F_GROWLITHE
	const RADIOTOWER4F_ROCKET1
	const RADIOTOWER4F_ROCKET2
	const RADIOTOWER4F_ROCKET_GIRL
	const RADIOTOWER4F_SCIENTIST

RadioTower4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RadioTower4FFisherScript:
	jumptextfaceplayer RadioTower4FFisherText

RadioTower4FDJMaryScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_MARY
	iftrue .GotPinkBow
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRockets
	writetext RadioTower4FDJMaryText
	waitbutton
	closetext
	end

.ClearedRockets:
	writetext RadioTower4FDJMaryText_ClearedRockets
	buttonsound
	verbosegiveitem PINK_BOW
	iffalse .NoRoom
	writetext RadioTower4FDJMaryText_GivePinkBow
	waitbutton
	closetext
	setevent EVENT_GOT_PINK_BOW_FROM_MARY
	end

.GotPinkBow:
	writetext RadioTower4FDJMaryText_After
	waitbutton
.NoRoom:
	closetext
	end

RadioTowerMeowth:
	opentext
	writetext RadioTowerMeowthText
	cry MEOWTH
	waitbutton
	closetext
	end

TrainerGruntM10:
	trainer GRUNTM, GRUNTM_10, EVENT_BEAT_ROCKET_GRUNTM_10, GruntM10SeenText, GruntM10BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM10AfterBattleText
	waitbutton
	closetext
	end

TrainerExecutivem2:
	trainer EXECUTIVEM, EXECUTIVEM_2, EVENT_BEAT_ROCKET_EXECUTIVEM_2, Executivem2SeenText, Executivem2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Executivem2AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF4:
	trainer GRUNTF, GRUNTF_4, EVENT_BEAT_ROCKET_GRUNTF_4, GruntF4SeenText, GruntF4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF4AfterBattleText
	waitbutton
	closetext
	end

TrainerScientistRich:
	trainer SCIENTIST, RICH, EVENT_BEAT_SCIENTIST_RICH, ScientistRichSeenText, ScientistRichBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRichAfterBattleText
	waitbutton
	closetext
	end

RadioTower4FProductionSign:
	jumptext RadioTower4FProductionSignText

RadioTower4FStudio2Sign:
	jumptext RadioTower4FStudio2SignText

RadioTower4FFisherText:
	text "유적에 놀러갔을때"
	line "라디오를 들으니까"
	cont "잘 모르는 방송이 들려왔어"
	done

RadioTower4FDJMaryText:
	text "호두『어째서……"
	line "이런 일을 당하는거야……?"
	
	para "나옹아 도와줘-!"
	done

RadioTower4FDJMaryText_ClearedRockets:
	text "호두『앗 너는-"
	line "나를 구해준 사람이구나-"
	
	para "자 이거"
	line "내 마음이야!"
	done

RadioTower4FDJMaryText_GivePinkBow:
	text "호두『그건말야"
	line "보통타입의 기술을 쓰는"
	cont "포켓몬에게 딱 맞을꺼야!"
	done

RadioTower4FDJMaryText_After:
	text "호두『나랑 오박사님의"
	line "포켓몬 강좌 꼭 들어줘야해-!"
	done

RadioTowerMeowthText:
	text "나옹『…… 나-옹"
	done

GruntM10SeenText:
	text "국장을 구해낼 작정인가"
	line "그건 무리라고 하는거야"
	cont "여기서 나에게 쓰러져버릴 테니까"
	done

GruntM10BeatenText:
	text "오- 이런~!"
	done

GruntM10AfterBattleText:
	text "이럴수가!"
	line "내가 쓰러져버릴 줄은"
	done

Executivem2SeenText:
	text "멈춰랏! 로켓단의"
	line "철옹성이라고 불려지는 나다"
	cont "이 이상은 가게 놔둘 수 없다!"
	done

Executivem2BeatenText:
	text "철옹성이 무너졌다……"
	done

Executivem2AfterBattleText:
	text "너를 존경하는 뜻에서"
	line "충고 한가지 해주지"
	
	para "지금이라도 늦지않았다"
	line "돌아가는 편이 좋을 꺼야……"
	done
	
GruntF4SeenText:
	text "포켓몬이 귀엽지 않느냐구?"
	line "그렇군 여기서 너의 포켓몬을"
	cont "쓰러뜨린다면 귀엽겠지?"
	done

GruntF4BeatenText:
	text "흥!"
	line "도움이 되지 않는다니까!"
	done

GruntF4AfterBattleText:
	text "나는 내가 제일 예쁘다니까!"
	line "포켓몬이란 어찌되든 괜찮아!"
	done
	
ScientistRichSeenText:
	text "훌륭하군!"
	
	para "이 라디오타워의 시설이라면"
	line "우리들의 야망을 실현시킬 수 있어"
	done
	
ScientistRichBeatenText:
	text "흐-음"
	line "위대한 계획의 앞에는"
	cont "방해꾼이 낀다는 건가"
	done

ScientistRichAfterBattleText:
	text "너 같은 녀석에게 방해받을"
	line "로켓단이라고 생각했단 말인가"
	done

RadioTower4FProductionSignText:
	text "4층 …… 제작실"
	done

RadioTower4FStudio2SignText:
	text "4층 …… 제2스튜디오"
	done

RadioTower4F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  0, RADIO_TOWER_5F, 1
	warp_event  9,  0, RADIO_TOWER_3F, 2
	warp_event 12,  0, RADIO_TOWER_5F, 2
	warp_event 17,  0, RADIO_TOWER_3F, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  7,  0, BGEVENT_READ, RadioTower4FProductionSign
	bg_event 15,  0, BGEVENT_READ, RadioTower4FStudio2Sign

	db 7 ; object events
	object_event  6,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower4FFisherScript, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 14,  6, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower4FDJMaryScript, -1
	object_event 12,  7, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTowerMeowth, -1
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM10, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerExecutivem2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerGruntF4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistRich, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
