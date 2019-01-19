	const_def 2 ; object constants
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST1
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST2
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST3

RuinsOfAlphResearchCenter_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_RUINSOFALPHRESEARCHCENTER_NOTHING
	scene_script .GetUnownDex ; SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ScientistCallback

.DummyScene0:
	end

.GetUnownDex:
	priorityjump .GetUnownDexScript
	end

.ScientistCallback:
	checkscene
	ifequal SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX, .ShowScientist
	return

.ShowScientist:
	moveobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 3, 7
	appear RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	return

.GetUnownDexScript:
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, MovementData_0x5926f
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	turnobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, DOWN
	opentext
	writetext RuinsOfAlphResearchCenterModifiedDexText
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, MovementData_0x59274
	opentext
	writetext RuinsOfAlphResearchCenterDexUpgradedText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_UNOWN_DEX
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, MovementData_0x59276
	setscene SCENE_RUINSOFALPHRESEARCHCENTER_NOTHING
	special RestartMapMusic
	end

RuinsOfAlphResearchCenterScientist3Script:
	faceplayer
	opentext
	checkcode VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterScientist3_PrinterAvailable
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterScientist1Script:
	faceplayer
	opentext
	checkcode VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkflag ENGINE_UNOWN_DEX
	iftrue .GotUnownDex
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist1Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist1Text_UnownAppeared
	waitbutton
	closetext
	end

.GotUnownDex:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotUnownDex
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotAllUnown
	waitbutton
	closetext
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	end

RuinsOfAlphResearchCenterScientist2Script:
	faceplayer
	opentext
	checkcode VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist2Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist2Text_UnownAppeared
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterScientist2Text_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterComputer:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	checkcode VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
.SkipChecking:
	writetext RuinsOfAlphResearchCenterComputerText
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterComputerText_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterPrinter:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	checkcode VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
.SkipChecking:
	writetext RuinsOfAlphResearchCenterPrinterText_DoesntWork
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterUnownPrinterText
	waitbutton
	special UnownPrinter
	closetext
	end

RuinsOfAlphResearchCenterPhoto:
; unreferenced
	jumptext RuinsOfAlphResearchCenterProfSilktreePhotoText

RuinsOfAlphResearchCenterBookshelf:
	jumptext RuinsOfAlphResearchCenterAcademicBooksText

MovementData_0x5926f:
	step UP
	step UP
	step LEFT
	turn_head UP
	step_end

MovementData_0x59274:
	step DOWN
	step_end

MovementData_0x59276:
	step UP
	step_end

RuinsOfAlphResearchCenterModifiedDexText:
	text "좋아!"
	
	para "포켓몬 도감의 개조가"
	line "끝났다!"
	
	para "옵션에서 안농도감을"
	line "추가해 넣었다"
	
	para "잡힌 순서대로"
	line "기록될 수 있도록 했단다"
	done

RuinsOfAlphResearchCenterDexUpgradedText:
	text "<PLAYER>의"
	line "포켓몬 도감의 성능이 향상되었다!"
	done

RuinsOfAlphResearchCenterScientist3Text:
	text "잡힌 안농이"
	line "전부 기록되어질꺼야"
	
	para "몇 종류나 있을까"
	line "너도 확인해 줘!"
	done

RuinsOfAlphResearchCenterScientist3_PrinterAvailable:
	text "안농을 전부"
	line "잡았다구?"
	cont "그것 굉장하군!"
	done

RuinsOfAlphResearchCenterScientist1Text:
	text "대략 1500년 전에"
	line "유적이 만들어졌지만"
	cont "누가 무엇을 위해 만들었나"
	cont "아직 모릅니다……"
	done
	
RuinsOfAlphResearchCenterScientist1Text_GotUnownDex:
	text "유적의 포켓몬"
	line "전부 몇 종류나 있지?"
	done

RuinsOfAlphResearchCenterScientist1Text_UnownAppeared:
	text "유적의 포켓몬이"
	line "출현했어요!?"
	
	para "이건 대 사건이군"
	line "바로 조사를 착수해야겠군!"
	done

RuinsOfAlphResearchCenterScientist1Text_GotAllUnown:
	text"わたしたちの　ちょうさと　きみの"
	line"きょうりょくの　おかげで"
	cont"いせきの　ことが　わかってきたよ"

	para"あの　いせきは　ポケモンの　すみか"
	line"として　つくられた　らしいね"
	done

RuinsOfAlphResearchCenterScientist2Text:
	text "벽에 그려져 있는 모양이"
	line "유적의 수수께끼를 푸는 열쇠다!"
	
	para "……라고 생각하는데-"
	done

RuinsOfAlphResearchCenterScientist2Text_UnownAppeared:
	text "네가 만난 포켓몬은"
	line "유적 벽의 모양과"
	cont "닮아있는것 같군"
	
	para "……흐음"
	
	para "그렇다고하면 수많은 종류가"
	line "유적에 있다는 것인가……"
	done

RuinsOfAlphResearchCenterUnusedText1:
; unused
	text"なぞの　もようが　あらわれたのには"
	line"なにか　きっかけとなる　できごとが"
	cont"あったと　おもうんだよ"

	para"いま　それを　しらべているんだ"
	done

RuinsOfAlphResearchCenterUnusedText2:
; unused
	text"ぼくの　しらべでは…"

	para"ポケモンコミュニケーションセンターが"
	line"できたときから　なぞの　もようが"
	cont"あらわれているんだ!"

	para"ということは…　でんぱ!　が"
	line"なにか　かんけい　してるらしいね"
	done

RuinsOfAlphResearchCenterScientist2Text_GotAllUnown:
	text "Why did those"
	line "ancient patterns"

	para "appear on the wall"
	line "now?"

	para "The mystery"
	line "deepens…"
	done

RuinsOfAlphResearchCenterComputerText:
	text "알프 유적의 조사"
	line "……올해로 10년째"
	done
	
RuinsOfAlphResearchCenterComputerText_GotAllUnown:
	text "수수께끼의 포켓몬"
	line "이름……안농"
	cont "전부해서 26종류 발견"
	done

RuinsOfAlphResearchCenterPrinterText_DoesntWork:
	text "이상한 기계다……"
	done

RuinsOfAlphResearchCenterUnownPrinterText:
	text "안농의 모습을"
	line "프린트할 수 있습니다!"
	done

RuinsOfAlphResearchCenterProfSilktreePhotoText:
; unused
	text "알프의 유적 연구소"
	line "초대 소장"
	cont "작명박사의 사진이다!"
	done

RuinsOfAlphResearchCenterAcademicBooksText:
	text "어려운 책들이 가득하군"
	line "『고대 유적』……"
	cont "『고대 문명의 수수께끼』……"
	done
	
RuinsOfAlphResearchCenter_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, RUINS_OF_ALPH_OUTSIDE, 6
	warp_event  3,  7, RUINS_OF_ALPH_OUTSIDE, 6

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6,  5, BGEVENT_READ, RuinsOfAlphResearchCenterBookshelf
	bg_event  3,  4, BGEVENT_READ, RuinsOfAlphResearchCenterComputer
	bg_event  7,  1, BGEVENT_READ, RuinsOfAlphResearchCenterPrinter

	db 3 ; object events
	object_event  4,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist1Script, -1
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist2Script, -1
	object_event  2,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist3Script, EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
