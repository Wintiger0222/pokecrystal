	const_def 2 ; object constants
	const RADIOTOWER2F_SUPER_NERD
	const RADIOTOWER2F_TEACHER
	const RADIOTOWER2F_ROCKET1
	const RADIOTOWER2F_ROCKET2
	const RADIOTOWER2F_ROCKET3
	const RADIOTOWER2F_ROCKET_GIRL
	const RADIOTOWER2F_BLACK_BELT1
	const RADIOTOWER2F_BLACK_BELT2
	const RADIOTOWER2F_JIGGLYPUFF
	const RADIOTOWER2F_BUENA
	const RADIOTOWER2F_RECEPTIONIST

RadioTower2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RadioTower2FUnusedDummyScene:
; unused
	end

RadioTower2FSuperNerdScript:
	jumptextfaceplayer RadioTower2FSuperNerdText

RadioTower2FTeacherScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	writetext RadioTower2FTeacherText
	waitbutton
	closetext
	end

.Rockets:
	writetext RadioTower2FTeacherText_Rockets
	waitbutton
	closetext
	end

RadioTowerJigglypuff:
	opentext
	writetext RadioTowerJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end

RadioTower2FBlackBelt1Script:
	jumptextfaceplayer RadioTower2FBlackBelt1Text

RadioTower2FBlackBelt2Script:
	jumptextfaceplayer RadioTower2FBlackBelt2Text

TrainerGruntM4:
	trainer GRUNTM, GRUNTM_4, EVENT_BEAT_ROCKET_GRUNTM_4, GruntM4SeenText, GruntM4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM4AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM5:
	trainer GRUNTM, GRUNTM_5, EVENT_BEAT_ROCKET_GRUNTM_5, GruntM5SeenText, GruntM5BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM5AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM6:
	trainer GRUNTM, GRUNTM_6, EVENT_BEAT_ROCKET_GRUNTM_6, GruntM6SeenText, GruntM6BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM6AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF2:
	trainer GRUNTF, GRUNTF_2, EVENT_BEAT_ROCKET_GRUNTF_2, GruntF2SeenText, GruntF2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF2AfterBattleText
	waitbutton
	closetext
	end

Buena:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover
	checkevent EVENT_MET_BUENA
	iffalse .Introduction
	checkflag ENGINE_BUENAS_PASSWORD_2
	iftrue .PlayedAlready
	readvar VAR_HOUR
	ifless 18, .TooEarly
	checkflag ENGINE_BUENAS_PASSWORD
	iffalse .TuneIn
	checkitem BLUE_CARD
	iffalse .NoBlueCard
	readvar VAR_BLUECARDBALANCE
	ifequal 30, .BlueCardCapped0
	playmusic MUSIC_BUENAS_PASSWORD
	writetext RadioTower2FBuenaDoYouKnowPasswordText
	special AskRememberPassword
	iffalse .ForgotPassword
	writetext RadioTower2FBuenaJoinTheShowText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	readvar VAR_FACING
	ifnotequal RIGHT, .DontNeedToMove
	applymovement PLAYER, RadioTower2FPlayerWalksToMicrophoneMovement
.DontNeedToMove:
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower2FBuenaEveryoneSayPasswordText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, DOWN
	refreshscreen
	special BuenasPassword
	closetext
	iffalse .WrongAnswer
	opentext
	writetext RadioTower2FBuenaCorrectAnswerText
	waitbutton
	closetext
	readvar VAR_BLUECARDBALANCE
	addval 1
	writevar VAR_BLUECARDBALANCE
	waitsfx
	playsound SFX_TRANSACTION
	setflag ENGINE_BUENAS_PASSWORD_2
	pause 20
	turnobject RADIOTOWER2F_BUENA, RIGHT
	opentext
	writetext RadioTower2FBuenaThanksForComingText
	waitbutton
	closetext
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	readvar VAR_BLUECARDBALANCE
	ifequal 30, .BlueCardCapped1
	end

.Introduction:
	writetext RadioTower2FBuenaShowIntroductionText
	buttonsound
	setevent EVENT_MET_BUENA
	verbosegiveitem BLUE_CARD
.TuneIn:
	writetext RadioTower2FBuenaTuneInToMyShowText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered0
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered0:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.ForgotPassword:
	writetext RadioTower2FBuenaComeBackAfterListeningText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.PlayedAlready:
	writetext RadioTower2FBuenaAlreadyPlayedText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered1
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered1:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 10
	end

.WrongAnswer:
	setflag ENGINE_BUENAS_PASSWORD_2
	opentext
	writetext RadioTower2FBuenaDidYouForgetText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 20
	opentext
	writetext RadioTower2FBuenaThanksForComingText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.MidRocketTakeover:
	writetext RadioTower2FBuenaPasswordIsHelpText
	waitbutton
	closetext
	end

.NoBlueCard:
	writetext RadioTower2FBuenaNoBlueCardText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered2
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
.Registered2:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.BlueCardCapped0:
	writetext RadioTower2FBuenaCardIsFullText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered3
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
.Registered3:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.TooEarly:
	writetext RadioTower2FBuenaTuneInAfterSixText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered4
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered4:
	end

.BlueCardCapped1:
	checkcellnum PHONE_BUENA
	iftrue .HasNumber
	pause 20
	turnobject RADIOTOWER2F_BUENA, DOWN
	pause 15
	turnobject PLAYER, UP
	pause 15
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
	showemote EMOTE_SHOCK, RADIOTOWER2F_BUENA, 15
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	opentext
	writetext RadioTower2FBuenaOfferPhoneNumberText
	sjump .AskForNumber

.OfferedNumberBefore:
	opentext
	writetext RadioTower2FBuenaOfferNumberAgainText
.AskForNumber:
	askforphonenumber PHONE_BUENA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	writetext RadioTower2FRegisteredBuenasNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
	writetext RadioTower2FBuenaCallMeText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	addcellnum PHONE_BUENA
	end

.NumberDeclined:
	writetext RadioTower2FBuenaSadRejectedText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.PhoneFull:
	writetext RadioTower2FBuenaYourPhoneIsFullText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
.HasNumber:
	end

RadioTowerBuenaPrizeReceptionist:
	faceplayer
	opentext
	checkitem BLUE_CARD
	iffalse .NoCard
	writetext RadioTower2FBuenaReceptionistPointsForPrizesText
	buttonsound
	special BuenaPrize
	closetext
	end

.NoCard:
	writetext RadioTower2FBuenaReceptionistNoCardText
	buttonsound
	closetext
	end

RadioTower2FSalesSign:
	jumptext RadioTower2FSalesSignText

RadioTower2FOaksPKMNTalkSign:
	jumptext RadioTower2FOaksPKMNTalkSignText

RadioTower2FPokemonRadioSign:
	jumptext RadioTower2FPokemonRadioSignText

RadioTower2FBookshelf:
	jumpstd magazinebookshelf

RadioTower2FPlayerWalksToMicrophoneMovement:
	slow_step DOWN
	slow_step RIGHT
	step_end

RadioTower2FSuperNerdText:
	text "어디서든 라디오 청취가 가능하니까"
	line "어디서든 라디오를 들어주세요!"
	done

RadioTower2FTeacherText:
	text "라디오에서 흘러나오는 자장가라도"
	line "포켓몬은 잠들어버리거든"
	done

RadioTower2FTeacherText_Rockets:
	text "라디오 방송국을 점령해서"
	line "어떡게 할 작정일까……?"
	done

RadioTowerJigglypuffText:
	text "푸린『푸우…… 푸린……"
	done

RadioTower2FBlackBelt1Text:
	text "여기부터 윗층은 관계자 외"
	line "출입금지란다……"
	
	para "예전에는 그런 일이 없었는데"
	line "지금 국장은 좀 이상해"
	done

RadioTower2FBlackBelt2Text:
	text "어디든 견학 OK 란다"
	line "예전처럼 상냥한"
	cont "국장으로 되돌아왔단다"
	done

GruntM4SeenText:
	text "3년전 로켓단은"
	line "해산에 몰리게 되었다……"
	
	para "그러나 우리들은"
	line "이곳에서 부활하는 것이다!"
	done

GruntM4BeatenText:
	text "크윽-"
	line "정떨어지는 놈"
	done

GruntM4AfterBattleText:
	text "너같은 녀석에게"
	line "부활의 방해를 받을 순 없지!"
	done
	
GruntM5SeenText:
	text "우리들은"
	line "포켓몬의 마피아 로켓단이다!"
	cont "나쁜 짓을 무척 좋아하지"
	
	para "오호-  겁먹었냐?"
	done

GruntM5BeatenText:
	text "정의의 편에 설 작정이냐?"
	done

GruntM5AfterBattleText:
	text "특별히 우리들은"
	line "나쁜 짓을 하려는건 아니구"
	cont "단지 좋아하는 것을 하려는거야"
	done

GruntM6SeenText:
	text "이봐 이봐!"
	line "우리들을 방해해서는 않되지!"
	done

GruntM6BeatenText:
	text "우우…… 졌다"
	done
	
GruntM6AfterBattleText:
	text "간부들은 이곳을 점령하려고"
	line "엄청난 일을 벌일 것 같아"
	cont "그건 그렇고 이제 뭘 할까나?"
	done

GruntF2SeenText:
	text "호호호!"
	line "너무나 간단하게 점령되어서"
	cont "싫증이 났지뭐야!"
	
	para "니가 날 즐겁게 해주겠어?"
	done

GruntF2BeatenText:
	text "네 녀석은 어떤 놈이냐!?"
	done

GruntF2AfterBattleText:
	text "나보다 강하다니……"
	
	para "용서할 수 없어!"
	done

RadioTower2FBuenaShowIntroductionText:
	text"규화『네-에 규화입니다!"

	para"혹시 규화의 암호라는"
	line"라디오 방송 알고 있어?"

	para"이 방송에서 나오는"
	line"암호를 나한테 알려주면"
	cont"포인트를 줄거야"

	para"그 포인트를 모으면"
	line"저기 있는 언니가"
	cont"멋진 경품이랑"
	cont"교환해 주는 거지!"

	para"그러면!"

	para"포인트를 모을 때 쓰는"
	line"카드야!"

	para"너에게 줄게!!"
	done

RadioTower2FBuenaTuneInToMyShowText:
	text"규화『내 암호 방송"
	line"재밌게 들어줘!"
	done

RadioTower2FBuenaDoYouKnowPasswordText:
	text"규화『내 라디오 방송"
	line"들어 준걸까나?"

	para"오늘의 암호 기억하고 있어?"
	done

RadioTower2FBuenaJoinTheShowText:
	text"규화『와ー　정말 고마워!"
	line"그러니까ー　이름이?"

	para"……<PLAY_G>이구나!"

	para"그러면　<PLAY_G>도"
	line"방송에 참가하자구!"
	done

RadioTower2FBuenaEveryoneSayPasswordText:
	text"규화『모두들 갑니다!"

	para"<PLAY_G>이 대답해주는"
	line"오늘의 암호"

	para"말해주세요ー!"
	done

RadioTower2FBuenaComeBackAfterListeningText:
	text"규화『그러면"
	line"방송을 듣게 되면"
	cont"다시 들러줘!"
	done

RadioTower2FBuenaAlreadyPlayedText:
	text"규화『미안해ー"
	line"문제를 맞힐 기회는"
	cont"하루에 한 번 뿐이야"

	para"내일 다시 와줘!"
	done

RadioTower2FBuenaCorrectAnswerText:
	text"규화『꺄ー　정답이야!"

	para"제대로 들어줬구나!"
	line"기쁜데에ー"

	para"그럼　1포인트　드립니ー다!"
	line"축하해!!"
	done

RadioTower2FBuenaDidYouForgetText:
	text"규화『아ー앙"
	line"유감스럽게도 틀렸네ー요!"

	para"암호를 까먹은 거려나?"
	done

RadioTower2FBuenaThanksForComingText:
	text"규화『넵!"
	line"지금 대답해준 사람은"
	cont"<PLAY_G>였습니다ー!"
	cont"감사합니다"

	para"모두들 들러줘!"
	line"기다리고 있을께ー!"
	done

RadioTower2FBuenaPasswordIsHelpText:
	text"규화『엣!"
	line"오늘의 암호?"

	para"물론 도와줘ー　잖아!"
	done

RadioTower2FBuenaCardIsFullText:
	text"규화『포인트가"
	line"꽉 찼네요!"

	para"경품하고 교환하고 와줘!"
	done

RadioTower2FBuenaTuneInAfterSixText:
	text"규화『암호 방송은"
	line"매일 저녁 6시부터"
	cont"0시까지　입니ー다!"

	para"방송 들으시면 들러줘!"
	done

RadioTower2FBuenaNoBlueCardText:
	text"규화『어라?"
	line"블루카드 가져오는 걸"
	cont"깜빡한 거려나?"

	para"카드가 없으면"
	line"포인트를 줄 수가 없는데…"
	done

RadioTower2FBuenaOfferPhoneNumberText:
	text"규화『아! 블루카드에"
	line"오늘로 30포인트야!"
	cont"대단해　대단ー해!"

	para"…그러네ー"
	line"30포인트짜리 경품은"
	cont"딱히 없지만…"

	para"<PLAY_G>은　몇 번이고"
	line"와줬으니까 특별히!"

	para"규화의 전화번호"
	line"알려줄까나?"
	done

RadioTower2FBuenaOfferNumberAgainText:
	text"규화『<PLAY_G>"
	line"내 전화번호"
	cont"등록할거야?"
	done

RadioTower2FRegisteredBuenasNumberText:
	text"<PLAYER>는(은)　규화의"
	line"번호를 등록했다!"
	done

RadioTower2FBuenaCallMeText:
	text"규화『전화 기다리고 있을게!"
	done

RadioTower2FBuenaSadRejectedText:
	text"규화『에ー　특별"
	line"대서비스인데…"
	done

RadioTower2FBuenaYourPhoneIsFullText:
	text"규화『<PLAY_G>의 전화번호가"
	line"꽉 차서 등록이 안 되네요ー"
	done

RadioTower2FBuenaReceptionistPointsForPrizesText:
	text"모아놓은 포인트를 쓰면"
	line"여기 있는 경품하고"
	cont"교환할 수 있습니다!"
	done

RadioTower2FBuenaReceptionistNoCardText:
	text"블루카드가 없으면"
	line"교환할 수 없습니다"

	para"블루카드를 잊지 말고"
	line"가지고 와주세요!"
	done

RadioTower2FSalesSignText:
	text "2층 …… 영업부"
	done

RadioTower2FOaksPKMNTalkSignText:
	text "오박사의 포켓몬 강좌"
	line "대 호평 방송중!"
	done

RadioTower2FPokemonRadioSignText:
	text "24시간 언제든지"
	line "어디에 있던지 포켓몬 라디오"
	done

RadioTower2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_3F, 1
	warp_event 15,  0, RADIO_TOWER_1F, 3

	db 0 ; coord events

	db 6 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower2FSalesSign
	bg_event  5,  0, BGEVENT_READ, RadioTower2FOaksPKMNTalkSign
	bg_event  9,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 10,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 11,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 13,  0, BGEVENT_READ, RadioTower2FPokemonRadioSign

	db 11 ; object events
	object_event  6,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower2FSuperNerdScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower2FTeacherScript, -1
	object_event  1,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM5, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM6, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 10,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGruntF2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  0,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt1Script, EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	object_event  1,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt2Script, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 12,  1, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTowerJigglypuff, -1
	object_event 14,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Buena, -1
	object_event 12,  7, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTowerBuenaPrizeReceptionist, EVENT_GOLDENROD_CITY_CIVILIANS
