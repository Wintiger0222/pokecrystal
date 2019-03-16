	const_def 2 ; object constants
	const MRPOKEMONSHOUSE_GENTLEMAN
	const MRPOKEMONSHOUSE_OAK

MrPokemonsHouse_MapScripts:
	db 2 ; scene scripts
	scene_script .MeetMrPokemon ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.MeetMrPokemon:
	prioritysjump .MrPokemonEvent
	end

.DummyScene:
	end

.MrPokemonEvent:
	showemote EMOTE_SHOCK, MRPOKEMONSHOUSE_GENTLEMAN, 15
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	opentext
	writetext MrPokemonIntroText1
	waitbutton
	closetext
	applymovement PLAYER, MrPokemonsHouse_PlayerWalksToMrPokemon
	opentext
	writetext MrPokemonIntroText2
	buttonsound
	waitsfx
	giveitem MYSTERY_EGG
	writetext MrPokemonsHouse_GotEggText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	blackoutmod CHERRYGROVE_CITY
	writetext MrPokemonIntroText3
	buttonsound
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, RIGHT
	writetext MrPokemonIntroText4
	buttonsound
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	turnobject MRPOKEMONSHOUSE_OAK, LEFT
	writetext MrPokemonIntroText5
	waitbutton
	closetext
	sjump MrPokemonsHouse_OakScript

MrPokemonsHouse_MrPokemonScript:
	faceplayer
	opentext
	checkitem RED_SCALE
	iftrue .RedScale
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .AlwaysNewDiscoveries
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	end

.AlwaysNewDiscoveries:
	writetext MrPokemonText_AlwaysNewDiscoveries
	waitbutton
	closetext
	end

.RedScale:
	writetext MrPokemonText_GimmeTheScale
	yesorno
	iffalse .refused
	verbosegiveitem EXP_SHARE
	iffalse .full
	takeitem RED_SCALE
	sjump .AlwaysNewDiscoveries

.refused
	writetext MrPokemonText_Disappointed
	waitbutton
.full
	closetext
	end

MrPokemonsHouse_OakScript:
	playmusic MUSIC_PROF_OAK
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakWalksToPlayer
	turnobject PLAYER, RIGHT
	opentext
	writetext MrPokemonsHouse_OakText1
	buttonsound
	waitsfx
	writetext MrPokemonsHouse_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	writetext MrPokemonsHouse_OakText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakExits
	playsound SFX_EXIT_BUILDING
	disappear MRPOKEMONSHOUSE_OAK
	waitsfx
	special RestartMapMusic
	pause 15
	turnobject PLAYER, UP
	opentext
	writetext MrPokemonsHouse_MrPokemonHealText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special StubbedTrainerRankings_Healings
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	setevent EVENT_RIVAL_NEW_BARK_TOWN
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	setscene SCENE_FINISHED
	setmapscene CHERRYGROVE_CITY, SCENE_CHERRYGROVECITY_MEET_RIVAL
	setmapscene ELMS_LAB, SCENE_ELMSLAB_MEET_OFFICER
	specialphonecall SPECIALCALL_ROBBED
	clearevent EVENT_COP_IN_ELMS_LAB
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .RivalTakesChikorita
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .RivalTakesCyndaquil
	setevent EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesChikorita:
	setevent EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesCyndaquil:
	setevent EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	end

MrPokemonsHouse_ForeignMagazines:
	jumptext MrPokemonsHouse_ForeignMagazinesText

MrPokemonsHouse_BrokenComputer:
	jumptext MrPokemonsHouse_BrokenComputerText

MrPokemonsHouse_StrangeCoins:
	jumptext MrPokemonsHouse_StrangeCoinsText

MrPokemonsHouse_PlayerWalksToMrPokemon:
	step RIGHT
	step UP
	step_end

MrPokemonsHouse_OakWalksToPlayer:
	step DOWN
	step LEFT
	step LEFT
	step_end

MrPokemonsHouse_OakExits:
	step DOWN
	step LEFT
	turn_head DOWN
	step_sleep 2
	step_end

MrPokemonIntroText1:
	text "이야이야"
	line "네가 <PLAY_G>이로군"
	
	para "공박사로부터"
	line "연락이 있어서 기다리고 있었단다"
	done

MrPokemonIntroText2:
	text "이것이 공박사에게"
	line "조사를 의뢰하고싶은 것이란다!"
	done

MrPokemonsHouse_GotEggText:
	text "<PLAYER>는(은)"
	line "포켓몬 할아버지로부터"
	cont "이상한 알을 맡았다!"
	done

MrPokemonIntroText3:
	text "포켓몬을 맡아 기르고 있는"
	line "부부가 있는데"
	cont "거기서 얻은 것이란다"
	
	para "혹시 그렇다면…… 라고 생각해서"
	line "공박사에게 메일을 보냈단다"
	
	para "포켓몬 진화의 연구라면"
	line "공박사가 최고니까!"
	done

MrPokemonIntroText4:
	text "여하튼 이 오박사도"
	line "인정하는 정도니까"
	done

MrPokemonIntroText5:
	text "내 상상이 맞았는가……"
	line "공박사라면 알고있을 터"
	done

MrPokemonsHouse_MrPokemonHealText:
	text "공박사가 계신곳에"
	line "돌아갈 작정인가?"
	
	para "약간 포켓몬을"
	line "쉬게 하는 것이 좋겠지!"
	done

MrPokemonText_ImDependingOnYou:
	text "그럼 잘 부탁한다!"
	done

MrPokemonText_AlwaysNewDiscoveries:
	text "이 세상은 참 재미있구나!"
	line "여러가지 발견이 있으니까!"
	done

MrPokemonsHouse_OakText1:
	text "오박사『호오!"
	line "네가 <PLAY_G>인가!"
	
	para "나는 오박사"
	line "포켓몬 연구를 하고있단다!"
	
	para "오랜 친구인"
	line "포켓몬 할아버지를 방문 해보니까"
	cont "공박사가 있는 곳으로부터"
	cont "심부름꾼이 온다고 들어서"
	cont "기다라고 있었단다!"
	
	para "호오-!"
	line "진귀한 포켓몬을 가지고 있구나!"
	
	para "게다가…… ……"
	
	para "흐음 역시!"
	
	para "공박사가 포켓몬을 줘서"
	line "너에게 심부름을 부탁한 이유를"
	cont "잘 알겠구나!"
	
	para "나와 공박사같은"
	line "연구가에게 있어서 포켓몬은"
	cont "소중한 친구이기 때문이란다!"
	
	para "너라면 포켓몬을 소중하게"
	line "키울 것 이라 생각한단다!"
	
	para "…… 그렇구나!"
	
	para "너에게 기대를 걸고 나도"
	line "한가지 부탁을 할까!"
	
	para "실은……"
	
	para "이것!"
	line "이 포켓몬 도감이란다!"
	
	para "발견한 포켓몬의 데이터가"
	line "자동적으로 기록되어져"
	cont "페이지가 늘어간다고 하는"
	cont "하이테크 도감이란다"
	done

MrPokemonsHouse_GetDexText:
	text "<PLAYER>는(은) 오박사로부터"
	line "포켓몬 도감을 얻었다!"
	done

MrPokemonsHouse_OakText2:
	text "많은 포켓몬과 만나서"
	line "이 도감을 완전하게"
	cont "만들어 주었으면 좋겠구나!"
	
	para "이런!"
	line "오랫동안 시간을 끌었구나!"
	
	para "이제부터 금빛시티에 가서"
	line "늘 그렇듯이 라디오 방송을"
	cont "녹음하지 않으면 안 되겠구나"
	
	para "그럼 <PLAY_G>!"
	line "잘 부탁한다!"
	done

MrPokemonText_GimmeTheScale:
	text "응? 그 비늘은?"
	line "뭐라! 빨간 갸라도스?"
	
	para "그 그것 참 희귀하군!"
	line "가 가지고싶구나……"
	
	para "<PLAY_G>"
	line "내가 오박사로부터 얻은"
	cont "이 학습장치랑"
	cont "교환하지 않겠느냐?"
	done

MrPokemonText_Disappointed:
	text "그런가 그것 참 유감이구나"
	line "꽤나 희귀한 것인데……"
	done

MrPokemonsHouse_ForeignMagazinesText:
	text "전 세계의 잡지가"
	line "가득 진열되어있다!"
	
	para "…… ……"
	line "제목을 읽을 수 없다……"
	done

MrPokemonsHouse_BrokenComputerText:
	text "커다란 컴퓨터!"
	line "……고장나있는 것 같다"
	done

MrPokemonsHouse_StrangeCoinsText:
	text "본적도 없는 동전이"
	line "가득 흩어져있다"
	cont "어느 나라의 돈일까?"
	done
	
MrPokemonsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_30, 2
	warp_event  3,  7, ROUTE_30, 2

	db 0 ; coord events

	db 5 ; bg events
	bg_event  0,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  1,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  6,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  7,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  6,  4, BGEVENT_READ, MrPokemonsHouse_StrangeCoins

	db 2 ; object events
	object_event  3,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrPokemonsHouse_MrPokemonScript, -1
	object_event  6,  5, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MR_POKEMONS_HOUSE_OAK
