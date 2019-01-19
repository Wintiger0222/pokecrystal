	const_def 2 ; object constants
	const GOLDENRODFLOWERSHOP_TEACHER
	const GOLDENRODFLOWERSHOP_FLORIA

GoldenrodFlowerShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FlowerShopTeacherScript:
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .Lalala
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue .GotSquirtbottle
	checkevent EVENT_MET_FLORIA
	iffalse .HaventMetFloria
	checkevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
	iffalse .Lalala
	checkflag ENGINE_PLAINBADGE
	iffalse .NoPlainBadge
	faceplayer
	opentext
	writetext UnknownText_0x554c2
	buttonsound
	verbosegiveitem SQUIRTBOTTLE
	setevent EVENT_GOT_SQUIRTBOTTLE
	closetext
	setevent EVENT_FLORIA_AT_SUDOWOODO
	clearevent EVENT_FLORIA_AT_FLOWER_SHOP
	end

.Lalala:
	turnobject GOLDENRODFLOWERSHOP_TEACHER, LEFT
	opentext
	writetext UnknownText_0x5552e
	waitbutton
	closetext
	end

.GotSquirtbottle:
	jumptextfaceplayer UnknownText_0x5550d

.NoPlainBadge:
	jumptextfaceplayer UnknownText_0x55463

.HaventMetFloria:
	jumptextfaceplayer UnknownText_0x553d4

FlowerShopFloriaScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .FoughtSudowoodo
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue .GotSquirtbottle
	writetext UnknownText_0x55561
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
	setevent EVENT_FLORIA_AT_FLOWER_SHOP
	clearevent EVENT_FLORIA_AT_SUDOWOODO
	end

.GotSquirtbottle:
	writetext UnknownText_0x555e6
	waitbutton
	closetext
	end

.FoughtSudowoodo:
	writetext UnknownText_0x55604
	waitbutton
	closetext
	end

FlowerShopShelf1:
; unused
	jumpstd picturebookshelf

FlowerShopShelf2:
; unused
	jumpstd magazinebookshelf

FlowerShopRadio:
; unused
	jumpstd radio2

UnknownText_0x553d4:
	text "36번 도로의"
	line "움직이는 나무를 본 적 있니?"

	para"わたしの　いもうとが"
	line"おもしろがって　みにいっちゃったの…"
	cont"あぶなくないのかしら　しんぱいだわ…"
	done

UnknownText_0x55463:
	text"キミも　じょうろを　かりたいの?"
	line"あぶないこと　かんがえちゃ　ダメよ"
	done
	
UnknownText_0x554c2:
	text "응? 너"
	line "꼭두보다 강하구나"

	para"それなら　だいじょうぶね"
	line"この　ゼニガメじょうろを　あげるわ"
	done

UnknownText_0x5550d:
	text"あまり　あぶないことを　しちゃダメよ"
	done

UnknownText_0x5552e:
	text "라라라 라라라라"
	line "듬뿍 물을 줄께"
	done

UnknownText_0x55561:
	text"うちの　おねえちゃんに"
	line"うごく　きの　はなしを　したら"
	cont"あぶないから　やめなさい　だって!"

	para"アカネちゃんにかてたら"
	line"じょうろ　かして　くれるかなぁ……"
	done

UnknownText_0x555e6:
	text"アカネちゃんにかつなんて　すごいね"
	done

UnknownText_0x55604:
	text"やっぱり　ポケモン　だったのね!"
	done

GoldenrodFlowerShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 6
	warp_event  3,  7, GOLDENROD_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FlowerShopTeacherScript, -1
	object_event  5,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FlowerShopFloriaScript, EVENT_FLORIA_AT_FLOWER_SHOP
