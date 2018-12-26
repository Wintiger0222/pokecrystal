	const_def 2 ; object constants
	const MAHOGANYTOWN_POKEFAN_M
	const MAHOGANYTOWN_GRAMPS
	const MAHOGANYTOWN_FISHER
	const MAHOGANYTOWN_LASS

MahoganyTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_MAHOGANY
	return

MahoganyTownTryARageCandyBarScript:
	showemote EMOTE_SHOCK, MAHOGANYTOWN_POKEFAN_M, 15
	applymovement MAHOGANYTOWN_POKEFAN_M, MovementData_0x1900a9
	follow PLAYER, MAHOGANYTOWN_POKEFAN_M
	applymovement PLAYER, MovementData_0x1900a7
	stopfollow
	turnobject PLAYER, RIGHT
	scall RageCandyBarMerchantScript
	applymovement MAHOGANYTOWN_POKEFAN_M, MovementData_0x1900ad
	end

MahoganyTownPokefanMScript:
	faceplayer
RageCandyBarMerchantScript:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	scall .SellRageCandyBars
	end

.ClearedRocketHideout:
	opentext
	writetext RageCandyBarMerchantSoldOutText
	waitbutton
	closetext
	end

.SellRageCandyBars:
	opentext
	writetext RageCandyBarMerchantTryOneText
	special PlaceMoneyTopRight
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, 300
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem RAGECANDYBAR
	iffalse .NoRoom
	waitsfx
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, 300
	special PlaceMoneyTopRight
	writetext RageCandyBarMerchantSavorItText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext RageCandyBarMerchantNotEnoughMoneyText
	waitbutton
	closetext
	end

.Refused:
	writetext RageCandyBarMerchantRefusedText
	waitbutton
	closetext
	end

.NoRoom:
	writetext RageCandyBarMerchantNoRoomText
	waitbutton
	closetext
	end

MahoganyTownGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	writetext MahoganyTownGrampsText
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MahoganyTownGrampsText_ClearedRocketHideout
	waitbutton
	closetext
	end

MahoganyTownFisherScript:
	jumptextfaceplayer MahoganyTownFisherText

MahoganyTownLassScript:
	jumptextfaceplayer MahoganyTownLassText

MahoganyTownSign:
	jumptext MahoganyTownSignText

MahoganyTownRagecandybarSign:
	jumptext MahoganyTownRagecandybarSignText

MahoganyGymSign:
	jumptext MahoganyGymSignText

MahoganyTownPokecenterSign:
	jumpstd pokecentersign

MovementData_0x1900a4:
	step DOWN
	big_step UP
	turn_head DOWN
MovementData_0x1900a7:
	step LEFT
	step_end

MovementData_0x1900a9:
	step RIGHT
	step DOWN
	turn_head LEFT
	step_end

MovementData_0x1900ad:
	step UP
	turn_head DOWN
	step_end

RageCandyBarMerchantTryOneText:
	text "잠깐 잠깐만 꼬마야!"
	
	para "황토마을에 처음 왔나보구나!"
	
	
	para "황토마을에 왔다면"
	line "분노의 호두과자를 사는 것이"
	cont "여행의 상식이라는 것이다"
	
	para "지금이라면 딱 300원"
	line "어떠냐 살꺼지?"
	done

RageCandyBarMerchantSavorItText:
	text "그럼 천천히 맛을 보거라!"
	done

RageCandyBarMerchantNotEnoughMoneyText:
	text "돈이 부족하구나"
	done

RageCandyBarMerchantRefusedText:
	text "아 그래……"
	done

RageCandyBarMerchantNoRoomText:
	text "그 이상 지닐 수 없어"
	done

RageCandyBarMerchantSoldOutText:
	text "분노의 호두과자는 품절이다"
	line "문 닫을 준비를 하고있단다"
	cont "그럼 방해하지 말고 비키거라"
	done

MahoganyTownGrampsText:
	text "너도 호수에 가서"
	line "갸라도스의 춤을 보려는거냐"
	done

MahoganyTownGrampsText_ClearedRocketHideout:
	text "분노의 호수에"
	line "잉어킹이 돌아온 것 같다"
	
	para "이것으로 분노의 호수 근처의"
	line "낚시꾼도 기뻐하고 있단다"
	done

MahoganyTownFisherText:
	text "이봐 이봐 애써서 왔잖아"
	line "천천히 관광이나 하거라"
	
	para "지금 북쪽에 있는"
	line "분노의 호수가 볼 만하단다"
	done
	
MahoganyTownLassText:
	text "할머니의 가게에 들려봐"
	line "이곳에서밖에 팔지 않는 것도 있어"
	done
	
MahoganyTownSignText:
	text "이곳은 황토마을"
	line "닌자의 마을에 잘 왔다"
	done

MahoganyTownRagecandybarSignText:
	text "황토마을에 왔다면"
	line "명물「분노의 호도과자」!!"
	done

MahoganyGymSignText:
	text "황토마을 포켓몬 체육관"
	line "관장 류옹이"
	cont "겨울의 혹독함을 가르쳐주는 자"
	done

MahoganyTown_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 11,  7, MAHOGANY_MART_1F, 1
	warp_event 17,  7, MAHOGANY_RED_GYARADOS_SPEECH_HOUSE, 1
	warp_event  6, 13, MAHOGANY_GYM, 1
	warp_event 15, 13, MAHOGANY_POKECENTER_1F, 1
	warp_event  9,  1, ROUTE_43_MAHOGANY_GATE, 3

	db 2 ; coord events
	coord_event 19,  8, SCENE_DEFAULT, MahoganyTownTryARageCandyBarScript
	coord_event 19,  9, SCENE_DEFAULT, MahoganyTownTryARageCandyBarScript

	db 4 ; bg events
	bg_event  1,  5, BGEVENT_READ, MahoganyTownSign
	bg_event  9,  7, BGEVENT_READ, MahoganyTownRagecandybarSign
	bg_event  3, 13, BGEVENT_READ, MahoganyGymSign
	bg_event 16, 13, BGEVENT_READ, MahoganyTownPokecenterSign

	db 4 ; object events
	object_event 19,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownPokefanMScript, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_EAST
	object_event  6,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownGrampsScript, -1
	object_event  6, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyTownFisherScript, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	object_event 12,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownLassScript, EVENT_MAHOGANY_MART_OWNERS
