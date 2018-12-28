	const_def 2 ; object constants
	const RADIOTOWER3F_SUPER_NERD
	const RADIOTOWER3F_GYM_GUY
	const RADIOTOWER3F_COOLTRAINER_F
	const RADIOTOWER3F_ROCKET1
	const RADIOTOWER3F_ROCKET2
	const RADIOTOWER3F_ROCKET3
	const RADIOTOWER3F_SCIENTIST

RadioTower3F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .CardKeyShutterCallback

.CardKeyShutterCallback:
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .Change
	return

.Change:
	changeblock 14, 2, $2a ; open shutter
	changeblock 14, 4, $01 ; floor
	return

RadioTower3FSuperNerdScript:
	jumptextfaceplayer RadioTower3FSuperNerdText

RadioTower3FGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoRockets
	writetext RadioTower3FGymGuyText_Rockets
	waitbutton
	closetext
	end

.NoRockets:
	writetext RadioTower3FGymGuyText
	waitbutton
	closetext
	end

RadioTower3FCooltrainerFScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUNNY_DAY_FROM_RADIO_TOWER
	iftrue .GotSunnyDay
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoRockets
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .UsedCardKey
	writetext UnknownText_0x5e754
	waitbutton
	closetext
	end

.UsedCardKey:
	writetext UnknownText_0x5e7cb
	waitbutton
	closetext
	end

.NoRockets:
	writetext UnknownText_0x5e7e2
	buttonsound
	verbosegiveitem TM_SUNNY_DAY
	iffalse .NoRoom
	writetext UnknownText_0x5e821
	waitbutton
	closetext
	setevent EVENT_GOT_SUNNY_DAY_FROM_RADIO_TOWER
	end

.GotSunnyDay:
	writetext UnknownText_0x5e85c
	waitbutton
.NoRoom:
	closetext
	end

TrainerGruntM7:
	trainer GRUNTM, GRUNTM_7, EVENT_BEAT_ROCKET_GRUNTM_7, GruntM7SeenText, GruntM7BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM7AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM8:
	trainer GRUNTM, GRUNTM_8, EVENT_BEAT_ROCKET_GRUNTM_8, GruntM8SeenText, GruntM8BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM8AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM9:
	trainer GRUNTM, GRUNTM_9, EVENT_BEAT_ROCKET_GRUNTM_9, GruntM9SeenText, GruntM9BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM9AfterBattleText
	waitbutton
	closetext
	end

TrainerScientistMarc:
	trainer SCIENTIST, MARC, EVENT_BEAT_SCIENTIST_MARC, ScientistMarcSeenText, ScientistMarcBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMarcAfterBattleText
	waitbutton
	closetext
	end

CardKeySlotScript::
	opentext
	writetext RadioTower3FCardKeySlotText
	waitbutton
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .UsedCardKey
	checkitem CARD_KEY
	iftrue .HaveCardKey
.UsedCardKey:
	closetext
	end

.HaveCardKey:
	writetext InsertedTheCardKeyText
	waitbutton
	setevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	playsound SFX_ENTER_DOOR
	changeblock 14, 2, $2a ; open shutter
	changeblock 14, 4, $01 ; floor
	reloadmappart
	closetext
	waitsfx
	end

RadioTower3FPersonnelSign:
	jumptext RadioTower3FPersonnelSignText

RadioTower3FPokemonMusicSign:
	jumptext RadioTower3FPokemonMusicSignText

RadioTower3FSuperNerdText:
	text "지금까지 발견한 포켓몬의"
	line "울음소리는 전부 모아놨어!"
	cont "200종류쯤 있단다!"
	done
	
RadioTower3FGymGuyText_Rockets:
	text "포켓몬이란 트레이너에 있어서"
	line "소중한 파트너잖아?"
	
	para "그런데도 그따위 명령을 하다니"
	line "포켓몬이 불쌍해죽겠어!"
	done
	
RadioTower3FGymGuyText:
	text "우리는 24시간 영업중"
	
	para "언제든지 즐거운 방송을"
	line "들을 수 있도록"
	cont "나도 24시간 분발해야지!"
	done
	
UnknownText_0x5e754:
	text "이녀석들의 두목이"
	line "문 저편에 서있어"
	
	para "안으로부터 열쇠를 잠궜지만"
	line "국장님이라면 열 수 있을꺼야"
	
	para "국장님은 5층에 있어"
	line "부탁해 제발 도와줘!"
	done
	
UnknownText_0x5e7cb:
	text "국장님은 무사하니?"
	done

UnknownText_0x5e7e2:
	text "고마워, 꼬마 영웅님!"
	line "이것은 내 감사의 선물이야!"
	done
	
UnknownText_0x5e821:
	text "안에 들은 것은 쾌청"
	line "한번 사용하면 잠시후"
	cont "불꽃타입의 위력이 상승한단다"
	done
	
UnknownText_0x5e85c:
	text "대 활약이었구나!"
	done
	
GruntM7SeenText:
	text "…… 나의 임무는"
	
	para "로켓단을 방해하는 녀석들을"
	line "재기불능으로 만드는 것이다!"
	done
	
GruntM7BeatenText:
	text "!!!"
	done
	
GruntM7AfterBattleText:
	text "…… 임무 실패"
	line "……월급 깎여버리겠어!"
	done
	
GruntM8SeenText:
	text "포켓몬에게 나쁜 짓을"
	line "명령하는 것은 기분 좋은 일이지!"
	done
	
GruntM8BeatenText:
	text "…… 뭐얏!"
	done
	
GruntM8AfterBattleText:
	text "지면 기분 나쁘잖아!"
	line "젠장!"
	cont "쓸모없는 포켓몬나부랭이"
	done
	
GruntM9SeenText:
	text "셔터가 열렸냐? 어떻게 된거야?"
	line "너랑 뭔가 관계가 있는것이냐?"
	done
	
GruntM9BeatenText:
	text "당했-다"
	done

GruntM9AfterBattleText:
	text "뭐-라!"
	line "지하통로를 돌파했어!?"
	cont "뭐하는 녀석이길래!"
	done

ScientistMarcSeenText:
	text "별볼일 없는 꼬마가 떠돌다니……"
	line "뭐냐 너는!?"
	done

ScientistMarcBeatenText:
	text "치잇"
	line "너무 깔봤단 말인가"
	done

ScientistMarcAfterBattleText:
	text "쿠쿠쿠……여기부터라면"
	line "생각한대로 전파를 보낼 수 있겠어"
	done

RadioTower3FCardKeySlotText:	
	text "카드키를 꽂을 곳이다!"
	done

InsertedTheCardKeyText:
	text "<PLAYER>는(은)"
	line "카드키를 꽂았다!"
	done

RadioTower3FPersonnelSignText:
	text "3층 ……총무부"
	done

RadioTower3FPokemonMusicSignText:
	text "포켓몬 뮤직"
	line "진행자는 준화입니다"
	done

RadioTower3F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  0,  0, RADIO_TOWER_2F, 1
	warp_event  7,  0, RADIO_TOWER_4F, 2
	warp_event 17,  0, RADIO_TOWER_4F, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower3FPersonnelSign
	bg_event  9,  0, BGEVENT_READ, RadioTower3FPokemonMusicSign
	bg_event 14,  2, BGEVENT_UP, CardKeySlotScript

	db 7 ; object events
	object_event  7,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower3FSuperNerdScript, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  3,  4, SPRITE_GYM_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower3FGymGuyScript, -1
	object_event 11,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower3FCooltrainerFScript, -1
	object_event  5,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM7, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM8, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 16,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM9, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  9,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerScientistMarc, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
