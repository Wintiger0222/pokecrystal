	const_def 2 ; object constants
	const VERMILIONPOKECENTER1F_NURSE
	const VERMILIONPOKECENTER1F_FISHING_GURU
	const VERMILIONPOKECENTER1F_SAILOR
	const VERMILIONPOKECENTER1F_BUG_CATCHER

VermilionPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VermilionPokecenter1FNurseScript:
	jumpstd pokecenternurse

VermilionPokecenter1FFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SNORLAX
	iftrue .FoughtSnorlax
	writetext VermilionPokecenter1FFishingGuruText
	waitbutton
	closetext
	end

.FoughtSnorlax:
	writetext VermilionPokecenter1FFishingGuruText_FoughtSnorlax
	waitbutton
	closetext
	end

VermilionPokecenter1FSailorScript:
	jumptextfaceplayer VermilionPokecenter1FSailorText

VermilionPokecenter1FBugCatcherScript:
	jumptextfaceplayer VermilionPokecenter1FBugCatcherText

VermilionPokecenter1FFishingGuruText:
	text "디그다의 굴 앞에"
	line "졸음포켓몬이 자고있다"
	
	para "잡을 찬스이지만"
	line "어떡게 해야 잠에서 깰까?"
	done

VermilionPokecenter1FFishingGuruText_FoughtSnorlax:
	text "디그다의 굴 앞에"
	line "졸음포켓몬이 자고 있었는데"
	cont "언제부턴가 없어져버렸다!"
	done
	
VermilionPokecenter1FSailorText:
	text "트레이너랑 대전하는 것도"
	line "쾌속선을 타는 즐거움이다!"
	done

VermilionPokecenter1FBugCatcherText:
	text "엥? 본 적도 없는"
	line "체육관 배지를 가지고 있구나"
	
	para "아 그렇지"
	line "성도에 살고 있는 사람이군!"
	done

VermilionPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, VERMILION_CITY, 2
	warp_event  4,  7, VERMILION_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FFishingGuruScript, -1
	object_event  6,  5, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FSailorScript, -1
	object_event  1,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FBugCatcherScript, -1
