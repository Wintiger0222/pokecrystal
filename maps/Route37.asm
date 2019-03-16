	const_def 2 ; object constants
	const ROUTE37_WEIRD_TREE1
	const ROUTE37_WEIRD_TREE2
	const ROUTE37_YOUNGSTER
	const ROUTE37_FRUIT_TREE1
	const ROUTE37_SUNNY
	const ROUTE37_FRUIT_TREE2
	const ROUTE37_FRUIT_TREE3

Route37_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Sunny

.Sunny:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .SunnyAppears
	disappear ROUTE37_SUNNY
	return

.SunnyAppears:
	appear ROUTE37_SUNNY
	return

TrainerTwinsAnnandanne1:
	trainer TWINS, ANNANDANNE1, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsAnnandanne1SeenText, TwinsAnnandanne1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsAnnandanne1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsAnnandanne2:
	trainer TWINS, ANNANDANNE2, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsAnnandanne2SeenText, TwinsAnnandanne2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsAnnandanne2AfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicGreg:
	trainer PSYCHIC_T, GREG, EVENT_BEAT_PSYCHIC_GREG, PsychicGregSeenText, PsychicGregBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicGregAfterBattleText
	waitbutton
	closetext
	end

SunnyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_MAGNET_FROM_SUNNY
	iftrue SunnySundayScript
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, SunnyNotSundayScript
	checkevent EVENT_MET_SUNNY_OF_SUNDAY
	iftrue .MetSunny
	writetext MeetSunnyText
	buttonsound
	setevent EVENT_MET_SUNNY_OF_SUNDAY
.MetSunny:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Kris
	writetext SunnyGivesGiftText1
	buttonsound
	sjump .next
.Kris:
	writetext SunnyGivesGiftText2
	buttonsound
.next
	verbosegiveitem MAGNET
	iffalse SunnyDoneScript
	setevent EVENT_GOT_MAGNET_FROM_SUNNY
	writetext SunnyGaveGiftText
	waitbutton
	closetext
	end

SunnySundayScript:
	writetext SunnySundayText
	waitbutton
SunnyDoneScript:
	closetext
	end

SunnyNotSundayScript:
	writetext SunnyNotSundayText
	waitbutton
	closetext
	end

Route37Sign:
	jumptext Route37SignText

Route37FruitTree1:
	fruittree FRUITTREE_ROUTE_37_1

Route37FruitTree2:
	fruittree FRUITTREE_ROUTE_37_2

Route37FruitTree3:
	fruittree FRUITTREE_ROUTE_37_3

Route37HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_37_HIDDEN_ETHER

TwinsAnnandanne1SeenText:
	text "마나『카나랑 둘이서"
	line "힘을 합쳐 열심히합니다!"
	done

TwinsAnnandanne1BeatenText:
	text "마나와카나『히잉"
	line "당신, 너무 강해요"
	done

TwinsAnnandanne1AfterBattleText:
	text "마나『언니랑 포켓몬이"
	line "생각하고 있는 것을 안다구요"
	done

TwinsAnnandanne2SeenText:
	text "카나『마나랑 둘이서"
	line "힘을 합쳐서 열심히 합니다!"
	done

TwinsAnnandanne2BeatenText:
	text "마나와카나『잉잉"
	line "당신은 심술꾸러기예요"
	done

TwinsAnnandanne2AfterBattleText:
	text "카나『우리 둘이랑"
	line "포켓몬은 같은 감정이예요"
	done

PsychicGregSeenText:
	text "포켓몬을 잠들게하면"
	line "아무것도 할 수 없게되지"
	cont "그 무서움을 가르쳐주마!"
	done

PsychicGregBeatenText:
	text "졌다……"
	line "꽤 슬프구나"
	done

PsychicGregAfterBattleText:
	text "잠들게 하거나 마비시키거나 해서"
	line "상대방의 자유를 빼앗는 것은"
	cont "중요한 테크닉이지"
	done

MeetSunnyText:
	text "일식『난 말이야-"
	line "일요일의 일식이다!"
	done

SunnyGivesGiftText1:
	text "형이랑 만나면"
	line "이걸 전해주라고 심부름 받았어!"
	done

SunnyGivesGiftText2:
	text "형이랑 만나면"
	line "이걸 전해주라고 심부름 받았어!"
	done

SunnyGaveGiftText:
	text "일식『그것은말야"
	
	para "음 그러니까"
	
	para "…… 뭐였드라?"
	
	para "…… …… ……"
	
	para "아!"
	line "생각났다!"
	
	para "전기타입의 기술을 배운"
	line "포켓몬에게 지니게하면"
	cont "기술의 위력이 강해진데!"
	cont "월희 누나가 그렇게 말했어!"
	done

SunnySundayText:
	text "일식『월희 누나랑"
	line "화홍 누나랑"
	cont "수방 형이랑"
	cont "목인 형이랑"
	cont "금순 누나랑"
	cont "토영 형!"
	
	para "내가 제일 막내야!"
	done

SunnyNotSundayText:
	text "일식『오늘은 일요일이"
	line "아니라구?"
	cont "음 그럼 저기 까먹었당!"
	done

Route37SignText:
	text "이곳은 37번 도로"
	done

Route37_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  3, BGEVENT_READ, Route37Sign
	bg_event  4,  2, BGEVENT_ITEM, Route37HiddenEther

	db 7 ; object events
	object_event  6, 12, SPRITE_WEIRD_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAnnandanne1, -1
	object_event  7, 12, SPRITE_WEIRD_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAnnandanne2, -1
	object_event  6,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicGreg, -1
	object_event 13,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37FruitTree1, -1
	object_event 16,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunnyScript, EVENT_ROUTE_37_SUNNY_OF_SUNDAY
	object_event 16,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37FruitTree2, -1
	object_event 15,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37FruitTree3, -1
