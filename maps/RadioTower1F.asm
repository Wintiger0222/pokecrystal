	const_def 2 ; object constants
	const RADIOTOWER1F_RECEPTIONIST
	const RADIOTOWER1F_LASS
	const RADIOTOWER1F_YOUNGSTER
	const RADIOTOWER1F_ROCKET
	const RADIOTOWER1F_GENTLEMAN
	const RADIOTOWER1F_COOLTRAINER_F

RadioTower1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RadioTower1FReceptionistScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	writetext UnknownText_0x5ce77
	waitbutton
	closetext
	end

.Rockets:
	writetext UnknownText_0x5ce81
	waitbutton
	closetext
	end

RadioTower1FLuckyNumberManScript:
	faceplayer
	opentext
	writetext UnknownText_0x5ceba
	buttonsound
	special CheckLuckyNumberShowFlag
	iffalse .skip
	special ResetLuckyNumberShowFlag
.skip
	special PrintTodaysLuckyNumber
	checkflag ENGINE_LUCKY_NUMBER_SHOW
	iftrue .GameOver
	writetext UnknownText_0x5cf3a
	buttonsound
	closetext
	applymovement RADIOTOWER1F_GENTLEMAN, MovementData_0x5ce71
	opentext
	writetext UnknownText_0x5cf5a
	buttonsound
	waitsfx
	writetext UnknownText_0x5cf79
	playsound SFX_DEX_FANFARE_20_49
	waitsfx
	buttonsound
	special CheckForLuckyNumberWinners
	closetext
	applymovement RADIOTOWER1F_GENTLEMAN, MovementData_0x5ce74
	opentext
	ifequal 1, .FirstPlace
	ifequal 2, .SecondPlace
	ifequal 3, .ThirdPlace
	sjump .NoPrize

.GameOver:
	writetext UnknownText_0x5cf7e
	waitbutton
	closetext
	end

.FirstPlace:
	writetext UnknownText_0x5cfb5
	playsound SFX_1ST_PLACE
	waitsfx
	buttonsound
	giveitem MASTER_BALL
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.SecondPlace:
	writetext UnknownText_0x5d023
	playsound SFX_2ND_PLACE
	waitsfx
	buttonsound
	giveitem EXP_SHARE
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.ThirdPlace:
	writetext UnknownText_0x5d076
	playsound SFX_3RD_PLACE
	waitsfx
	buttonsound
	giveitem PP_UP
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.NoPrize:
	writetext UnknownText_0x5d0c0
	waitbutton
	closetext
	end

.BagFull:
	writetext UnknownText_0x5d0e6
	waitbutton
	closetext
	end

RadioTower1FRadioCardWomanScript:
	faceplayer
	opentext
	checkflag ENGINE_RADIO_CARD
	iftrue .GotCard
	writetext UnknownText_0x5d12d
	yesorno
	iffalse .NoQuiz
	writetext UnknownText_0x5d1f2
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext UnknownText_0x5d231
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext UnknownText_0x5d282
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext UnknownText_0x5d2bc
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext UnknownText_0x5d30e
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext UnknownText_0x5d37b
	buttonsound
	getstring STRING_BUFFER_4, .RadioCardText
	scall .ReceiveItem
	writetext UnknownText_0x5d3c0
	buttonsound
	setflag ENGINE_RADIO_CARD
.GotCard:
	writetext UnknownText_0x5d3e5
	waitbutton
	closetext
	end

.RadioCardText:
	db "라디오카드@"

.ReceiveItem:
	jumpstd receiveitem
	end

.WrongAnswer:
	playsound SFX_WRONG
	writetext UnknownText_0x5d409
	waitbutton
	closetext
	end

.NoQuiz:
	writetext UnknownText_0x5d443
	waitbutton
	closetext
	end

RadioTower1FLassScript:
	jumptextfaceplayer RadioTower1FLassText

RadioTower1FYoungsterScript:
	jumptextfaceplayer RadioTower1FYoungsterText

TrainerGruntM3:
	trainer GRUNTM, GRUNTM_3, EVENT_BEAT_ROCKET_GRUNTM_3, GruntM3SeenText, GruntM3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM3AfterBattleText
	waitbutton
	closetext
	end

RadioTower1FDirectory:
	jumptext RadioTower1FDirectoryText

RadioTower1FLuckyChannelSign:
	jumptext RadioTower1FLuckyChannelSignText

MovementData_0x5ce71:
	step RIGHT
	turn_head UP
	step_end

MovementData_0x5ce74:
	step LEFT
	turn_head UP
	step_end

UnknownText_0x5ce77:
	text "어서오세요!"
	done

UnknownText_0x5ce81:
	text "…… 어서오세요"
	line "대단히 죄송하지만"
	cont "지금은 견학을 할 수 없습니다"
	done

UnknownText_0x5ceba:
	text "예 여기는 교환소입니다"
	
	para "당신의 포켓몬"
	line "아이디 넘버로"
	cont "운이 좋다면 상품획득 찬스!"
	done

UnknownText_0x5cf3a:
	text " 이번 주 당첨 번호는"
	line "@"
	text_ram wStringBuffer3
	text "입니다"
	done

UnknownText_0x5cf5a:
	text "그럼 바로 체크"
	line "하겠습니다"
	done

UnknownText_0x5cf79:
	text "…… …… …… …… ……"
	line " …… …… …… …… ……"
	done

UnknownText_0x5cf7e:
	text "다음의 발표를"
	line "즐겁게 기다려주세요"
	done

UnknownText_0x5cfb5:
	text "이 이럴수가 5자리 맞았습니다!"
	line "1등! 1등입니다!"
	
	para "1등 상품은"
	line "마스터볼입니다!"
	done

UnknownText_0x5d023:
	text "오옷! 아래 3자리 맞았습니다!"
	line "2등입니다!"
	
	para "2등 상품은"
	line "학습장치입니다!"
	done

UnknownText_0x5d076:
	text "아래 2자리 수가 맞았습니다!"
	line "3등이 당첨되었습니다"
	
	para "3등 상품은"
	line "포인트 업 입니다!"
	done
	
UnknownText_0x5d0c0:
	text "애석하게도"
	line "모두 꽝입니다"
	done

UnknownText_0x5d0e6:
	text "짐이 잔뜩 있는 것 같군요"
	line "짐을 줄이시고 되도록 빨리"
	cont "오시길 바랍니다"
	done

UnknownText_0x5d12d:
	text "지금 막 캠페인 중!"
	
	para "퀴즈 5문제에 계속해서"
	line "정답이 나오면"
	cont "라디오 카드를 선물로!"
	
	para "포켓기어에 꽂으면 언제 어디서나"
	line "라디오를 들을 수 있습니다"
	cont "퀴즈에 도전하겠습니까?"
	done

UnknownText_0x5d1f2:
	text "그럼 제1문제!"
	
	para "아침에만 출현하는 포켓몬이"
	line "있을까요?"
	done
	
UnknownText_0x5d231:
	text "정답입니다"
	line "그럼 제2문제!"
	
	para "열매는 마트에서 살 수 없다?"
	done

UnknownText_0x5d282:
	text "정답입니다"
	line "계속해서 제3문제!"
	
	para "비전머신01에 들어"
	line "있는것은 플래시?"
	done
	
UnknownText_0x5d2bc:
	text "계속해서 정답"
	line "그럼 제4문제!"
	
	para "비상은 도라지시티의 비행"
	line "타입 전문 체육관 관장?"
	done

UnknownText_0x5d30e:
	text "대단하군요!"
	line "드디어 마지막 문제입니다"
	
	
	para "금빛시티 게임 코너의 게임엔"
	line "파이리가 있다?"
	done

UnknownText_0x5d37b:
	text "모든 문제 정답"
	line "축하드립니다!"
	cont "상품인 라디오 카드입니다!"
	done
	
UnknownText_0x5d3c0:
	text "<PLAYER>의 포켓몬 기어에서"
	line "라디오를 들을 수 있게 되었다!"
	done

UnknownText_0x5d3e5:
	text "우리들의 방송"
	line "항상 듣고 즐기시길!"
	done

UnknownText_0x5d409:
	text "이런이런 틀리셨네요"
	line "아깝게 되었군요"
	cont "다음에 다시 도전해주세요!"
	done

UnknownText_0x5d443:
	text "그렇습니까?"
	line "다시 할 마음이 생기면 찾아주세요"
	done

RadioTower1FLassText:
	text "DJ라고 한다면 준화뿐이지!"
	line "저 달콤한 목소리를 말하자면……"
	
	para "벌써 녹아서 헤롱헤롱"
	done

RadioTower1FYoungsterText:
	text "나는 포켓몬 강좌의"
	line "호두님이 좋아!"
	
	para "……목소리밖에 모르지만"
	done

GruntM3SeenText:
	text "드디어 라디오타워를 접수했다!"
	line "로켓단의 무서움을"
	cont "전국에 알려야한다"
	
	para "먼저 너에게 우리들의"
	line "두려움을 가르쳐 주겠다!"
	done

GruntM3BeatenText:
	text "이 이녀석은 강하군……"
	line "요주의 인물이로군"
	done
	
GruntM3AfterBattleText:
	text "넌 너무나 강하군"
	
	para "이대로는 계획이 물거품이다"
	line "동료들에게 알리지 않으면……"
	done

RadioTower1FDirectoryText:
	text "1층 …… 안내"
	line "2층 …… 영업부"
	cont "3층 …… 총무부"
	cont "4층 …… 제작실"
	cont "5층 …… 국장실"
	done

RadioTower1FLuckyChannelSignText:
	text "럭키- 채널!"
	line "당신의 포켓몬은 몇번?"
	
	para "포켓몬을 교환해서"
	line "여러가지 번호를 모아보자!"
	done

RadioTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 11
	warp_event  3,  7, GOLDENROD_CITY, 11
	warp_event 15,  0, RADIO_TOWER_2F, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower1FDirectory
	bg_event 13,  0, BGEVENT_READ, RadioTower1FLuckyChannelSign

	db 6 ; object events
	object_event  5,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower1FReceptionistScript, -1
	object_event 16,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower1FLassScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 15,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FYoungsterScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 14,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM3, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FLuckyNumberManScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 12,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower1FRadioCardWomanScript, EVENT_GOLDENROD_CITY_CIVILIANS
