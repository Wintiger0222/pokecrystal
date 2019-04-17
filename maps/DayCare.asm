	const_def 2 ; object constants
	const DAYCARE_GRAMPS
	const DAYCARE_GRANNY

DayCare_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .EggCheckCallback

.EggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside
	clearevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	setevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	return

.PutDayCareManOutside:
	setevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	clearevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	return

DayCareManScript_Inside:
	faceplayer
	opentext
	checkevent EVENT_GOT_ODD_EGG
	iftrue .AlreadyHaveOddEgg
	writetext DayCareManText_GiveOddEgg
	buttonsound
	closetext
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	special GiveOddEgg
	opentext
	writetext DayCareText_GotOddEgg
	playsound SFX_KEY_ITEM
	waitsfx
	writetext DayCareText_DescribeOddEgg
	waitbutton
	closetext
	setevent EVENT_GOT_ODD_EGG
	end

.PartyFull:
	opentext
	writetext DayCareText_PartyFull
	waitbutton
	closetext
	end

.AlreadyHaveOddEgg:
	special DayCareMan
	waitbutton
	closetext
	end

DayCareLadyScript:
	faceplayer
	opentext
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .HusbandWasLookingForYou
	special DayCareLady
	waitbutton
	closetext
	end

.HusbandWasLookingForYou:
	writetext Text_GrampsLookingForYou
	waitbutton
	closetext
	end

DayCareBookshelf:
	jumpstd difficultbookshelf

Text_GrampsLookingForYou:
	text"할아버지가"
	line"널 찾고 있더라"
	done
	
Text_DayCareManTalksAboutEggTicket:
	text"난 키우미집 할아버지란다"
	line"최근 금빛시티에 생긴"
	cont"트레이드 코너인가 하는 데서"
	cont"수수께끼의 알을 받을 수 있다는"

	para"「알 티켓」이란걸"
	line"받아는데…"

	para"우린 키우미집 하니까"
	line"필요없구나"

	para"줄테니 받아가렴"
	done

DayCareManText_GiveOddEgg:
	text "나는 키우미집 할아버지란다"
	line "알에 대한 거 알고 있니?"

	para "아내랑 같이 포켓몬을 "
	line "키우고 있었는데"
	cont "어느 날 이런 알이 있던 게다!"

	para "신기한 일이야"

	para "혹시 알을 가지고 싶니?"

	para "그러면 너에게 줄테니"
	line "신경 쓰지 말고 가져가렴"
	done

DayCareText_ComeAgain:
	text"나중에 또 오렴"
	done
	
DayCareText_GotOddEgg:
	text "<PLAYER>는(은)"
	line "이상한 알을 받았다."
	done

DayCareText_DescribeOddEgg:
	text "다른 트레이너의"
	line "포켓몬을 키울 때"
	cont "본 알이란다"

	para "…그런데 그 트레이너가"
	line "알을 갖기 싫다고 해서"
	cont "내가 이렇게 키우고 있었단다"
	done

DayCareText_PartyFull:
	text "자리가 없어!"
	done

DayCare_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  5, ROUTE_34, 3
	warp_event  0,  6, ROUTE_34, 4
	warp_event  2,  7, ROUTE_34, 5
	warp_event  3,  7, ROUTE_34, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, DayCareBookshelf
	bg_event  1,  1, BGEVENT_READ, DayCareBookshelf

	db 2 ; object events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Inside, EVENT_DAY_CARE_MAN_IN_DAY_CARE
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DayCareLadyScript, -1
