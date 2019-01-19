	const_def 2 ; object constants
	const DRAGONSHRINE_ELDER1
	const DRAGONSHRINE_ELDER2
	const DRAGONSHRINE_ELDER3
	const DRAGONSHRINE_CLAIR

DragonShrine_MapScripts:
	db 2 ; scene scripts
	scene_script .DragonShrineTest ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.DragonShrineTest:
	priorityjump .DragonShrineTestScript
	end

.DummyScene:
	end

.DragonShrineTestScript:
	applymovement PLAYER, DragonShrinePlayerWalkInMovement
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderStepDownMovement
	opentext
	writetext DragonShrineElderGreetingText
	buttonsound
.Question1:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	writetext DragonShrineQuestion1Text
	buttonsound
	loadmenu DragonShrineQuestion1_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RightAnswer
	ifequal 2, .WrongAnswer
	ifequal 3, .RightAnswer
	end

.Question2:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	writetext DragonShrineQuestion2Text
	buttonsound
	loadmenu DragonShrineQuestion2_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RightAnswer
	ifequal 2, .RightAnswer
	ifequal 3, .WrongAnswer
.Question3:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	writetext DragonShrineQuestion3Text
	buttonsound
	loadmenu DragonShrineQuestion3_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .WrongAnswer
	ifequal 2, .RightAnswer
	ifequal 3, .RightAnswer
.Question4:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	writetext DragonShrineQuestion4Text
	buttonsound
	loadmenu DragonShrineQuestion4_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RightAnswer
	ifequal 2, .WrongAnswer
	ifequal 3, .RightAnswer
.Question5:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	writetext DragonShrineQuestion5Text
	buttonsound
	loadmenu DragonShrineQuestion5_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .WrongAnswer
	ifequal 2, .RightAnswer
	ifequal 3, .WrongAnswer
.RightAnswer:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue .PassedTheTest
	writetext DragonShrineRightAnswerText
	buttonsound
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .Question5
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iftrue .Question4
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .Question3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Question2
.WrongAnswer:
	closetext
	turnobject DRAGONSHRINE_ELDER1, LEFT
	opentext
	writetext DragonShrineWrongAnswerText1
	waitbutton
	closetext
	turnobject DRAGONSHRINE_ELDER1, DOWN
	opentext
	writetext DragonShrineWrongAnswerText2
	waitbutton
	closetext
	setevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue .Question5
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .Question4
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iftrue .Question3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .Question2
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Question1
.PassedTheTest:
	writetext DragonShrinePassedTestText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_CLAIR
	appear DRAGONSHRINE_CLAIR
	waitsfx
	turnobject PLAYER, DOWN
	pause 30
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairWalkInMovement
	turnobject DRAGONSHRINE_CLAIR, RIGHT
	turnobject PLAYER, LEFT
	turnobject DRAGONSHRINE_ELDER1, LEFT
	opentext
	writetext DragonShrineClairYouPassedText
	waitbutton
	closetext
	special FadeOutMusic
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairBigStepLeftMovement
	opentext
	writetext DragonShrineClairThatCantBeText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairSlowStepLeftMovement
	opentext
	writetext DragonShrineClairYoureLyingText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkToClairMovement
	turnobject DRAGONSHRINE_CLAIR, UP
	opentext
	writetext DragonShrineMustIInformLanceText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, DRAGONSHRINE_CLAIR, 15
	opentext
	writetext DragonShrineIUnderstandText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairTwoSlowStepsRightMovement
	opentext
	writetext DragonShrineHereRisingBadgeText
	waitbutton
	setflag ENGINE_RISINGBADGE
	playsound SFX_GET_BADGE
	waitsfx
	special RestartMapMusic
	specialphonecall SPECIALCALL_MASTERBALL
	setscene SCENE_FINISHED
	setmapscene DRAGONS_DEN_B1F, SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM
	writetext DragonShrinePlayerReceivedRisingBadgeText
	buttonsound
	writetext DragonShrineRisingBadgeExplanationText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkAway1Movement
	turnobject DRAGONSHRINE_CLAIR, UP
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkAway2Movement
	turnobject PLAYER, UP
	opentext
	writetext DragonShrineElderScoldsClairText
	waitbutton
	closetext
	opentext
	writetext DragonShrineSpeechlessText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairWalkOutMovement
	playsound SFX_ENTER_DOOR
	disappear DRAGONSHRINE_CLAIR
	waitsfx
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

DragonShrineElder1Script:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .DontGiveDratiniYet
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	iftrue .ReceivedDratini
	checkevent EVENT_GOT_DRATINI
	iffalse .GiveDratini
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iftrue .BeatRivalInMtMoon
	writetext DragonShrineClairsGrandfatherText
	waitbutton
	closetext
	end

.GiveDratini:
	writetext DragonShrineTakeThisDratiniText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	writetext DragonShrinePlayerReceivedDratiniText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke DRATINI, 15
	checkevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	special GiveDratini
	setevent EVENT_GOT_DRATINI
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	writetext DragonShrineSymbolicDragonText
	waitbutton
	closetext
	end

.PartyFull:
	writetext DragonShrinePartyFullText
	waitbutton
	closetext
	end

.BeatRivalInMtMoon:
	writetext DragonShrineSilverIsInTrainingText
	waitbutton
	closetext
	end

.DontGiveDratiniYet:
	writetext DragonShrineComeAgainText
	waitbutton
	closetext
	end

.ReceivedDratini:
	writetext DragonShrineSymbolicDragonText
	waitbutton
	closetext
	end

DragonShrineElder2Script:
	faceplayer
	opentext
	writetext DragonShrineElder2Text
	waitbutton
	closetext
	end

DragonShrineElder3Script:
	faceplayer
	opentext
	writetext DragonShrineElder3Text
	waitbutton
	closetext
	end

DragonShrineQuestion1_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "なかま@"
	db "てした@"
	db "ともだち@"

DragonShrineQuestion2_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 9, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "さくせん@"
	db "そだてる@"
	db "インチキ@"

DragonShrineQuestion3_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 5, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "よわいひと@"
	db "つよいひと@"
	db "だれとでも@"

DragonShrineQuestion4_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "애정@"
	db "폭력@"
	db "지식@"

DragonShrineQuestion5_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 12, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "つよいの@"
	db "どっちも@"
	db "よわいの@"

DragonShrinePlayerWalkInMovement:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

DragonShrineElderStepDownMovement:
	slow_step DOWN
	step_end

DragonShrineElderWalkToClairMovement:
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	turn_head DOWN
	step_end

DragonShrineElderWalkAway1Movement:
	slow_step RIGHT
	slow_step RIGHT
	step_end

DragonShrineElderWalkAway2Movement:
	slow_step RIGHT
	turn_head DOWN
	step_end

DragonShrineClairWalkInMovement:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

DragonShrineClairBigStepLeftMovement:
	fix_facing
	big_step LEFT
	step_end

DragonShrineClairSlowStepLeftMovement:
	slow_step LEFT
	remove_fixed_facing
	step_end

DragonShrineClairTwoSlowStepsRightMovement:
	slow_step RIGHT
	slow_step RIGHT
	step_end

DragonShrineClairWalkOutMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

DragonShrineElderGreetingText:
	text"ふむ…　よくきたのう"

	para"なーにしんぱい　するでない"
	line"なにも　いわなくても　わかっておる!"
	cont"イブキの　やつにいわれて"
	cont"この　ほこらまで　きたのじゃろう?"

	para"あの　むすめにも　こまったものじゃ…"

	para"まぁ…　おぬしには　もうしわけないが"
	line"すこし　ばかり　ためさせてもらうぞ"
	cont"なーにわしの　しつもんに"
	cont"すこし　こたえて　もらうだけじゃよ"

	para"では　いくぞ…　"
	done

DragonShrineQuestion1Text:
	text"おぬしにとって　ポケモンとは"
	line"どのような　そんざい　なのかな?"
	done

DragonShrineQuestion2Text:
	text"ポケモンしょうぶで　かつために"
	line"ひつようなこと　とは　なにかな?"
	done

DragonShrineQuestion3Text:
	text"どんな　ポケモン<TRAINER>と　"
	line"たたかって　みたいと　おもう?"
	done

DragonShrineQuestion4Text:
	text"ポケモンを　そだてる　のに"
	line"いちばん　だいじなことは　なんじゃ?"
	done

DragonShrineQuestion5Text:
	text"つよいポケモンと　よわいポケモン"
	line"どっちのほうが　だいじ　なのかのう?"
	done

DragonShrinePassedTestText:
	text"ふむ　なるほど…"

	para"おぬしは　ポケモンを　とても"
	line"だいじにおもって　いるようじゃな…"

	para"かんしん　かんしん"
	line"その　こころが　たいせつなのじゃ!"

	para"<PLAYER>よ"
	line"いまの　きもちを　わすれるで　ないぞ"
	cont"その　きもちを　わすれなければ"
	cont"ポケモンりーグにいっても"
	cont"じゅうぶん　つうよう　するじゃろう!"
	done
	
DragonShrineMustIInformLanceText:
	text"こりゃ　イブキ!"

	para"この　もの"
	line"わざも　こころも　みごとな　ものじゃ"
	cont"かんねんして　さっさと"
	cont"ライジングバッジを　わたさんか!"

	para"さもないと…"
	line"このことを　ワタルにいいつけるぞ!"
	done

DragonShrineElderScoldsClairText:
	text"イブキよ…"

	para"おまえになくて"
	line"この　ものにあるもの…"
	cont"よく　かんがえる　ことじゃ"
	done
	
DragonShrineComeAgainText:
	text"きがむいたら　また　くるがよい"
	done

DragonShrineTakeThisDratiniText:
	text"ふむ…　よくきたのう"

	para"ちょうど　よかった"
	line"おぬしにわたすものが　あるのじゃ!"

	para"わしにみとめられた　あかしとして"
	line"この　ミニりュウ　つれてゆくがよい!"
	done

DragonShrinePlayerReceivedDratiniText:
	text"<PLAYER>は　ちょうろうから"
	line"ミニりュウを　もらった！"
	done
	
DragonShrinePartyFullText:
	text"なんじゃ?"
	line"ポケモンが　いっぱいの　ようじゃぞ"
	done

DragonShrineSymbolicDragonText:
	text"ドラゴンポケモンは"
	line"われら　いちぞくの　しょうちょう!"

	para"おぬしになら　まかせられる"
	done

DragonShrineClairsGrandfatherText:
	text"おぬしとの　であいで　イブキは"
	line"なにかを　かんじとった　ようじゃ…"

	para"そふ　として　かんしゃ　するぞ"
	done
	
DragonShrineSilverIsInTrainingText:
	text"いま　おぬしと　おなじ　としごろの"
	line"しょうねんが　しゅぎょうにきておる"

	para"むかしの　イブキににていて"
	line"ちょっと　しんぱい　じゃのう…"
	done

DragonShrineWrongAnswerText1:
	text"はぁ?"
	line"よく　きこえなかったのう……"
	done

DragonShrineWrongAnswerText2:
	text"なんと　いったんじゃ?"
	done
	
DragonShrineRightAnswerText:
	text"ふむ　なるほど…"
	done

DragonShrineElder2Text:
	text"ちょうろうさまに"
	line"みとめられた　ものを　みるのは"
	cont"ワタルさま　いらい　ひさしぶりじゃ"
	done
	
DragonShrineElder3Text:
	text"ワタルさまを　しっているのか?"

	para"ワタルさまは　わかいころの"
	line"ちょうろうさまにそっくりじゃ"
	cont"ちは　あらそえない　ものじゃのう…"
	done

DragonShrineClairYouPassedText:
	text"けっかは　どうかしら?"

	para"きくまでも　ないと　おもうけど…"
	line"あなたでは　むり　だったでしょう?"
	cont"<……>　<……>　<……>　<……>　<……>　<……>"
	cont"<……>　え!　ごうかく?"
	done
DragonShrineClairThatCantBeText:
	text"そんな!"
	done
	
DragonShrineClairYoureLyingText:
	text"うそでしょ!"
	line"わっ　わたしだって"
	cont"まだ　みとめてもらって　ないのに!"
	done
	
DragonShrineIUnderstandText:
	text"わっ　わかりましたわ…"
	done
	
DragonShrineHereRisingBadgeText:
	text"さあ　これが　ライジングバッジよ…"
	line"さっさと　うけとりなさい!"
	done
	
DragonShrinePlayerReceivedRisingBadgeText:
	text"<PLAYER>は　イブキから"
	line"ライジングバッジを　もらった！"
	done
	
DragonShrineRisingBadgeExplanationText:
	text"ライジングバッジを　もっていれば"
	line"どんな　たきでも"
	cont"のぼることが　できる…"
	cont"そして　すべての　ポケモンが"
	cont"あなたを　<TRAINER>として　みとめ"
	cont"どんな　めいれいにも　したがうわ…"
	done

DragonShrineSpeechlessText:
	text "<……> <……> <……> <……> <……> <……>"
	done

DragonShrine_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  9, DRAGONS_DEN_B1F, 2
	warp_event  5,  9, DRAGONS_DEN_B1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder1Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  2,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder2Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  7,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder3Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  4,  8, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRAGON_SHRINE_CLAIR
