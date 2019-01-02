	const_def 2 ; object constants
	const VIOLETPOKECENTER1F_NURSE
	const VIOLETPOKECENTER1F_GAMEBOY_KID
	const VIOLETPOKECENTER1F_GENTLEMAN
	const VIOLETPOKECENTER1F_YOUNGSTER
	const VIOLETPOKECENTER1F_SCIENTIST

VioletPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VioletPokecenterNurse:
	jumpstd pokecenternurse

VioletPokecenter1F_ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	iftrue .SecondTimeAsking
	writetext UnknownText_0x69555
.AskTakeEgg:
	yesorno
	iffalse .RefusedEgg
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	giveegg TOGEPI, 5
	stringtotext .eggname, MEM_BUFFER_1
	scall .AideGivesEgg
	setevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	clearevent EVENT_ELMS_AIDE_IN_LAB
	clearevent EVENT_TOGEPI_HATCHED
	setmapscene ROUTE_32, SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	writetext UnknownText_0x695c5
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .AideWalksAroundPlayer
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_SCIENTIST, MovementData_AideWalksStraightOutOfPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_SCIENTIST
	waitsfx
	end

.AideWalksAroundPlayer:
	applymovement VIOLETPOKECENTER1F_SCIENTIST, MovementData_AideWalksLeftToExitPokecenter
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_SCIENTIST, MovementData_AideFinishesLeavingPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_SCIENTIST
	waitsfx
	end

.eggname
	db "EGG@"

.AideGivesEgg:
	jumpstd receivetogepiegg
	end

.PartyFull:
	writetext UnknownText_0x69693
	waitbutton
	closetext
	end

.RefusedEgg:
	writetext UnknownText_0x696f2
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	end

.SecondTimeAsking:
	writetext UnknownText_0x69712
	jump .AskTakeEgg

VioletPokecenter1FGameboyKidScript:
	jumptextfaceplayer VioletPokecenter1FGameboyKidText

VioletPokecenter1FGentlemanScript:
	jumptextfaceplayer VioletPokecenter1FGentlemanText

VioletPokecenter1FYoungsterScript:
	jumptextfaceplayer VioletPokecenter1FYoungsterText

MovementData_AideWalksStraightOutOfPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_AideWalksLeftToExitPokecenter:
	step LEFT
	step DOWN
	step_end

MovementData_AideFinishesLeavingPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step_end

UnknownText_0x69555:
	text "<PLAY_G> 오래간만입니다"
	line "공박사님께 부탁을 받아서"
	cont "당신을 찾고 있었어요"
	
	para "사실은……"
	
	para "포켓몬 알을"
	line "지니고 있어달라는 것입니다!"
	done

UnknownText_0x695c5:
	text "공박사님이 조사한 바로는"
	line "포켓몬은 알 안에서"
	cont "어느정도 키우지 않으면"
	cont "태어나지 않는다고 합니다!"
	
	para "그것도 늘 활발한"
	line "포켓몬 곁에 있지 않으면"
	cont "안 된다는 것 같아요"
	
	para "그러한 것을 부탁할 만한 사람은"
	line "<PLAY_G> 뿐이니까"
	cont "잘 부탁할께요!"
	
	para "태어난다면 공박사님에게"
	line "연락해주세요"
	done

UnknownText_0x69693:
	text "포켓몬이 잔뜩 있어서"
	line "그 이상 데리고 다닐 수 없습니다"
	cont "그럼 이곳에서 기다리겠습니다"
	done

UnknownText_0x696f2:
	text "그 그런……"
	line "공박사님의 부탁이라니까요"
	done

UnknownText_0x69712:
	text "<PLAY_G>"
	line "알을 데리고 있어 주겠습니까?"
	done

UnknownText_0x6972d:
	text "만약 멀리 있는 친구와"
	line "대전을 할수 있으면 좋을텐데!"
	done

UnknownText_0x69791:
	text "방금 진청시티의 친구와"
	line "콜로세움에서 배틀하고 왔어!"
	
	para "모바일 어댑터만 있으면"
	line "멀리 있는 친구랑 놀수 있어!"
	done

VioletPokecenter1FGameboyKidText:
	text "잡은 포켓몬을"
	line "컴퓨터에 맡기는 시스템을"
	cont "이수재라는 녀석이 만들었대"
	done

VioletPokecenter1FGentlemanText:
	text "3년정도 전쯤의 이야기란다"
	
	para "로켓단이라고 하는 녀석들이"
	line "포켓몬을 사용해서"
	cont "나쁜 짓만 했단다"
	
	para "하지만 악은 망한다!"
	line "어떤 소년의 활약으로"
	cont "해산되었단다!"
	done

VioletPokecenter1FYoungsterText:
	text "포켓몬은 머리가 좋으니까"
	line "존경할만한 트레이너가"
	cont "말하는 것이 아니면 듣지 않아"
	
	para "체육관 배지를 지니고 있지 않으면"
	line "명령도 듣지않고 제멋대로란다"
	done

VioletPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, VIOLET_CITY, 5
	warp_event  4,  7, VIOLET_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenterNurse, -1
	object_event  7,  6, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGentlemanScript, -1
	object_event  8,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FYoungsterScript, -1
	object_event  4,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1F_ElmsAideScript, EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
