	const_def 2 ; object constants
	const ROUTE15_YOUNGSTER1
	const ROUTE15_YOUNGSTER2
	const ROUTE15_YOUNGSTER3
	const ROUTE15_YOUNGSTER4
	const ROUTE15_TEACHER1
	const ROUTE15_TEACHER2
	const ROUTE15_POKE_BALL

Route15_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerTeacherColette:
	trainer TEACHER, COLETTE, EVENT_BEAT_TEACHER_COLETTE, TeacherColetteSeenText, TeacherColetteBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherColetteAfterBattleText
	waitbutton
	closetext
	end

TrainerTeacherHillary:
	trainer TEACHER, HILLARY, EVENT_BEAT_TEACHER_HILLARY, TeacherHillarySeenText, TeacherHillaryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherHillaryAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyKipp:
	trainer SCHOOLBOY, KIPP, EVENT_BEAT_SCHOOLBOY_KIP, SchoolboyKippSeenText, SchoolboyKippBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyKippAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyTommy:
	trainer SCHOOLBOY, TOMMY, EVENT_BEAT_SCHOOLBOY_TOMMY, SchoolboyTommySeenText, SchoolboyTommyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyTommyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyJohnny:
	trainer SCHOOLBOY, JOHNNY, EVENT_BEAT_SCHOOLBOY_JOHNNY, SchoolboyJohnnySeenText, SchoolboyJohnnyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyJohnnyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyBilly:
	trainer SCHOOLBOY, BILLY, EVENT_BEAT_SCHOOLBOY_BILLY, SchoolboyBillySeenText, SchoolboyBillyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyBillyAfterBattleText
	waitbutton
	closetext
	end

Route15Sign:
	jumptext Route15SignText

Route15PPUp:
	itemball PP_UP

TeacherColetteSeenText:
	text "잃어버린 물건은 없나?"
	done
	
TeacherColetteBeatenText:
	text "꺄아-!"
	done

TeacherColetteAfterBattleText:
	text "선생님도 어린시절에"
	line "잘 잃어버리곤 했었단다"
	done

TeacherHillarySeenText:
	text "날씨가 좋은 날은"
	line "교실에서 공부하는 것보다"
	cont "운동장에서 운동하고싶지!"
	done

TeacherHillaryBeatenText:
	text "졌다……"
	done

TeacherHillaryAfterBattleText:
	text "공부는 중요하지만"
	line "운동도 중요하단다!"
	done

SchoolboyKippSeenText:
	text "잠깐 기다려"
	line "어머니에게 전화할꺼니까"
	done

SchoolboyKippBeatenText:
	text "미안해요 엄마"
	line "저 졌어요!"
	done
	
SchoolboyKippAfterBattleText:
	text "많이 걱정하시니까"
	line "자주 어머니에게 전화한단다"
	done

SchoolboyTommySeenText:
	text "대전하자!"
	line "나 지지않을꺼야!"
	done

SchoolboyTommyBeatenText:
	text "학원 숙제"
	line "까먹었다!"
	done

SchoolboyTommyAfterBattleText:
	text "하우 두 유 두!"
	line "어제 막 배웠어!"
	done

SchoolboyJohnnySeenText:
	text "보라타운의 라디오타워에"
	line "사회과 견학을 간다!"
	done

SchoolboyJohnnyBeatenText:
	text "엄청 강하구나!"
	done

SchoolboyJohnnyAfterBattleText:
	text "걷는 것 지쳐버렸다……"
	line "쉬고싶어"
	done
	
SchoolboyBillySeenText:
	text "내가 제일 잘하는 과목은"
	line "체육이야!"
	done
	
SchoolboyBillyBeatenText:
	text "이런-!"
	line "졌다-!"
	done

SchoolboyBillyAfterBattleText:
	text "수업에 포켓몬이 있었다면"
	line "내가 최고일텐데!"
	done

Route15SignText:
	text "이곳은 15번 도로"
	line "연분홍시티 …… 보라타운"
	done

Route15_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  4, ROUTE_15_FUCHSIA_GATE, 3
	warp_event  2,  5, ROUTE_15_FUCHSIA_GATE, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event 19,  9, BGEVENT_READ, Route15Sign

	db 7 ; object events
	object_event 10, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSchoolboyKipp, -1
	object_event 15, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyTommy, -1
	object_event 33, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyJohnny, -1
	object_event 27, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyBilly, -1
	object_event 30, 12, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerTeacherColette, -1
	object_event 20, 10, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerTeacherHillary, -1
	object_event 12,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route15PPUp, EVENT_ROUTE_15_PP_UP
