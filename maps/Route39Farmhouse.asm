	const_def 2 ; object constants
	const ROUTE39FARMHOUSE_POKEFAN_M
	const ROUTE39FARMHOUSE_POKEFAN_F

Route39Farmhouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PokefanM_DairyFarmer:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue FarmerMScript_SellMilk
	writetext FarmerMText_SickCow
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	end

FarmerMScript_SellMilk:
	checkitem MOOMOO_MILK
	iftrue FarmerMScript_Milking
	writetext FarmerMText_BuyMilk
	special PlaceMoneyTopRight
	yesorno
	iffalse FarmerMScript_NoSale
	checkmoney YOUR_MONEY, 500
	ifequal HAVE_LESS, FarmerMScript_NoMoney
	giveitem MOOMOO_MILK
	iffalse FarmerMScript_NoRoom
	takemoney YOUR_MONEY, 500
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext FarmerMText_GotMilk
	buttonsound
	itemnotify
	closetext
	end

FarmerMScript_NoMoney:
	writetext FarmerMText_NoMoney
	waitbutton
	closetext
	end

FarmerMScript_NoRoom:
	writetext FarmerMText_NoRoom
	waitbutton
	closetext
	end

FarmerMScript_NoSale:
	writetext FarmerMText_NoSale
	waitbutton
	closetext
	end

FarmerMScript_Milking:
	writetext FarmerMText_Milking
	waitbutton
	closetext
	end

PokefanF_SnoreFarmer:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
	iftrue FarmerFScript_GotSnore
	checkevent EVENT_HEALED_MOOMOO
	iftrue FarmerFScript_GiveSnore
	writetext FarmerFText_InTrouble
	waitbutton
	closetext
	end

FarmerFScript_GiveSnore:
	writetext FarmerFText_HealedMiltank
	buttonsound
	verbosegiveitem TM_SNORE
	iffalse FarmerFScript_NoRoomForSnore
	setevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
FarmerFScript_GotSnore:
	writetext FarmerFText_SnoreSpeech
	waitbutton
FarmerFScript_NoRoomForSnore:
	closetext
	end

FarmhouseBookshelf:
	jumpstd picturebookshelf

FarmerMText_SickCow:
	text "나의 밀탱크"
	line "유유가 나오지 않게 되었단다!"
	
	para "우리집의 우유는 유명하다"
	line "모두 마시고싶다고 이야기하는데"
	
	para "나무열매를 많이 먹인다면"
	line "건강해져서"
	cont "맛있는 우유를 많이"
	cont "만들어 줄텐데말야"
	done

FarmerMText_BuyMilk:
	text "목장의 자랑인"
	line "튼튼 우유는 필요없나?"
	
	para "포켓몬에게 마시게하면"
	line "체력을 회복한단다"
	
	para "지금이라면 500원이다"
	done

FarmerMText_GotMilk:
	text "많이 마시거라!"
	done

FarmerMText_NoMoney:
	text "이런이런 돈이 부족하구나!"
	done

FarmerMText_NoRoom:
	text "이런이런 짐이 가득찼구나!"
	done
	
FarmerMText_NoSale:
	text "필요없다?"
	line "그럼 다음에 오거라"
	done

FarmerMText_Milking:
	text "그럼 젖을 짜기 시작 해볼까"
	done

FarmerFText_InTrouble:
	text "우리 우유는"
	line "관동지방에도 출하하고 있다"
	
	para "하지만 밀탱크가"
	line "맛있는 우유를 만들지 못하면"
	cont "우리들은 곤란해진단다"
	done

FarmerFText_HealedMiltank:
	text "밀탱크가"
	line "맛있는 우유를 만들기 시작한 것은"
	cont "너의 덕분이다"
	
	para "이것을 너에게 주마"
	line "꼭 받아주거라"
	done

Text_ReceivedTM13:
	text "<PLAYER>는(은)"
	line "기술머신13을 얻었다!"
	done

FarmerFText_SnoreSpeech:
	text "그것은 코골기라는 기술이다"
	
	para "자고있을 때에만 쓸 수 있는"
	line "희귀한 기술이니까"
	cont "잘 생각해서 사용하거라"
	done

Route39Farmhouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_39, 2
	warp_event  3,  7, ROUTE_39, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, FarmhouseBookshelf
	bg_event  1,  1, BGEVENT_READ, FarmhouseBookshelf

	db 2 ; object events
	object_event  3,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokefanM_DairyFarmer, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokefanF_SnoreFarmer, -1
