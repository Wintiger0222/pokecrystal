	const_def 2 ; object constants
	const RADIOTOWER5F_DIRECTOR
	const RADIOTOWER5F_ROCKET
	const RADIOTOWER5F_ROCKET_GIRL
	const RADIOTOWER5F_ROCKER
	const RADIOTOWER5F_POKE_BALL

RadioTower5F_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_RADIOTOWER5F_ROCKET_BOSS
	scene_script .DummyScene2 ; SCENE_RADIOTOWER5F_NOTHING

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

FakeDirectorScript:
	turnobject RADIOTOWER5F_DIRECTOR, UP
	showemote EMOTE_SHOCK, RADIOTOWER5F_DIRECTOR, 15
	opentext
	writetext FakeDirectorTextBefore1
	waitbutton
	closetext
	applymovement RADIOTOWER5F_DIRECTOR, FakeDirectorMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext FakeDirectorTextBefore2
	waitbutton
	closetext
	winlosstext FakeDirectorWinText, 0
	setlasttalked RADIOTOWER5F_DIRECTOR
	loadtrainer EXECUTIVEM, EXECUTIVEM_3
	startbattle
	reloadmapafterbattle
	opentext
	writetext FakeDirectorTextAfter
	buttonsound
	verbosegiveitem BASEMENT_KEY
	closetext
	setscene SCENE_RADIOTOWER5F_ROCKET_BOSS
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_3
	end

Director:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TrueDirector
	writetext FakeDirectorTextAfter
	waitbutton
	closetext
	end

.TrueDirector:
	writetext RadioTower5FDirectorText
	waitbutton
	closetext
	end

TrainerExecutivef1:
	trainer EXECUTIVEF, EXECUTIVEF_1, EVENT_BEAT_ROCKET_EXECUTIVEF_1, Executivef1SeenText, Executivef1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Executivef1AfterBattleText
	waitbutton
	closetext
	end

RadioTower5FRocketBossScene:
	applymovement PLAYER, RadioTower5FPlayerTwoStepsLeftMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject RADIOTOWER5F_ROCKET, RIGHT
	opentext
	writetext RadioTower5FRocketBossBeforeText
	waitbutton
	closetext
	winlosstext RadioTower5FRocketBossWinText, 0
	setlasttalked RADIOTOWER5F_ROCKET
	loadtrainer EXECUTIVEM, EXECUTIVEM_1
	startbattle
	reloadmapafterbattle
	opentext
	writetext RadioTower5FRocketBossAfterText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear RADIOTOWER5F_ROCKET
	disappear RADIOTOWER5F_ROCKET_GIRL
	pause 15
	special FadeInQuickly
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_1
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_MAHOGANY_MART_OWNERS
	clearflag ENGINE_ROCKETS_IN_MAHOGANY
	clearevent EVENT_GOLDENROD_CITY_CIVILIANS
	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	clearevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	special PlayMapMusic
	disappear RADIOTOWER5F_DIRECTOR
	moveobject RADIOTOWER5F_DIRECTOR, 12, 0
	appear RADIOTOWER5F_DIRECTOR
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksIn
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower5FDirectorThankYouText
	buttonsound
	verbosegiveitem CLEAR_BELL
	writetext RadioTower5FDirectorDescribeClearBellText
	waitbutton
	closetext
	setscene SCENE_RADIOTOWER5F_NOTHING
	setmapscene ECRUTEAK_TIN_TOWER_ENTRANCE, SCENE_DEFAULT
	setevent EVENT_GOT_CLEAR_BELL
	setevent EVENT_TEAM_ROCKET_DISBANDED
	sjump .UselessJump

.UselessJump:
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksOut
	playsound SFX_EXIT_BUILDING
	disappear RADIOTOWER5F_DIRECTOR
	end

Ben:
	jumptextfaceplayer BenText

RadioTower5FUltraBall:
	itemball ULTRA_BALL

RadioTower5FDirectorsOfficeSign:
	jumptext RadioTower5FDirectorsOfficeSignText

RadioTower5FStudio1Sign:
	jumptext RadioTower5FStudio1SignText

RadioTower5FBookshelf:
	jumpstd magazinebookshelf

FakeDirectorMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5FDirectorWalksIn:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step_end

RadioTower5FDirectorWalksOut:
	step RIGHT
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5FPlayerTwoStepsLeftMovement:
	step LEFT
	step LEFT
	step_end

FakeDirectorTextBefore1:
	text "너 너는!"
	line "구하러 와주었는가……"
	done

FakeDirectorTextBefore2:
	text "라고 말할꺼라 생각했느냐!"
	line "이몸은 가짜다!"
	
	para "진짜인 것처럼 해서"
	line "빼앗을 준비를 하고있었다"
	
	para "하-하하 국장이"
	line "있는 장소를 알고싶은가!"
	
	para "좋아 가르쳐주도록 하지"
	line "단 이몸을 이기고 나서다"
	done

FakeDirectorWinText:
	text "아 알았다……"
	line "국장이 있는곳을 가르쳐주겠다"
	done

FakeDirectorTextAfter:
	text "진짜 국장은……"
	
	para "지하창고에 감금되어있다!"
	
	para "지하창고 알겠는가?"
	line "지하창고 뒷편의 더욱 뒷쪽"
	cont "거기까지 갈 수 있을까?……"
	done

Executivef1SeenText:
	text"황토마을 아지트에 있던"
	line "나를 기억하니?"

	para "그때는 졌지만"
	line "이번에는 그렇게 안될 꺼야"
	done

Executivef1BeatenText:
	text "……!"
	
	para "전력을 다해 싸웠는데도……"
	line "이럴수가 패배라니……"
	done

Executivef1AfterBattleText:
	text "<PLAYER>(이)라고 했었지?"
	
	para "너 같은 꼬마에게는"
	line "우리들의 위대함을"
	cont "이해하기 힘들것 같군"
	
	para "유감이군"
	line "너의 강함이 맘에 들었는데"
	done

RadioTower5FRocketBossBeforeText:
	text "이런이런 이곳까지 왔단말인가"
	
	para "꽤나 우수한"
	line "트레이너 같군"
	
	para "우리들은 라디오 방송국을"
	line "점령해서 전국에"
	cont "부활했다는 선전을 할 것입니다"
	
	para "그러고보니 어디선가"
	line "수행중의 비주기님도"
	cont "돌아오실 것이 틀림없어"
	
	para "그 옛날의 영광을"
	line "되돌리는 것입니다……"
	cont "더 이상 방해는 용서 않겠습니다!"
	done

RadioTower5FRocketBossWinText:
	text "…… 크윽~"
	line "비주기님 용서를……"
	done

RadioTower5FRocketBossAfterText:
	text "……아아 이럴수가"
	
	para "모든 꿈이"
	line "지금 물거품이 되어버렸어요"
	cont "역시 저에게는 무리였을까요?"
	
	para "알겠습니다"
	line "비주기님이 그렇게 한 것처럼"
	cont "우리들 로켓단은"
	cont "여기서 해산하지요"
	
	para "그럼 작별입니다"
	done

RadioTower5FDirectorThankYouText:
	text "국장『오오 <PLAY_G>"
	line "정말 고맙다"
	
	para "너의 용기있는 행동이"
	line "전국의 포켓몬을 구했단다"
	
	para "이것은 약소하지만"
	line "나의 마음이란다"
	done

RadioTower5FDirectorDescribeClearBellText:
	text "금빛시티에도 탑이 있었지만 "
	line "너무 낡아서 쓰러질 것만 같아"
	cont "라디오타워를 지은거야"
	
	para "그 공사때"
	line "우리는 땅 속에서"
	cont "종을 발견했단다"
	
	para "옛날에는 금빛시티에"
	line "온갖 포켓몬이"
	cont "살고 있었다고 하니까"
	
	para "어쩌면 인주시티의"
	line "방울탑과 연결되어 있는"
	cont "것일지도…"
	
	para "아! 기억이 나구나."
	line "로켓단이 말하는 것을 엿들었단다"
	cont "방울탑에서 무엇인가 일어나고 있다는구나"
	
	para "무슨 일이 일어나는지 잘"
	line "모르겠으니 <PLAY_G>(이)가"
	cont "직접 가보는게 좋겠구나" 
	
	para "그럼 나는"
	line "국장실로 돌아가겠네"
	done

RadioTower5FDirectorText:
	text "국장『<PLAY_G>"
	line "나는 포켓몬이 너무너무 좋아서"
	cont "그 감정을 전하고싶어"
	cont "라디오 방송을 시작했단다!"
	
	para "모두가 방송을"
	line "즐거워해준다면 기쁘겠구나"
	done

BenText:
	text "준화『음악을 듣고있니?"
	done

RadioTower5FDirectorsOfficeSignText:
	text "5층 …… 국장실"
	done
	
RadioTower5FStudio1SignText:
	text "5층 …… 제1스튜디오"
	done

RadioTower5F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_4F, 1
	warp_event 12,  0, RADIO_TOWER_4F, 3

	db 2 ; coord events
	coord_event  0,  3, SCENE_DEFAULT, FakeDirectorScript
	coord_event 16,  5, SCENE_RADIOTOWER5F_ROCKET_BOSS, RadioTower5FRocketBossScene

	db 5 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower5FDirectorsOfficeSign
	bg_event 11,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 15,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 16,  1, BGEVENT_READ, RadioTower5FBookshelf
	bg_event 17,  1, BGEVENT_READ, RadioTower5FBookshelf

	db 5 ; object events
	object_event  3,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Director, -1
	object_event 13,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 17,  2, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerExecutivef1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 13,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Ben, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  8,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RadioTower5FUltraBall, EVENT_RADIO_TOWER_5F_ULTRA_BALL
