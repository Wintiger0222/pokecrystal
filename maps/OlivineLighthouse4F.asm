	const_def 2 ; object constants
	const OLIVINELIGHTHOUSE4F_SAILOR
	const OLIVINELIGHTHOUSE4F_LASS

OlivineLighthouse4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerLassConnie:
	trainer LASS, CONNIE1, EVENT_BEAT_LASS_CONNIE, LassConnie1SeenText, LassConnie1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassConnie1AfterBattleText
	waitbutton
	closetext
	end

TrainerSailorKent:
	trainer SAILOR, KENT, EVENT_BEAT_SAILOR_KENT, SailorKentSeenText, SailorKentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorKentAfterBattleText
	waitbutton
	closetext
	end

SailorKentSeenText:
	text "규리씨……"
	line "포켓몬이 걱정 될꺼야"
	cont "약도 효과가 없고말야"
	done

SailorKentBeatenText:
	text "나도 모르겠어……"
	done

SailorKentAfterBattleText:
	text "약이라……"
	line "맞아! 진청시티에는 솜씨 좋은"
	cont "약국이 있다는 이야기가 있어!"
	done

LassConnie1SeenText:
	text "규리는"
	line "이 마을의 체육관 관장이면서도……"
	
	para "나 함께 돌아갈 작정이야"
	line "누구에게도 방해받지 않을꺼야!"
	done
	
LassConnie1BeatenText:
	text "아아 내 포켓몬!"
	done

LassConnie1AfterBattleText:
	text "그렇군! 누구든지 포켓몬이"
	line "상처를 입으면 걱정을 하겠군"
	
	para "규리가 체육관에 돌아갈 수 있도록"
	line "내가 기도해 줄께"
	done

OlivineLighthouse4F_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 13,  3, OLIVINE_LIGHTHOUSE_3F, 1
	warp_event  3,  5, OLIVINE_LIGHTHOUSE_5F, 2
	warp_event  9,  7, OLIVINE_LIGHTHOUSE_5F, 3
	warp_event  9,  5, OLIVINE_LIGHTHOUSE_3F, 3
	warp_event 16,  9, OLIVINE_LIGHTHOUSE_3F, 6
	warp_event 17,  9, OLIVINE_LIGHTHOUSE_3F, 7
	warp_event  8,  3, OLIVINE_LIGHTHOUSE_3F, 8
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_3F, 9
	warp_event 16,  7, OLIVINE_LIGHTHOUSE_5F, 4
	warp_event 17,  7, OLIVINE_LIGHTHOUSE_5F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  7, 14, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorKent, -1
	object_event 11,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassConnie, -1
