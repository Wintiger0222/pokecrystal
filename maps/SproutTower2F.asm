	const_def 2 ; object constants
	const SPROUTTOWER2F_SAGE1
	const SPROUTTOWER2F_SAGE2
	const SPROUTTOWER2F_POKE_BALL

SproutTower2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSageNico:
	trainer SAGE, NICO, EVENT_BEAT_SAGE_NICO, SageNicoSeenText, SageNicoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNicoAfterBattleText
	waitbutton
	closetext
	end

TrainerSageEdmond:
	trainer SAGE, EDMOND, EVENT_BEAT_SAGE_EDMOND, SageEdmondSeenText, SageEdmondBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageEdmondAfterBattleText
	waitbutton
	closetext
	end

SproutTower2FStatue:
	jumptext SproutTower2FStatueText

SproutTower2FXAccuracy:
	itemball X_ACCURACY

SageNicoSeenText:
	text "우리들이 큰 소란을 쳐도"
	line "이 탑은 꿈쩍도 하지않을 것이오!"
	done

SageNicoBeatenText:
	text "소란을 친 것치곤 다행일세……!"
	done

SageNicoAfterBattleText:
	text "엄청난 지진일지라도"
	line "흔들리는 기둥덕분에"
	cont "무너지지 않는 것이외다……!"
	done

SageEdmondSeenText:
	text "바람에 흔들리고 있소"
	line "나뭇잎처럼……!"
	done

SageEdmondBeatenText:
	text "허약한 녀석!"
	done

SageEdmondAfterBattleText:
	text "모다피의 아름다운 움직임을"
	line "싸움에도 받아들였소이다만……"
	cont "수행이 부족한 듯 하구려"
	done

SproutTower2FStatueText:
	text "포켓몬이 받들어 모셔지고 있군……"
	line "어딘가 장엄한 분위기야"
	done

SproutTower2F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  6,  4, SPROUT_TOWER_1F, 3
	warp_event  2,  6, SPROUT_TOWER_1F, 4
	warp_event 17,  3, SPROUT_TOWER_1F, 5
	warp_event 10, 14, SPROUT_TOWER_3F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 12, 15, BGEVENT_READ, SproutTower2FStatue

	db 3 ; object events
	object_event 12,  3, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageNico, -1
	object_event  9, 14, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSageEdmond, -1
	object_event  3,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower2FXAccuracy, EVENT_SPROUT_TOWER2F_X_ACCURACY
