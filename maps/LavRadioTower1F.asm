	const_def 2 ; object constants
	const LAVRADIOTOWER1F_RECEPTIONIST
	const LAVRADIOTOWER1F_OFFICER
	const LAVRADIOTOWER1F_SUPER_NERD1
	const LAVRADIOTOWER1F_GENTLEMAN
	const LAVRADIOTOWER1F_SUPER_NERD2

LavRadioTower1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LavRadioTower1FReceptionistScript:
	jumptextfaceplayer LavRadioTower1FReceptionistText

LavRadioTower1FOfficerScript:
	jumptextfaceplayer LavRadioTower1FOfficerText

LavRadioTower1FSuperNerd1Script:
	jumptextfaceplayer LavRadioTower1FSuperNerd1Text

LavRadioTower1FGentlemanScript:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext LavRadioTower1FGentlemanText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext LavRadioTower1FGentlemanText_ReturnedMachinePart
	buttonsound
	stringtotext .expncardname, MEM_BUFFER_1
	scall .receiveitem
	setflag ENGINE_EXPN_CARD
.GotExpnCard:
	writetext LavRadioTower1FGentlemanText_GotExpnCard
	waitbutton
	closetext
	end

.receiveitem:
	jumpstd receiveitem
	end

.expncardname
	db "확장카드@";미번역
	;확장카드?

LavRadioTower1FSuperNerd2Script:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	writetext LavRadioTower1FSuperNerd2Text
	waitbutton
	closetext
	end

.GotExpnCard:
	writetext LavRadioTower1FSuperNerd2Text_GotExpnCard
	waitbutton
	closetext
	end

LavRadioTower1FDirectory:
	jumptext LavRadioTower1FDirectoryText

LavRadioTower1FPokeFluteSign:
	jumptext LavRadioTower1FPokeFluteSignText

LavRadioTower1FReferenceLibrary:
; unreferenced
	jumptext LavRadioTower1FReferenceLibraryText

LavRadioTower1FReceptionistText:
	text "어서오세요!"
	
	para "1층의 플로어는"
	line "견학중입니다!"
	done

LavRadioTower1FOfficerText:
	text "견학은 1층 플로어뿐입니다"
	
	para "성도의 라디오타워가"
	line "악당들에게 점령되어서"
	cont "경비를 강화했습니다"
	done

LavRadioTower1FSuperNerd1Text:
	text "많은 사람들이"
	line "라디오타워에서 일하고 있데!"
	
	para "재미있는 방송을 만들기위해"
	line "모두 힘을내고 있지!"
	done

LavRadioTower1FGentlemanText:
	text "아아 큰일이다!"
	
	para "발전소가 움직이지 않으면"
	line "라디오 방송도 할 수 없게된다!"
	
	para "겨우 라디오를 시작했는데"
	line "방송을 하지 못 하게 되면"
	cont "나는 파멸이야-!"
	done

LavRadioTower1FGentlemanText_ReturnedMachinePart:
	text "오오!"
	line "네가 발전소 사건을"
	cont "해결한 <PLAY_G>인가!"
	
	para "네 덕분으로 나는"
	line "짤리지 않고 살고 있단다"
	cont "정말 살았단다!"
	
	para "내 마음의 선물이다"
	line "이것을 받아가거라!"
	done

LavRadioTower1FGentlemanText_GotExpnCard:
	text "그것이 있으면"
	line "새로운 라디오 방송이 생긴다"
	cont "들을 수 있도록 된단다!"
	cont "카하하하하핫!"
	done

LavRadioTower1FSuperNerd2Text:
	text "하아-이!"
	line "나는 음악 방송의"
	cont "최고 감독!"
	
	para "……오잉 너의 포켓기어로는"
	line "유감이지만 내 방송을"
	cont "수신할 수 없구나!"
	
	para "업그레이드를 한 라디오 카드를"
	line "끼우면 들을 수 있게 된단다!"
	done

LavRadioTower1FSuperNerd2Text_GotExpnCard:
	text "하아-이!"
	line "나는 음악 방송의"
	cont "최고 감독!"
	
	para "아름다운 멜로디를"
	line "방송하고 있단다!"
	cont "잘 부탁해!"
	done

LavRadioTower1FDirectoryText:
	text "1층 …… 안내"
	line "2층 …… 영업부"
	cont "3층 …… 총무부"
	cont "4층 …… 제작실"
	cont "5층 …… 국장실"
	done

LavRadioTower1FPokeFluteSignText:
	text "맑고 깨끗한 피리의 음색으로"
	line "포켓몬의 기분도 두둥실!"
	cont "채널 20!"
	done

LavRadioTower1FReferenceLibraryText:
	text "포켓몬의 CD랑"
	line "비디오가 많이 진열되어 있다"
	cont "방송 자료인가?"
	done
	

LavRadioTower1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, LAVENDER_TOWN, 7
	warp_event  3,  7, LAVENDER_TOWN, 7

	db 0 ; coord events

	db 2 ; bg events
	bg_event 11,  0, BGEVENT_READ, LavRadioTower1FDirectory
	bg_event  5,  0, BGEVENT_READ, LavRadioTower1FPokeFluteSign

	db 5 ; object events
	object_event  6,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FReceptionistScript, -1
	object_event 15,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FOfficerScript, -1
	object_event  1,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd1Script, -1
	object_event  9,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FGentlemanScript, -1
	object_event 14,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd2Script, -1
