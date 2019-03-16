	const_def 2 ; object constants
	const ROUTE36NATIONALPARKGATE_OFFICER1
	const ROUTE36NATIONALPARKGATE_YOUNGSTER1
	const ROUTE36NATIONALPARKGATE_YOUNGSTER2
	const ROUTE36NATIONALPARKGATE_ROCKER
	const ROUTE36NATIONALPARKGATE_POKEFAN_M
	const ROUTE36NATIONALPARKGATE_YOUNGSTER3
	const ROUTE36NATIONALPARKGATE_YOUNGSTER4
	const ROUTE36NATIONALPARKGATE_LASS
	const ROUTE36NATIONALPARKGATE_YOUNGSTER5
	const ROUTE36NATIONALPARKGATE_YOUNGSTER6
	const ROUTE36NATIONALPARKGATE_YOUNGSTER7
	const ROUTE36NATIONALPARKGATE_OFFICER2

Route36NationalParkGate_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE36NATIONALPARKGATE_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE36NATIONALPARKGATE_UNUSED
	scene_script .LeaveContestEarly ; SCENE_ROUTE36NATIONALPARKGATE_LEAVE_CONTEST_EARLY

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .CheckIfContestRunning
	callback MAPCALLBACK_OBJECTS, .CheckIfContestAvailable

.DummyScene0:
	end

.DummyScene1:
	end

.LeaveContestEarly:
	prioritysjump .LeavingContestEarly
	end

.CheckIfContestRunning:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	setscene SCENE_ROUTE36NATIONALPARKGATE_NOTHING
	return

.BugContestIsRunning:
	setscene SCENE_ROUTE36NATIONALPARKGATE_LEAVE_CONTEST_EARLY
	return

.CheckIfContestAvailable:
	checkevent EVENT_WARPED_FROM_ROUTE_35_NATIONAL_PARK_GATE
	iftrue .Return
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .SetContestOfficer
	ifequal THURSDAY, .SetContestOfficer
	ifequal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .SetContestOfficer
	disappear ROUTE36NATIONALPARKGATE_OFFICER1
	appear ROUTE36NATIONALPARKGATE_OFFICER2
	return

.SetContestOfficer:
	appear ROUTE36NATIONALPARKGATE_OFFICER1
	disappear ROUTE36NATIONALPARKGATE_OFFICER2
.Return:
	return

.LeavingContestEarly:
	turnobject PLAYER, UP
	opentext
	readvar VAR_CONTESTMINUTES
	addval 1
	getnum STRING_BUFFER_3
	writetext UnknownText_0x6b284
	yesorno
	iffalse .GoBackToContest
	writetext UnknownText_0x6b2c5
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	scall .CopyContestants
	disappear ROUTE36NATIONALPARKGATE_OFFICER1
	appear ROUTE36NATIONALPARKGATE_OFFICER2
	applymovement PLAYER, MovementData_0x6add1
	pause 15
	special FadeInQuickly
	jumpstd bugcontestresults

.GoBackToContest:
	writetext UnknownText_0x6b300
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	warpfacing LEFT, NATIONAL_PARK_BUG_CONTEST, 33, 18
	end

.CopyContestants:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_1A
	iftrue .Not1
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER1
.Not1:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_2A
	iftrue .Not2
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER2
.Not2:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_3A
	iftrue .Not3
	appear ROUTE36NATIONALPARKGATE_ROCKER
.Not3:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_4A
	iftrue .Not4
	appear ROUTE36NATIONALPARKGATE_POKEFAN_M
.Not4:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_5A
	iftrue .Not5
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER3
.Not5:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_6A
	iftrue .Not6
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER4
.Not6:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_7A
	iftrue .Not7
	appear ROUTE36NATIONALPARKGATE_LASS
.Not7:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_8A
	iftrue .Not8
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER5
.Not8:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_9A
	iftrue .Not9
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER6
.Not9:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_10A
	iftrue .Not10
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER7
.Not10:
	special UpdateSprites
	end

Route36OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, _ContestNotOn
	ifequal MONDAY, _ContestNotOn
	ifequal WEDNESDAY, _ContestNotOn
	ifequal FRIDAY, _ContestNotOn
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route36Officer_ContestHasConcluded
	scall Route36ParkGate_DayToText
	writetext UnknownText_0x6add5
	yesorno
	iffalse .DecidedNotToJoinContest
	readvar VAR_PARTYCOUNT
	ifgreater 1, .LeaveMonsWithOfficer
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
.ResumeStartingContest:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext UnknownText_0x6ae87
	buttonsound
	waitsfx
	writetext UnknownText_0x6aeb1
	playsound SFX_ITEM
	waitsfx
	writetext UnknownText_0x6aecc
	waitbutton
	closetext
	setflag ENGINE_BUG_CONTEST_TIMER
	special GiveParkBalls
	turnobject PLAYER, LEFT
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	special SelectRandomBugContestContestants
	warpfacing LEFT, NATIONAL_PARK_BUG_CONTEST, 33, 18
	end

.LeaveMonsWithOfficer:
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, .ContinueLeavingMons
	readvar VAR_BOXSPACE
	ifequal 0, .BoxFull
.ContinueLeavingMons:
	special CheckFirstMonIsEgg
	ifequal TRUE, .FirstMonIsEgg
	writetext UnknownText_0x6afb0
	yesorno
	iffalse .RefusedToLeaveMons
	special ContestDropOffMons
	iftrue .FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext UnknownText_0x6b021
	buttonsound
	writetext UnknownText_0x6b055
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	buttonsound
	sjump .ResumeStartingContest

.DecidedNotToJoinContest:
	writetext UnknownText_0x6b0c6
	waitbutton
	closetext
	end

.RefusedToLeaveMons:
	writetext UnknownText_0x6b081
	waitbutton
	closetext
	end

.FirstMonIsFainted:
	writetext UnknownText_0x6b0f2
	waitbutton
	closetext
	end

.BoxFull:
	writetext UnknownText_0x6b166
	waitbutton
	closetext
	end

.FirstMonIsEgg:
	writetext UnknownText_0x6b209
	waitbutton
	closetext
	end

Route36Officer_ContestHasConcluded:
	checkevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	iftrue .Sunstone
	checkevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	iftrue .Everstone
	checkevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	iftrue .GoldBerry
	checkevent EVENT_CONTEST_OFFICER_HAS_BERRY
	iftrue .Berry
	writetext UnknownText_0x6b32b
	waitbutton
	closetext
	end

.Sunstone:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem SUN_STONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	closetext
	end

.Everstone:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	closetext
	end

.GoldBerry:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem GOLD_BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	closetext
	end

.Berry:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_BERRY
	closetext
	end

.BagFull:
	writetext UnknownText_0x6b910
	waitbutton
	closetext
	end

_ContestNotOn:
	jumptextfaceplayer UnknownText_0x6b370

Route36NationalParkGateOfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route36Officer_ContestHasConcluded
	writetext UnknownText_0x6b370
	waitbutton
	closetext
	end

Route36ParkGate_DayToText:
	jumpstd daytotext
	end

BugCatchingContestant1BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant1BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant1BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant2BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant2BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant2BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant3BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant3BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant3BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant4BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant4BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant4BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant5BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant5BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant5BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant6BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant6BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant6BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant7BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant7BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant7BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant8BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant8BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant8BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant9BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant9BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant9BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant10BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant10BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant10BStillCompetingText
	waitbutton
	closetext
	end

UnusedBugCatchingContestExplanationSign:
; duplicate of BugCatchingContestExplanationSign in Route35NationalParkGate.asm
	jumptext UnusedBugCatchingContestExplanationText

MovementData_0x6add1:
	big_step DOWN
	big_step RIGHT
	turn_head UP
	step_end

UnknownText_0x6add5:
	text "오늘은 @"
	text_ram wStringBuffer3
	text "요일"
	line "곤충채집 대회가 열립니다"
	
	para "룰은 간단!"
	
	para "소지한 포켓몬 1마리로"
	line "강해보이는 벌레포켓몬을"
	cont "잡을 수 있을까 경쟁하는겁니다"
	
	para "참가하겠습니까?"
	done
	
UnknownText_0x6ae87:
	text "대회에서 사용할"
	line "전용볼을 받으세요!"
	done

UnknownText_0x6aeb1:
	text "<PLAYER>는(은)"
	line "파크볼을 20개 받았다!"
	done

UnknownText_0x6aecc:
	text "가장 강해보이는 포켓몬을"
	line "잡은 사람이 우승입니다!"
	
	para "제한시간은 20분!"
	
	para "또한 파크볼이 전부 떨어지면"
	line "종료입니다!"
	
	para "최종적으로 잡은 포켓몬은"
	line "참가자의 것이 되겠습니다!"
	
	para "열심히 해서 강해보이는"
	line "포켓몬을 잡아주세요!"
	done

UnknownText_0x6afb0:
	text "엥?"
	line "포켓몬이 한마리가 아니로군요!"

	para "시합에 필요한 포켓몬……"
	line "@"
	text_ram wStringBuffer3
	text "(으)로"
	cont "참가하기로 되겠습니다"
	cont "괜찮겠습니까?"
	done

UnknownText_0x6b021:
	text "그럼 남은 포켓몬은"
	line "여기서 맡아놓겠습니다!"
	done

UnknownText_0x6b055:
	text "<PLAYER>는(은) 관계자에게"
	line "포켓몬을 맡겼다!"
	done

UnknownText_0x6b081:
	text "대회에서 싸우게 할"
	line "포켓몬을 정하고나서"
	cont "다시 한번 와주세요"
	done

UnknownText_0x6b0c6:
	text "그렇습니까"
	line "그럼 다음에 참가해주세요!"
	done

UnknownText_0x6b0f2:
	text "엥?"
	line "참가할 포켓몬이"
	cont "싸울 수 없어보이는군요"
	
	para "포켓몬을 바꾸고나서"
	line "와주세요"
	done
	
UnknownText_0x6b166:
	text "엥?"
	line "소지품과 컴퓨터 박스도"
	cont "가득인 것 같군요"
	
	para "그렇다면 벌레포켓몬을"
	line "잡아도 지닐 수 없어요"
	
	para "소지품과 컴퓨터 박스를"
	line "정리하고 와주세요"
	done

UnknownText_0x6b209:
	text "엥?"
	line "맨 앞의 포켓몬이"
	cont "알 같군요"
	
	para "포켓몬을 바꾸고나서"
	line "와주세요"
	done

UnknownText_0x6b284:
	text "남은 시간은"
	line "앞으로 @"
	text_ram wStringBuffer3
	text "분입니다"
	cont "벌써 끝내겠습니까?"
	done

UnknownText_0x6b2c5:
	text "그렇습니까"
	line "그럼 여기서 결과발표를"
	cont "기다려 주십시오"
	done

UnknownText_0x6b300:
	text "그렇습니까"
	line "그럼 남은시간"
	cont "더욱 분발하고 와주세요!"
	done
	
UnknownText_0x6b32b:
	text "오늘의 콘테스트는"
	line "끝났어요"
	cont "다음에 다시 참가하세요!"
	done

UnknownText_0x6b370:
	text "공원에서만 발견할 수 있는"
	line "포켓몬도 있단다!"
	done

BugCatchingContestant1BText:
	text "미키『나를 패배시키다니……"
	line "너 꽤 잘하는군!"
	done
BugCatchingContestant1BStillCompetingText:
	text "미키『포켓몬이 나올까 어떨까는"
	line "운도 중요하단다"
	done

BugCatchingContestant2BText:
	text "태민『움 부럽군"
	line "이번에는 상태가 나빳어"
	done

BugCatchingContestant2BStillCompetingText:
	text "태민『혹시 커다란"
	line "포켓몬이라면 우승일까?"
	done
	
BugCatchingContestant3BText:
	text "켄『훌륭해!"
	line "나도 포켓몬을 새롭게 키울꺼야!"
	done

BugCatchingContestant3BStillCompetingText:
	text "켄『포켓몬의 색깔이"
	line "희귀하면 포인트가 높아질까"
	done
	
BugCatchingContestant4BText:
	text "인명『네가 우승인가!"
	line "어떤 포켓몬을 잡았느냐"
	done

BugCatchingContestant4BStillCompetingText:
	text "인명『원하던 포켓몬을"
	line "발견한다면 만족이지"
	done

BugCatchingContestant5BText:
	text "정남『축하해!"
	line "너에대해 존경을 할 것 같아!"
	done

BugCatchingContestant5BStillCompetingText:
	text "정남『요전에"
	line "스라크를 잡았는데"
	cont "우승을 못했었어……"
	done

BugCatchingContestant6BText:
	text "웅일『네가 잡은"
	line "포켓몬 멋있구나!"
	done

BugCatchingContestant6BStillCompetingText:
	text "웅일『레벨이 높으면"
	line "우승하기 쉬울텐데……"
	cont "그밖에도 포인트가 있는 것 같아"
	done

BugCatchingContestant7BText:
	text "미지『네가 우승!?"
	line "대단하네!!"
	
	para "다음번에 함께 벌레포켓몬을"
	line "잡으러가지 않을래?"
	done
	
BugCatchingContestant7BStillCompetingText:
	text "미지『난 벌레포켓몬을"
	line "제일 좋아한단다"
	done

BugCatchingContestant8BText:
	text "희주『벌레포켓몬 잡기에"
	line "이 내가 지다니……"
	done

BugCatchingContestant8BStillCompetingText:
	text "희주『캐터피로"
	line "우승한 사람이 있다고한다!"
	done

BugCatchingContestant9BText:
	text "동석『다음번엔 내가 이길꺼야!"
	done

BugCatchingContestant9BStillCompetingText:
	text "동석『움 더 많이"
	line "포인트가 높다고 생각했는데"
	done

BugCatchingContestant10BText:
	text "지선『꼭 비법을 가르쳐줘!"
	line "공부하고싶걸랑!"
	done

BugCatchingContestant10BStillCompetingText:
	text "지선『공부하고는 있지만……"
	line "그것만으로는 이길 수 없겠지"
	done

UnusedSudowoodoText:
; This text is unused and unreferenced in the final game.
; The tree Pokémon is Sudowoodo.
; The Silph Scope 2 was later reworked into the Squirtbottle.
	text "커다란 나무와 같은 모습의"
	line "포켓몬이 어딘가에 있다고한다"
	
	para "실프 스코프2가 있다면"
	line "정체를 알 수 있데"
	done

UnusedBugCatchingContestExplanationText:
; duplicate of BugCatchingContestExplanationText in Route35NationalParkGate.asm
	text "곤충채집 대회가"
	line "열리는 것은……"
	cont "화요일 목요일 토요일"
	
	para "참가상을 받는 것은 물론이고"
	line "잡은 벌레포켓몬을"
	cont "자기가 가질 수 있습니다"
	done

UnknownText_0x6b910:
	text "오잉?"
	line "짐이 가득찬 것 같군요."
	
	para "오늘 가져갈 수 없다면"
	line "맡아두겠으니"
	cont "짐을 정리하고 와주세요"
	done

UnknownText_0x6b97f:
	text "<PLAYER>씨죠?"
	
	para "여기"
	line "맡아두었던 상품입니다"
	done

Route36NationalParkGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, NATIONAL_PARK, 1
	warp_event  0,  5, NATIONAL_PARK, 2
	warp_event  9,  4, ROUTE_36, 1
	warp_event  9,  5, ROUTE_36, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6,  0, BGEVENT_READ, BugCatchingContestExplanationSign

	db 12 ; object events
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route36OfficerScriptContest, EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant1BScript, EVENT_BUG_CATCHING_CONTESTANT_1B
	object_event  4,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant2BScript, EVENT_BUG_CATCHING_CONTESTANT_2B
	object_event  2,  6, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant3BScript, EVENT_BUG_CATCHING_CONTESTANT_3B
	object_event  6,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant4BScript, EVENT_BUG_CATCHING_CONTESTANT_4B
	object_event  2,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant5BScript, EVENT_BUG_CATCHING_CONTESTANT_5B
	object_event  5,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant6BScript, EVENT_BUG_CATCHING_CONTESTANT_6B
	object_event  3,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant7BScript, EVENT_BUG_CATCHING_CONTESTANT_7B
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant8BScript, EVENT_BUG_CATCHING_CONTESTANT_8B
	object_event  6,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant9BScript, EVENT_BUG_CATCHING_CONTESTANT_9B
	object_event  6,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant10BScript, EVENT_BUG_CATCHING_CONTESTANT_10B
	object_event  3,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route36NationalParkGateOfficerScript, EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
