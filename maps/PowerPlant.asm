	const_def 2 ; object constants
	const POWERPLANT_OFFICER1
	const POWERPLANT_GYM_GUY1
	const POWERPLANT_GYM_GUY2
	const POWERPLANT_OFFICER2
	const POWERPLANT_GYM_GUY3
	const POWERPLANT_FISHER
	const POWERPLANT_FOREST

PowerPlant_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_POWERPLANT_NOTHING
	scene_script .DummyScene1 ; SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

PowerPlantGuardPhoneScript:
	playsound SFX_CALL
	showemote EMOTE_SHOCK, POWERPLANT_OFFICER1, 15
	waitsfx
	pause 30
	applymovement POWERPLANT_OFFICER1, MovementData_0x188ed5
	turnobject POWERPLANT_GYM_GUY1, DOWN
	turnobject POWERPLANT_GYM_GUY2, DOWN
	opentext
	writetext UnknownText_0x188f22
	waitbutton
	closetext
	turnobject POWERPLANT_OFFICER1, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext UnknownText_0x188f7f
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement POWERPLANT_OFFICER1, MovementData_0x188eda
	setscene SCENE_POWERPLANT_NOTHING
	end

PowerPlantOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue .MetManager
	writetext UnknownText_0x188ee0
	waitbutton
	closetext
	end

.MetManager:
	writetext UnknownText_0x188f7f
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext UnknownText_0x188fa2
	waitbutton
	closetext
	end

PowerPlantGymGuy1Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext UnknownText_0x188fcf
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext UnknownText_0x189038
	waitbutton
	closetext
	end

PowerPlantGymGuy2Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext UnknownText_0x189079
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext UnknownText_0x1890ef
	waitbutton
	closetext
	end

PowerPlantGymGuy3Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext UnknownText_0x18910e
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext UnknownText_0x18917f
	waitbutton
	closetext
	end

PowerPlantGymGuy4Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext UnknownText_0x1891c2
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext UnknownText_0x189225
	waitbutton
	closetext
	end

PowerPlantManager:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkitem MACHINE_PART
	iftrue .FoundMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue .MetManager
	writetext UnknownText_0x189264
	waitbutton
	closetext
	setevent EVENT_MET_MANAGER_AT_POWER_PLANT
	clearevent EVENT_CERULEAN_GYM_ROCKET
	clearevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	setmapscene CERULEAN_GYM, SCENE_CERULEANGYM_GRUNT_RUNS_OUT
	setscene SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL
	end

.MetManager:
	writetext UnknownText_0x189308
	waitbutton
	closetext
	end

.FoundMachinePart:
	writetext UnknownText_0x18936e
	buttonsound
	takeitem MACHINE_PART
	setevent EVENT_RETURNED_MACHINE_PART
	clearevent EVENT_SAFFRON_TRAIN_STATION_POPULATION
	setevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	setevent EVENT_ROUTE_24_ROCKET
	setevent EVENT_RESTORED_POWER_TO_KANTO
	clearevent EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
.ReturnedMachinePart:
	checkevent EVENT_GOT_TM07_ZAP_CANNON
	iftrue .GotZapCannon
	writetext UnknownText_0x1893c4
	buttonsound
	verbosegiveitem TM_ZAP_CANNON
	iffalse .NoRoom
	setevent EVENT_GOT_TM07_ZAP_CANNON
	writetext UnknownText_0x1893f4
	waitbutton
.NoRoom:
	closetext
	end

.GotZapCannon:
	writetext UnknownText_0x189475
	waitbutton
	closetext
	end

Forest:
	faceplayer
	opentext
	trade NPC_TRADE_FOREST
	waitbutton
	closetext
	end

PowerPlantBookshelf:
	jumpstd difficultbookshelf

MovementData_0x188ed5:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

MovementData_0x188eda:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

UnknownText_0x188ee0:
	text "발전소에"
	line "도둑이 들다니"
	cont "전대미문의 사건이다……"
	done

UnknownText_0x188f22:
	text "블루시티로부터"
	line "연락이 있었습니다!"
	
	para "괴상한 남자가 길 한복판에서"
	line "어슬렁 거린다는 것이었습니다!"
	done

UnknownText_0x188f7f:
	text "괜찮다면 너도"
	line "협력해주지 않겠니?"
	done

UnknownText_0x188fa2:
	text "이제부터는 경비를"
	line "강화하지 않으면!"
	done

UnknownText_0x188fcf:
	text "발전기의 부품이"
	line "어떤자에의해 도둑맞았다!"
	
	para "부품이 없으면 신형의"
	line "발전기를 움직이게 할 수 없단다!"
	done

UnknownText_0x189038:
	text "매일 많은 전기를"
	line "만들 수 있게 되었단다!"
	done

UnknownText_0x189079:
	text "이곳은 이전에 무인"
	line "발전소였단다"
	
	para "그러나 리니어 기차의"
	line "전력을 만들기위해"
	cont "다시 만들어진 것이다"
	done

UnknownText_0x1890ef:
	text "무사히 발전기가"
	line "움직이게끔 되었단다!"
	done
UnknownText_0x18910e:
	text "이 앞은 발전실"
	line "소장님이 계시지만"
	cont "기계가 부서져서"
	cont "화를 내거나 슬퍼하기도 하고……"
	done
	
UnknownText_0x18917f:
	text "기계가 고쳐져서"
	line "소장님도 기운이 넘친다!"
	done

UnknownText_0x1891c2:
	text "리니어 기차는 많은 전기를"
	line "사용하는 교통수단이니까"
	
	para "신형 발전기가 움직이지 않으면"
	line "리니어 기차는 멈춘채로 끝이란다"
	done

UnknownText_0x189225:
	text "이제 드디어 리니어 기차를"
	line "움직이게 할 수 있다!"
	done
	
UnknownText_0x189264:
	text "소장『요 요 용서 못해!"
	
	para "내가 많은 시간을 투자한"
	line "발전기를 고장내다니!"
	
	para "붙잡히기만 하면"
	line "필살의 전자포로"
	cont "박살낼꺼야!!"
	done
	
UnknownText_0x189308:
	text "소장『나는 용서할 수 없다!"
	line "범인이 울면서 싹싹 빌어도말야!"
	cont "크흑 크흑 크흐흑……!"
	done

UnknownText_0x18936e:
	text "소장『오 오 오 오옷!!"
	
	para "그것은 나의 귀여운"
	line "발전기의 부품이 아닌가!"
	cont "자네가 찾아주었는가!"
	done

UnknownText_0x1893c4:
	text "얘야!!"
	line "고맙단다!"
	cont "고마움의 표시로"
	cont "이 기술머신을 주마!"
	done

UnknownText_0x1893f4:
	text "소장『기술머신07은"
	line "나의 필살 전자포!"
	cont "강력한 기술이란다!"
	
	para "약간 명중률은 떨어지지만……"
	line "위력은 대단하단다!"
	done

UnknownText_0x189475:
	text "소장『내 발전기!"
	line "점점 전기를 만들고 있다!"
	done

PowerPlant_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 17, ROUTE_10_NORTH, 2
	warp_event  3, 17, ROUTE_10_NORTH, 2

	db 1 ; coord events
	coord_event  5, 12, SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL, PowerPlantGuardPhoneScript

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, PowerPlantBookshelf
	bg_event  1,  1, BGEVENT_READ, PowerPlantBookshelf

	db 7 ; object events
	object_event  4, 14, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficerScript, -1
	object_event  2,  9, SPRITE_GYM_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuy1Script, -1
	object_event  6, 11, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuy2Script, -1
	object_event  9,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuy3Script, -1
	object_event  7,  2, SPRITE_GYM_GUY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuy4Script, -1
	object_event 14, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlantManager, -1
	object_event  5,  5, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Forest, -1
