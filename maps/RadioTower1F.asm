	const_def 2 ; object constants
	const RADIOTOWER1F_RECEPTIONIST
	const RADIOTOWER1F_LASS
	const RADIOTOWER1F_YOUNGSTER
	const RADIOTOWER1F_ROCKET
	const RADIOTOWER1F_LUCKYNUMBERMAN
	const RADIOTOWER1F_CARD_WOMAN

RadioTower1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RadioTower1FReceptionistScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	writetext RadioTower1FReceptionistWelcomeText
	waitbutton
	closetext
	end

.Rockets:
	writetext RadioTower1FReceptionistNoToursText
	waitbutton
	closetext
	end

RadioTower1FLuckyNumberManScript:
	faceplayer
	opentext
	writetext RadioTower1FLuckyNumberManAskToPlayText
	buttonsound
	special CheckLuckyNumberShowFlag
	iffalse .skip
	special ResetLuckyNumberShowFlag
.skip
	special PrintTodaysLuckyNumber
	checkflag ENGINE_LUCKY_NUMBER_SHOW
	iftrue .GameOver
	writetext RadioTower1FLuckyNumberManThisWeeksIdIsText
	buttonsound
	closetext
	applymovement RADIOTOWER1F_LUCKYNUMBERMAN, RadioTower1FLuckyNumberManGoToPCMovement
	opentext
	writetext RadioTower1FLuckyNumberManCheckIfMatchText
	buttonsound
	waitsfx
	writetext RadioTower1FLuckyNumberManDotDotDotText
	playsound SFX_DEX_FANFARE_20_49
	waitsfx
	buttonsound
	special CheckForLuckyNumberWinners
	closetext
	applymovement RADIOTOWER1F_LUCKYNUMBERMAN, RadioTower1FLuckyNumberManReturnToPlayerMovement
	opentext
	ifequal 1, .FirstPlace
	ifequal 2, .SecondPlace
	ifequal 3, .ThirdPlace
	sjump .NoPrize

.GameOver:
	writetext RadioTower1FLuckyNumberManComeAgainText
	waitbutton
	closetext
	end

.FirstPlace:
	writetext RadioTower1FLuckyNumberManPerfectMatchText
	playsound SFX_1ST_PLACE
	waitsfx
	buttonsound
	giveitem MASTER_BALL
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.SecondPlace:
	writetext RadioTower1FLuckyNumberManOkayMatchText
	playsound SFX_2ND_PLACE
	waitsfx
	buttonsound
	giveitem EXP_SHARE
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.ThirdPlace:
	writetext RadioTower1FLuckyNumberManWeakMatchText
	playsound SFX_3RD_PLACE
	waitsfx
	buttonsound
	giveitem PP_UP
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.NoPrize:
	writetext RadioTower1FLuckyNumberManNoneOfYourIDNumbersMatchText
	waitbutton
	closetext
	end

.BagFull:
	writetext RadioTower1FLuckyNumberManNoRoomForYourPrizeText
	waitbutton
	closetext
	end

RadioTower1FRadioCardWomanScript:
	faceplayer
	opentext
	checkflag ENGINE_RADIO_CARD
	iftrue .GotCard
	writetext RadioTower1FRadioCardWomanOfferQuizText
	yesorno
	iffalse .NoQuiz
	writetext RadioTower1FRadioCardWomanQuestion1Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion2Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion3Text
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion4Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion5Text
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanYouWinText
	buttonsound
	getstring STRING_BUFFER_4, .RadioCardText
	scall .ReceiveItem
	writetext RadioTower1FPokegearIsARadioText
	buttonsound
	setflag ENGINE_RADIO_CARD
.GotCard:
	writetext RadioTower1FRadioCardWomanTuneInText
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
	writetext RadioTower1FRadioCardWomanWrongAnswerText
	waitbutton
	closetext
	end

.NoQuiz:
	writetext RadioTower1FRadioCardWomanNotTakingQuizText
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

RadioTower1FLuckyNumberManGoToPCMovement:
	step RIGHT
	turn_head UP
	step_end

RadioTower1FLuckyNumberManReturnToPlayerMovement:
	step LEFT
	turn_head UP
	step_end

RadioTower1FReceptionistWelcomeText:
	text "어서오세요!"
	done

RadioTower1FReceptionistNoToursText:
	text "…… 어서오세요"
	line "대단히 죄송하지만"
	cont "지금은 견학을 할 수 없습니다"
	done

RadioTower1FLuckyNumberManAskToPlayText:
	text "예 여기는 교환소입니다"
	
	para "당신의 포켓몬"
	line "아이디 넘버로"
	cont "운이 좋다면 상품획득 찬스!"
	done

RadioTower1FLuckyNumberManThisWeeksIdIsText:
	text " 이번 주 당첨 번호는"
	line "@"
	text_ram wStringBuffer3
	text "입니다"
	done

RadioTower1FLuckyNumberManCheckIfMatchText:
	text "그럼 바로 체크"
	line "하겠습니다"
	done

RadioTower1FLuckyNumberManDotDotDotText:
	text "…… …… …… …… ……"
	line " …… …… …… …… ……"
	done

RadioTower1FLuckyNumberManComeAgainText:
	text "다음의 발표를"
	line "즐겁게 기다려주세요"
	done

RadioTower1FLuckyNumberManPerfectMatchText:
	text "이 이럴수가 5자리 맞았습니다!"
	line "1등! 1등입니다!"
	
	para "1등 상품은"
	line "마스터볼입니다!"
	done

RadioTower1FLuckyNumberManOkayMatchText:
	text "오옷! 아래 3자리 맞았습니다!"
	line "2등입니다!"
	
	para "2등 상품은"
	line "학습장치입니다!"
	done

RadioTower1FLuckyNumberManWeakMatchText:
	text "아래 2자리 수가 맞았습니다!"
	line "3등이 당첨되었습니다"
	
	para "3등 상품은"
	line "포인트 업 입니다!"
	done
	
RadioTower1FLuckyNumberManNoneOfYourIDNumbersMatchText:
	text "애석하게도"
	line "모두 꽝입니다"
	done

RadioTower1FLuckyNumberManNoRoomForYourPrizeText:
	text "짐이 잔뜩 있는 것 같군요"
	line "짐을 줄이시고 되도록 빨리"
	cont "오시길 바랍니다"
	done

RadioTower1FRadioCardWomanOfferQuizText:
	text "지금 막 캠페인 중!"
	
	para "퀴즈 5문제에 계속해서"
	line "정답이 나오면"
	cont "라디오 카드를 선물로!"
	
	para "포켓기어에 꽂으면 언제 어디서나"
	line "라디오를 들을 수 있습니다"
	cont "퀴즈에 도전하겠습니까?"
	done

RadioTower1FRadioCardWomanQuestion1Text:
	text "그럼 제1문제!"
	
	para "아침에만 출현하는 포켓몬이"
	line "있을까요?"
	done
	
RadioTower1FRadioCardWomanQuestion2Text:
	text "정답입니다"
	line "그럼 제2문제!"
	
	para "열매는 마트에서 살 수 없다?"
	done

RadioTower1FRadioCardWomanQuestion3Text:
	text "정답입니다"
	line "계속해서 제3문제!"
	
	para "비전머신01에 들어"
	line "있는것은 플래시?"
	done
	
RadioTower1FRadioCardWomanQuestion4Text:
	text "계속해서 정답"
	line "그럼 제4문제!"
	
	para "비상은 도라지시티의 비행"
	line "타입 전문 체육관 관장?"
	done

RadioTower1FRadioCardWomanQuestion5Text:
	text "대단하군요!"
	line "드디어 마지막 문제입니다"
	
	
	para "금빛시티 게임 코너의 게임엔"
	line "파이리가 있다?"
	done

RadioTower1FRadioCardWomanYouWinText:
	text "모든 문제 정답"
	line "축하드립니다!"
	cont "상품인 라디오 카드입니다!"
	done
	
RadioTower1FPokegearIsARadioText:
	text "<PLAYER>의 포켓몬 기어에서"
	line "라디오를 들을 수 있게 되었다!"
	done

RadioTower1FRadioCardWomanTuneInText:
	text "우리들의 방송"
	line "항상 듣고 즐기시길!"
	done

RadioTower1FRadioCardWomanWrongAnswerText:
	text "이런이런 틀리셨네요"
	line "아깝게 되었군요"
	cont "다음에 다시 도전해주세요!"
	done

RadioTower1FRadioCardWomanNotTakingQuizText:
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
