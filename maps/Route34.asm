	const_def 2 ; object constants
	const ROUTE34_YOUNGSTER1
	const ROUTE34_YOUNGSTER2
	const ROUTE34_YOUNGSTER3
	const ROUTE34_LASS
	const ROUTE34_OFFICER
	const ROUTE34_POKEFAN_M
	const ROUTE34_GRAMPS
	const ROUTE34_DAY_CARE_MON_1
	const ROUTE34_DAY_CARE_MON_2
	const ROUTE34_COOLTRAINER_F1
	const ROUTE34_COOLTRAINER_F2
	const ROUTE34_COOLTRAINER_F3
	const ROUTE34_POKE_BALL

Route34_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .EggCheckCallback

.EggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside
	clearevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	setevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	jump .CheckMon1

.PutDayCareManOutside:
	setevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	clearevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	jump .CheckMon1

.CheckMon1:
	checkflag ENGINE_DAY_CARE_MAN_HAS_MON
	iffalse .HideMon1
	clearevent EVENT_DAY_CARE_MON_1
	jump .CheckMon2

.HideMon1:
	setevent EVENT_DAY_CARE_MON_1
	jump .CheckMon2

.CheckMon2:
	checkflag ENGINE_DAY_CARE_LADY_HAS_MON
	iffalse .HideMon2
	clearevent EVENT_DAY_CARE_MON_2
	return

.HideMon2:
	setevent EVENT_DAY_CARE_MON_2
	return

DayCareManScript_Outside:
	faceplayer
	opentext
	special DayCareManOutside
	waitbutton
	closetext
	ifequal TRUE, .end_fail
	clearflag ENGINE_DAY_CARE_MAN_HAS_EGG
	checkcode VAR_FACING
	ifequal RIGHT, .walk_around_player
	applymovement ROUTE34_GRAMPS, Route34MovementData_DayCareManWalksBackInside
	playsound SFX_ENTER_DOOR
	disappear ROUTE34_GRAMPS
.end_fail
	end

.walk_around_player
	applymovement ROUTE34_GRAMPS, Route34MovementData_DayCareManWalksBackInside_WalkAroundPlayer
	playsound SFX_ENTER_DOOR
	disappear ROUTE34_GRAMPS
	end

DayCareMon1Script:
	opentext
	special DayCareMon1
	closetext
	end

DayCareMon2Script:
	opentext
	special DayCareMon2
	closetext
	end

TrainerCamperTodd1:
	trainer CAMPER, TODD1, EVENT_BEAT_CAMPER_TODD, CamperTodd1SeenText, CamperTodd1BeatenText, 0, .Script

.Script:
	writecode VAR_CALLERID, PHONE_CAMPER_TODD
	endifjustbattled
	opentext
	checkflag ENGINE_TODD
	iftrue .Rematch
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue .SaleIsOn
	checkcellnum PHONE_CAMPER_TODD
	iftrue .NumberAccepted
	checkevent EVENT_TODD_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext CamperTodd1AfterText
	buttonsound
	setevent EVENT_TODD_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber
	jump .FinishAsk

.AskAgain:
	scall .AskNumber2
.FinishAsk:
	askforphonenumber PHONE_CAMPER_TODD
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	trainertotext CAMPER, TODD1, MEM_BUFFER_0
	scall .RegisteredNumber
	jump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext CamperTodd1BeatenText, 0
	copybytetovar wToddFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_CIANWOOD
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer CAMPER, TODD1
	startbattle
	reloadmapafterbattle
	loadvar wToddFightCount, 1
	clearflag ENGINE_TODD
	end

.LoadFight1:
	loadtrainer CAMPER, TODD2
	startbattle
	reloadmapafterbattle
	loadvar wToddFightCount, 2
	clearflag ENGINE_TODD
	end

.LoadFight2:
	loadtrainer CAMPER, TODD3
	startbattle
	reloadmapafterbattle
	loadvar wToddFightCount, 3
	clearflag ENGINE_TODD
	end

.LoadFight3:
	loadtrainer CAMPER, TODD4
	startbattle
	reloadmapafterbattle
	loadvar wToddFightCount, 4
	clearflag ENGINE_TODD
	end

.LoadFight4:
	loadtrainer CAMPER, TODD5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TODD
	end

.SaleIsOn:
	writetext CamperToddSaleText
	waitbutton
	closetext
	end

.AskNumber:
	jumpstd asknumber1m
	end

.AskNumber2:
	jumpstd asknumber2m
	end

.RegisteredNumber:
	jumpstd registerednumberm
	end

.NumberAccepted:
	jumpstd numberacceptedm
	end

.NumberDeclined:
	jumpstd numberdeclinedm
	end

.PhoneFull:
	jumpstd phonefullm
	end

.RematchStd:
	jumpstd rematchm
	end

TrainerPicnickerGina1:
	trainer PICNICKER, GINA1, EVENT_BEAT_PICNICKER_GINA, PicnickerGina1SeenText, PicnickerGina1BeatenText, 0, .Script

.Script:
	writecode VAR_CALLERID, PHONE_PICNICKER_GINA
	endifjustbattled
	opentext
	checkflag ENGINE_GINA
	iftrue .Rematch
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftrue .LeafStone
	checkcellnum PHONE_PICNICKER_GINA
	iftrue .NumberAccepted
	checkevent EVENT_GINA_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext PicnickerGina1AfterText
	buttonsound
	setevent EVENT_GINA_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	jump .FinishAsk

.AskAgain:
	scall .AskNumber2
.FinishAsk:
	askforphonenumber PHONE_PICNICKER_GINA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	trainertotext PICNICKER, GINA1, MEM_BUFFER_0
	scall .RegisteredNumber
	jump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext PicnickerGina1BeatenText, 0
	copybytetovar wGinaFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_MAHOGANY
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, GINA1
	startbattle
	reloadmapafterbattle
	loadvar wGinaFightCount, 1
	clearflag ENGINE_GINA
	end

.LoadFight1:
	loadtrainer PICNICKER, GINA2
	startbattle
	reloadmapafterbattle
	loadvar wGinaFightCount, 2
	clearflag ENGINE_GINA
	end

.LoadFight2:
	loadtrainer PICNICKER, GINA3
	startbattle
	reloadmapafterbattle
	loadvar wGinaFightCount, 3
	clearflag ENGINE_GINA
	end

.LoadFight3:
	loadtrainer PICNICKER, GINA4
	startbattle
	reloadmapafterbattle
	loadvar wGinaFightCount, 4
	clearflag ENGINE_GINA
	end

.LoadFight4:
	loadtrainer PICNICKER, GINA5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GINA
	end

.LeafStone:
	scall .Gift
	verbosegiveitem LEAF_STONE
	iffalse .BagFull
	clearflag ENGINE_GINA_HAS_LEAF_STONE
	setevent EVENT_GINA_GAVE_LEAF_STONE
	jump .NumberAccepted

.BagFull:
	jump .PackFull

.AskNumber1:
	jumpstd asknumber1f
	end

.AskNumber2:
	jumpstd asknumber2f
	end

.RegisteredNumber:
	jumpstd registerednumberf
	end

.NumberAccepted:
	jumpstd numberacceptedf
	end

.NumberDeclined:
	jumpstd numberdeclinedf
	end

.PhoneFull:
	jumpstd phonefullf
	end

.RematchStd:
	jumpstd rematchf
	end

.Gift:
	jumpstd giftf
	end

.PackFull:
	jumpstd packfullf
	end

OfficerKeithScript:
	faceplayer
	opentext
	checktime NITE
	iffalse .NoFight
	checkevent EVENT_BEAT_OFFICER_KEITH
	iftrue .AfterScript
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerKeithSeenText
	waitbutton
	closetext
	winlosstext OfficerKeithWinText, 0
	loadtrainer OFFICER, KEITH
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICER_KEITH
	closetext
	end

.AfterScript:
	writetext OfficerKeithAfterText
	waitbutton
	closetext
	end

.NoFight:
	writetext OfficerKeithDaytimeText
	waitbutton
	closetext
	end

TrainerYoungsterSamuel:
	trainer YOUNGSTER, SAMUEL, EVENT_BEAT_YOUNGSTER_SAMUEL, YoungsterSamuelSeenText, YoungsterSamuelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
IF DEF(_MOBILE)
	special Mobile_DummyReturnFalse
	iftrue .mobile
ENDC
	writetext YoungsterSamuelAfterText
	waitbutton
	closetext
	end

IF DEF(_MOBILE)
.mobile
	writetext YoungsterSamuelAfterText
	waitbutton
	closetext
	end
ENDC

	
TrainerYoungsterIan:
	trainer YOUNGSTER, IAN, EVENT_BEAT_YOUNGSTER_IAN, YoungsterIanSeenText, YoungsterIanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterIanAfterText
	waitbutton
	closetext
	end

TrainerPokefanmBrandon:
	trainer POKEFANM, BRANDON, EVENT_BEAT_POKEFANM_BRANDON, PokefanmBrandonSeenText, PokefanmBrandonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmBrandonAfterText
	waitbutton
	closetext
	end

TrainerCooltrainerfIrene:
	trainer COOLTRAINERF, IRENE, EVENT_BEAT_COOLTRAINERF_IRENE, CooltrainerfIreneSeenText, CooltrainerfIreneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue .GotSoftSand
	writetext CooltrainerfIreneAfterText1
	waitbutton
	closetext
	end

.GotSoftSand:
	writetext CooltrainerfIreneAfterText2
	waitbutton
	closetext
	end

TrainerCooltrainerfJenn:
	trainer COOLTRAINERF, JENN, EVENT_BEAT_COOLTRAINERF_JENN, CooltrainerfJennSeenText, CooltrainerfJennBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue .GotSoftSand
	writetext CooltrainerfJennAfterText1
	waitbutton
	closetext
	end

.GotSoftSand:
	writetext CooltrainerfJennAfterText2
	waitbutton
	closetext
	end

TrainerCooltrainerfKate:
	trainer COOLTRAINERF, KATE, EVENT_BEAT_COOLTRAINERF_KATE, CooltrainerfKateSeenText, CooltrainerfKateBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue .GotSoftSand
	writetext CooltrainerfKateOfferSoftSandText
	buttonsound
	verbosegiveitem SOFT_SAND
	iffalse .BagFull
	setevent EVENT_GOT_SOFT_SAND_FROM_KATE
.GotSoftSand:
	writetext CooltrainerfKateAfterText
	waitbutton
.BagFull:
	closetext
	end

Route34IlexForestSign:
; unused
	jumptext Route34IlexForestSignText

Route34Sign:
	jumptext Route34SignText

Route34TrainerTips:
	jumptext Route34TrainerTipsText

DayCareSign:
	jumptext DayCareSignText

Route34Nugget:
	itemball NUGGET

Route34HiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_ROUTE_34_HIDDEN_RARE_CANDY

Route34HiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ROUTE_34_HIDDEN_SUPER_POTION

Route34MovementData_DayCareManWalksBackInside:
	slow_step LEFT
	slow_step LEFT
	slow_step UP
	step_end

Route34MovementData_DayCareManWalksBackInside_WalkAroundPlayer:
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	slow_step UP
	slow_step UP
	step_end

YoungsterSamuelSeenText:
	text "이 근처는 나의"
	line "연습 장소란다!"
	done

YoungsterSamuelBeatenText:;TRANSLATED
	text"지나가는 여행자에게 졌다!"
	done

YoungsterSamuelMobileText:;TRANSLATED
	text"너도　금빛시티　간적 있어?"
	line"포켓몬센터가 바뀌어서"
	cont"깜짝 놀랐지?"
	done

YoungsterSamuelAfterText:
	text "연습으로도 안 된다면 특훈이다!"
	line "어떻게되던 나의 목표는"
	cont "체육관 관장이니까!"
	done

YoungsterIanSeenText:
	text "나는 반에서 제일"
	line "포켓몬이 강하다!"
	done
	
YoungsterIanBeatenText:
	text "에고고……뛰는놈 위에"
	line "나는놈이 있다는 것인가……"
	done

YoungsterIanAfterText:
	text "반에서 자랑하기위해"
	line "여러가지 노력을 하고있어"
	done

CamperTodd1SeenText:
	text "포켓몬을 키우는데 자신이 있다구"
	line "잠시 승부할래?"
	done

CamperTodd1BeatenText:;TRANSLATED
	text"키우는 방법이 잘못됐었나?"
	done

CamperTodd1AfterText:;TRANSLATED
	text"으-음…"
	line"보모의 집에 들러야 되나?"
	cont"도구를 써야 되나?"
	done

CamperToddSaleText:;TRANSLATED
	text"하늘 아래에서 쇼핑!"
	line"옥상은 기분 좋네-"
	done

PicnickerGina1SeenText:
	text "너 포켓몬 트레이너니?"
	line "그럼 연습상대가 되어줘!"
	done

PicnickerGina1BeatenText:
	text "이런!"
	line "절대로 이길 수 없구나!"
	done

PicnickerGina1AfterText:
	text "너는 너무 강해서"
	line "연습에 도움이 되지 않겠어!"
	done
	
OfficerKeithSeenText:
	text "이봐 너"
	line "거기서 뭘 하고있니?"
	done

OfficerKeithWinText:
	text "강한 아이로군!"
	done

OfficerKeithAfterText:
	text "순찰은 이상 없음!"
	line "너도 조심하거라"
	done

OfficerKeithDaytimeText:
	text "이상한 인간이 없나"
	line "순찰하고 있습니다"
	done
PokefanmBrandonSeenText:
	text "보모로부터"
	line "돌려 받은지 얼마되지 않은 포켓몬"
	cont "얼마나 강해졌는가 보겠어!"
	done
	
PokefanmBrandonBeatenText:
	text "왜 이렇게 되는걸까!?"
	done

PokefanmBrandonAfterText:
	text "포켓몬 언제부턴가"
	line "모르는 기술을 배웠기때문에"
	cont "내가 갈피를 못 잡았다"
	done

CooltrainerfIreneSeenText:
	text "마리사『꺄앗!"
	line "남자애가 왔어!"
	done

CooltrainerfIreneBeatenText:
	text "마리사『아-앙 강하구나!"
	done

CooltrainerfIreneAfterText1:
	text "마리사『마리아 언니에게"
	line "복수를 해달라고 할꺼야!"
	done

CooltrainerfIreneAfterText2:
	text "마리사『아름다운 모래펄이지?"
	line "우리들의 비밀장소야!"
	done

CooltrainerfJennSeenText:
	text "고움『잘도 이겼구나!"
	line "마리사의 복수닷!"
	done

CooltrainerfJennBeatenText:
	text "고움『미안해요"
	line "마리사! 언니!"
	done

CooltrainerfJennAfterText1:
	text "고움『방심하지 말았어야 했는데"
	line "마리아 언니는 무척 강하단다!"
	done

CooltrainerfJennAfterText2:
	text "고움『햇님의 햇살은"
	line "몸을 튼튼하게 한단다!"
	done

CooltrainerfKateSeenText:
	text "마리아『여동생들을"
	line "잘도 귀여워 해줬구나!"
	done

CooltrainerfKateBeatenText:
	text "마리아『내가"
	line "지다니!"
	done

CooltrainerfKateOfferSoftSandText:
	text "마리아『강하구나"
	line "졌다 완벽하게……"
	
	para "이것을 줄께!"
	done

CooltrainerfKateAfterText:
	text "마리아『미안해"
	line "갑자기 싸움을 걸어서"
	
	para "아무도 오지 않을꺼라 생각해서"
	line "무척 놀랬거든"
	done

Route34IlexForestSignText:
; unused
	text "게이트를 빠져나오면 너도밤나무 숲"
	done

Route34SignText:
	text "이곳은 34번 도로"
	line "금빛시티 …… 고동마을"
	cont "도중의 너도밤나무 숲"
	done

Route34TrainerTipsText:
	text "득이 되는 게시판!"
	
	para "열매나무는 하루가 지나면"
	line "새로운 나무열매가 열립니다"
	
	para "어디에 무엇이 있는지"
	line "기억해두고 또 옵시다!"
	done

DayCareSignText:
	text "이곳은 보모의 집"
	line "당신의 포켓몬을 돌봐줍니다"
	done

Route34_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 13, 37, ROUTE_34_ILEX_FOREST_GATE, 1
	warp_event 14, 37, ROUTE_34_ILEX_FOREST_GATE, 2
	warp_event 11, 14, DAY_CARE, 1
	warp_event 11, 15, DAY_CARE, 2
	warp_event 13, 15, DAY_CARE, 3

	db 0 ; coord events

	db 5 ; bg events
	bg_event 12,  6, BGEVENT_READ, Route34Sign
	bg_event 13, 33, BGEVENT_READ, Route34TrainerTips
	bg_event 10, 13, BGEVENT_READ, DayCareSign
	bg_event  8, 32, BGEVENT_ITEM, Route34HiddenRareCandy
	bg_event 17, 19, BGEVENT_ITEM, Route34HiddenSuperPotion

	db 13 ; object events
	object_event 13,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerCamperTodd1, -1
	object_event 15, 32, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterSamuel, -1
	object_event 11, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterIan, -1
	object_event 10, 26, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerGina1, -1
	object_event  9, 11, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OfficerKeithScript, -1
	object_event 18, 28, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmBrandon, -1
	object_event 15, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Outside, EVENT_DAY_CARE_MAN_ON_ROUTE_34
	object_event 14, 18, SPRITE_DAY_CARE_MON_1, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareMon1Script, EVENT_DAY_CARE_MON_1
	object_event 17, 19, SPRITE_DAY_CARE_MON_2, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareMon2Script, EVENT_DAY_CARE_MON_2
	object_event 11, 48, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerCooltrainerfIrene, -1
	object_event  3, 48, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfJenn, -1
	object_event  6, 51, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfKate, -1
	object_event  7, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route34Nugget, EVENT_ROUTE_34_NUGGET
