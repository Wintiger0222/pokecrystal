	const_def 2 ; object constants
	const ROUTE32_FISHER1
	const ROUTE32_FISHER2
	const ROUTE32_FISHER3
	const ROUTE32_YOUNGSTER1
	const ROUTE32_YOUNGSTER2
	const ROUTE32_YOUNGSTER3
	const ROUTE32_LASS1
	const ROUTE32_COOLTRAINER_M
	const ROUTE32_YOUNGSTER4
	const ROUTE32_FISHER4
	const ROUTE32_POKE_BALL1
	const ROUTE32_FISHER5
	const ROUTE32_FRIEDA
	const ROUTE32_POKE_BALL2

Route32_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	scene_script .DummyScene2 ; SCENE_ROUTE32_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Frieda

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.Frieda:
	readvar VAR_WEEKDAY
	ifequal FRIDAY, .FriedaAppears
	disappear ROUTE32_FRIEDA
	return

.FriedaAppears:
	appear ROUTE32_FRIEDA
	return

Route32CooltrainerMScript:
	faceplayer
Route32CooltrainerMContinueScene:
	opentext
	checkevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	iftrue .GotMiracleSeed
	checkflag ENGINE_ZEPHYRBADGE
	iffalse .DontHaveZephyrBadge
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue .GiveMiracleSeed
	writetext Route32CooltrainerMText_AideIsWaiting
	waitbutton
	closetext
	end

.Unreferenced:
	writetext Route32CooltrainerMText_UnusedSproutTower
	waitbutton
	closetext
	end

.GiveMiracleSeed:
	writetext Route32CooltrainerMText_HaveThisSeed
	buttonsound
	verbosegiveitem MIRACLE_SEED
	iffalse .BagFull
	setevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	sjump .GotMiracleSeed

.DontHaveZephyrBadge:
	writetext Route32CooltrainerMText_VioletGym
	waitbutton
	closetext
	end

.GotMiracleSeed:
	writetext Route32CooltrainerMText_ExperiencesShouldBeUseful
	waitbutton
.BagFull:
	closetext
	end

Route32CooltrainerMStopsYouScene:
	turnobject ROUTE32_COOLTRAINER_M, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext Route32CooltrainerMText_WhatsTheHurry
	waitbutton
	closetext
	follow PLAYER, ROUTE32_COOLTRAINER_M
	applymovement PLAYER, Movement_Route32CooltrainerMPushesYouBackToViolet
	stopfollow
	turnobject PLAYER, DOWN
	scall Route32CooltrainerMContinueScene
	applymovement ROUTE32_COOLTRAINER_M, Movement_Route32CooltrainerMReset1
	applymovement ROUTE32_COOLTRAINER_M, Movement_Route32CooltrainerMReset2
	end

Route32RoarTMGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM05_ROAR
	iftrue .AlreadyHaveRoar
	writetext Text_RoarIntro
	buttonsound
	verbosegiveitem TM_ROAR
	iffalse .Finish
	setevent EVENT_GOT_TM05_ROAR
.AlreadyHaveRoar:
	writetext Text_RoarOutro
	waitbutton
.Finish:
	closetext
	end

Route32WannaBuyASlowpokeTailScript:
	turnobject ROUTE32_FISHER4, DOWN
	turnobject PLAYER, UP
	sjump _OfferToSellSlowpokeTail

SlowpokeTailSalesmanScript:
	faceplayer
_OfferToSellSlowpokeTail:
	setscene SCENE_ROUTE32_NOTHING
	opentext
	writetext Text_MillionDollarSlowpokeTail
	yesorno
	iffalse .refused
	writetext Text_ThoughtKidsWereLoaded
	waitbutton
	closetext
	end

.refused
	writetext Text_RefusedToBuySlowpokeTail
	waitbutton
	closetext
	end

TrainerCamperRoland:
	trainer CAMPER, ROLAND, EVENT_BEAT_CAMPER_ROLAND, CamperRolandSeenText, CamperRolandBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperRolandAfterText
	waitbutton
	closetext
	end

TrainerFisherJustin:
	trainer FISHER, JUSTIN, EVENT_BEAT_FISHER_JUSTIN, FisherJustinSeenText, FisherJustinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherJustinAfterText
	waitbutton
	closetext
	end

TrainerFisherRalph1:
	trainer FISHER, RALPH1, EVENT_BEAT_FISHER_RALPH, FisherRalph1SeenText, FisherRalph1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_FISHER_RALPH
	endifjustbattled
	opentext
	checkflag ENGINE_RALPH
	iftrue .Rematch
	checkflag ENGINE_FISH_SWARM
	iftrue .Swarm
	checkcellnum PHONE_FISHER_RALPH
	iftrue .NumberAccepted
	checkevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext FisherRalphAfterText
	buttonsound
	setevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskAgain:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_FISHER_RALPH
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, FISHER, RALPH1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext FisherRalph1BeatenText, 0
	readmem wRalphFightCount
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
	checkflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer FISHER, RALPH1
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 1
	clearflag ENGINE_RALPH
	end

.LoadFight1:
	loadtrainer FISHER, RALPH2
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 2
	clearflag ENGINE_RALPH
	end

.LoadFight2:
	loadtrainer FISHER, RALPH3
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 3
	clearflag ENGINE_RALPH
	end

.LoadFight3:
	loadtrainer FISHER, RALPH4
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 4
	clearflag ENGINE_RALPH
	end

.LoadFight4:
	loadtrainer FISHER, RALPH5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_RALPH
	end

.Swarm:
	writetext FisherRalphSwarmText
	waitbutton
	closetext
	end

.AskNumber1:
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

TrainerFisherHenry:
	trainer FISHER, HENRY, EVENT_BEAT_FISHER_HENRY, FisherHenrySeenText, FisherHenryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherHenryAfterText
	waitbutton
	closetext
	end

TrainerPicnickerLiz1:
	trainer PICNICKER, LIZ1, EVENT_BEAT_PICNICKER_LIZ, PicnickerLiz1SeenText, PicnickerLiz1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_LIZ
	endifjustbattled
	opentext
	checkflag ENGINE_LIZ
	iftrue .Rematch
	checkcellnum PHONE_PICNICKER_LIZ
	iftrue .NumberAccepted
	checkevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext PicnickerLiz1AfterText
	buttonsound
	setevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskAgain:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_LIZ
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, PICNICKER, LIZ1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext PicnickerLiz1BeatenText, 0
	readmem wLizFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, LIZ1
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 1
	clearflag ENGINE_LIZ
	end

.LoadFight1:
	loadtrainer PICNICKER, LIZ2
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 2
	clearflag ENGINE_LIZ
	end

.LoadFight2:
	loadtrainer PICNICKER, LIZ3
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 3
	clearflag ENGINE_LIZ
	end

.LoadFight3:
	loadtrainer PICNICKER, LIZ4
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 4
	clearflag ENGINE_LIZ
	end

.LoadFight4:
	loadtrainer PICNICKER, LIZ5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_LIZ
	end

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

TrainerYoungsterAlbert:
	trainer YOUNGSTER, ALBERT, EVENT_BEAT_YOUNGSTER_ALBERT, YoungsterAlbertSeenText, YoungsterAlbertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterAlbertAfterText
	waitbutton
	closetext
	end

TrainerYoungsterGordon:
	trainer YOUNGSTER, GORDON, EVENT_BEAT_YOUNGSTER_GORDON, YoungsterGordonSeenText, YoungsterGordonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterGordonAfterText
	waitbutton
	closetext
	end

TrainerBirdKeeperPeter:
	trainer BIRD_KEEPER, PETER, EVENT_BEAT_BIRD_KEEPER_PETER, BirdKeeperPeterSeenText, BirdKeeperPeterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperPeterAfterText
	waitbutton
	closetext
	end

FriedaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	iftrue .Friday
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checkevent EVENT_MET_FRIEDA_OF_FRIDAY
	iftrue .MetFrieda
	writetext MeetFriedaText
	buttonsound
	setevent EVENT_MET_FRIEDA_OF_FRIDAY
.MetFrieda:
	writetext FriedaGivesGiftText
	buttonsound
	verbosegiveitem POISON_BARB
	iffalse .Done
	setevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	writetext FriedaGaveGiftText
	waitbutton
	closetext
	end

.Friday:
	writetext FriedaFridayText
	waitbutton
.Done:
	closetext
	end

.NotFriday:
	writetext FriedaNotFridayText
	waitbutton
	closetext
	end

Route32GreatBall:
	itemball GREAT_BALL

Route32Repel:
	itemball REPEL

Route32Sign:
	jumptext Route32SignText

Route32RuinsSign:
	jumptext Route32RuinsSignText

Route32UnionCaveSign:
	jumptext Route32UnionCaveSignText

Route32PokecenterSign:
	jumpstd pokecentersign

Route32HiddenGreatBall:
	hiddenitem GREAT_BALL, EVENT_ROUTE_32_HIDDEN_GREAT_BALL

Route32HiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ROUTE_32_HIDDEN_SUPER_POTION

Movement_Route32CooltrainerMPushesYouBackToViolet:
	step UP
	step UP
	step_end

Movement_Route32CooltrainerMReset1:
	step DOWN
	step_end

Movement_Route32CooltrainerMReset2:
	step RIGHT
	step_end

Route32CooltrainerMText_WhatsTheHurry:
	text "카-악!!"
	line "다음에-익!!"
	done

Route32CooltrainerMText_AideIsWaiting:
	text "<PLAYER>(이)란 사람이 그댄가?"
	line "그대를 찾아다니는"
	cont "안경쓴 사내가 있었다"
	
	para "포켓몬센터에서"
	line "그대를 기다리고 있을 것이다"
	cont "그곳에 가 보거라!"
	done

Route32CooltrainerMText_UnusedSproutTower:
; unused
	text "모다피의 탑에는 갔었는가?"
	line "도라지시티에 들리면 모다피의탑에서"
	cont "수행하는 것이"
	
	para "트레이너의 상식이 아닌가"
	line "어서 가 보거라!"
	done

Route32CooltrainerMText_VioletGym:
	text "포켓몬 체육관에는 갔었는가?"
	line "포켓몬 체육관에 들려서"
	cont "너와 포켓몬을 단련시키는 것이"
	
	para "트레이너의 상식이 아닌가"
	line "어서 가 보거라!"
	done

Route32CooltrainerMText_HaveThisSeed:
	text "음 좋은 포켓몬을 데리고 있군!"
	line "이것도 저것도 도라지시티에서"
	cont "여러가지로 단련시켰기 때문이지"
	
	para "특별히 포켓몬 체육관에서의"
	line "수행은 이득이 되었을 터"
	
	para "좋아! 도라지시티에 온 기념이다"
	line "이것을 가지고 가거라"
	
	para "포켓몬에게 지니게하면"
	line "풀타입 기술의 위력이"
	cont "올라간다고 하는 상품이다!"
	done

Route32CooltrainerMText_ExperiencesShouldBeUseful:
	text "도라지시티에서의 경험은"
	line "그대의 여행에 도움이 될 것이다"
	done

Text_MillionDollarSlowpokeTail:
	text "맛있고 영양만점의"
	line "맛있는 꼬리는 모르니?"
	
	para "지금이라면 딱 100만원"
	line "어때 사겠어?"
	done

Text_ThoughtKidsWereLoaded:
	text "돈이 부족하잖아!"
	
	para "쳇! 요즘 아이들은"
	line "부자라고 생각했는데……"
	done

Text_RefusedToBuySlowpokeTail:
	text "필요 없다고?"
	line "그럼 저리가! 꺼져!"
	done

FisherJustinSeenText:
	text "우왓!"
	
	para "놀래켜서 내 포획물이 도망갔잖아!"
	done

FisherJustinBeatenText:
	text "풀쩍!"
	done

FisherJustinAfterText:
	text "법석대지말고 소란 피우지말고……"
	
	para "낚시도 포켓몬도"
	line "오묘함은 똑같구나!"
	done
	
FisherRalph1SeenText:;TRANSLATED
	text"난 낚시도 자신 있지만"
	line"포켓몬이라 해서 너 같이"
	cont"어린애한테는 지지 않아!"
	done

FisherRalph1BeatenText:
	text "상대방의 태도에 맞췄다……"
	done

FisherRalphAfterText:
	text "낚시는 일생의 즐거움!"
	line "포켓몬은 일생의 친구!"
	done

FisherRalphSwarmText:;TRANSLATED
	text"하나 둘 셋…"
	line"으하하하　풍어다 풍어!"

	para"난 이제 됬어"
	line"잔뜩　잡아라　꼬마야!"
	done

; --- start a segment of unused text

Route32UnusedFisher1SeenText:
	text "같은 포켓몬밖에 낚이지 않는다……"
	line "기분전환으로 잠시 싸워볼까……"
	done
	

Route32UnusedFisher1BeatenText:
	text "안 될때에는"
	line "뭘 하든지 안 되는 것인가"
	done

Route32UnusedFisher1AfterText:
	text "옆의 낚시꾼은"
	line "어째서 좋은 포켓몬이 낚일까?"
	done

Route32UnusedFisher2SeenText:
	text "오늘은 기분 최고로구나"
	line "좋-아 잠시 싸워볼까!"
	done

Route32UnusedFisher2BeatenText:
	text "에구구"
	line "승부에서 이기기는 틀렸는가"
	done

Route32UnusedFisher2AfterText:
	text "좋은 포켓몬을 낚고싶으면"
	line "좋은 낚싯대를 써야지!"
	done

; --- end a segment of unused texts

FisherHenrySeenText:
	text "내 포켓몬"
	line "어느 때든 쌩쌩!"
	done

FisherHenryBeatenText:
	text "어기영차"
	done

FisherHenryAfterText:
	text "잡은지 얼마 되지 않아서는"
	line "키운 포켓몬에게 못 미치지"
	done

YoungsterAlbertSeenText:
	text "못 보던 얼굴이군"
	line "너 강하냐?"
	done

YoungsterAlbertBeatenText:
	text "강하구나!"
	done

YoungsterAlbertAfterText:
	text "나는 자신이 좋아하는 포켓몬으로"
	line "최강을 목표로 한다!"
	
	para "강하다고 모두와 같은"
	line "포켓몬은 사용하지 않아"
	done

YoungsterGordonSeenText:
	text "풀숲에서 좋은 포켓몬 발견했다!"
	line "뭔가 해줄 것 같은 기분이야!"
	done

YoungsterGordonBeatenText:
	text "아-아"
	line "이길 수 있다고 생각했는데"
	done

YoungsterGordonAfterText:
	text "풀숲을 걸어다니면"
	line "달라 붙는 벌레가 많이 있단다"
	done

CamperRolandSeenText:
	text "그 시선……"
	line "어쩐지 신경쓰이는군"
	done

CamperRolandBeatenText:
	text "우-움 유감이다"
	done

CamperRolandAfterText:
	text "싸우고싶지 않다면"
	line "시선을 마주치지 않으면 좋을꺼야"
	done

PicnickerLiz1SeenText:
	text "…… 그래그래"
	line "응 그런거야"
	
	para "엥? 뭐라고? 포켓몬 승부?"
	line "전화하고 있는데"
	cont "좋아 팍팍 끝내줄 테니까"
	done
	

PicnickerLiz1BeatenText:;TRANSLATED
	text"정말!　이 분함을"
	line"어디에 쏟아야 되나고-!"
	done

PicnickerLiz1AfterText:
	text "재미있게 이야기를 하고 있었는데"
	done

BirdKeeperPeterSeenText:
	text "얼라리 그 배지는……"
	
	para "도라지시티 체육관의 배지!"
	line "너 비상님에게 이겼단말인가!"
	done
BirdKeeperPeterBeatenText:
	text "자신의 미숙함을 알았다!"
	done
	

BirdKeeperPeterAfterText:
	text "도라지시티 체육관에서"
	line "새로 단련이나 해볼까"
	done
	

Route32UnusedText:
; unused
	text "낚시 훼방꾼!"
	line "이라고 야단맞아버렸어……"
	done

Text_RoarIntro:
	text "우오오옷!"
	
	para "소리치면 모두 도망치지만"
	line "너는 와주었다아앗!"
	cont "감동했다아아!"
	cont "이것을 가지고 가거라아아앗!"
	done

Text_RoarOutro:
	text "우오오옷!"
	line "내용물은 울부짖기"
	cont "울부짖으면 포켓몬도 도망친단다"
	done

MeetFriedaText:
	text "금순『얏호-!"
	
	para "나는 금요일의 금순!"
	line "잘 부탁해-!"
	done

FriedaGivesGiftText:
	text "자 여기 독바늘!"
	line "너에게 줄께!"
	done

FriedaGaveGiftText:
	text "금순『독타입의 기술을 배운"
	line "포켓몬에게 지니게 해봐!"
	
	para "앗!"
	
	para "하고 놀랄꺼야!"
	
	para "기술의 위력이 강해지니까!"
	done
	
FriedaFridayText:
	text "금순『이봐 친구!"
	line "너는 무슨 요일이 좋니?"
	
	para "나는 금요일이란다!"
	line "절대로!"
	
	para "그렇게 생각하지 않니?"
	done

FriedaNotFridayText:
	text "금순『오늘은 금요일이"
	line "아니라구?"
	cont "재미없어-"
	done

Route32SignText:
	text "이곳은 32번 도로"
	line "도라지시티 …… 고동마을"
	done

Route32RuinsSignText:
	text "알프의 유적"
	line "동쪽 입구"
	done

Route32UnionCaveSignText:
	text "이 앞은 연결동굴"
	done

Route32_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 11, 73, ROUTE_32_POKECENTER_1F, 1
	warp_event  4,  2, ROUTE_32_RUINS_OF_ALPH_GATE, 3
	warp_event  4,  3, ROUTE_32_RUINS_OF_ALPH_GATE, 4
	warp_event  6, 79, UNION_CAVE_1F, 4

	db 2 ; coord events
	coord_event 18,  8, SCENE_DEFAULT, Route32CooltrainerMStopsYouScene
	coord_event  7, 71, SCENE_ROUTE32_OFFER_SLOWPOKETAIL, Route32WannaBuyASlowpokeTailScript

	db 6 ; bg events
	bg_event 13,  5, BGEVENT_READ, Route32Sign
	bg_event  9,  1, BGEVENT_READ, Route32RuinsSign
	bg_event 10, 84, BGEVENT_READ, Route32UnionCaveSign
	bg_event 12, 73, BGEVENT_READ, Route32PokecenterSign
	bg_event 12, 67, BGEVENT_ITEM, Route32HiddenGreatBall
	bg_event 11, 40, BGEVENT_ITEM, Route32HiddenSuperPotion

	db 14 ; object events
	object_event  8, 49, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherJustin, -1
	object_event 12, 56, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherRalph1, -1
	object_event  6, 48, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherHenry, -1
	object_event 12, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterAlbert, -1
	object_event  4, 63, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterGordon, -1
	object_event  3, 45, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperRoland, -1
	object_event 10, 30, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerLiz1, -1
	object_event 19,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32CooltrainerMScript, -1
	object_event 11, 82, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperPeter, -1
	object_event  7, 70, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeTailSalesmanScript, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  6, 53, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route32GreatBall, EVENT_ROUTE_32_GREAT_BALL
	object_event 15, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32RoarTMGuyScript, -1
	object_event 12, 67, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FriedaScript, EVENT_ROUTE_32_FRIEDA_OF_FRIDAY
	object_event  3, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route32Repel, EVENT_ROUTE_32_REPEL
