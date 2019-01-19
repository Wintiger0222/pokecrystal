	const_def 2 ; object constants
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST1
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST2
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST3

PokecomCenterAdminOfficeMobile_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PokecomCenterAdminOfficeMobileScientist1Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist1Text

PokecomCenterAdminOfficeMobileScientist2Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist2Text

PokecomCenterAdminOfficeMobileScientist3Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist3Text

PokecomCenterAdminOfficeMobileComputer1:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text
	waitbutton
.loop:
	reloadmappart
	loadmenu .Computer1MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .PokeComClub
	ifequal 2, .MobileCenter
	jump .Quit

.PokeComClub:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text_PokeComClub
	waitbutton
	jump .loop

.MobileCenter:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text_MobileCenter
	waitbutton
	jump .loop

.Quit:
	closetext
	end

.Computer1MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
IF DEF (_CRYSTALMOBILE)
	db "# COM CLUB@" ; # COM CLUB
	db "MOBILE CENTER@" ; MOBILE CENTER
	db "QUIT@" ; QUIT
ELSE;번역하지마세요
	db "#　つうしん　クラブ@" ; # COM CLUB
	db "モバイルセンター@" ; MOBILE CENTER
	db "やめる@" ; QUIT
ENDC

PokecomCenterAdminOfficeMobileComputer2:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text
	waitbutton
.loop:
	reloadmappart
	loadmenu .Computer2MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .UsePhone
	ifequal 2, .DontUsePhone
	jump .Quit

.UsePhone:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text_UsePhone
	waitbutton
	jump .loop

.DontUsePhone:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text_DontUsePhone
	waitbutton
	jump .loop

.Quit:
	closetext
	end

.Computer2MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
IF DEF (_CRYSTALMOBILE)
	db "Use phone@" ; Use phone
	db "Don't use phone@" ; Don't use phone
	db "QUIT@" ; QUIT
ELSE;번역하지마세요
	db "でんわ<WO>つかうとき@" ; Use phone
	db "でんわ<GA>つながらないとき@" ; Don't use phone
	db "やめる@" ; QUIT
ENDC

PokecomCenterAdminOfficeMobileComputer3:
	jumptext PokecomCenterAdminOfficeMobileComputer3Text

PokecomCenterAdminOfficeMobileScientist1Text:
	text"ポケモンコミュニケーションセンターと"
	line"モバイルセンターは"

	para"とおくにいる　<TRAINER>どうしや"
	line"しらない　<TRAINER>どうし　でも"
	cont"たいせんや　こうかんが　できたら"
	cont"いいな　という　きぼうがあって"
	cont"つくられたんです"
	done

PokecomCenterAdminOfficeMobileScientist2Text:
	text"はじめて　モバイルを　つかって"
	line"つうしん　できたときは　かんどう"
	cont"したでしょ?"

	para"ぼくらも　さいしょに　つうしんの"
	line"じっけんが　せいこう　したときは"
	cont"からだが　ふるえちゃったよ"
	done

PokecomCenterAdminOfficeMobileScientist3Text:
	text"これだけ　おおきい　しせつが"
	line"できたのは　でんぱ　の　ぎじゅつが"
	cont"おおきく　はってん　したからなんだ"
	done

PokecomCenterAdminOfficeMobileComputer1Text:
	text"モバイルアダプタを　つかう"
	line"ばしょに　ついて　かいてある"
	done

PokecomCenterAdminOfficeMobileComputer1Text_PokeComClub:
	text "There's a #COM"
	text"ポケモンセンター　2かいの"
	line"ポケモン　つうしん　クラブ　で"

	para"モバイルアダプタをつかって"
	line"とおくにいる　おともだちと"
	cont"たいせんや　こうかんが　できます"

	para"つうしんは　おなじ　しゅるいの"
	line"モバイルアダプタを　つかっている"
	cont"おともだちと　してください"
	done

PokecomCenterAdminOfficeMobileComputer1Text_MobileCenter:
	text"トレードコーナーで　こうかんしたり"
	line"ポケモンニュースを　よみこむときは"

	para"モバイルセンター　という　ところに"
	line"でんわを　かけます"

	para"モバイルセンターに　つなぐには"
	line"まず　モバイルセンターへの"
	cont"とうろくを　しておいてください"
	done

PokecomCenterAdminOfficeMobileComputer2Text:
	text"でんわを　つかうときに"
	line"ついて　かいてある"
	done

PokecomCenterAdminOfficeMobileComputer2Text_UsePhone:
	text"でんわと　モバイルアダプタを"
	line"しっかり　つないでください"

	para"でんぱが　はいりやすい"
	line"ところで　つうしんしてください"

	para"つうしんちゅうは　でんわを"
	line"さわったり　きらないで　ください"
	done

PokecomCenterAdminOfficeMobileComputer2Text_DontUsePhone:
	text"でんわかいせんが　こんでいるときは"
	line"うまく　つながらないことが　あります"

	para"そのときは　すこし　まってから"
	line"かけなおして　みてください"

	para"どうしても　うまく　いかなかったり"
	line"エラーの　いみが　わからないときは"

	para"サポートセンターへ　といあわせるか"
	line"せつめいしょを　よんでください"
	done

PokecomCenterAdminOfficeMobileComputer3Text:
	text"かんりしつに　メールが　きてる!"

	para"……　……　……"

	para"『ポケモンコミュニケーションセンター"
	line"スタッフの　みなさんへ"

	para"でんぱで　つうしんが　できるので"
	line"ぜんこくの　ポケモン<TRAINER>が"
	cont"こうりゅう　できるように"
	cont"なりましたね!"

	para"このさき　いつか　せかいじゅうの"
	line"ポケモン<TRAINER>　ぜんいんが"
	cont"つうしん　できるように　なる　ひまで"
	cont"がんばってください!"

	para"……　……　……"
	done

PokecomCenterAdminOfficeMobile_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0, 31, GOLDENROD_POKECENTER_1F, 3
	warp_event  1, 31, GOLDENROD_POKECENTER_1F, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6, 26, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer1
	bg_event  6, 28, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer2
	bg_event  3, 26, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer3

	db 3 ; object events
	object_event  4, 28, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist1Script, -1
	object_event  7, 27, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist2Script, -1
	object_event  7, 29, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist3Script, -1
