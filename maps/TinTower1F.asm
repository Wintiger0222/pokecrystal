	const_def 2 ; object constants
	const TINTOWER1F_SUICUNE
	const TINTOWER1F_RAIKOU
	const TINTOWER1F_ENTEI
	const TINTOWER1F_EUSINE
	const TINTOWER1F_SAGE1
	const TINTOWER1F_SAGE2
	const TINTOWER1F_SAGE3
	const TINTOWER1F_SAGE4
	const TINTOWER1F_SAGE5
	const TINTOWER1F_SAGE6

TinTower1F_MapScripts:
	db 2 ; scene scripts
	scene_script .FaceSuicune ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 2 ; callbacks
	callback MAPCALLBACK_OBJECTS, .NPCsCallback
	callback MAPCALLBACK_TILES, .StairsCallback

.FaceSuicune:
	prioritysjump .SuicuneBattle
	end

.DummyScene:
	end

.NPCsCallback:
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .GotRainbowWing
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .FaceBeasts
	special BeastsCheck
	iffalse .FaceBeasts
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
.GotRainbowWing:
	checkevent EVENT_FOUGHT_HO_OH
	iffalse .Done
	appear TINTOWER1F_EUSINE
.Done:
	return

.FaceBeasts:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .FoughtSuicune
	appear TINTOWER1F_SUICUNE
	setval RAIKOU
	special MonCheck
	iftrue .NoRaikou
	appear TINTOWER1F_RAIKOU
	sjump .CheckEntei

.NoRaikou:
	disappear TINTOWER1F_RAIKOU
.CheckEntei:
	setval ENTEI
	special MonCheck
	iftrue .NoEntei
	appear TINTOWER1F_ENTEI
	sjump .BeastsDone

.NoEntei:
	disappear TINTOWER1F_ENTEI
.BeastsDone:
	return

.FoughtSuicune:
	disappear TINTOWER1F_SUICUNE
	disappear TINTOWER1F_RAIKOU
	disappear TINTOWER1F_ENTEI
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	return

.StairsCallback:
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .DontHideStairs
	changeblock 10, 2, $09 ; floor
.DontHideStairs:
	return

.SuicuneBattle:
	applymovement PLAYER, TinTowerPlayerMovement1
	pause 15
	setval RAIKOU
	special MonCheck
	iftrue .Next1 ; if player caught Raikou, he doesn't appear in Tin Tower
	applymovement TINTOWER1F_RAIKOU, TinTowerRaikouMovement1
	turnobject PLAYER, LEFT
	cry RAIKOU
	pause 10
	playsound SFX_WARP_FROM
	applymovement TINTOWER1F_RAIKOU, TinTowerRaikouMovement2
	disappear TINTOWER1F_RAIKOU
	playsound SFX_EXIT_BUILDING
	waitsfx
.Next1:
	setval ENTEI
	special MonCheck
	iftrue .Next2 ; if player caught Entei, he doesn't appear in Tin Tower
	applymovement TINTOWER1F_ENTEI, TinTowerEnteiMovement1
	turnobject PLAYER, RIGHT
	cry ENTEI
	pause 10
	playsound SFX_WARP_FROM
	applymovement TINTOWER1F_ENTEI, TinTowerEnteiMovement2
	disappear TINTOWER1F_ENTEI
	playsound SFX_EXIT_BUILDING
	waitsfx
.Next2:
	turnobject PLAYER, UP
	pause 10
	applymovement PLAYER, TinTowerPlayerMovement2
	applymovement TINTOWER1F_SUICUNE, TinTowerSuicuneMovement
	cry SUICUNE
	pause 20
	loadwildmon SUICUNE, 40
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	startbattle
	dontrestartmapmusic
	disappear TINTOWER1F_SUICUNE
	setevent EVENT_FOUGHT_SUICUNE
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	setmapscene ROUTE_42, SCENE_ROUTE42_NOTHING
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_36
	setmapscene ROUTE_36, SCENE_ROUTE36_NOTHING
	setevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setmapscene CIANWOOD_CITY, SCENE_CIANWOODCITY_NOTHING
	setscene SCENE_FINISHED
	clearevent EVENT_SET_WHEN_FOUGHT_HO_OH
	reloadmapafterbattle
	pause 20
	turnobject PLAYER, DOWN
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_EUSINE, 10, 15
	appear TINTOWER1F_EUSINE
	applymovement TINTOWER1F_EUSINE, MovementData_0x1851ec
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE1, 9, 15
	appear TINTOWER1F_SAGE1
	applymovement TINTOWER1F_SAGE1, MovementData_0x1851f5
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE2, 9, 15
	appear TINTOWER1F_SAGE2
	applymovement TINTOWER1F_SAGE2, MovementData_0x1851fb
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE3, 9, 15
	appear TINTOWER1F_SAGE3
	applymovement TINTOWER1F_SAGE3, MovementData_0x1851fe
	moveobject TINTOWER1F_SAGE1, 7, 13
	moveobject TINTOWER1F_SAGE2, 9, 13
	moveobject TINTOWER1F_SAGE3, 11, 13
	turnobject PLAYER, RIGHT
	opentext
	writetext TinTowerEusineSuicuneText
	waitbutton
	closetext
	applymovement TINTOWER1F_EUSINE, MovementData_0x1851f1
	playsound SFX_EXIT_BUILDING
	disappear TINTOWER1F_EUSINE
	waitsfx
	special FadeOutMusic
	pause 20
	playmapmusic
	end

TinTower1FSage1Script:
	jumptextfaceplayer TinTower1FSage1Text

TinTower1FSage2Script:
	jumptextfaceplayer TinTower1FSage2Text

TinTower1FSage3Script:
	jumptextfaceplayer TinTower1FSage3Text

TinTower1FSage4Script:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .FoughtHoOh
	jumptextfaceplayer TinTower1FSage4Text1

.FoughtHoOh:
	jumptextfaceplayer TinTower1FSage4Text2

TinTower1FSage5Script:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .FoughtHoOh
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .GotRainbowWing
	writetext TinTower1FSage5Text1
	buttonsound
	verbosegiveitem RAINBOW_WING
	closetext
	refreshscreen
	earthquake 72
	waitsfx
	playsound SFX_STRENGTH
	changeblock 10, 2, $20 ; stairs
	reloadmappart
	setevent EVENT_GOT_RAINBOW_WING
	closetext
	opentext
.GotRainbowWing:
	writetext TinTower1FSage5Text2
	waitbutton
	closetext
	end

.FoughtHoOh:
	writetext TinTower1FSage5Text3
	waitbutton
	closetext
	end

TinTower1FSage6Script:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .FoughtHoOh
	jumptextfaceplayer TinTower1FSage6Text1

.FoughtHoOh:
	jumptextfaceplayer TinTower1FSage6Text2

TinTowerEusine:
	jumptextfaceplayer TinTowerEusineHoOhText

TinTowerPlayerMovement1:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

TinTowerRaikouMovement1:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerRaikouMovement2:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step RIGHT
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerEnteiMovement1:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerEnteiMovement2:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step LEFT
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerSuicuneMovement:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerPlayerMovement2:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

MovementData_0x1851ec:
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

MovementData_0x1851f1:
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x1851f5:
	step UP
	step UP
	step LEFT
	step LEFT
	turn_head UP
	step_end

MovementData_0x1851fb:
	step UP
	step UP
	step_end

MovementData_0x1851fe:
	step UP
	step RIGHT
	step RIGHT
	step UP
	step_end

TinTowerEusineSuicuneText:
	text"ミナキ『すごい!　すごすぎる!"

	para"こんな　すばらしい　たたかいを"
	line"みたのは　はじめてだ"
	cont"かんげきしたよ"

	para"スイクンも　すごかったが"
	line"<PLAYER>も　すごかったぜ!"

	para"ふしぎな　ちからを　もつ　スイクンは"
	line"にじいろの　ポケモンを"
	cont"よびよせる　らしいぜ"

	para"こんかいの　ことで"
	line"いつのひか　その　ポケモンが"
	cont"すがたを　みせるかも　しれない"

	para"わたしも　でんせつについて"
	line"いろいろと　しらべてみる　つもりだ"

	para"すばらしい　たたかいを　みせてくれた"
	line"きみに　かんしゃするぜ"

	para"じゃあな　<PLAYER>!"
	done

TinTower1FSage1Text:
	text"でんせつでは…"

	para"ひとと　ポケモンが　こころを"
	line"かよわせるとき"
	cont"にじいろの　ポケモンが　まいおりる"

	para"というが…"

	para"でんせつの　ポケモンたちが"
	line"ひとを　ためしている!"

	para"という　ことなのだろうか?"
	done

TinTower1FSage2Text:
	text"かねのとうが　やけたとき"
	line"なもない　ポケモンたちが　3たい"
	cont"いきたえた　らしいのです"
	cont"かなしいことです"

	para"ですが…"

	para"そこに　にじいろの　ポケモン"

	para"すなわち…"

	para"ホウオウさまが　そらより　あらわれ"
	line"3たいの　ポケモンたちを"
	cont"よみがえらせました"

	para"それが…"

	para"スイクン　エンテイ　ライコウさま"
	line"なのです"

	para"そういう　はなしを　きいております"
	done

TinTower1FSage3Text:
	text"2つの　とうは　ポケモンと　ひとの"
	line"ゆうじょうと　きぼうを　ねがって"
	cont"つくられた　そうじゃ"

	para"もう　700ねんも"
	line"まえの　ことじゃが"
	cont"たいせつな　ことじゃ"
	done

TinTower1FSage4Text1:
	text"この　スズのとうに　ホウオウさまが"
	line"まいおりたらしい"
	done

TinTower1FSage5Text1:
	text"あなたのみを　まもる"
	line"これを　おもちくだされ"
	done

TinTower1FSage5Text2:
	text"さあ　すすみなさい"
	done

TinTower1FSage6Text1:
	text"やはり　きみは"
	line"ためされて　いるのじゃろう"
	cont"まよいを　けして　すすむのじゃ"
	done

TinTowerEusineHoOhText:
	text"やっぱり　<PLAYER>が"
	line"にじいろの　ポケモンに　あえたんだね"

	para"わたしが　おもいえがいた"
	line"とおりだった"

	para"わたしの　けんきゅうも"
	line"すてたもんじゃないな"

	para"もっともっと　ポケモンのことを"
	line"べんきょうして"
	cont"りっぱな　マニアになるぜ!"
	done

TinTower1FSage4Text2:
	text"でんせつの　ポケモンたちには"
	line"とうにおちた　かみなり"

	para"とうを　やきつくした　ほのお"

	para"とうの　ほのおを　けした　あめ"

	para"この3つの　ちからが"
	line"やどっていると　いわれている"
	done

TinTower1FSage5Text3:
	text"でんせつの　ポケモンが"
	line"たんじょう　したときのことです"

	para"それを　みていた　ひとたちは"
	line"かれらを　おそれ"

	para"そして……"

	para"むりな　こうげきを　するものまで"
	line"あらわれたそうです"

	para"じぶんたちの　ちからを　しっていた"
	line"でんせつの　ポケモンたちは"

	para"そんな　ひとたちに　こうげきはせず"
	line"ひたすら　かけまわったそうです"
	done

TinTower1FSage6Text2:
	text"でんせつの　ポケモンの　なかでも"
	line"スイクンさまは　もっとも"
	cont"ホウオウさまに　ちかいそんざいと"
	cont"いわれておるのじゃ"

	para"そして　また　アンノーンという"
	line"ポケモンとも　なにか　つながりが"
	cont"あるらしいと　きいておる"

	para"アンノーンという　ポケモンも"
	line"スイクンさまも　ともに"

	para"ちからを　だしあって"
	line"きょうりょくして　おるのじゃろう"
	done

TinTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  9, 15, ECRUTEAK_CITY, 12
	warp_event 10, 15, ECRUTEAK_CITY, 12
	warp_event 10,  2, TIN_TOWER_2F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 10 ; object events
	object_event  9,  9, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_SUICUNE
	object_event  7,  9, SPRITE_RAIKOU, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_RAIKOU
	object_event 12,  9, SPRITE_ENTEI, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_ENTEI
	object_event  8,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TinTowerEusine, EVENT_TIN_TOWER_1F_EUSINE
	object_event  5,  9, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage1Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event 11, 11, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage2Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event 14,  6, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage3Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  4,  2, SPRITE_SAGE, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage4Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event  9,  1, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage5Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event 14,  2, SPRITE_SAGE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage6Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
