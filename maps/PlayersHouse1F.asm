	const_def 2 ; object constants
	const PLAYERSHOUSE1F_MOM1
	const PLAYERSHOUSE1F_MOM2
	const PLAYERSHOUSE1F_MOM3
	const PLAYERSHOUSE1F_MOM4
	const PLAYERSHOUSE1F_POKEFAN_F

PlayersHouse1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

MeetMomLeftScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

MeetMomRightScript:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	turnobject PLAYER, LEFT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsTowardPlayerMovement
	sjump MeetMomScript

.OnRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksToPlayerMovement
MeetMomScript:
	opentext
	writetext ElmsLookingForYouText
	buttonsound
	getstring STRING_BUFFER_4, GearName
	scall PlayersHouse1FReceiveItemStd
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MOM
	setscene SCENE_FINISHED
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	writetext MomGivesPokegearText
	buttonsound
	special SetDayOfWeek

; .SetDayOfWeek:
	; writetext IsItDSTText
	; yesorno
	; iffalse .WrongDay
	; special InitialSetDSTFlag
	; yesorno
	; iffalse .SetDayOfWeek
	; sjump .DayOfWeekDone

; .WrongDay:
	; special InitialClearDSTFlag
	; yesorno
	; iffalse .SetDayOfWeek
; .DayOfWeekDone:

	writetext ComeHomeForDSTText
	yesorno
	iffalse .ExplainPhone
	sjump .KnowPhone

.KnowPhone:
	writetext KnowTheInstructionsText
	buttonsound
	sjump .FinishPhone

.ExplainPhone:
	writetext DontKnowTheInstructionsText
	buttonsound
	sjump .FinishPhone

.FinishPhone:
	writetext InstructionsNextText
	waitbutton
	closetext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .FromRight
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .FromLeft
	sjump .Finish

.FromRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsBackMovement
	sjump .Finish

.FromLeft:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksBackMovement
	sjump .Finish

.Finish:
	special RestartMapMusic
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	end

MeetMomTalkedScript:
	playmusic MUSIC_MOM
	sjump MeetMomScript

GearName:
	db "포켓기어@"

PlayersHouse1FReceiveItemStd:
	jumpstd receiveitem
	end

MomScript:
	faceplayer
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkscene
	iffalse MeetMomTalkedScript ; SCENE_DEFAULT
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue .FirstTimeBanking
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .BankOfMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .GaveMysteryEgg
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .GotAPokemon
	writetext HurryUpElmIsWaitingText
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext SoWhatWasProfElmsErrandText
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext ImBehindYouText
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special BankOfMom
	waitbutton
	closetext
	end

NeighborScript:
	faceplayer
	opentext
	checktime MORN
	iftrue .MornScript
	checktime DAY
	iftrue .DayScript
	checktime NITE
	iftrue .NiteScript

.MornScript:
	writetext NeighborMornIntroText
	buttonsound
	sjump .Main

.DayScript:
	writetext NeighborDayIntroText
	buttonsound
	sjump .Main

.NiteScript:
	writetext NeighborNiteIntroText
	buttonsound
	sjump .Main

.Main:
	writetext NeighborText
	waitbutton
	closetext
	turnobject PLAYERSHOUSE1F_POKEFAN_F, RIGHT
	end

TVScript:
	jumptext TVText

StoveScript:
	jumptext StoveText

SinkScript:
	jumptext SinkText

FridgeScript:
	jumptext FridgeText

MomTurnsTowardPlayerMovement:
	turn_head RIGHT
	step_end

MomWalksToPlayerMovement:
	slow_step RIGHT
	step_end

MomTurnsBackMovement:
	turn_head LEFT
	step_end

MomWalksBackMovement:
	slow_step LEFT
	step_end

ElmsLookingForYouText:
	text "아 <PLAYER>!"	
	line "옆집의 공박사님이"
	cont "찾아왔었단다"

	para "뭔지 너에게"
	line "부탁할 것이 있다고 하셔서"
	
	para "그래! 잊어먹을 뻔 했네"
	line "수리를 보냈던"
	cont "포켓몬기어가 돌아왔단다"
	
	para "여기!"
	done

MomGivesPokegearText:
	text "포켓몬기어"
	line "줄여서 포켓기어"
	
	para "훌륭한 트레이너가"
	line "되려면 가지고 있지 않으면 않될껄"
	
	para "엥? 요일을 맞추지 않았네"
	line "사용하기 전에 오늘은"
	cont "무슨 요일인가 정해놓지 않으면"
	done

IsItDSTText:
	; text "Is it Daylight"
	; line "Saving Time now?"
	; done

ComeHomeForDSTText:
	text "그래 그래"
	line "전화의 사용방법 기억하고 있니?"
	done

KnowTheInstructionsText:
	text "포켓몬기어의 스위치를 넣고"
	line "아이콘을 고르기만 하면 되잖니?"
	done

DontKnowTheInstructionsText:
	text "그럼 설명서를 읽을께"
	
	para "포켓몬기어의 스위치를 넣고"
	line "전화 아이콘을 고르는 것이란다"
	done

InstructionsNextText:
	text "전화번호는"
	line "자동으로 등록되어지니까"
	cont "기록하고 싶은 상대를 고르면 된다"
	
	para "이렇게 간단하게"
	line "전화를 할 수 있다니 대단하네"
	done

HurryUpElmIsWaitingText:
	text "공박사님이 부르셨단다"
	line "빨리 가봐야지!"
	done

SoWhatWasProfElmsErrandText:
	text "공박사님의"
	line "용무는 무엇이었니?"
	
	para "…… …… …… "
	
	para "그래 아주 힘들겠구나"
	line "그래도 다른사람에게 부탁을 받는건"
	cont "중요한 것이란다!"
	done

ImBehindYouText:
	text "<PLAYER>! 힘내거라!"

	line "엄마가 응원할께!"
	done

NeighborMornIntroText:
	text "안녕 <PLAY_G>!"
	line "나 놀러왔어!"
	done

NeighborDayIntroText:
	text "안녕 <PLAY_G>!"
	line "나 놀러왔어!"
	done
	
NeighborNiteIntroText:
	text "좋은 저녁 <PLAY_G>!"
	line "나 놀러왔어!"
	done

NeighborText:;번역함
	text "<PLAY_G> 들어봤니?"

	para "내 딸은 공박사의 조수가"
	line "되고싶어해"

	para "그애는 포켓몬 정말 좋아한다니까"
	done

StoveText:
	text "엄마의 특별요리"
	line "홍련섬 풍의 화산 햄버거!"
	done

SinkText:
	text "빤짝빤짝거리는 싱크대!"
	line "엄마는 깔끔쟁이"
	done

FridgeText:
	text "냉장고 안에는……"
	
	para "맛있는 물이 가득"
	line "그리고 달콤한 후르츠 밀크!"
	done

TVText:
	text "TV에서 영화를 하고 있다"
	line "남자아이가 둘이 여행을 하고 있다"
	cont "기차의 창너머로 별이 보인다……"
	
	para "…… 나도 빨리 가봐야지!"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, NEW_BARK_TOWN, 2
	warp_event  7,  7, NEW_BARK_TOWN, 2
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	db 2 ; coord events
	coord_event  8,  4, SCENE_DEFAULT, MeetMomLeftScript
	coord_event  9,  4, SCENE_DEFAULT, MeetMomRightScript

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, StoveScript
	bg_event  1,  1, BGEVENT_READ, SinkScript
	bg_event  2,  1, BGEVENT_READ, FridgeScript
	bg_event  4,  1, BGEVENT_READ, TVScript

	db 5 ; object events
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  2,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  0,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  4,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NeighborScript, EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
