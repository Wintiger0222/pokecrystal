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
	checkcode VAR_HOUR
	ifless 18, .TooEarly
	checkflag ENGINE_BUENAS_PASSWORD
	iffalse .TuneIn
	checkitem BLUE_CARD
	iffalse .NoBlueCard
	checkcode VAR_BLUECARDBALANCE
	ifequal 30, .BlueCardCapped0
	playmusic MUSIC_BUENAS_PASSWORD
	writetext UnknownText_0x5de35
	special AskRememberPassword
	iffalse .ForgotPassword
	writetext UnknownText_0x5de84
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	checkcode VAR_FACING
	ifnotequal RIGHT, .DontNeedToMove
	applymovement PLAYER, MovementData_0x5d921
.DontNeedToMove:
	turnobject PLAYER, RIGHT
	opentext
	writetext UnknownText_0x5dedd
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, DOWN
	refreshscreen
	special BuenasPassword
	closetext
	iffalse .WrongAnswer
	opentext
	writetext UnknownText_0x5dfc1
	waitbutton
	closetext
	checkcode VAR_BLUECARDBALANCE
	addvar 1
	writevarcode VAR_BLUECARDBALANCE
	waitsfx
	playsound SFX_TRANSACTION
	setflag ENGINE_BUENAS_PASSWORD_2
	pause 20
	turnobject RADIOTOWER2F_BUENA, RIGHT
	opentext
	writetext UnknownText_0x5e054
	waitbutton
	closetext
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	checkcode VAR_BLUECARDBALANCE
	ifequal 30, .BlueCardCapped1
	end

.Introduction:
	writetext UnknownText_0x5dcf4
	buttonsound
	setevent EVENT_MET_BUENA
	verbosegiveitem BLUE_CARD
.TuneIn:
	writetext UnknownText_0x5de10
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
	writetext UnknownText_0x5df29
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.PlayedAlready:
	writetext UnknownText_0x5df6c
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
	writetext UnknownText_0x5e01c
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 20
	opentext
	writetext UnknownText_0x5e054
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.MidRocketTakeover:
	writetext UnknownText_0x5e0c2
	waitbutton
	closetext
	end

.NoBlueCard:
	writetext UnknownText_0x5e192
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
	writetext UnknownText_0x5e0f1
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
	writetext UnknownText_0x5e131
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
	writetext UnknownText_0x5e1ee
	jump .AskForNumber

.OfferedNumberBefore:
	opentext
	writetext UnknownText_0x5e2bf
.AskForNumber:
	askforphonenumber PHONE_BUENA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	writetext UnknownText_0x5e2f3
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
	writetext UnknownText_0x5e310
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	addcellnum PHONE_BUENA
	end

.NumberDeclined:
	writetext UnknownText_0x5e33c
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.PhoneFull:
	writetext UnknownText_0x5e35e
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
	writetext UnknownText_0x5e392
	buttonsound
	special BuenaPrize
	closetext
	end

.NoCard:
	writetext UnknownText_0x5e3d8
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

MovementData_0x5d921:
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

UnknownText_0x5dcf4:
	text"アオイ『はーい　わたし　アオイ!"

	para"あいことば　っていう"
	line"ラジオばんぐみ　しってる?"

	para"この　ばんぐみで　ながれている"
	line"あいことばを　わたしに　おしえると"
	cont"ポイントを　もらえるの"

	para"その　ポイントを　ためると"
	line"そこにいる　おねえさんが"
	cont"すてきな　けいひんと"
	cont"こうかん　してくれるのよ!"

	para"はい!"

	para"これが　ポイントを　ためる"
	line"カードよ!"

	para"あなたに　あげるね!"
	done

UnknownText_0x5de10:
	text"アオイ『わたしの　あいことば"
	line"ばんぐみを　よろしくね!"
	done

UnknownText_0x5de35:
	text"アオイ『わたしの　ラジオばんぐみ"
	line"きいて　くれたかな?"

	para"きょうの　あいことば　おぼえてる?"
	done

UnknownText_0x5de84:
	text"アオイ『わー　どうも　ありがとう!"
	line"えっとー　おなまえは?"

	para"……<PLAY_G>ね!"

	para"それじゃ　<PLAY_G>も"
	line"ばんぐみに　さんかしてね!"
	done

UnknownText_0x5dedd:
	text"アオイ『みんな　いくわよ!"

	para"<PLAY_G>が　こたえる"
	line"きょうの　あいことば"

	para"いっちゃってー!"
	done

UnknownText_0x5df29:
	text"アオイ『それじゃ"
	line"ばんぐみを　きいたら"
	cont"また　きてね!"
	done

UnknownText_0x5df6c:
	text"アオイ『ごめんねー"
	line"もんだいに　こたえられるのは"
	cont"いちにち　いっかい　だけなの"

	para"また　あした　きてね!"
	done

UnknownText_0x5dfc1:
	text"アオイ『きゃー　せいかいよ!"

	para"ちゃんと　きいて　くれたのね!"
	line"うれしいなー"

	para"はい　1ポイント　あげまーす!"
	line"おめでとう!!"
	done

UnknownText_0x5e01c:
	text"アオイ『あーん"
	line"ざんねん　はずれでーす!"

	para"あいことば　わすれちゃったかな?"
	done

UnknownText_0x5e054:
	text"アオイ『はい!"
	line"いま　こたえて　くれたのは"
	cont"<PLAY_G>　でしたー!"
	cont"どうも　ありがとう"

	para"みんなも　きてね!"
	line"まってまーす!"
	done

UnknownText_0x5e0c2:
	text"アオイ『えっ!"
	line"きょうの　あいことば?"

	para"もちろん　たすけてー　でしょ!"
	done

UnknownText_0x5e0f1:
	text"アオイ『ポイントが"
	line"もう　いっぱいです!"

	para"けいひんと　こうかん　してね!"
	done

UnknownText_0x5e131:
	text"アオイ『あいことば　ばんぐみは"
	line"まいにち　ごご6じから"
	cont"0じまで　やってまーす!"

	para"ばんぐみ　きいたら　きてね!"
	done

UnknownText_0x5e192:
	text"アオイ『あら?"
	line"ブルーカードを　もってくるの"
	cont"わすれちゃったかな?"

	para"ブルーカードが　ないと"
	line"ポイントを　あげられないの…"
	done

UnknownText_0x5e1ee:
	text"アオイ『あ!　ブルーカードが"
	line"きょうで　30ポイントよ!"
	cont"すごい　すごーい!"

	para"…そうねー"
	line"30ポイントの　けいひんは"
	cont"とくに　ないんだけど…"

	para"<PLAY_G>は　なんども"
	line"きてくれたから　とくべつ!"

	para"アオイの　でんわばんごう"
	line"おしえて　あげちゃおうかな?"
	done

UnknownText_0x5e2bf:
	text"アオイ『<PLAY_G>"
	line"わたしの　でんわばんごう"
	cont"とうろく　する?"
	done

UnknownText_0x5e2f3:
	text"<PLAYER>は　アオイの"
	line"でんわばんごうを　とうろく　した！"
	done

UnknownText_0x5e310:
	text"アオイ『でんわ　まってるね!"
	done

UnknownText_0x5e33c:
	text"アオイ『えー　とくべつ"
	line"だいサービス　なのになあ…"
	done

UnknownText_0x5e35e:
	text"アオイ『<PLAY_G>の　でんわ"
	line"いっぱいで　とうろく　できないよー"
	done

UnknownText_0x5e392:
	text"たまった　ポイントを　つかえば"
	line"こちらで　おすきな　けいひんと"
	cont"こうかん　できます!"
	done

UnknownText_0x5e3d8:
	text"ブルーカードを　もっていないと"
	line"けいひんと　こうかん　できません"

	para"ブルーカードを　わすれずに"
	line"また　きてくださいね!"
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
