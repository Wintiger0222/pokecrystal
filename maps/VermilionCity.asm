	const_def 2 ; object constants
	const VERMILIONCITY_TEACHER
	const VERMILIONCITY_GRAMPS
	const VERMILIONCITY_MACHOP
	const VERMILIONCITY_SUPER_NERD
	const VERMILIONCITY_BIG_SNORLAX
	const VERMILIONCITY_POKEFAN_M

VermilionCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VERMILION
	return

VermilionCityTeacherScript:
	jumptextfaceplayer VermilionCityTeacherText

VermilionMachopOwner:
	jumptextfaceplayer VermilionMachopOwnerText

VermilionMachop:
	opentext
	writetext VermilionMachopText1
	cry MACHOP
	waitbutton
	closetext
	earthquake 30
	opentext
	writetext VermilionMachopText2
	waitbutton
	closetext
	end

VermilionCitySuperNerdScript:
	jumptextfaceplayer VermilionCitySuperNerdText

VermilionSnorlax:
	opentext
	special SnorlaxAwake
	iftrue .Awake
	writetext UnknownText_0x1aab64
	waitbutton
	closetext
	end

.Awake:
	writetext UnknownText_0x1aab84
	pause 15
	cry SNORLAX
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 50
	startbattle
	disappear VERMILIONCITY_BIG_SNORLAX
	setevent EVENT_FOUGHT_SNORLAX
	reloadmapafterbattle
	end

VermilionGymBadgeGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
	iftrue .AlreadyGotItem
	readvar VAR_BADGES
	ifequal NUM_BADGES, .AllBadges
	ifgreater 13, .MostBadges
	ifgreater 9, .SomeBadges
	writetext UnknownText_0x1aabc8
	waitbutton
	closetext
	end

.SomeBadges:
	writetext UnknownText_0x1aac2b
	waitbutton
	closetext
	end

.MostBadges:
	writetext UnknownText_0x1aac88
	waitbutton
	closetext
	end

.AllBadges:
	writetext UnknownText_0x1aacf3
	buttonsound
	verbosegiveitem HP_UP
	iffalse .Done
	setevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
.AlreadyGotItem:
	writetext UnknownText_0x1aad4a
	waitbutton
.Done:
	closetext
	end

VermilionCitySign:
	jumptext VermilionCitySignText

VermilionGymSign:
	jumptext VermilionGymSignText

PokemonFanClubSign:
	jumptext PokemonFanClubSignText

VermilionCityDiglettsCaveSign:
	jumptext VermilionCityDiglettsCaveSignText

VermilionCityPortSign:
	jumptext VermilionCityPortSignText

VermilionCityPokecenterSign:
	jumpstd pokecentersign

VermilionCityMartSign:
	jumpstd martsign

VermilionCityHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VERMILION_CITY_HIDDEN_FULL_HEAL

VermilionCityTeacherText:
	text "여기 갈색시티의 항구는"
	line "관동 바다의 입구란다"
	
	para "외국으로부터"
	line "호화 여객선도 왔었어"
	done

VermilionMachopOwnerText:
	text "포켓몬에게 땅을 다지게 시키는데"
	line "정작 빌딩을 지을 돈이 없단다"
	done

VermilionMachopText1:
	text "알통몬『알통 알통-"
	done

VermilionMachopText2:
	text "알통몬은 끙끙거리며"
	line "지면을 다지고있다!"
	done

VermilionCitySuperNerdText:
	text "관동지방에도"
	line "8개의 체육관이 있단다"
	
	para "자 저곳의 커다란 건물이"
	line "갈색시티의 포켓몬 체육관이다!"
	done

UnknownText_0x1aab64:
	text "잠만보는 기분좋게"
	line "코를 골고 있다……"
	done

UnknownText_0x1aab84:
	text "잠만보에게"
	line "포켓기어를 들려주었다……"
	
	para "…… …… …… …… ……"
	line " …… …… …… …… ……"
	
	para "잠만보가 눈을 떴다!"
	done

UnknownText_0x1aabc8:
	text "관동의 체육관은"
	line "강한 트레이너들이 모여있다"
	
	para "특히 체육관 관장은 강적이다"
	line "간단하게는 이길 수 없다고 생각해"
	done

UnknownText_0x1aac2b:
	text "관동의 체육관 배지를"
	line "모으기 시작했구나!"
	
	para "상대하기 벅찬 트레이너가"
	line "많이 있을꺼야!"
	done

UnknownText_0x1aac88:
	text "이제 조금만 더 하면"
	line "관동 체육관 제패로군!"
	
	para "8개 전부 모았다면"
	line "나에게 가르쳐줘!"
	done

UnknownText_0x1aacf3:
	text "축하해! 관동의 배지를"
	line "전부 모았구나!"
	
	para "열심히한 너에게는"
	line "이것을 주마!"
	done

UnknownText_0x1aad4a:
	text "친구들과 싸울 때는"
	line "여러 타입을 가지고 있으면"
	cont "유리할꺼야"
	
	para "틀림없이 관동의 배지가"
	line "도움이 될꺼라고 생각해!"
	done

VermilionCitySignText:
	text "이곳은 갈색시티"
	line "갈색은 오렌지 저녁노을의 색깔"
	done

VermilionGymSignText:
	text "갈색시티 포켓몬 체육관"
	line "관장 마티스"
	cont "번개 아메리칸"
	done

PokemonFanClubSignText:
	text "여기는 포켓몬 애호가 클럽"
	line "포켓몬을 좋아하면 누구든지 환영"
	done

VermilionCityDiglettsCaveSignText:
	text "디그다의 굴"
	done
	
VermilionCityPortSignText:
	text "갈색시티 항구 입구"
	done

VermilionCity_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event  5,  5, VERMILION_FISHING_SPEECH_HOUSE, 1
	warp_event  9,  5, VERMILION_POKECENTER_1F, 1
	warp_event  7, 13, POKEMON_FAN_CLUB, 1
	warp_event 13, 13, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, 1
	warp_event 21, 13, VERMILION_MART, 2
	warp_event 21, 17, VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE, 1
	warp_event 10, 19, VERMILION_GYM, 1
	warp_event 19, 31, VERMILION_PORT_PASSAGE, 1
	warp_event 20, 31, VERMILION_PORT_PASSAGE, 2
	warp_event 34,  7, DIGLETTS_CAVE, 1

	db 0 ; coord events

	db 8 ; bg events
	bg_event 25,  3, BGEVENT_READ, VermilionCitySign
	bg_event  5, 19, BGEVENT_READ, VermilionGymSign
	bg_event  5, 13, BGEVENT_READ, PokemonFanClubSign
	bg_event 33,  9, BGEVENT_READ, VermilionCityDiglettsCaveSign
	bg_event 27, 15, BGEVENT_READ, VermilionCityPortSign
	bg_event 10,  5, BGEVENT_READ, VermilionCityPokecenterSign
	bg_event 22, 13, BGEVENT_READ, VermilionCityMartSign
	bg_event 12, 19, BGEVENT_ITEM, VermilionCityHiddenFullHeal

	db 6 ; object events
	object_event 18,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityTeacherScript, -1
	object_event 23,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMachopOwner, -1
	object_event 26,  7, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionMachop, -1
	object_event 14, 16, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionCitySuperNerdScript, -1
	object_event 34,  8, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_VERMILION_CITY_SNORLAX
	object_event 31, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionGymBadgeGuy, -1
