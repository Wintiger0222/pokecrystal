	const_def 2 ; object constants
	const MAHOGANYGYM_PRYCE
	const MAHOGANYGYM_BUENA1
	const MAHOGANYGYM_ROCKER1
	const MAHOGANYGYM_BUENA2
	const MAHOGANYGYM_ROCKER2
	const MAHOGANYGYM_ROCKER3
	const MAHOGANYGYM_GYM_GUY

MahoganyGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyGymPryceScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, 0
	loadtrainer PRYCE, PRYCE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	writetext Text_ReceivedGlacierBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_GLACIERBADGE
	checkcode VAR_BADGES
	scall MahoganyGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM16_ICY_WIND
	iftrue PryceScript_Defeat
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_BEAT_BOARDER_RONALD
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	writetext PryceText_GlacierBadgeSpeech
	buttonsound
	verbosegiveitem TM_ICY_WIND
	iffalse MahoganyGym_NoRoomForIcyWind
	setevent EVENT_GOT_TM16_ICY_WIND
	writetext PryceText_IcyWindSpeech
	waitbutton
	closetext
	end

PryceScript_Defeat:
	writetext PryceText_CherishYourPokemon
	waitbutton
MahoganyGym_NoRoomForIcyWind:
	closetext
	end

MahoganyGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerSkierRoxanne:
	trainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierRoxanneAfterBattleText
	waitbutton
	closetext
	end

TrainerSkierClarissa:
	trainer SKIER, CLARISSA, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierClarissaAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderRonald:
	trainer BOARDER, RONALD, EVENT_BEAT_BOARDER_RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderRonaldAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderBrad:
	trainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderBradAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderDouglas:
	trainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderDouglasAfterBattleText
	waitbutton
	closetext
	end

MahoganyGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .MahoganyGymGuyWinScript
	writetext MahoganyGymGuyText
	waitbutton
	closetext
	end

.MahoganyGymGuyWinScript:
	writetext MahoganyGymGuyWinText
	waitbutton
	closetext
	end

MahoganyGymStatue:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext PRYCE, PRYCE1, MEM_BUFFER_1
	jumpstd gymstatue2

PryceText_Intro:
	text "포켓몬도 사람들도"
	line "살다보면 여러가지 일이 있지"
	
	para "나도 여러가지"
	line "괴로운 일을 맛보았다"
	
	para "인생의 선배로서"
	line "그것을 가르쳐주겠다"
	
	para "네가 태어나기 전부터"
	line "포켓몬과 함께 지내온 내가"
	cont "그리 간단히 지는 일은 없을꺼다"
	
	para "겨울의 류옹이라고 불려지는"
	line "그 실력을 보여주겠다"
	done

PryceText_Impressed:
	text "으음"
	line "훌륭한 시합이었다"
	
	para "그 강한 마음이 있다면"
	line "무슨 일이 일어나도"
	cont "뛰어넘어 갈 수 있을 것이다"
	
	para "움!"
	line "이 배지를 가지고 가거라"
	done

Text_ReceivedGlacierBadge:
	text "<PLAYER>는(은) 류옹으로부터"
	line "아이스배지를 받았다!"
	done

PryceText_GlacierBadgeSpeech:
	text "그것을 가지고 있으면"
	line "특수능력이 높아진다"
	
	para "그리고"
	line "거친 소용돌이 위를 지날 수 있는"
	cont "바다 회오리라는 기술을 쓸수 있다"
	
	para "그리고 이것은"
	line "내가 주는 선물이다"
	done

PryceText_IcyWindSpeech:
	text "그것의 이름은 얼다바람"
	
	para "데미지를 주면서"
	line "스피드를 떨어뜨려준다……"
	
	para "바로 겨울의 혹독함을"
	line "느끼게 하는 기술이지"
	done

PryceText_CherishYourPokemon:
	text "얼음과 눈이 녹으면……"
	line "봄이 된다"
	
	para "너는 이제부터 긴 시간"
	line "포켓몬과 함께 지낼 수 있다는"
	cont "그것을 소중히 여기거라"
	done

BoarderRonaldSeenText:
	text "너의 포켓몬을 얼려서"
	line "아무것도 할 수 없게 만들어주마"
	done

BoarderRonaldBeatenText:
	text "내쪽이 아무것도 할 수 없었군"
	done

BoarderRonaldAfterBattleText:
	text "그러고보니…… 얼게 되어도"
	line "사용할 수 있는 기술도 있다는데"
	done

BoarderBradSeenText:
	text "이 황토마을 체육관은"
	line "미끌미끌 미끄러져서 즐겁지?"
	
	para "그렇다고 우리들은"
	line "놀고 있는 것은 아니지!"
	done

BoarderBradBeatenText:
	text "약간은 우리들의 진심을"
	line "알아주게 되었는가?"
	done

BoarderBradAfterBattleText:
	text "이 체육관은 좋아"
	line "언제든지 포켓몬과 함께"
	cont "미끄럼을 타며 지낼 수 있으니까!"
	done
	
BoarderDouglasSeenText:
	text "나는 류옹님의 강함"
	line "그 비밀을 알고 있단다!"
	done

BoarderDouglasBeatenText:
	text "할 수 없군"
	line "비밀을 가르쳐주마"
	done

BoarderDouglasAfterBattleText:
	text "류옹님이 강한 이유……"
	
	para "그것은 매일"
	line "차가운 폭포를 맞으며"
	cont "몸도 마음도 단련시키기 때문이다!"
	done

SkierRoxanneSeenText:
	text "체육관 관장인 류옹님과"
	line "만나고 싶다면 잘 생각해서"
	cont "미끄러질 필요가 있다!"
	done

SkierRoxanneBeatenText:
	text "에이-"
	line "스키였다면 지지 않았을텐데……"
	done
	
SkierRoxanneAfterBattleText:
	text "잘 미끄럼을 타지 않으면"
	line "가고 싶은곳에 가지 못하는 것이"
	cont "이 체육관의 즐거움이다"
	done

SkierClarissaSeenText:
	text "보아라! 이 화려한 슈푸르를!!"
	done
	
SkierClarissaBeatenText:
	text "으앙!"
	line "깜짝 놀라서 엉덩방아를 찧었다"
	done

SkierClarissaAfterBattleText:
	text "포켓몬 승부인데"
	line "스키실력을 자랑해버렸다"
	done

MahoganyGymGuyText:
	text "류옹님은 포켓몬과 50년이나"
	line "지내고 있는 강자다!"
	
	para "얼음타입의 기술로"
	line "상대방의 포켓몬을"
	cont "얼리는 것이 특기라고 한다!"
	
	para "그렇다면 이쪽에서는"
	line "불타오르는 정열로 녹여주겠다!"
	done

MahoganyGymGuyWinText:
	text "류옹님도 대단하지만"
	line "승리한 너도 대단했단다!"
	
	para "연령을 뛰어넘은"
	line "뜨거운 시합이었다!"
	done

MahoganyGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, MAHOGANY_TOWN, 3
	warp_event  5, 17, MAHOGANY_TOWN, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, MahoganyGymStatue
	bg_event  6, 15, BGEVENT_READ, MahoganyGymStatue

	db 7 ; object events
	object_event  5,  3, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MahoganyGymPryceScript, -1
	object_event  4,  6, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierRoxanne, -1
	object_event  0, 17, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderRonald, -1
	object_event  9, 17, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierClarissa, -1
	object_event  5,  9, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderBrad, -1
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderDouglas, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyGymGuyScript, -1
