CELADONDEPTSTORE6F_FRESH_WATER_PRICE EQU 200
CELADONDEPTSTORE6F_SODA_POP_PRICE    EQU 300
CELADONDEPTSTORE6F_LEMONADE_PRICE    EQU 350

	const_def 2 ; object constants
	const CELADONDEPTSTORE6F_SUPER_NERD
	const CELADONDEPTSTORE6F_YOUNGSTER

CeladonDeptStore6F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HideRooftopStairs

.HideRooftopStairs:
	changeblock 12, 0, $03 ; wall
	return

CeladonDeptStore6FSuperNerdScript:
	jumptextfaceplayer CeladonDeptStore6FSuperNerdText

CeladonDeptStore6FYoungsterScript:
	jumptextfaceplayer CeladonDeptStore6FYoungsterText

CeladonDeptStore6FVendingMachine:
	opentext
	writetext CeladonVendingText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .FreshWater
	ifequal 2, .SodaPop
	ifequal 3, .Lemonade
	closetext
	end

.FreshWater:
	checkmoney YOUR_MONEY, CELADONDEPTSTORE6F_FRESH_WATER_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem FRESH_WATER
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, CELADONDEPTSTORE6F_FRESH_WATER_PRICE
	getitemname STRING_BUFFER_3, FRESH_WATER
	sjump .VendItem

.SodaPop:
	checkmoney YOUR_MONEY, CELADONDEPTSTORE6F_SODA_POP_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem SODA_POP
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, CELADONDEPTSTORE6F_SODA_POP_PRICE
	getitemname STRING_BUFFER_3, SODA_POP
	sjump .VendItem

.Lemonade:
	checkmoney YOUR_MONEY, CELADONDEPTSTORE6F_LEMONADE_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem LEMONADE
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, CELADONDEPTSTORE6F_LEMONADE_PRICE
	getitemname STRING_BUFFER_3, LEMONADE
	sjump .VendItem

.VendItem:
	pause 10
	playsound SFX_ENTER_DOOR
	writetext CeladonClangText
	buttonsound
	itemnotify
	sjump .Start

.NotEnoughMoney:
	writetext CeladonVendingNoMoneyText
	waitbutton
	sjump .Start

.NotEnoughSpace:
	writetext CeladonVendingNoSpaceText
	waitbutton
	sjump .Start

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1 ;11, 15?;수정필요
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags;미번역
	db 4 ; items
	db "맛있는　물　　　200¥@"
	db "미네랄　사이다　300¥@"
	db "후르츠　밀크　　350¥@"
	db "그만두다@"

CeladonDeptStore6FDirectory:
	jumptext CeladonDeptStore6FDirectoryText

; unused
CeladonDeptStore6FElevatorButton:
	jumpstd elevatorbutton

CeladonVendingText:
	text "자동판매기다!"
	line "마시고싶은 음료는…… ……"
	done

CeladonClangText:
	text "덜컹!"

	para "@"
	text_ram wStringBuffer3
	text "(이)가 나왔다"
	done

CeladonVendingNoMoneyText:
	text "돈이 모자라!"
	done

CeladonVendingNoSpaceText:
	text "이 이상 들 수 없어!"
	done

CeladonDeptStore6FSuperNerdText:
	text "근처 제비뽑기"
	line "자동판매기……"
	cont "최근에는 볼 수가 없네"
	done

CeladonDeptStore6FYoungsterText:
	text "저기 형아!"
	line "여긴 게임이 없어!"
	cont "난 게임으로 놀고싶은데"
	done

CeladonDeptStore6FDirectoryText:
	text "6층 …… 휴식의 공원"
	line "      …… 자동판매기"
	done

CeladonDeptStore6F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 15,  0, CELADON_DEPT_STORE_5F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event 14,  0, BGEVENT_READ, CeladonDeptStore6FDirectory
	bg_event  3,  0, BGEVENT_READ, CeladonDeptStore1FElevatorButton
	bg_event  8,  1, BGEVENT_UP, CeladonDeptStore6FVendingMachine
	bg_event  9,  1, BGEVENT_UP, CeladonDeptStore6FVendingMachine
	bg_event 10,  1, BGEVENT_UP, CeladonDeptStore6FVendingMachine
	bg_event 11,  1, BGEVENT_UP, CeladonDeptStore6FVendingMachine

	db 2 ; object events
	object_event  9,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore6FSuperNerdScript, -1
	object_event 12,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore6FYoungsterScript, -1
