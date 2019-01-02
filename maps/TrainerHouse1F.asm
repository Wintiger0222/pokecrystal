	const_def 2 ; object constants
	const TRAINERHOUSE1F_RECEPTIONIST
	const TRAINERHOUSE1F_COOLTRAINER_M
	const TRAINERHOUSE1F_COOLTRAINER_F
	const TRAINERHOUSE1F_YOUNGSTER
	const TRAINERHOUSE1F_GENTLEMAN

TrainerHouse1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerHouse1FReceptionistScript:
	jumptextfaceplayer TrainerHouse1FReceptionistText

TrainerHouse1FCooltrainerMScript:
	jumptextfaceplayer TrainerHouse1FCooltrainerMText

TrainerHouse1FCooltrainerFScript:
	jumptextfaceplayer TrainerHouse1FCooltrainerFText

TrainerHouse1FYoungsterScript:
	jumptextfaceplayer TrainerHouse1FYoungsterText

TrainerHouse1FGentlemanScript:
	jumptextfaceplayer TrainerHouse1FGentlemanText

TrainerHouseSign1:
	jumptext TrainerHouseSign1Text

TrainerHouseSign2:
	jumptext TrainerHouseSign2Text

TrainerHouseIllegibleBook:
	jumptext TrainerHouseIllegibleText

TrainerHouse1FReceptionistText:
	text "이곳은 트레이너 하우스"
	line "상록시티의 신 명소"
	cont "트레이너의 사교장입니다!"
	
	para "지하의 연습장에서"
	line "대전도 할 수 있어요!"
	done

TrainerHouse1FCooltrainerMText:
	text "상록시티는 석영고원에서"
	line "제일 가까운 마을"
	
	para "석영고원을 목표로 하여"
	line "트레이너들이 많이 들리기 때문에"
	cont "이 시설이 만들어졌단다"
	done

TrainerHouse1FCooltrainerFText:
	text "지하의 방에서"
	line "연습 시합을 하고 있어"
	
	para "성도의 트레이너 실력을"
	line "보여줘!"
	done

TrainerHouse1FYoungsterText:
	text "여러 마을에 가서"
	line "여러 사람들과 싸우지 않으면"
	cont "챔피언이 될 수 없는걸까"
	
	para "태초마을의 챔피언도"
	line "관동의 모든 마을을"
	cont "여행하며 다녔데!"
	done
	
TrainerHouse1FGentlemanText:
	text "후우……"
	line "포켓몬 승부에 지쳐서"
	cont "잠시 휴식을……"
	done

TrainerHouseSign1Text:
	text "지하 트레이닝장"
	line "연습 시합을 개최합니다!"
	cont "실력을 자랑하는 트레이너는"
	cont "자진해서 참가 해 주세요!"
	done

TrainerHouseSign2Text:
	text "룰과 규정은 없습니다!"
	line "도로에서 자유시합과도"
	cont "같습니다!"
	done
	
TrainerHouseIllegibleText:
	text "…… 뭐 뭐라고"
	line "대전 공략 메모……?"
	
	para "롱스톤이 지나간 흔적"
	line "같은 글씨라서 읽을 수 없다……!"
	done

TrainerHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2, 13, VIRIDIAN_CITY, 3
	warp_event  3, 13, VIRIDIAN_CITY, 3
	warp_event  8,  2, TRAINER_HOUSE_B1F, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  5,  0, BGEVENT_READ, TrainerHouseSign1
	bg_event  7,  0, BGEVENT_READ, TrainerHouseSign2
	bg_event  7, 10, BGEVENT_READ, TrainerHouseIllegibleBook

	db 5 ; object events
	object_event  0, 11, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FReceptionistScript, -1
	object_event  7, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FCooltrainerMScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FCooltrainerFScript, -1
	object_event  4,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FYoungsterScript, -1
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FGentlemanScript, -1
