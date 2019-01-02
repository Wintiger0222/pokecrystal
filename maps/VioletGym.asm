	const_def 2 ; object constants
	const VIOLETGYM_FALKNER
	const VIOLETGYM_YOUNGSTER1
	const VIOLETGYM_YOUNGSTER2
	const VIOLETGYM_GYM_GUY

VioletGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VioletGymFalknerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer FALKNER, FALKNER1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	opentext
	writetext ReceivedZephyrBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	checkcode VAR_BADGES
	scall VioletGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	setmapscene ELMS_LAB, SCENE_ELMSLAB_NOTHING
	specialphonecall SPECIALCALL_ASSISTANT
	writetext FalknerZephyrBadgeText
	buttonsound
	verbosegiveitem TM_MUD_SLAP
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext FalknerTMMudSlapText
	waitbutton
	closetext
	end

.SpeechAfterTM:
	writetext FalknerFightDoneText
	waitbutton
.NoRoomForMudSlap:
	closetext
	end

VioletGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerBirdKeeperRod:
	trainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, BirdKeeperRodSeenText, BirdKeeperRodBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRodAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperAbe:
	trainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, BirdKeeperAbeSeenText, BirdKeeperAbeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperAbeAfterBattleText
	waitbutton
	closetext
	end

VioletGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .VioletGymGuyWinScript
	writetext VioletGymGuyText
	waitbutton
	closetext
	end

.VioletGymGuyWinScript:
	writetext VioletGymGuyWinText
	waitbutton
	closetext
	end

VioletGymStatue:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext FALKNER, FALKNER1, MEM_BUFFER_1
	jumpstd gymstatue2

FalknerIntroText:
	text "내가 도라지시티 포켓몬 체육관"
	line "관장인 비상이다!"
	
	para "세간에서는"
	line "비행타입의 포켓몬같은 것은"
	cont "전기 충격에 한방이라고……"
	
	para "그렇게 새포켓몬을 바보취급한다"
	line "나는 그것을 용서 못 한다"
	
	para "넓은 하늘을 화려하게 나는"
	line "새포켓몬의 진정 강함을"
	cont "알게 해주겠다!"
	done

FalknerWinLossText:
	text "……젠장"
	line "아버지가 소중하게 여기던"
	cont "포켓몬이……"
	
	para "알겠다"
	line "이것을 가지고 가거라!"
	
	para "포켓몬 리그 공인"
	line "윙배지다!"
	done

ReceivedZephyrBadgeText:
	text "<PLAYER>는(은) 비상으로부터"
	line "윙배지를 받았다!"
	done

FalknerZephyrBadgeText:
	text "윙배지를 지니고 있으면"
	line "너의 포켓몬"
	cont "공격력이 올라간다!"
	
	para "그리고 플래시라고 하는"
	line "기술을 배운 포켓몬은"
	cont "싸우고 있지 않을 때에도"
	cont "플래시를 쓸 수 있다!"
	
	para "그리고 이것도 가지고 가라"
	done

FalknerTMMudSlapText:
	text "기술머신을 사용하면"
	line "단숨에 포켓몬에게"
	cont "기술을 가르칠 수 있다!"
	
	para "그러나 1회용이기때문에"
	line "잘 생각해서 써야할꺼야"
	
	para "덧붙여서 기술머신31의 안에는"
	line "진흙 뿌리기가 들어있다"
	
	para "상대의 명중력을 떨어뜨리면서"
	line "데미지를 준단다"
	
	para "다시 말해서 공격과 방어가"
	line "동시에 되는 기술이다"
	done

FalknerFightDoneText:
	text "이 앞에는 여러마을에"
	line "포켓몬 체육관이 있으니까"
	cont "거기서 실력을 겨루어보면 좋을꺼다"
	
	para "나는최강의"
	line "새 조련사가 되기위하여"
	cont "포켓몬과 내 자신을 단련시키겠어!"
	done

BirdKeeperRodSeenText:
	text "표어는 강한 근성"
	
	para "이곳에 모여있는 인간은"
	line "새포켓몬으로 최강을 목표로 하여"
	cont "밤낮 없이 특훈을 하고있다!"
	
	para "덤벼랏!"
	done

BirdKeeperRodBeatenText:
	text "쿠-웅!!"
	done

BirdKeeperRodAfterBattleText:
	text "비상님의"
	line "실력은 진짜다"
	
	para "나를 이긴 것 정도로"
	line "들뜨지말아라!"
	done

BirdKeeperAbeSeenText:
	text "비상님에게 도전할 수 있을까"
	line "시험해보겠다!"
	done

BirdKeeperAbeBeatenText:
	text "진짜냐!?"
	done

BirdKeeperAbeAfterBattleText:
	text "신출내기 트레이너 녀석에게"
	line "진다는 것은 말도 안 되지……"
	done

VioletGymGuyText:
	text "여어!"
	line "나는 트레이너가 아니지만"
	cont "어드바이스는 할 수 있지!"
	
	para "믿음이야!"
	line "믿는다면"
	cont "챔피언도 꿈은 아니지!"
	
	para "그래 들어주겠니?"
	line "좋아!"
	
	para "풀타입은 비행타입에"
	line "대단히 상성이 나쁘단다"
	cont "꼭 주의를 해야해!"
	done

VioletGymGuyWinText:
	text "나이스 파이트!"
	line "그 상태로 단번에"
	cont "포켓몬 챔피언이 되어라!"
	done

VioletGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, VIOLET_CITY, 2
	warp_event  5, 15, VIOLET_CITY, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, VioletGymStatue
	bg_event  6, 13, BGEVENT_READ, VioletGymStatue

	db 4 ; object events
	object_event  5,  1, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletGymFalknerScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRod, -1
	object_event  2, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperAbe, -1
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymGuyScript, -1
