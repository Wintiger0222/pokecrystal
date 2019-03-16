	const_def 2 ; object constants
	const LAKEOFRAGE_LANCE
	const LAKEOFRAGE_GRAMPS
	const LAKEOFRAGE_SUPER_NERD1
	const LAKEOFRAGE_COOLTRAINER_F1
	const LAKEOFRAGE_FISHER1
	const LAKEOFRAGE_FISHER2
	const LAKEOFRAGE_COOLTRAINER_M
	const LAKEOFRAGE_COOLTRAINER_F2
	const LAKEOFRAGE_GYARADOS
	const LAKEOFRAGE_WESLEY
	const LAKEOFRAGE_POKE_BALL1
	const LAKEOFRAGE_POKE_BALL2

LakeOfRage_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; unusable
	scene_script .DummyScene1 ; unusable

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .Wesley

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	return

.Wesley:
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .WesleyAppears
	disappear LAKEOFRAGE_WESLEY
	return

.WesleyAppears:
	appear LAKEOFRAGE_WESLEY
	return

LakeOfRageLanceScript:
	checkevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	iftrue .AskAgainForHelp
	opentext
	writetext UnknownText_0x70157
	buttonsound
	faceplayer
	writetext UnknownText_0x701b4
	yesorno
	iffalse .RefusedToHelp
.AgreedToHelp:
	writetext UnknownText_0x702c6
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement LAKEOFRAGE_LANCE, MovementData_0x70155
	disappear LAKEOFRAGE_LANCE
	clearevent EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	setevent EVENT_DECIDED_TO_HELP_LANCE
	setmapscene MAHOGANY_MART_1F, SCENE_MAHOGANYMART1F_LANCE_UNCOVERS_STAIRS
	end

.RefusedToHelp:
	writetext UnknownText_0x70371
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	end

.AskAgainForHelp:
	faceplayer
	opentext
	writetext UnknownText_0x703a5
	yesorno
	iffalse .RefusedToHelp
	sjump .AgreedToHelp

RedGyarados:
	opentext
	writetext UnknownText_0x703cb
	pause 15
	cry GYARADOS
	closetext
	loadwildmon GYARADOS, 30
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	ifequal LOSE, .NotBeaten
	disappear LAKEOFRAGE_GYARADOS
.NotBeaten:
	reloadmapafterbattle
	opentext
	giveitem RED_SCALE
	waitsfx
	writetext UnknownText_0x703df
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setscene 0 ; Lake of Rage does not have a scene variable
	appear LAKEOFRAGE_LANCE
	end

LakeOfRageGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	writetext LakeOfRageGrampsText
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext LakeOfRageGrampsText_ClearedRocketHideout
	waitbutton
	closetext
	end

LakeOfRageSuperNerdScript:
	jumptextfaceplayer LakeOfRageSuperNerdText

LakeOfRageCooltrainerFScript:
	jumptextfaceplayer LakeOfRageCooltrainerFText

LakeOfRageSign:
	jumptext LakeOfRageSignText

MagikarpHouseSignScript:
	opentext
	writetext FishingGurusHouseSignText
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .MagikarpLengthRecord
	waitbutton
	closetext
	end

.MagikarpLengthRecord:
	buttonsound
	special MagikarpHouseSign
	closetext
	end

TrainerFisherAndre:
	trainer FISHER, ANDRE, EVENT_BEAT_FISHER_ANDRE, FisherAndreSeenText, FisherAndreBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherAndreAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherRaymond:
	trainer FISHER, RAYMOND, EVENT_BEAT_FISHER_RAYMOND, FisherRaymondSeenText, FisherRaymondBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherRaymondAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermAaron:
	trainer COOLTRAINERM, AARON, EVENT_BEAT_COOLTRAINERM_AARON, CooltrainermAaronSeenText, CooltrainermAaronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAaronAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfLois:
	trainer COOLTRAINERF, LOIS, EVENT_BEAT_COOLTRAINERF_LOIS, CooltrainerfLoisSeenText, CooltrainerfLoisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLoisAfterBattleText
	waitbutton
	closetext
	end

WesleyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	iftrue WesleyWednesdayScript
	readvar VAR_WEEKDAY
	ifnotequal WEDNESDAY, WesleyNotWednesdayScript
	checkevent EVENT_MET_WESLEY_OF_WEDNESDAY
	iftrue .MetWesley
	writetext MeetWesleyText
	buttonsound
	setevent EVENT_MET_WESLEY_OF_WEDNESDAY
.MetWesley:
	writetext WesleyGivesGiftText
	buttonsound
	verbosegiveitem BLACKBELT
	iffalse WesleyDoneScript
	setevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	writetext WesleyGaveGiftText
	waitbutton
	closetext
	end

WesleyWednesdayScript:
	writetext WesleyWednesdayText
	waitbutton
WesleyDoneScript:
	closetext
	end

WesleyNotWednesdayScript:
	writetext WesleyNotWednesdayText
	waitbutton
	closetext
	end

LakeOfRageElixer:
	itemball ELIXER

LakeOfRageTMDetect:
	itemball TM_DETECT

LakeOfRageHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_LAKE_OF_RAGE_HIDDEN_FULL_RESTORE

LakeOfRageHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_LAKE_OF_RAGE_HIDDEN_RARE_CANDY

LakeOfRageHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_LAKE_OF_RAGE_HIDDEN_MAX_POTION

MovementData_0x70155:
	teleport_from
	step_end

UnknownText_0x70157:
	text "이 호수에는"
	line "갸라도스만 있구나……"
	
	para "역시 잉어킹은"
	line "누군가가 한 짓에 의해 강제로"
	cont "진화하게 된 것인가……"
	done

UnknownText_0x701b4:
	text "너도 소문을 듣고"
	line "찾아왔는가?"
	
	para "그래 <PLAYER>(이)라고 하는가"
	line "내 이름은 목호"
	cont "너와 같은 트레이너란다"
	
	para "이곳의 소문을 듣고"
	line "진상을 조사하고 있었는데……"
	
	para "<PLAY_G>!"
	line "좀 전의 싸움을 보니까"
	cont "네가 상당한 실력의"
	cont "트레이너라는 것을 알 수 있었다"
	
	para "괜찮다면 나와함께"
	line "조사를 해주겠는가?"
	done

UnknownText_0x702c6:
	text "목호『그럼 한시름 놓았다!"
	
	para "호수의 잉어킹은"
	line "황토마을에서 흘러나오는"
	cont "수수께끼의 전파에 의해 강제로"
	cont "진화 되어지는 것 같단다"
	
	para "<PLAY_G>!"
	line "먼저 가서 기다리겠다!"
	done

UnknownText_0x70371:
	text "그런가……"
	line "마음이 변하면 언제든지 오너라"
	done

UnknownText_0x703a5:
	text "목호『응?"
	line "도와주겠니?"
	done

UnknownText_0x703cb:
	text "갸라도스『카- 갸오-!!"
	done

UnknownText_0x703df:
	text "<PLAYER>"
	db "는(은)"
	line "빨간 비늘을 손에 넣었다!"
	done

LakeOfRageGrampsText:
	text "갸라도스가 화가 났구나"
	line "뭔가 좋지 않은 일이 일어날지도"
	done

LakeOfRageGrampsText_ClearedRocketHideout:
	text "허허!"
	line "좋은 잉어킹이 잘 낚인단다"
	done

LakeOfRageSuperNerdText:
	text "이곳은 예전에 갸라도스가"
	line "폭주해서 돌아다닐때 만들어졌데"
	
	para "이번의 대량 발생이랑"
	line "뭔가 관계가 있을까?"
	done

LakeOfRageCooltrainerFText:
	text "내가 잘못 보았을까"
	line "호수 한가운데"
	cont "빨간 갸라도스가 있었어……"
	
	para "하지만 갸라도스는"
	line "보통은 파란색이지?"
	done

FisherAndreSeenText:
	text "아까 낚아 올린"
	line "자랑할만한 포켓몬으로 승부를!"
	done

FisherAndreBeatenText:
	text "낚시는 프로급이라도"
	line "포켓몬은 아직 아마츄어인가……"
	done
	
FisherAndreAfterBattleText:
	text "낚시 실력이라면 지지 않는다!"
	line "어찌되었든 하루종일"
	cont "포켓몬을 낚고 있으니까!"
	done

FisherRaymondSeenText:
	text "전력을 다하여도"
	line "똑같은 포켓몬밖에 낚이지 않는다!"
	done

FisherRaymondBeatenText:
	text "…… 낚싯줄 엉켜버렸다"
	done
	
FisherRaymondAfterBattleText:
	text "어째서 좋은 포켓몬이"
	line "낚이지 않는거야!"
	done

CooltrainermAaronSeenText:
	text "트레이너를 발견하면"
	line "반드시 도전한다!"
	cont "그것은 트레이너의 숙명!"
	done

CooltrainermAaronBeatenText:
	text "후우……"
	line "좋은 시합이었다"
	done

CooltrainermAaronAfterBattleText:
	text "포켓몬과 트레이너는"
	line "싸움으로 싸움을 이겨내어"
	cont "자신을 단련시킨다!"
	done

CooltrainerfLoisSeenText:
	text "빨간 갸라도스는 어떻게 되었니?"
	
	para "엥 이젠 없어?"
	line "이런 힘들게 왔더니……"
	
	para "좋아 그럼 너 나랑 시합하자!"
	done

CooltrainerfLoisBeatenText:
	text "훌륭하구나"
	done

CooltrainerfLoisAfterBattleText:
	text "그러고보니까 나"
	line "핑크색 버터플을 본적이 있어!"
	done

MeetWesleyText:
	text "수방『이야! 처음뵙겠습니다!"
	
	para "나는 수요일의 수방!"
	done

WesleyGivesGiftText:
	text "힘들게 만났잖아"
	line "이거 받아줘!"
	done

WesleyGaveGiftText:
	text "수방『그 검은띠는"
	line "격투타입 기술의"
	cont "위력을 높여주는 도구야!"
	done

WesleyWednesdayText:
	text "수방『나를 발견할 수 있었다면"
	line "다른 누나들도"
	cont "벌써 만나지 않았겠니?"
	
	para "그것이 아니라면 운이 좋았던걸까?"
	done

WesleyNotWednesdayText:
	text "수방『오늘은 수요일이"
	line "아닌 것 같군!"
	cont "아깝네"
	done

LakeOfRageSignText:
	text "이곳은 분노의 호수"
	line "다른 이름은 갸라도스호"
	done
	
FishingGurusHouseSignText:
	text "낚시명인의 집"
	done

LakeOfRage_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7,  3, LAKE_OF_RAGE_HIDDEN_POWER_HOUSE, 1
	warp_event 27, 31, LAKE_OF_RAGE_MAGIKARP_HOUSE, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event 21, 27, BGEVENT_READ, LakeOfRageSign
	bg_event 25, 31, BGEVENT_READ, MagikarpHouseSignScript
	bg_event 11, 28, BGEVENT_ITEM, LakeOfRageHiddenFullRestore
	bg_event  4,  4, BGEVENT_ITEM, LakeOfRageHiddenRareCandy
	bg_event 35,  5, BGEVENT_ITEM, LakeOfRageHiddenMaxPotion

	db 12 ; object events
	object_event 21, 28, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageLanceScript, EVENT_LAKE_OF_RAGE_LANCE
	object_event 20, 26, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageGrampsScript, -1
	object_event 36, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageSuperNerdScript, -1
	object_event 25, 29, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageCooltrainerFScript, -1
	object_event 30, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherAndre, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 24, 26, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherRaymond, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event  4, 15, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermAaron, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 36,  7, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerCooltrainerfLois, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 18, 22, SPRITE_GYARADOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RedGyarados, EVENT_LAKE_OF_RAGE_RED_GYARADOS
	object_event  4,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WesleyScript, EVENT_LAKE_OF_RAGE_WESLEY_OF_WEDNESDAY
	object_event  7, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LakeOfRageElixer, EVENT_LAKE_OF_RAGE_ELIXER
	object_event 35,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LakeOfRageTMDetect, EVENT_LAKE_OF_RAGE_TM_DETECT
