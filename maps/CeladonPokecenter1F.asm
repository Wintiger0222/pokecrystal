	const_def 2 ; object constants
	const CELADONPOKECENTER1F_NURSE
	const CELADONPOKECENTER1F_GENTLEMAN
	const CELADONPOKECENTER1F_PHARMACIST
	const CELADONPOKECENTER1F_COOLTRAINER_F
	const CELADONPOKECENTER1F_EUSINE

CeladonPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonPokecenter1FNurseScript:
	jumpstd pokecenternurse

CeladonPokecenter1FGentlemanScript:
	jumpstd happinesschecknpc

CeladonPokecenter1FCooltrainerFScript:
	jumptextfaceplayer CeladonPokecenter1FCooltrainerFText

CeladonPokecenter1FPharmacistScript:
	jumptextfaceplayer CeladonPokecenter1FPharmacistText

CeladonEusine:
	faceplayer
	opentext
	writetext CeladonEusineText1
	buttonsound
	setval SUICUNE
	special MonCheck
	iffalse .NoSuicune
	special BeastsCheck
	iftrue .HoOh
	writetext NoBeastsText
	waitbutton
.NoSuicune:
	closetext
	end

.HoOh:
	writetext EusineLeavesCeladonText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .Location1
	applymovement CELADONPOKECENTER1F_EUSINE, .Movement1
	sjump .Continue

.Location1:
	applymovement CELADONPOKECENTER1F_EUSINE, .Movement2
.Continue:
	disappear CELADONPOKECENTER1F_EUSINE
	playsound SFX_EXIT_BUILDING
	waitsfx
	end

.Movement2:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

.Movement1:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

CeladonPokecenter1FCooltrainerFText:
	text "민화님은"
	line "풀포켓몬의 조련사"

	para "깔보다가는"
	line "큰 코 다칠꺼야!"
	done

CeladonPokecenter1FPharmacistText:
	text "게임코너의 지하에는"
	line "로켓단의 아지트가……"

	para "앗참!"
	line "이것은 오래전"
	cont "3년전의 이야기란다!"
	done

CeladonEusineText1:;TRANSLATED
	text"수호『여어!"

	para"오랜만에 고향에"
	line"돌아왔어"
	done

EusineLeavesCeladonText:;TRANSLATED
	text"<PLAYER>는 알아?"

	para"아까 들은 이야기인데"
	line"방울탑에 무지개색 포켓몬이"
	cont"나타났다는 소문이 있어"

	para"나도 지금부터"
	line"인주시티에 갈까 생각하는데"

	para"일단믄 포켓몬 회복을"
	line"먼저 해야겠지"

	para"그럼 거기서 보자　<PLAYER>!"
	done

NoBeastsText:;TRANSLATED
	text"그러고보니　<PLAYER>"
	line"전설의 포켓몬 있잖아"

	para"라이코랑 앤테이는"
	line"잡았어?"

	para"……………"

	para"그런가…"

	para"잡았다면 나한테도"
	line"알려줬으면 좋겠어"

	para"잘 부탁한다구　<PLAYER>!"
	done

CeladonPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, CELADON_CITY, 5
	warp_event  4,  7, CELADON_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FGentlemanScript, -1
	object_event  0,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FPharmacistScript, -1
	object_event  8,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FCooltrainerFScript, -1
	object_event  4,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonEusine, EVENT_SET_WHEN_FOUGHT_HO_OH
