	const_def 2 ; object constants
	const ROUTE3_FISHER1
	const ROUTE3_YOUNGSTER1
	const ROUTE3_YOUNGSTER2
	const ROUTE3_FISHER2

Route3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerFirebreatherOtis:
	trainer FIREBREATHER, OTIS, EVENT_BEAT_FIREBREATHER_OTIS, FirebreatherOtisSeenText, FirebreatherOtisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherOtisAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterWarren:
	trainer YOUNGSTER, WARREN, EVENT_BEAT_YOUNGSTER_WARREN, YoungsterWarrenSeenText, YoungsterWarrenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterWarrenAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterJimmy:
	trainer YOUNGSTER, JIMMY, EVENT_BEAT_YOUNGSTER_JIMMY, YoungsterJimmySeenText, YoungsterJimmyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJimmyAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherBurt:
	trainer FIREBREATHER, BURT, EVENT_BEAT_FIREBREATHER_BURT, FirebreatherBurtSeenText, FirebreatherBurtBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBurtAfterBattleText
	waitbutton
	closetext
	end

Route3MtMoonSquareSign:
	jumptext Route3MtMoonSquareSignText

FirebreatherOtisSeenText:
	text "아-!"
	line "오늘도 좋은 날씨다!"
	done

FirebreatherOtisBeatenText:
	text "날씨는 맑아도"
	line "내 마음은 비……"
	done

FirebreatherOtisAfterBattleText:
	text "비가 오면"
	line "햇빛이 뚫기 힘들지"
	cont "홋!"
	done

YoungsterWarrenSeenText:
	text "우-움……"
	line "어떡게할까……"
	done
	
YoungsterWarrenBeatenText:
	text "역시 졌다……"
	done

YoungsterWarrenAfterBattleText:
	text "너 강한 것 같으니까"
	line "싸우기가 무서웠어 나……"
	done

YoungsterJimmySeenText:
	text "나는 바람의 아들"
	line "활력이 넘치는 아이!"
	done

YoungsterJimmyBeatenText:
	text "퓨우-!"
	done

YoungsterJimmyAfterBattleText:
	text "일년내내 짧은 반바지"
	line "이것이 나의 신조다!"
	done

FirebreatherBurtSeenText:
	text "어서오너라!"
	line "잘 보거라!"
	done

FirebreatherBurtBeatenText:
	text "아찻!"
	done

FirebreatherBurtAfterBattleText:
	text "관동 최고의"
	line "불뿜기 연예인은 나를두고 하는말!"
	cont "……포켓몬 승부는 졌지만"
	done

Route3MtMoonSquareSignText:
	text "달맞이 산 광장"
	line "……계단을 올라서 바로!"
	done
Route3_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 52,  1, MOUNT_MOON, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 49, 13, BGEVENT_READ, Route3MtMoonSquareSign

	db 4 ; object events
	object_event 26, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherOtis, -1
	object_event 10,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterWarren, -1
	object_event 16,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerYoungsterJimmy, -1
	object_event 49,  5, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherBurt, -1
