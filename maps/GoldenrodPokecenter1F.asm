	const_def 2 ; object constants
	const GOLDENRODPOKECENTER1F_NURSE
	const GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_LASS
	const GOLDENRODPOKECENTER1F_POKEFAN_F

GoldenrodPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodPokecenter1FNurseScript:
	jumpstd pokecenternurse

GoldenrodPokecenter1F_GSBallSceneLeft:
	writebyte BATTLETOWERACTION_CHECKMOBILEEVENT
	special BattleTowerAction
	ifequal MOBILE_EVENT_OBJECT_GS_BALL, .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, 0, 7
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, MovementData_0x6105a
	turnobject PLAYER, UP
	opentext
	writetext UnknownText_0x622f0
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext UnknownText_0x62359
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, MovementData_0x61060
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GoldenrodPokecenter1F_GSBallSceneRight:
	writebyte BATTLETOWERACTION_CHECKMOBILEEVENT
	special BattleTowerAction
	ifequal MOBILE_EVENT_OBJECT_GS_BALL, .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, 0, 7
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, MovementData_0x61065
	turnobject PLAYER, UP
	opentext
	writetext UnknownText_0x622f0
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext UnknownText_0x62359
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, MovementData_0x6106c
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GoldenrodPokecenter1FGameboyKidScript:
	jumptextfaceplayer GoldenrodPokecenter1FGameboyKidText

GoldenrodPokecenter1FLassScript:
	jumptextfaceplayer GoldenrodPokecenter1FLassText

GoldenrodPokecenter1FPokefanF:
	faceplayer
	opentext
	writetext UnknownText_0x623fb
	waitbutton
	writetext UnknownText_0x6248c
	yesorno
	iffalse .NoEonMail
	takeitem EON_MAIL
	iffalse .NoEonMail
	writetext UnknownText_0x62549
	waitbutton
	writetext UnknownText_0x624a4
	waitbutton
	verbosegiveitem REVIVE
	iffalse .NoRoom
	writetext UnknownText_0x624e9
	waitbutton
	closetext
	end

.NoEonMail:
	writetext UnknownText_0x62509
	waitbutton
	closetext
	end

.NoRoom:
	giveitem EON_MAIL
	writetext UnknownText_0x6252a
	waitbutton
	closetext
	end

MovementData_0x6105a:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

MovementData_0x61060:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

MovementData_0x61065:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

MovementData_0x6106c:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

; unused
UnknownText_0x61072:
	text"ポケモンコミュニケーションセンター"
	line"トレードコーナーに　ようこそ!"

	para"こちらでは"
	line"であったことのない　おともだちと"
	cont"ポケモンの　こうかんが　たのしめます"
	done

UnknownText_0x610ce:
	text"こうかんを　するためには　ポケモンを"
	line"あずけて　もらうことになりますが…"

	para"こうかんを　しますか?"
	done

UnknownText_0x61111:
	text"つぎにどんな　ポケモンが"
	line"ほしいのか　おしえて　ください"
	done

UnknownText_0x6113b:
	text"わかりました"
	line"あなたの　@"
	text_ram wStringBuffer3
	text"と"
	cont"@"
	text_ram wStringBuffer4
	text "の"
	cont"こうかんを　とりもって　さしあげます"

	para"それでは　あなたの　ポケモンを"
	line"おあずかりさせて　いただきます"

	para"おへやの　じゅんびを　しますので"
	line"しばらく　おまちください　……"
	done

UnknownText_0x611c9:
	text"わかりました　あなたの　@"
	text_ram wStringBuffer3
	text"と"
	line"あなたが　みはっけんの　ポケモンとの"
	cont"こうかんを　とりもって　さしあげます"

	para"それでは　あなたの　ポケモンを"
	line"おあずかりさせて　いただきます"

	para"おへやの　じゅんびを　しますので"
	line"しばらく　おまちください　……"
	done

UnknownText_0x61271:
	text"あなたの　ポケモンを　"
	line"しっかりと　おあずかり　いたしました"

	para"こうかん　あいてを　さがすには　"
	line"すこし　じかんが　かかりますので"
	cont"しばらくしたら　また　おいでください"
	done

UnknownText_0x612d8:
	text"あら?　てもちの　ポケモンが"
	line"1たいしか　いないようですね　……"

	para"てもちの　ポケモンを　ふやして　から"
	line"また　いらして　ください"
	done

UnknownText_0x61344:
	text"またの"
	line"ごりようを　おまち　してます!"
	done

UnknownText_0x6135f:
	text"つうしんエラー"
	done


UnknownText_0x61375:
	text"その　ポケモンを　あずけると"
	line"たたかえる　てもちポケモンが"

	para"いなくなって　しまいます!"
	done

UnknownText_0x613a9:
	text"もうしわけ　ありませんが"
	line"タマゴは　おあずかり　できません"
	done

UnknownText_0x613c8:
	text"ポケモンにいじょうがあるので"
	line"おあずかり　できません!"
	done

UnknownText_0x61409:
	text"あら?　あなた…　ポケモンを"
	line"おあずけになっていますよね?"
	done

UnknownText_0x61438:
	text"それでは　おへやを　しらべますので"
	line"しばらく　おまちください……"
	done


UnknownText_0x6145c:
	text"おまたせ　しました！　こうかんの"
	line"あいてが　みつかっていた　ようです"
	done

UnknownText_0x6149a:
	text"あなたの　あたらしい　なかまです"
	line"かわいがって　あげて　くださいね"

	para"それでは　またの"
	line"ごりようを　おまち　しております!"
	done
	
UnknownText_0x614ed:
	text"でも　てもちの　ポケモンが"
	line"いっぱいな　ようです　ので　……"

	para"てもちの　ポケモンを　へらして　から"
	line"また　いらして　ください"
	done

UnknownText_0x61544:
	text"ざんねん　ですが…"
	line"こうかん　あいては　みつかってません"

	para"おあずかり　している"
	line"ポケモンを　ひきとりますか?"
	done

UnknownText_0x615a5:
	text"ポケモンを　"
	line"おかえし　いたしました"
	done
	
UnknownText_0x615c2:
	text"ざんねん　ですが…"
	line"こうかん　あいては　みつかってません"

	para"ながく　おあずけになっているので"
	line"あなたの　ポケモンが"
	cont"たいへん　さみしがってる　ようです"

	para"なので　1ど　おあずかり　している"
	line"ポケモンを　おかえし　いたします…"
	done


UnknownText_0x6166e:
	text"またの"
	line"ごりようを　おまち　しております!"
	done
	
UnknownText_0x61689:
	text"それでは　ひきつづき"
	line"ポケモンを　おあずかり　いたします"
	done

UnknownText_0x616b4:
	text"あら?　"
	line"ポケモンを　おあずかりしてから"
	cont"まだ　すこし　しか"
	cont"じかんが　たっていないようですね"

	para"もう　しばらく　たってから"
	line"また　おこしください"
	done

UnknownText_0x616fb:
	text"センターにおつなぎするまえに"
	line"レポートを　かきます"
	done

UnknownText_0x61727:
	text"それでは　こうかんにだしたい"
	line"ポケモンを　えらんで　ください"
	done
	
UnknownText_0x61749:
	text"もうしわけ　ありませんが　こうかんを"
	line"ちゅうし　させて　いただきます"
	done
UnknownText_0x6176f:
	text"あ!"

	para"「タマゴけん」を　おもちの"
	line"かたですね!"

	para"タマゴけんは　とくべつな　ポケモンを"
	line"とくべつな　かただけにおわたしする"
	cont"ひきかえけん　です"
	done

UnknownText_0x617d2:
	text"それでは　かんたんにせつめい"
	line"させていただきます!"

	para"トレードコーナーの　こうかんでは"
	line"であったことのない　おともだちと"
	cont"こうかんを　するので　じかんが"
	cont"かかりますが"

	para"なぞのタマゴは"
	line"あなたのためにとくべつに"
	cont"ようい　していたものですので"
	cont"すぐ　おくられてきます!"

	para"いまから　センターにある"
	line"いろいろな　へやから"

	para"1つの　へやを　えらび"
	line"そこにある　なぞのタマゴを"
	cont"おくってもらいます"
	done

UnknownText_0x6191f:
	text"じゅんびを　しますので"
	line"しばらく　おまちください……"
	done

UnknownText_0x61936:
	text"おまたせ　しました!"
	line"なぞのタマゴを　うけとりました!"

	para"これは　なぞのタマゴです"

	para"たいせつにそだてて　あげて"
	line"くださいね"
	done

UnknownText_0x61996:
	text"もうしわけ　ございません!"

	para"ただいま　タマゴけんの"
	line"サービスは　ちゅうし　しています"
	done

UnknownText_0x619db:
	text"ポケモンニュースマシンだ!"
	done

UnknownText_0x619f5:
	text"なにを　しますか?"
	done

UnknownText_0x61a11:
	text"ポケモンニュースは"
	line"みんなの　ポケモンレポートを"
	cont"あつめて　つくる　ニュースです!"

	para"あたらしい　ニュースを　よみこむとき"
	line"あなたの　ポケモンレポートが"
	cont"おくられる　ことが　あります"

	para"おくられる　レポートの　ないようは"
	line"あなたの　ぼうけんの　きろくと"
	cont"モバイルプロフィールです"

	para"でんわばんごうは　おくられません"

	para"ニュースは　みんなから　おくられる"
	line"レポートによって　いろいろ"
	cont"ないようが　かわることが　あります"

	para"もしかすると　あなたの　なまえも"
	line"ニュースにのるかもしれません!"
	done

UnknownText_0x61b7c:
	text"あたらしい　ニュースを"
	line"よみこみますか?"
	done

UnknownText_0x61b9d:
	text"あたらしい　ニュースを　よみこみます"
	line"そのまま　しばらく　おまちください"
	done
	
UnknownText_0x61bc4:
	text"まえの　ニュースが　ありません!"
	done

UnknownText_0x61bdb:
	text"ニュースの　データが　こわれています"
	line"よみこみ　なおして　ください"
	done

UnknownText_0x61c18:
	text"じゅんびちゅう…"
	line"また　あとで　おこしください"
	done

UnknownText_0x61c4b:
	text"ニュースマシンを　そうさする　まえに"
	line"レポートを　かきます"
	done

UnknownText_0x61c89:
	text"でっかい　ポケモンセンターだねー"
	line"すごいねー"

	para"ここって　さいきん　できたばかりでね"
	line"あたらしい　きかいが"
	cont"いっぱい　あるんだよ!"
	done

UnknownText_0x61cef:
	text"トレードコーナーの　あたらしい"
	line"あそびかた　はっけんしちゃった！"

	para"ポッポにメールを　もたせて"
	line"ほしい　ポケモンも　ポッポにして"
	cont"こうかんにだすんだ!"

	para"みんなが　おなじこと　すると"
	line"いろんな　ひとと"
	cont"ぶんつうが　できちゃうよ!"

	para"なづけて　ポッポメール!"

	para"…はやったら　ともだち　いっぱい"
	line"できるかも!"
	done

UnknownText_0x61dfd:
	text"ここはね　あったことのない　ひとと"
	line"ポケモンを　こうかんできる"
	cont"ところ　なんだって!"

	para"でも　いまは　まだ"
	line"ちょうせいちゅう　みたいよ"
	done

UnknownText_0x61e5c:
	text"いま　しらない　おんなのこから"
	line"ハネッコを　もらったの!"

	para"あなたも　ほしい　ポケモンと"
	line"こうかん　できると　いいね!"
	done

UnknownText_0x61eb2:
	text"メスの　ハネッコを　もらったのに"
	line"なまえが　ヤスオくん　だったの!"
	cont"しかも　パパと　おなじ　なまえ…"
	done

UnknownText_0x61efa:
	text"ニュースマシンって　なんだろう?"

	para"ラジオより　ひろい　ちいきの"
	line"じょうほうが　わかるのかな?"
	done

UnknownText_0x61f48:
	text"ポケモンコミュニケーションセンターと"
	line"ぜんぶの　ポケモンセンターが"
	cont"でんぱで　つながるんだって!"

	para"きっと　これから"
	line"いろんな　ひとと　つうしんが"
	cont"できるようになるのね!"
	done

UnknownText_0x61fc9:
	text"ここにある　しせつは"
	line"まだ　つかえないみたいだけど"

	para"ひとよりも　はやく"
	line"うわさのスポットを　みにきたっていう"
	cont"うれしさが　あるね!"
	done

UnknownText_0x6202c:
	text"こないだ　ニュースにともだちの"
	line"なまえが　でてたから　びっくりした！"
	done

UnknownText_0x6206d:
	text"さいしんじょうほうを　いつも"
	line"チェックしてないと　きがすまないわ!"
	done

UnknownText_0x620a1:
	text"ニュースになまえが　のって"
	line"すっごく　ゆうめいになっちゃったら"
	cont"きっと　もう　もてもて　だろうな…"

	para"うーん　どうやったら　のるんだろう?"
	done

GoldenrodPokecenter1FGameboyKidText:
	text"2かいにある　コロシアムで"
	line"つうしんたいせん　できるだろ"

	para"かべをみると　じぶんの　せいせきが"
	line"わかるから　まけてられないよ"
	done

UnknownText_0x62173:
	text"コガネの　ポケモンセンターに"
	line"みたこともない　きかいが　あると"
	cont"きいて　やってきたが…"

	para"まだ　いろいろと　じゅんびで"
	line"あわただしそうじゃな…"
	done

UnknownText_0x62222:
	text"ここにいると"
	line"あたらしいものが　いっぱい　みられて"
	cont"きぶんが　わかがえるのう"
	done

GoldenrodPokecenter1FLassText:
	text"どんなにレべルが　たかくたって"
	line"タイプの　あいしょうが　あるの"

	para"ぜったいにつよい　ポケモンってのは"
	line"そうそう　いないでしょうね"
	done

UnknownText_0x622f0:
	text"<PLAYER>さん　ですよね?"

	para"おめでとうございます!"

	para"こんかいは　とくべつに…ということで"
	line"ジーエスボールと　いうものが"
	cont"おくられて　きました！"

	para"どうぞ　おうけとりください!"
	done

UnknownText_0x62359:
	text"また　ごりようください!"
	done
UnknownText_0x62370:
	text"ポケモンコミュニケーションセンター"
	line"1かい　の　ごあんない"
	cont"ひだり　　　…　かんりしつ"
	cont"ちゅうおう　…　トレードコーナー"
	cont"みぎ　　　　…　ポケモンニュース"
	done

UnknownText_0x623c7:
	text"ポケモンニュースマシンだ!"

	para"まだ　ニュースは　よめない　みたい…"
	done

UnknownText_0x623fb:
	text "Oh my, your pack"
	line "looks so heavy!"

	para "Oh! Do you happen"
	line "to have something"
	cont "named EON MAIL?"

	para "My daughter is"
	line "after one."

	para "You can part with"
	line "one, can't you?"
	done

UnknownText_0x6248c:
	text "Give away an EON"
	line "MAIL?"
	done

UnknownText_0x624a4:
	text "Oh, that's great!"
	line "Thank you, honey!"

	para "Here, this is for"
	line "you in return!"
	done

UnknownText_0x624e9:
	text "My daughter will"
	line "be delighted!"
	done

UnknownText_0x62509:
	text "Oh? You don't have"
	line "one? Too bad."
	done

UnknownText_0x6252a:
	text "Oh… Well, another"
	line "time, then."
	done

UnknownText_0x62549:
	text "<PLAYER> gave away"
	line "the EON MAIL."
	done

GoldenrodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  7, GOLDENROD_CITY, 15
	warp_event  4,  7, GOLDENROD_CITY, 15
	warp_event  0,  6, POKECOM_CENTER_ADMIN_OFFICE_MOBILE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 2 ; coord events
	coord_event  3,  7, SCENE_DEFAULT, GoldenrodPokecenter1F_GSBallSceneLeft
	coord_event  4,  7, SCENE_DEFAULT, GoldenrodPokecenter1F_GSBallSceneRight

	db 0 ; bg events

	db 5 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FNurseScript, -1
	object_event 16,  8, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FLassScript, -1
	object_event  7,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FPokefanF, -1
