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
	prioritysjump .DragonShrineTestScript
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
	readvar VAR_PARTYCOUNT
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
	db "동료@"
	db "부하@"
	db "친구@"

DragonShrineQuestion2_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 9, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "작전@"
	db "육성@"
	db "속임수@"

DragonShrineQuestion3_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 5, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "약한사람@"
	db "강한사람@"
	db "누구라도@"

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
	db "강한 쪽@"
	db "어느쪽도@"
	db "약한 쪽@"

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
	text"흠…　어서와라"

	para"걱정할 필요 없느니라"
	line"아무 말 안해도 알고 있느니라!"
	cont"이향 그 녀석이"
	cont"여기까지 오라고 한거지?"

	para"그 녀석도 곤란하게 하는구나…"

	para"뭐…　그대에겐 미안하지만"
	line"조금 시험해보도록 하마"
	cont"별거 아닐세 내 질문에"
	cont"답하는거 정도니"

	para"그럼 질문하겠네…　"
	done

DragonShrineQuestion1Text:
	text"그대에게 있어서 포켓몬이란"
	line"어떤 존재인가?"
	done

DragonShrineQuestion2Text:
	text"포켓몬 승부에 이기기 위해"
	line"필요한건 무엇인가?"
	done

DragonShrineQuestion3Text:
	text"어떤 포켓몬<TRAINER>와　"
	line"싸워보고 싶은가?"
	done

DragonShrineQuestion4Text:
	text"포켓몬을 기르는데 있어서"
	line"가장 중요한건 무엇인가?"
	done

DragonShrineQuestion5Text:
	text"강한 포켓몬과 약한 포켓몬"
	line"어느쪽이 소중한가?"
	done

DragonShrinePassedTestText:
	text"그래 그렇군…"

	para"그대는 포켓몬을 무척"
	line"소중하게 생각하고 있는듯 하네…"

	para"관심 관심"
	line"그 마음가짐이 중요한 것일세!"

	para"<PLAYER>(이)여"
	line"지금의 마음을 잊어버리지 말게나"
	cont"그 마음을 잊어버리지 않는다면"
	cont"포켓몬 리그도"
	cont"충분히 해낼 수 있을걸세!"
	done
	
DragonShrineMustIInformLanceText:
	text"그럼 이향!"

	para"이 자는"
	line"실력도 마음도 완벽한 자일세"
	cont"단념하고 냉큼"
	cont"라이징 배지를 주지 못할까!"

	para"안그런다면…"
	line"이번 일을 목호에게 얘기할터!"
	done

DragonShrineElderScoldsClairText:
	text"이향이여…"

	para"너에겐 없고"
	line"이 자에겐 있는 것…"
	cont"잘 생각해보는게 좋을걸세"
	done
	
DragonShrineComeAgainText:
	text"기분이 내킨다면 다시와주게"
	done

DragonShrineTakeThisDratiniText:
	text"흠…　잘 와주었네"

	para"딱 잘 되었다"
	line"그대에게 줄것이 있네!"

	para"그대를 인정했다는 뜻이니"
	line"이 미뇽을 데려가도록 하게!"
	done

DragonShrinePlayerReceivedDratiniText:
	text"<PLAYER>는(은) 장로에게"
	line"미뇽을 받았다!"
	done
	
DragonShrinePartyFullText:
	text"뭣이?"
	line"포켓몬이 잔뜩일세"
	done

DragonShrineSymbolicDragonText:
	text"드래곤 포켓몬은"
	line"우리 일족의 상징!"

	para"그대라면 맡길 수 있지"
	done

DragonShrineClairsGrandfatherText:
	text"그대와의 만남으로 이향은"
	line"뭔가를 느낀거 같네…"

	para"그 아이의 할애비로써 감사 하네"
	done
	
DragonShrineSilverIsInTrainingText:
	text"지금 그대와 같은 또래의"
	line"소년이 수행을 하고있네"

	para"이향의 어릴적과 닮아있어서"
	line"조금 걱정일세…"
	done

DragonShrineWrongAnswerText1:
	text"응?"
	line"잘 안들렸네만……"
	done

DragonShrineWrongAnswerText2:
	text"뭐라고 했지?"
	done
	
DragonShrineRightAnswerText:
	text"흠 그렇군…"
	done

DragonShrineElder2Text:
	text"장로님이"
	line"인정한 사람을 보는건"
	cont"목호님 이후 오랜만이군"
	done
	
DragonShrineElder3Text:
	text"목호님을 알고있는건가?"

	para"목호님은 젊었을적"
	line"장로님과 꼭 닮았지"
	cont"피는 속일 수 없는건가…"
	done

DragonShrineClairYouPassedText:
	text"결과는 어땠지?"

	para"뭐 굳이 들을 필요도 없겠지만…"
	line"역시 너에겐 무리였지?"
	cont"<……>　<……>　<……>　<……>　<……>　<……>"
	cont"<……>　엣!　합격?"
	done
	
DragonShrineClairThatCantBeText:
	text"그럴수가!"
	done
	
DragonShrineClairYoureLyingText:
	text"거짓말이지!"
	line"나…나도 아직까지"
	cont"인정받지 못했는데!"
	done
	
DragonShrineIUnderstandText:
	text"아…알겠어…"
	done
	
DragonShrineHereRisingBadgeText:
	text"자 이게 라이징 배지야…"
	line"빨리 받으라고!"
	done
	
DragonShrinePlayerReceivedRisingBadgeText:
	text"<PLAYER>는(은) 이향에게"
	line"라이징 배지를 받았다！"
	done
	
DragonShrineRisingBadgeExplanationText:
	text"라이징 배지를 가지고 있으면"
	line"어떤 폭포라도"
	cont"넘을 수 있어…"
	cont"그리고 모든 포켓몬이"
	cont"너를　<TRAINER>로써 인정하게 되어"
	cont"어떤 명령이라도 따를거야…"
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
