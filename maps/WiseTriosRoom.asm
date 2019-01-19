	const_def 2 ; object constants
	const WISETRIOSROOM_SAGE1
	const WISETRIOSROOM_SAGE2
	const WISETRIOSROOM_SAGE3
	const WISETRIOSROOM_SAGE4
	const WISETRIOSROOM_SAGE5
	const WISETRIOSROOM_SAGE6

WiseTriosRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .WiseTrioCallback

.DummyScene0:
	end

.DummyScene1:
	end

.WiseTrioCallback:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .NoWiseTrio
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .WiseTrio2
	checkitem CLEAR_BELL
	iftrue .WiseTrio2
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

.WiseTrio2:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

.NoWiseTrio:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

WiseTriosRoomSage1Script:
	jumptextfaceplayer WiseTriosRoomSage1Text

WiseTriosRoomSage2Script:
	jumptextfaceplayer WiseTriosRoomSage2Text

WiseTriosRoomSage3Script:
	jumptextfaceplayer WiseTriosRoomSage3Text

WiseTriosRoom_CannotEnterTinTowerScript:
	turnobject WISETRIOSROOM_SAGE3, UP
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE3, 20
	follow PLAYER, WISETRIOSROOM_SAGE3
	applymovement PLAYER, MovementData_0x98622
	stopfollow
	turnobject PLAYER, RIGHT
	opentext
	writetext WiseTriosRoomSage3BlocksExitText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_SAGE3, MovementData_0x98625
	turnobject WISETRIOSROOM_SAGE3, LEFT
	end

TrainerSageGaku:
	trainer SAGE, GAKU, EVENT_BEAT_SAGE_GAKU, SageGakuSeenText, SageGakuBeatenText, 0, .Script

.Script:
	opentext
	writetext SageGakuAfterBattleText
	waitbutton
	closetext
	end

TrainerSageMasa:
	trainer SAGE, MASA, EVENT_BEAT_SAGE_MASA, SageMasaSeenText, SageMasaBeatenText, 0, .Script

.Script:
	opentext
	writetext SageMasaAfterBattleText
	waitbutton
	closetext
	end

TrainerSageKoji:
	trainer SAGE, KOJI, EVENT_BEAT_SAGE_KOJI, SageKojiSeenText, SageKojiBeatenText, 0, .Script

.Script:
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .KojiAllowsPassage
	pause 10
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE6, 20
	opentext
	writetext SageKojiAfterBattleQuestionText
	buttonsound
	writetext SageKojiAfterBattleSpeechText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_SAGE6, MovementData_0x98628
	turnobject WISETRIOSROOM_SAGE6, UP
	setevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	setscene SCENE_FINISHED
	end

.KojiAllowsPassage:
	opentext
	writetext SageKojiAfterBattleFinalText
	waitbutton
	closetext
	end

MovementData_0x98622:
	step LEFT
	step LEFT
	step_end

MovementData_0x98625:
	step RIGHT
	step DOWN
	step_end

MovementData_0x98628:
	step RIGHT
	step DOWN
	step_end

WiseTriosRoomSage1Text:
	text"なんということだ!"

	para"スイクン　エンテイ　ライコウさまが"
	line"めざめられた　らしい…"

	para"あの　でんせつが　おきるというのか?"
	done

WiseTriosRoomSage2Text:
	text"わたしたちも　やけたとうで"
	line"しゅぎょうを　しておりますが"
	cont"あなが　あいたなど　きいたことも"
	cont"ございません"

	para"だれかが　わざと　あなを"
	line"つくったとしか　かんがえられません…"
	done
	
WiseTriosRoomSage3BlocksExitText:
	text"スズのとうは　エンジュの"
	line"ジムバッジを　もっていれば"
	cont"はいれるのじゃが"

	para"スイクン　エンテイ　ライコウさまが"
	line"めざめられた　いま"

	para"ごえんりょ　ねがいたい!"
	done

WiseTriosRoomSage3Text:
	text"わたしたちは　でんせつの　ポケモンを"
	line"まもっている　3にんしゅうじゃ"
	done

SageGakuSeenText:
	text"でんせつでは　ポケモンと"
	line"こころを　かよわせる"
	cont"じんぶつが　あらわれたとき"

	para"スズのとうで　そのじんぶつを　ためす"
	line"と　ある……"

	para"その　でんせつどおり"

	para"ポケモン…　スイクンさまが"
	line"おこしに　なった！"

	para"わたしたち　3にんしゅうが"
	line"きみに　その　しかくが　あるのか"
	cont"たしかめる!"
	done

SageGakuBeatenText:
	text"よそう　いじょうに　つよい…"
	line"……　もしや……"
	done

SageGakuAfterBattleText:
	text"きみが　おやすみに　なっていた"
	line"スイクン　エンテイ　ライコウさまを"
	cont"みた　という　かたか"

	para"しんじられん!"

	para"でんせつでは　おやすみに"
	line"なられているときは　みえない"
	cont"と　あるのに……"
	done

SageMasaSeenText:
	text"あなたに　しんじつを　つたえて"
	line"よいものか　どうか"

	para"おちから　はいけん　いたします"
	done

SageMasaBeatenText:
	text"…………"
	line"しんじつを　おはなし　しましょう"
	done
	
SageMasaAfterBattleText:
	text"むかしは　9じゅうの　とうが"
	line"2つ　ありました"

	para"ポケモンを　おこす　とう　と"
	line"いわれた　かねのとう"

	para"ポケモンを　やすめる　とう　と"
	line"いわれた　スズのとう　です"

	para"それは　すばらしい　けしき"
	line"だったに　ちがいありません"

	para"そのころの　かねのとうには"
	line"おおきな　ぎんいろの　ポケモンが"
	cont"はねを　やすめていた　そうです"

	para"ところが…"

	para"いまから　およそ150ねん　まえ"
	line"1つの　とう　に"
	cont"かみなりが　おちたそうです"

	para"そのため　とう　は"
	line"ものすごい　ほのおに　つつまれ"
	cont"3にちも　もえつづけた　そうです"

	para"そして…"

	para"とつぜんの　おおあめに　よって"
	line"きえたそうです"

	para"それが　いまの　やけたとう　なのです"
	done

SageKojiSeenText:
	text"きみの　ちから　みせてもらうぞ!"
	done

SageKojiBeatenText:
	text"つ　つよい…　つよすぎる"
	line"なぜだ!?"
	done

SageKojiAfterBattleQuestionText:
	text"きみ!　もしや!?"
	line"でんせつの　ポケモンたちが"
	cont"まっている　かたか!?"
	done

SageKojiAfterBattleSpeechText:
	text"なるほど……"

	para"わたしたち　3にんしゅうは"
	line"でんせつの　ポケモンを　おまもりし"

	para"しんじつの　ちからと　こころを"
	line"もった　ひとを　とおすように"
	cont"いわれています"

	para"どうぞ　おとおり　ください"

	para"そして　このさきの"
	line"スズのとうに　おはいりください"

	para"スイクンさまは　あなたを　おためしに"
	line"なるでしょう"
	done

SageKojiAfterBattleFinalText:
	text"どうぞ　おとおり　ください"

	para"スイクンさまは　あなたを　おためしに"
	line"なるでしょう"
	done

WiseTriosRoom_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7,  4, ECRUTEAK_CITY, 4
	warp_event  7,  5, ECRUTEAK_CITY, 5
	warp_event  1,  4, ECRUTEAK_TIN_TOWER_ENTRANCE, 5

	db 1 ; coord events
	coord_event  7,  4, SCENE_DEFAULT, WiseTriosRoom_CannotEnterTinTowerScript

	db 0 ; bg events

	db 6 ; object events
	object_event  6,  2, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage1Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  6,  7, SPRITE_SAGE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage2Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  7,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage3Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  4,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageGaku, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  4,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageMasa, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  6,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageKoji, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
