	const_def 2 ; object constants
	const SAFFRONPOKECENTER1F_NURSE
	const SAFFRONPOKECENTER1F_TEACHER
	const SAFFRONPOKECENTER1F_FISHER
	const SAFFRONPOKECENTER1F_YOUNGSTER

SaffronPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SaffronPokecenter1FNurseScript:
	jumpstd pokecenternurse

SaffronPokecenter1FTeacherScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer SaffronPokecenter1FTeacherText

.mobile
	jumptextfaceplayer SaffronPokecenter1FTeacherMobileText

SaffronPokecenter1FFisherScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .SolvedKantoPowerCrisis
	writetext SaffronPokecenter1FFisherText
	waitbutton
	closetext
	end

.SolvedKantoPowerCrisis:
	writetext SaffronPokecenter1FFisherReturnedMachinePartText
	waitbutton
	closetext
	end

SaffronPokecenter1FYoungsterScript:
	jumptextfaceplayer SaffronPokecenter1FYoungsterText

SaffronPokecenter1FTeacherText:
	text "성도의 포켓몬 센터는"
	line "어떻게 생겼어?"

	para"…ふーん　カントーと"
	line"あまり　かわらないのね"

	para"じゃあ　あんしんして"
	line"ジョウトに　いけるわ!"
	done

SaffronPokecenter1FTeacherMobileText:
	text "성도의 포켓몬 센터는"
	line "어떻게 생겼어?"

	para"…ふーん　そっちでも"
	line"とおくに　いる　ひとと"
	cont"つうしん　できるように　なったんだー"

	para"じゃあ　ジョウトの　ともだちに"
	line"マりル　つかまえて　もらって"
	cont"こうかん　しよっと!"
	done

SaffronPokecenter1FFisherText:
	text "아까 돌산 터널을"
	line "지나왔는데"
	cont "어쩐지 발전소가"
	cont "떠들썩했던 것 같아……"
	done

SaffronPokecenter1FFisherReturnedMachinePartText:
	text "동굴은 무너지기 쉽다!"
	
	para "블루시티 동굴처럼"
	line "무너진 동굴이"
	cont "몇개정도 있단다!"
	
	para "프로 등산가로서"
	line "상식이지!"
	done

SaffronPokecenter1FYoungsterText:
	text "실프주식회사 본사랑"
	line "리니어 스테이션"
	
	para "이 두 곳이"
	line "노랑시티의 명소란다!"
	done

SaffronPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, SAFFRON_CITY, 4
	warp_event  4,  7, SAFFRON_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FTeacherScript, -1
	object_event  8,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FFisherScript, -1
	object_event  1,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FYoungsterScript, -1
