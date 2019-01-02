	const_def 2 ; object constants
	const GOLDENRODUNDERGROUND_SUPER_NERD1
	const GOLDENRODUNDERGROUND_SUPER_NERD2
	const GOLDENRODUNDERGROUND_SUPER_NERD3
	const GOLDENRODUNDERGROUND_SUPER_NERD4
	const GOLDENRODUNDERGROUND_POKE_BALL
	const GOLDENRODUNDERGROUND_GRAMPS
	const GOLDENRODUNDERGROUND_SUPER_NERD5
	const GOLDENRODUNDERGROUND_SUPER_NERD6
	const GOLDENRODUNDERGROUND_GRANNY

GoldenrodUnderground_MapScripts:
	db 0 ; scene scripts

	db 3 ; callbacks
	callback MAPCALLBACK_NEWMAP, .ResetSwitches
	callback MAPCALLBACK_TILES, .CheckBasementKey
	callback MAPCALLBACK_OBJECTS, .CheckDayOfWeek

.ResetSwitches:
	clearevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	clearevent EVENT_EMERGENCY_SWITCH
	clearevent EVENT_SWITCH_4
	clearevent EVENT_SWITCH_5
	clearevent EVENT_SWITCH_6
	clearevent EVENT_SWITCH_7
	clearevent EVENT_SWITCH_8
	clearevent EVENT_SWITCH_9
	clearevent EVENT_SWITCH_10
	clearevent EVENT_SWITCH_11
	clearevent EVENT_SWITCH_12
	clearevent EVENT_SWITCH_13
	clearevent EVENT_SWITCH_14
	writebyte 0
	copyvartobyte wUndergroundSwitchPositions
	return

.CheckBasementKey:
	checkevent EVENT_USED_BASEMENT_KEY
	iffalse .LockBasementDoor
	return

.LockBasementDoor:
	changeblock 18, 6, $3d ; locked door
	return

.CheckDayOfWeek:
	checkcode VAR_WEEKDAY
	ifequal MONDAY, .Monday
	ifequal TUESDAY, .Tuesday
	ifequal WEDNESDAY, .Wednesday
	ifequal THURSDAY, .Thursday
	ifequal FRIDAY, .Friday
	ifequal SATURDAY, .Saturday

.Sunday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	disappear GOLDENRODUNDERGROUND_SUPER_NERD5
	appear GOLDENRODUNDERGROUND_SUPER_NERD6
	appear GOLDENRODUNDERGROUND_GRANNY
	return

.Monday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	checktime MORN
	iffalse .NotMondayMorning
	appear GOLDENRODUNDERGROUND_GRAMPS
.NotMondayMorning:
	disappear GOLDENRODUNDERGROUND_SUPER_NERD5
	disappear GOLDENRODUNDERGROUND_SUPER_NERD6
	disappear GOLDENRODUNDERGROUND_GRANNY
	return

.Tuesday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	appear GOLDENRODUNDERGROUND_SUPER_NERD5
	disappear GOLDENRODUNDERGROUND_SUPER_NERD6
	disappear GOLDENRODUNDERGROUND_GRANNY
	return

.Wednesday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	disappear GOLDENRODUNDERGROUND_SUPER_NERD5
	appear GOLDENRODUNDERGROUND_SUPER_NERD6
	disappear GOLDENRODUNDERGROUND_GRANNY
	return

.Thursday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	appear GOLDENRODUNDERGROUND_SUPER_NERD5
	disappear GOLDENRODUNDERGROUND_SUPER_NERD6
	disappear GOLDENRODUNDERGROUND_GRANNY
	return

.Friday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	disappear GOLDENRODUNDERGROUND_SUPER_NERD5
	appear GOLDENRODUNDERGROUND_SUPER_NERD6
	disappear GOLDENRODUNDERGROUND_GRANNY
	return

.Saturday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	appear GOLDENRODUNDERGROUND_SUPER_NERD5
	disappear GOLDENRODUNDERGROUND_SUPER_NERD6
	appear GOLDENRODUNDERGROUND_GRANNY
	return

TrainerSupernerdEric:
	trainer SUPER_NERD, ERIC, EVENT_BEAT_SUPER_NERD_ERIC, SupernerdEricSeenText, SupernerdEricBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdEricAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdTeru:
	trainer SUPER_NERD, TERU, EVENT_BEAT_SUPER_NERD_TERU, SupernerdTeruSeenText, SupernerdTeruBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdTeruAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacIssac:
	trainer POKEMANIAC, ISSAC, EVENT_BEAT_POKEMANIAC_ISSAC, PokemaniacIssacSeenText, PokemaniacIssacBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacIssacAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacDonald:
	trainer POKEMANIAC, DONALD, EVENT_BEAT_POKEMANIAC_DONALD, PokemaniacDonaldSeenText, PokemaniacDonaldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacDonaldAfterBattleText
	waitbutton
	closetext
	end

BitterMerchantScript:
	opentext
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .Open
	ifequal SATURDAY, .Open
	jump GoldenrodUndergroundScript_ShopClosed

.Open:
	pokemart MARTTYPE_BITTER, MART_UNDERGROUND
	closetext
	end

BargainMerchantScript:
	opentext
	checkflag ENGINE_GOLDENROD_UNDERGROUND_MERCHANT_CLOSED
	iftrue GoldenrodUndergroundScript_ShopClosed
	checkcode VAR_WEEKDAY
	ifequal MONDAY, .CheckMorn
	jump GoldenrodUndergroundScript_ShopClosed

.CheckMorn:
	checktime MORN
	iffalse GoldenrodUndergroundScript_ShopClosed
	pokemart MARTTYPE_BARGAIN, 0
	closetext
	end

OlderHaircutBrotherScript:
	opentext
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .DoHaircut
	ifequal THURSDAY, .DoHaircut
	ifequal SATURDAY, .DoHaircut
	jump GoldenrodUndergroundScript_ShopClosed

.DoHaircut:
	checkflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	iftrue .AlreadyGotHaircut
	special PlaceMoneyTopRight
	writetext UnknownText_0x7c5f9
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, 500
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext UnknownText_0x7c69a
	buttonsound
	special YoungerHaircutBrother
	ifequal $0, .Refused
	ifequal $1, .Refused
	setflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	ifequal $2, .two
	ifequal $3, .three
	jump .else

.two
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	jump .then

.three
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	jump .then

.else
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	jump .then

.then
	takemoney YOUR_MONEY, 500
	special PlaceMoneyTopRight
	writetext UnknownText_0x7c6b8
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext UnknownText_0x7c6d8
	waitbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue EitherHaircutBrotherScript_SlightlyHappier
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue EitherHaircutBrotherScript_Happier
	jump EitherHaircutBrotherScript_MuchHappier

.Refused:
	writetext UnknownText_0x7c6ea
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext UnknownText_0x7c709
	waitbutton
	closetext
	end

.AlreadyGotHaircut:
	writetext UnknownText_0x7c72b
	waitbutton
	closetext
	end

YoungerHaircutBrotherScript:
	opentext
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .DoHaircut
	ifequal WEDNESDAY, .DoHaircut
	ifequal FRIDAY, .DoHaircut
	jump GoldenrodUndergroundScript_ShopClosed

.DoHaircut:
	checkflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	iftrue .AlreadyGotHaircut
	special PlaceMoneyTopRight
	writetext UnknownText_0x7c75c
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, 300
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext UnknownText_0x7c7f1
	buttonsound
	special OlderHaircutBrother
	ifequal $0, .Refused
	ifequal $1, .Refused
	setflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	ifequal $2, .two
	ifequal $3, .three
	jump .else

.two
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	jump .then

.three
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	jump .then

.else
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	jump .then

.then
	takemoney YOUR_MONEY, 300
	special PlaceMoneyTopRight
	writetext UnknownText_0x7c80e
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext UnknownText_0x7c82a
	waitbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue EitherHaircutBrotherScript_SlightlyHappier
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue EitherHaircutBrotherScript_Happier
	jump EitherHaircutBrotherScript_MuchHappier

.Refused:
	writetext UnknownText_0x7c842
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext UnknownText_0x7c85b
	waitbutton
	closetext
	end

.AlreadyGotHaircut:
	writetext UnknownText_0x7c87b
	waitbutton
	closetext
	end

EitherHaircutBrotherScript_SlightlyHappier:
	writetext HaircutBrosText_SlightlyHappier
	special PlayCurMonCry
	waitbutton
	closetext
	end

EitherHaircutBrotherScript_Happier:
	writetext HaircutBrosText_Happier
	special PlayCurMonCry
	waitbutton
	closetext
	end

EitherHaircutBrotherScript_MuchHappier:
	writetext HaircutBrosText_MuchHappier
	special PlayCurMonCry
	waitbutton
	closetext
	end

BasementDoorScript::
	opentext
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue .Open
	checkitem BASEMENT_KEY
	iftrue .Unlock
	writetext UnknownText_0x7c5b0
	waitbutton
	closetext
	end

.Unlock:
	playsound SFX_TRANSACTION
	writetext UnknownText_0x7c5d6
	waitbutton
	closetext
	changeblock 18, 6, $2e ; unlocked door
	reloadmappart
	closetext
	setevent EVENT_USED_BASEMENT_KEY
	end

.Open:
	writetext UnknownText_0x7c5c3
	waitbutton
	closetext
	end

GoldenrodUndergroundScript_ShopClosed:
	writetext UnknownText_0x7c904
	waitbutton
	closetext
	end

GoldenrodUndergroundCoinCase:
	itemball COIN_CASE

GoldenrodUndergroundNoEntrySign:
	jumptext GoldenrodUndergroundNoEntryText

GoldenrodUndergroundHiddenParlyzHeal:
	hiddenitem PARLYZ_HEAL, EVENT_GOLDENROD_UNDERGROUND_HIDDEN_PARLYZ_HEAL

GoldenrodUndergroundHiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_GOLDENROD_UNDERGROUND_HIDDEN_SUPER_POTION

GoldenrodUndergroundHiddenAntidote:
	hiddenitem ANTIDOTE, EVENT_GOLDENROD_UNDERGROUND_HIDDEN_ANTIDOTE

SupernerdEricSeenText:
	text "포켓몬을 사용하여"
	line "속임수를 쓰려다가 들켜서"
	cont "게임코너에서 쫓겨났다……"
	done

SupernerdEricBeatenText:
	text "…… 투덜투덜"
	done

SupernerdEricAfterBattleText:
	text "역시 정정당당하지 않으면"
	line "안되는 것인가……"
	done

SupernerdTeruSeenText:
	text "너 포켓몬의"
	line "상성을 생각하고 있니?"
	
	para "타입의 상성을 알고 있으면"
	line "포켓몬이 더욱 강해진다!"
	done

SupernerdTeruBeatenText:
	text "아이고 아얏!"
	done

SupernerdTeruAfterBattleText:
	text "타입의 상성은 잘 알고 있지만"
	line "나는 같은 타입의"
	cont "포켓몬만 사용하고 있지"
	done

PokemaniacIssacSeenText:
	text "산발하는 기술의 포켓몬!"
	line "그 강함을 보여주거랏!"
	done
	
PokemaniacIssacBeatenText:
	text "으아아!"
	done

PokemaniacIssacAfterBattleText:
	text "산발을 당하면"
	line "어쩐지 포켓몬이 잘 따라준다"
	done

PokemaniacDonaldSeenText:
	text "너 어쩐지"
	line "희귀한 포켓몬을 가지고 있군"
	cont "좀 보여줘"
	done

PokemaniacDonaldBeatenText:
	text "으악!"
	line "졌다! 분하다!"
	done

PokemaniacDonaldAfterBattleText:
	text "포켓몬 도감을 만들고 있니?"
	line "그럼 알아둬야 할 정보!"
	
	para "33번 도로에 있는"
	line "등산가 스톰씨는"
	
	para "희귀한 포켓몬을 발견하면"
	line "전화로 알려준단다!"
	done

UnknownText_0x7c5b0:
	text "열쇠가 잠겨있다"
	done
	
UnknownText_0x7c5c3:
	text "문은 열려있군"
	done

UnknownText_0x7c5d6:
	text "지하의 열쇠를 사용했다!"
	line "문이 열렸다!"
	done

UnknownText_0x7c5f9:
	text "어서오세요!"
	line "우리집은 포켓몬 미용실!"
	
	para "실력이 확실한 나는"
	line "미용사 형제중의 형님이"
	cont "500원으로 당신의 포켓몬을"
	cont "예쁘게 꾸며줍니다!"
	
	para "어떻게 할래요?"
	line "예쁘게 꾸며줄까요?"
	done

UnknownText_0x7c69a:
	text "어느 포켓몬을 아름답게 할까요?"
	done

UnknownText_0x7c6b8:
	text "좋습니다!"
	line "예쁘게 해 줄께요!"
	done

UnknownText_0x7c6d8:
	text "네 끝났습니다!"
	done

UnknownText_0x7c6ea:
	text "그래요?"
	line "유감이로군요"
	done

UnknownText_0x7c709:
	text "돈이 부족한 것 같군요!"
	done

UnknownText_0x7c72b:
	text "하루에 1마리씩입니다"
	line "오늘 영업은 끝!"
	done

UnknownText_0x7c75c:
	text "포켓몬 미용실에 잘 오셨습니다!"
	
	para "나는"
	line "미용사 형제중의 동생!"
	
	para "값이 싼 점이 영업방침!"
	line "300원으로 너의 포켓몬을"
	cont "예쁘게 해 줄께!"
	
	para "어떻게 할래?"
	line "나한테 맡겨볼래?"
	done

UnknownText_0x7c7f1:
	text "어떤 포켓몬을 멋있게 할까?"
	done

UnknownText_0x7c80e:
	text "좋아!"
	line "아주 멋있게 해 줄께!"
	done

UnknownText_0x7c82a:
	text "자 끝났다!"
	done

UnknownText_0x7c842:
	text "그래?"
	line "유감이군"
	done

UnknownText_0x7c85b:
	text "돈이 부족한 것 같군"
	done

UnknownText_0x7c87b:
	text "하루에 1마리뿐이야"
	line "미안 오늘은 영업 끝!"
	done

HaircutBrosText_SlightlyHappier:
	text_ram wStringBuffer3
	text "는(은)"
	line "약간 기쁜 듯"
	done

HaircutBrosText_Happier:
	text_ram wStringBuffer3
	text "는(은)"
	line "기뻐하는 것 같다!"
	done

HaircutBrosText_MuchHappier:
	text_ram wStringBuffer3
	text "는(은)"
	line "매우 기뻐하는 것 같다!"
	done

UnknownText_0x7c904:
	text "오늘은 하지 않아!"
	done

GoldenrodUndergroundNoEntryText:
	text "이 앞은 출입금지!"
	done

GoldenrodUnderground_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  3,  2, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 7
	warp_event  3, 34, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 4
	warp_event 18,  6, GOLDENROD_UNDERGROUND, 4
	warp_event 21, 31, GOLDENROD_UNDERGROUND, 3
	warp_event 22, 31, GOLDENROD_UNDERGROUND, 3
	warp_event 22, 27, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event 18,  6, BGEVENT_READ, BasementDoorScript
	bg_event 19,  6, BGEVENT_READ, GoldenrodUndergroundNoEntrySign
	bg_event  6, 13, BGEVENT_ITEM, GoldenrodUndergroundHiddenParlyzHeal
	bg_event  4, 18, BGEVENT_ITEM, GoldenrodUndergroundHiddenSuperPotion
	bg_event 17,  8, BGEVENT_ITEM, GoldenrodUndergroundHiddenAntidote

	db 9 ; object events
	object_event  5, 31, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdEric, -1
	object_event  6,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdTeru, -1
	object_event  3, 27, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPokemaniacIssac, -1
	object_event  2,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacDonald, -1
	object_event  7, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundCoinCase, EVENT_GOLDENROD_UNDERGROUND_COIN_CASE
	object_event  7, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BargainMerchantScript, EVENT_GOLDENROD_UNDERGROUND_GRAMPS
	object_event  7, 14, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OlderHaircutBrotherScript, EVENT_GOLDENROD_UNDERGROUND_OLDER_HAIRCUT_BROTHER
	object_event  7, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, YoungerHaircutBrotherScript, EVENT_GOLDENROD_UNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	object_event  7, 21, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BitterMerchantScript, EVENT_GOLDENROD_UNDERGROUND_GRANNY
