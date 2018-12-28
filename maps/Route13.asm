	const_def 2 ; object constants
	const ROUTE13_YOUNGSTER1
	const ROUTE13_YOUNGSTER2
	const ROUTE13_POKEFAN_M1
	const ROUTE13_POKEFAN_M2
	const ROUTE13_POKEFAN_M3

Route13_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerPokefanmAlex:
	trainer POKEFANM, ALEX, EVENT_BEAT_POKEFANM_ALEX, PokefanmAlexSeenText, PokefanmAlexBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmAlexAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmJoshua:
	trainer POKEFANM, JOSHUA, EVENT_BEAT_POKEFANM_JOSHUA, PokefanmJoshuaSeenText, PokefanmJoshuaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJoshuaAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperPerry:
	trainer BIRD_KEEPER, PERRY, EVENT_BEAT_BIRD_KEEPER_PERRY, BirdKeeperPerrySeenText, BirdKeeperPerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperPerryAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperBret:
	trainer BIRD_KEEPER, BRET, EVENT_BEAT_BIRD_KEEPER_BRET, BirdKeeperBretSeenText, BirdKeeperBretBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBretAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerKenny:
	trainer HIKER, KENNY, EVENT_BEAT_HIKER_KENNY, HikerKennySeenText, HikerKennyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerKennyAfterBattleText
	waitbutton
	closetext
	end

Route13TrainerTips:
	jumptext Route13TrainerTipsText

Route13Sign:
	jumptext Route13SignText

Route13DirectionsSign:
	jumptext Route13DirectionsSignText

Route13HiddenCalcium:
	hiddenitem CALCIUM, EVENT_ROUTE_13_HIDDEN_CALCIUM

PokefanmAlexSeenText:
	text "이 사람의 위엄을 많은"
	line "포켓몬들에 전하는 것이 좋을꺼야!"
	done

PokefanmAlexBeatenText:
	text "부 분하다 ……"
	done

PokefanmAlexAfterBattleText:
	text "사나이로 태어난 이상은"
	line "황제가 되어보고싶지?"
	done
	
PokefanmJoshuaSeenText:
	text "우후후후훗!"
	line "피카츄들과 승부하지 않을래?"
	done
	
PokefanmJoshuaBeatenText:
	text "피 피카츄가!"
	done

PokefanmJoshuaAfterBattleText:
	text "너는 많은 포켓몬을"
	line "가지고 있어 보이지만"
	cont "역시 피카츄가 최고!"
	done

BirdKeeperPerrySeenText:
	text "날쌘 움직임이"
	line "새 포켓몬의 특징이지!"
	done

BirdKeeperPerryBeatenText:
	text "빠른 움직임에서 지고있어!?"
	line "이 내가-!?"
	done

BirdKeeperPerryAfterBattleText:
	text "훌륭하게 단련되어져 있구나"
	line "너의 포켓몬들은!"
	done

BirdKeeperBretSeenText:
	text "보아라 내 포켓몬!"
	line "멋있는 색깔과 윤기가 나지!"
	done

BirdKeeperBretBeatenText:
	text "제기럴!"
	line "생각대로 되지 않는걸까!"
	done
	
BirdKeeperBretAfterBattleText:
	text "손질해서 예쁘게 해주면"
	line "포켓몬도 기뻐할꺼야!"
	done

HikerKennySeenText:
	text "돌산 터널에 가볼까"
	line "롱스톤을 잡으러말야!"
	done

HikerKennyBeatenText:
	text "졌다!"
	done

HikerKennyAfterBattleText:
	text "자연의 모습은 언제나"
	line "똑같아 보이지만"
	
	para "사실은 조금씩"
	line "모양이 바뀌고 있단다"
	done

Route13TrainerTipsText:
	text "…… 득이 되는 게시판!"
	
	para "거기 거기!"
	line "말뚝을 사이에 두고 왼쪽"
	done

Route13SignText:
	text "이곳은 13번 도로"
	line "북쪽 …… 고요한 다리"
	done

Route13DirectionsSignText:
	text "북쪽 …… 보라타운"
	line "서쪽 …… 연분홍시티"
	done

Route13_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 4 ; bg events
	bg_event 29, 13, BGEVENT_READ, Route13TrainerTips
	bg_event 41, 11, BGEVENT_READ, Route13Sign
	bg_event 17, 13, BGEVENT_READ, Route13DirectionsSign
	bg_event 30, 13, BGEVENT_ITEM, Route13HiddenCalcium

	db 5 ; object events
	object_event 42,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperPerry, -1
	object_event 43,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperBret, -1
	object_event 32,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJoshua, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerHikerKenny, -1
	object_event 25,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmAlex, -1
