	const_def 2 ; object constants
	const ROUTE35NATIONALPARKGATE_OFFICER1
	const ROUTE35NATIONALPARKGATE_YOUNGSTER
	const ROUTE35NATIONALPARKGATE_OFFICER2

Route35NationalParkGate_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE35NATIONALPARKGATE_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE35NATIONALPARKGATE_UNUSED
	scene_script .LeaveContestEarly ; SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY

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
	setscene SCENE_ROUTE35NATIONALPARKGATE_NOTHING
	return

.BugContestIsRunning:
	setscene SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY
	return

.CheckIfContestAvailable:
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .SetContestOfficer
	ifequal THURSDAY, .SetContestOfficer
	ifequal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	disappear ROUTE35NATIONALPARKGATE_OFFICER1
	appear ROUTE35NATIONALPARKGATE_YOUNGSTER
	appear ROUTE35NATIONALPARKGATE_OFFICER2
	return

.SetContestOfficer:
	appear ROUTE35NATIONALPARKGATE_OFFICER1
	disappear ROUTE35NATIONALPARKGATE_YOUNGSTER
	disappear ROUTE35NATIONALPARKGATE_OFFICER2
	return

.LeavingContestEarly:
	applymovement PLAYER, Route35NationalParkGatePlayerApproachOfficer1Movement
	turnobject ROUTE35NATIONALPARKGATE_OFFICER1, RIGHT
	opentext
	readvar VAR_CONTESTMINUTES
	addval 1
	getnum STRING_BUFFER_3
	writetext Route35NationalParkGateOfficer1WantToFinishText
	yesorno
	iffalse .GoBackToContest
	writetext Route35NationalParkGateOfficer1WaitAtNorthGateText
	waitbutton
	closetext
	jumpstd bugcontestresultswarp

.GoBackToContest:
	writetext Route35NationalParkGateOfficer1OkGoFinishText
	waitbutton
	closetext
	scall Route35NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route35OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, Route35NationalParkGate_NoContestToday
	ifequal MONDAY, Route35NationalParkGate_NoContestToday
	ifequal WEDNESDAY, Route35NationalParkGate_NoContestToday
	ifequal FRIDAY, Route35NationalParkGate_NoContestToday
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route35NationalParkGate_ContestIsOver
	scall Route35NationalParkGate_GetDayOfWeek
	writetext Route35NationalParkGateOfficer1AskToParticipateText
	yesorno
	iffalse Route35NationalParkGate_DeclinedToParticipate
	readvar VAR_PARTYCOUNT
	ifgreater 1, Route35NationalParkGate_LeaveTheRestBehind
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
Route35NationalParkGate_OkayToProceed:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext Route35NationalParkGateOfficer1GiveParkBallsText
	buttonsound
	writetext Route35NationalParkGatePlayerReceivedParkBallsText
	playsound SFX_ITEM
	waitsfx
	writetext Route35NationalParkGateOfficer1ExplainsRulesText
	waitbutton
	closetext
	special GiveParkBalls
	scall Route35NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	special SelectRandomBugContestContestants
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route35NationalParkGate_EnterContest:
	readvar VAR_FACING
	ifequal LEFT, Route35NationalParkGate_FacingLeft
	applymovement PLAYER, Route35NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement
	end

Route35NationalParkGate_FacingLeft:
	applymovement PLAYER, Route35NationalParkGatePlayerEnterParkMovement
	end

Route35NationalParkGate_LeaveTheRestBehind:
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, Route35NationalParkGate_LessThanFullParty
	readvar VAR_BOXSPACE
	ifequal 0, Route35NationalParkGate_NoRoomInBox

Route35NationalParkGate_LessThanFullParty:
	special CheckFirstMonIsEgg
	ifequal TRUE, Route35NationalParkGate_FirstMonIsEgg
	writetext Route35NationalParkGateOfficer1AskToUseFirstMonText
	yesorno
	iffalse Route35NationalParkGate_DeclinedToLeaveMonsBehind
	special ContestDropOffMons
	iftrue Route35NationalParkGate_FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext Route35NationalParkGateOfficer1WellHoldYourMonText
	buttonsound
	writetext Route35NationalParkGatePlayersMonLeftWithHelperText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	buttonsound
	sjump Route35NationalParkGate_OkayToProceed

Route35NationalParkGate_DeclinedToParticipate:
	writetext Route35NationalParkGateOfficer1TakePartInFutureText
	waitbutton
	closetext
	end

Route35NationalParkGate_DeclinedToLeaveMonsBehind:
	writetext Route35NationalParkGateOfficer1ChooseMonAndComeBackText
	waitbutton
	closetext
	end

Route35NationalParkGate_FirstMonIsFainted:
	writetext Route35NationalParkGateOfficer1FirstMonCantBattleText
	waitbutton
	closetext
	end

Route35NationalParkGate_NoRoomInBox:
	writetext Route35NationalParkGateOfficer1MakeRoomText
	waitbutton
	closetext
	end

Route35NationalParkGate_FirstMonIsEgg:
	writetext Route35NationalParkGateOfficer1EggAsFirstMonText
	waitbutton
	closetext
	end

Route35NationalParkGate_ContestIsOver:
	writetext Route35NationalParkGateOfficer1ContestIsOverText
	waitbutton
	closetext
	end

Route35NationalParkGate_NoContestToday:
	jumptextfaceplayer Route35NationalParkGateOfficer1WeHoldContestsText

Route35NationalParkGateOfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route35NationalParkGate_ContestIsOver
	writetext Route35NationalParkGateOfficer1WeHoldContestsText
	waitbutton
	closetext
	end

Route35NationalParkGateYoungsterScript:
	jumptextfaceplayer Route35NationalParkGateYoungsterText

BugCatchingContestExplanationSign:
	jumptext BugCatchingContestExplanationText

Route35NationalParkGate_GetDayOfWeek:
	jumpstd daytotext
	end

Route35NationalParkGatePlayerApproachOfficer1Movement:
	step DOWN
	turn_head LEFT
	step_end

Route35NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement:
	step RIGHT
	step UP
	step UP
	step_end

Route35NationalParkGatePlayerEnterParkMovement:
	step UP
	step_end

Route35NationalParkGateOfficer1AskToParticipateText:
	text "오늘은 @"
	text_ram wStringBuffer3
	text "요일"
	line "곤충채집 대회가 열립니다"
	
	para "룰은 간단!"
	
	para "지니고있는 포켓몬 한마리로"
	line "강해보이는 벌레포켓몬을"
	cont "잡을 수 있을까를 경쟁하는겁니다"
	
	para "참가 하겠습니까?"
	done

Route35NationalParkGateOfficer1GiveParkBallsText:
	text "대회에서 사용하는"
	line "전용볼을 받으세요!"
	done

Route35NationalParkGatePlayerReceivedParkBallsText:
	text "<PLAYER>는(은)"
	line "파크볼을 20개 얻었다"
	done

Route35NationalParkGateOfficer1ExplainsRulesText:
	text "제일 강해보이는 포켓몬을"
	line "잡은 사람이 우승입니다!"
	
	para "제한시간은 20분!"
	
	para "또한 파크볼이 다 떨어져도"
	line "종료됩니다!"
	
	para "마지막에 잡은 포켓몬은"
	line "참가자의 포켓몬이 됩니다!"
	
	para "힘을내서 강해보이는"
	line "포켓몬을 잡아주세요!"
	done

Route35NationalParkGateOfficer1AskToUseFirstMonText:
	text "엥?"
	line "포켓몬이 한마리가 아니로군요!"

	para "시합에 필요한 포켓몬……"
	line "@"
	text_ram wStringBuffer3
	text "(으)로"
	cont "참가하기로 되었습니다"
	cont "괜찮겠습니까?"
	done

Route35NationalParkGateOfficer1WellHoldYourMonText:
	text "그럼 남은 포켓몬은"
	line "여기에 맡아놓겠습니다!"
	done

Route35NationalParkGatePlayersMonLeftWithHelperText:
	text "<PLAYER>는(은) 관계자에게"
	line "포켓몬을 맡겼다!"
	done
	
Route35NationalParkGateOfficer1ChooseMonAndComeBackText:
	text "대회에서 싸우게 할"
	line "포켓몬을 정하고 나서"
	cont "다시 한번 부탁을 드리겠습니다"
	done

Route35NationalParkGateOfficer1TakePartInFutureText:
	text "그렇습니까"
	line "다음 번에는 꼭 참가해주세요!"
	done

Route35NationalParkGateOfficer1FirstMonCantBattleText:
	text "엥?"
	line "참가할 포켓몬이"
	cont "싸울 수 없어 보이는군요"
	
	para "포켓몬을 바꾸고나서"
	line "와주세요"
	done
	
Route35NationalParkGateOfficer1MakeRoomText:
	text "엥?"
	line "소지품과 컴퓨터 박스도"
	cont "가득인 것 같군요"
	
	para "그렇다면 벌레포켓몬을"
	line "잡아도 지닐 수 없어요"
	
	para "소지품과 컴퓨터 박스를"
	line "정리하고 와주세요"
	done

Route35NationalParkGateOfficer1EggAsFirstMonText:
	text "엥?"
	line "맨 앞의 포켓몬이"
	cont "알 같군요"
	
	para "포켓몬을 바꾸고나서"
	line "와주세요"
	done

Route35NationalParkGateOfficer1WantToFinishText:
	text "남은 시간은"
	line "앞으로 @"
	text_ram wStringBuffer3
	text "분입니다"
	cont "벌써 끝을 내겠습니까?"
	done

Route35NationalParkGateOfficer1WaitAtNorthGateText:
	text "그렇습니까"
	line "그럼 위의 게이트에서"
	cont "결과발표를"
	cont "기다려주십시오"
	done

Route35NationalParkGateOfficer1OkGoFinishText:
	text "그렇습니까"
	line "그럼 남은 시간"
	cont "더욱 분발하고 와주십시요"
	done

Route35NationalParkGateOfficer1ContestIsOverText:
	text "오늘의 콘테스트는"
	line "끝났어요"
	cont "다음에 다시 참가해주세요!"
	done

Route35NationalParkGateOfficer1WeHoldContestsText:
	text "공원에서는 가끔"
	line "대회가 열린단다"
	cont "괜찮다면 너도 참가하지 않을래?"
	done
	
Route35NationalParkGateYoungsterText:
	text "곤충채집 대회"
	line "다음은 언제일까?"
	done

BugCatchingContestExplanationText:
	text "곤충채집 대회가"
	line "열리는 것은……"
	cont "화요일 목요일 토요일"
	
	para "참가상을 받는 것은 물론이고"
	line "잡은 벌레포켓몬을"
	cont "자기가 가질 수 있습니다"
	done


Route35NationalParkGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  0, NATIONAL_PARK, 3
	warp_event  4,  0, NATIONAL_PARK, 4
	warp_event  3,  7, ROUTE_35, 3
	warp_event  4,  7, ROUTE_35, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  0, BGEVENT_READ, BugCatchingContestExplanationSign

	db 3 ; object events
	object_event  2,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35OfficerScriptContest, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  6,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGateYoungsterScript, EVENT_ROUTE_35_NATIONAL_PARK_GATE_YOUNGSTER
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGateOfficerScript, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
