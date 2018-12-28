	const_def 2 ; object constants
	const ROUTE32POKECENTER1F_NURSE
	const ROUTE32POKECENTER1F_FISHING_GURU
	const ROUTE32POKECENTER1F_COOLTRAINER_F

Route32Pokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route32Pokecenter1FNurseScript:
	jumpstd pokecenternurse

Route32Pokecenter1FFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_OLD_ROD
	iftrue .GotOldRod
	writetext Route32Pokecenter1FFishingGuruText_Question
	yesorno
	iffalse .Refused
	writetext Route32Pokecenter1FFishingGuruText_Yes
	buttonsound
	verbosegiveitem OLD_ROD
	writetext Route32Pokecenter1FFishingGuruText_GiveOldRod
	waitbutton
	closetext
	setevent EVENT_GOT_OLD_ROD
	end

.Refused:
	writetext Route32Pokecenter1FFishingGuruText_No
	waitbutton
	closetext
	end

.GotOldRod:
	writetext Route32Pokecenter1FFishingGuruText_After
	waitbutton
	closetext
	end

Route32Pokecenter1FCooltrainerFScript:
	jumptextfaceplayer Route32Pokecenter1FCooltrainerFText

Route32Pokecenter1FFishingGuruText_Question:
	text "이 근처는 낚시의 명소란다"
	line "모두가 낚고 있는 것을 보고"
	cont "너도 낚시가 하고싶어지지?"
	
	para "괜찮다면 내"
	line "낚싯대를 나누어줄까?"
	done

Route32Pokecenter1FFishingGuruText_Yes:
	text "기쁘구나! 이것으로 너도"
	line "낚시꾼의 동지가 되었단다"
	done

Route32Pokecenter1FFishingGuruText_GiveOldRod:
	text "낚시는 아주 좋아!"
	
	para "물이 있는 곳이라면"
	line "바다든지 강이든지"
	cont "계속 낚싯대를 사용하거라! "
	done

Route32Pokecenter1FFishingGuruText_No:
	text "얼라리"
	line "그렇다면 유감이로구나"
	done

Route32Pokecenter1FFishingGuruText_After:
	text "어이! 소년"
	line "낚시는 잘 되는가?"
	done

Route32Pokecenter1FCooltrainerFText:
	text "움- 포켓몬에게"
	line "무엇을 지니게 할까 망설여진다"
	
	para "공격력을 강하게 하는"
	line "도구로 할까"
	done

Route32Pokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, ROUTE_32, 1
	warp_event  4,  7, ROUTE_32, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FNurseScript, -1
	object_event  1,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FFishingGuruScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FCooltrainerFScript, -1
