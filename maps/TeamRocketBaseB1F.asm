	const_def 2 ; object constants
	const TEAMROCKETBASEB1F_ROCKET1
	const TEAMROCKETBASEB1F_ROCKET2
	const TEAMROCKETBASEB1F_SCIENTIST
	const TEAMROCKETBASEB1F_POKE_BALL1
	const TEAMROCKETBASEB1F_POKE_BALL2
	const TEAMROCKETBASEB1F_POKE_BALL3

TeamRocketBaseB1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .HideSecurityGrunt

.DummyScene:
	end

.HideSecurityGrunt:
	disappear TEAMROCKETBASEB1F_ROCKET1
	return

SecurityCamera1a:
	checkevent EVENT_SECURITY_CAMERA_1
	iftrue NoSecurityCamera
	scall PlaySecurityCameraSounds
	checkevent EVENT_TEAM_ROCKET_BASE_POPULATION
	iftrue NoSecurityCamera
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	moveobject TEAMROCKETBASEB1F_ROCKET1, 19, 2
	appear TEAMROCKETBASEB1F_ROCKET1
	turnobject PLAYER, LEFT
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement1
	scall TrainerCameraGrunt1
	ifequal TRUE, NoSecurityCamera
	scall PlaySecurityCameraSounds
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	moveobject TEAMROCKETBASEB1F_ROCKET1, 19, 2
	appear TEAMROCKETBASEB1F_ROCKET1
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement1
	scall TrainerCameraGrunt2
	ifequal TRUE, NoSecurityCamera
	setevent EVENT_SECURITY_CAMERA_1
	end

SecurityCamera1b:
	checkevent EVENT_SECURITY_CAMERA_1
	iftrue NoSecurityCamera
	scall PlaySecurityCameraSounds
	checkevent EVENT_TEAM_ROCKET_BASE_POPULATION
	iftrue NoSecurityCamera
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	moveobject TEAMROCKETBASEB1F_ROCKET1, 19, 3
	appear TEAMROCKETBASEB1F_ROCKET1
	turnobject PLAYER, LEFT
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement1
	scall TrainerCameraGrunt1
	ifequal TRUE, NoSecurityCamera
	scall PlaySecurityCameraSounds
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	moveobject TEAMROCKETBASEB1F_ROCKET1, 19, 3
	appear TEAMROCKETBASEB1F_ROCKET1
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement1
	scall TrainerCameraGrunt2
	ifequal TRUE, NoSecurityCamera
	setevent EVENT_SECURITY_CAMERA_1
	end

SecurityCamera2a:
	checkevent EVENT_SECURITY_CAMERA_2
	iftrue NoSecurityCamera
	scall PlaySecurityCameraSounds
	checkevent EVENT_TEAM_ROCKET_BASE_POPULATION
	iftrue NoSecurityCamera
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	moveobject TEAMROCKETBASEB1F_ROCKET1, 4, 7
	appear TEAMROCKETBASEB1F_ROCKET1
	turnobject PLAYER, LEFT
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement2
	scall TrainerCameraGrunt1
	ifequal TRUE, NoSecurityCamera
	scall PlaySecurityCameraSounds
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject PLAYER, RIGHT
	moveobject TEAMROCKETBASEB1F_ROCKET1, 12, 5
	appear TEAMROCKETBASEB1F_ROCKET1
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement3
	scall TrainerCameraGrunt2
	ifequal TRUE, NoSecurityCamera
	setevent EVENT_SECURITY_CAMERA_2
	end

SecurityCamera2b:
	checkevent EVENT_SECURITY_CAMERA_2
	iftrue NoSecurityCamera
	scall PlaySecurityCameraSounds
	checkevent EVENT_TEAM_ROCKET_BASE_POPULATION
	iftrue NoSecurityCamera
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	moveobject TEAMROCKETBASEB1F_ROCKET1, 4, 8
	appear TEAMROCKETBASEB1F_ROCKET1
	turnobject PLAYER, LEFT
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement4
	scall TrainerCameraGrunt1
	ifequal TRUE, NoSecurityCamera
	scall PlaySecurityCameraSounds
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject PLAYER, RIGHT
	moveobject TEAMROCKETBASEB1F_ROCKET1, 12, 5
	appear TEAMROCKETBASEB1F_ROCKET1
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement5
	scall TrainerCameraGrunt2
	ifequal TRUE, NoSecurityCamera
	setevent EVENT_SECURITY_CAMERA_2
	end

SecurityCamera3a:
	checkevent EVENT_SECURITY_CAMERA_3
	iftrue NoSecurityCamera
	scall PlaySecurityCameraSounds
	checkevent EVENT_TEAM_ROCKET_BASE_POPULATION
	iftrue NoSecurityCamera
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	moveobject TEAMROCKETBASEB1F_ROCKET1, 19, 6
	appear TEAMROCKETBASEB1F_ROCKET1
	turnobject PLAYER, LEFT
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement1
	scall TrainerCameraGrunt1
	ifequal TRUE, NoSecurityCamera
	scall PlaySecurityCameraSounds
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject PLAYER, RIGHT
	moveobject TEAMROCKETBASEB1F_ROCKET1, 25, 11
	appear TEAMROCKETBASEB1F_ROCKET1
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement6
	scall TrainerCameraGrunt2
	ifequal TRUE, NoSecurityCamera
	setevent EVENT_SECURITY_CAMERA_3
	end

SecurityCamera3b:
	checkevent EVENT_SECURITY_CAMERA_3
	iftrue NoSecurityCamera
	scall PlaySecurityCameraSounds
	checkevent EVENT_TEAM_ROCKET_BASE_POPULATION
	iftrue NoSecurityCamera
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	moveobject TEAMROCKETBASEB1F_ROCKET1, 19, 7
	appear TEAMROCKETBASEB1F_ROCKET1
	turnobject PLAYER, LEFT
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement1
	scall TrainerCameraGrunt1
	ifequal TRUE, NoSecurityCamera
	scall PlaySecurityCameraSounds
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject PLAYER, RIGHT
	moveobject TEAMROCKETBASEB1F_ROCKET1, 25, 12
	appear TEAMROCKETBASEB1F_ROCKET1
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement7
	scall TrainerCameraGrunt2
	ifequal TRUE, NoSecurityCamera
	setevent EVENT_SECURITY_CAMERA_3
	end

SecurityCamera4:
	checkevent EVENT_SECURITY_CAMERA_4
	iftrue NoSecurityCamera
	scall PlaySecurityCameraSounds
	checkevent EVENT_TEAM_ROCKET_BASE_POPULATION
	iftrue NoSecurityCamera
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	moveobject TEAMROCKETBASEB1F_ROCKET1, 17, 16
	appear TEAMROCKETBASEB1F_ROCKET1
	turnobject PLAYER, LEFT
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement1
	scall TrainerCameraGrunt1
	ifequal TRUE, NoSecurityCamera
	scall PlaySecurityCameraSounds
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject PLAYER, RIGHT
	moveobject TEAMROCKETBASEB1F_ROCKET1, 25, 11
	appear TEAMROCKETBASEB1F_ROCKET1
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement8
	scall TrainerCameraGrunt2
	ifequal TRUE, NoSecurityCamera
	setevent EVENT_SECURITY_CAMERA_4
	end

SecurityCamera5:
	checkevent EVENT_SECURITY_CAMERA_5
	iftrue NoSecurityCamera
	scall PlaySecurityCameraSounds
	checkevent EVENT_TEAM_ROCKET_BASE_POPULATION
	iftrue NoSecurityCamera
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	moveobject TEAMROCKETBASEB1F_ROCKET1, 3, 16
	appear TEAMROCKETBASEB1F_ROCKET1
	turnobject PLAYER, LEFT
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement1
	scall TrainerCameraGrunt1
	ifequal TRUE, NoSecurityCamera
	scall PlaySecurityCameraSounds
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject PLAYER, RIGHT
	moveobject TEAMROCKETBASEB1F_ROCKET1, 14, 16
	appear TEAMROCKETBASEB1F_ROCKET1
	applymovement TEAMROCKETBASEB1F_ROCKET1, SecurityCameraMovement9
	scall TrainerCameraGrunt2
	ifequal TRUE, NoSecurityCamera
	setevent EVENT_SECURITY_CAMERA_5
	end

NoSecurityCamera:
	end

TrainerCameraGrunt1:
	opentext
	writetext CameraGrunt1SeenText
	waitbutton
	closetext
	winlosstext CameraGrunt1BeatenText, 0
	setlasttalked TEAMROCKETBASEB1F_ROCKET1
	loadtrainer GRUNTM, GRUNTM_20
	startbattle
	disappear TEAMROCKETBASEB1F_ROCKET1
	reloadmapafterbattle
	end

TrainerCameraGrunt2:
	opentext
	writetext CameraGrunt2SeenText
	waitbutton
	closetext
	winlosstext CameraGrunt2BeatenText, 0
	setlasttalked TEAMROCKETBASEB1F_ROCKET1
	loadtrainer GRUNTM, GRUNTM_21
	startbattle
	disappear TEAMROCKETBASEB1F_ROCKET1
	reloadmapafterbattle
	end

PlaySecurityCameraSounds:
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	pause 10
	playsound SFX_LICK
	end

ExplodingTrap1:
	checkevent EVENT_EXPLODING_TRAP_1
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_1
	end

ExplodingTrap2:
	checkevent EVENT_EXPLODING_TRAP_2
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_2
	end

ExplodingTrap3:
	checkevent EVENT_EXPLODING_TRAP_3
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_3
	end

ExplodingTrap4:
	checkevent EVENT_EXPLODING_TRAP_4
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_4
	end

ExplodingTrap5:
	checkevent EVENT_EXPLODING_TRAP_5
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_5
	end

ExplodingTrap6:
	checkevent EVENT_EXPLODING_TRAP_6
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_6
	end

ExplodingTrap7:
	checkevent EVENT_EXPLODING_TRAP_7
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_7
	end

ExplodingTrap8:
	checkevent EVENT_EXPLODING_TRAP_8
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_8
	end

ExplodingTrap9:
	checkevent EVENT_EXPLODING_TRAP_9
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_9
	end

ExplodingTrap10:
	checkevent EVENT_EXPLODING_TRAP_10
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_10
	end

ExplodingTrap11:
	checkevent EVENT_EXPLODING_TRAP_11
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_11
	end

ExplodingTrap12:
	checkevent EVENT_EXPLODING_TRAP_12
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_12
	end

ExplodingTrap13:
	checkevent EVENT_EXPLODING_TRAP_13
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_13
	end

ExplodingTrap14:
	checkevent EVENT_EXPLODING_TRAP_14
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_14
	end

ExplodingTrap15:
	checkevent EVENT_EXPLODING_TRAP_15
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_15
	end

ExplodingTrap16:
	checkevent EVENT_EXPLODING_TRAP_16
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_16
	end

ExplodingTrap17:
	checkevent EVENT_EXPLODING_TRAP_17
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_17
	end

ExplodingTrap18:
	checkevent EVENT_EXPLODING_TRAP_18
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_18
	end

ExplodingTrap19:
	checkevent EVENT_EXPLODING_TRAP_19
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_19
	end

ExplodingTrap20:
	checkevent EVENT_EXPLODING_TRAP_20
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_20
	end

ExplodingTrap21:
	checkevent EVENT_EXPLODING_TRAP_21
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_21
	end

ExplodingTrap22:
	checkevent EVENT_EXPLODING_TRAP_22
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_22
	end

VoltorbExplodingTrap:
	special FadeOutPalettes
	cry VOLTORB
	special FadeInPalettes
	setlasttalked -1
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon VOLTORB, 23
	startbattle
	end

GeodudeExplodingTrap:
	special FadeOutPalettes
	cry GEODUDE
	special FadeInPalettes
	setlasttalked -1
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon GEODUDE, 21
	startbattle
	end

KoffingExplodingTrap:
	special FadeOutPalettes
	cry KOFFING
	special FadeInPalettes
	setlasttalked -1
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon KOFFING, 21
	startbattle
	end

NoExplodingTrap:
	end

TrainerScientistJed:
	trainer SCIENTIST, JED, EVENT_BEAT_SCIENTIST_JED, ScientistJedSeenText, ScientistJedBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistJedAfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM16:
	trainer GRUNTM, GRUNTM_16, EVENT_BEAT_ROCKET_GRUNTM_16, GruntM16SeenText, GruntM16BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM16AfterBattleText
	waitbutton
	closetext
	end

TeamRocketBaseB1FSecurityCamera:
	jumptext TeamRocketBaseB1FSecurityCameraText

TeamRocketBaseB1FBookshelf:
	jumpstd teamrocketoath

TeamRocketBaseB1FSecretSwitch:
	opentext
	checkevent EVENT_TURNED_OFF_SECURITY_CAMERAS
	iftrue .SecretSwitchOff
	writetext TeamRocketBaseB1FSecretSwitchText
	playsound SFX_TALLY
	waitbutton
	closetext
	setevent EVENT_TURNED_OFF_SECURITY_CAMERAS
	setevent EVENT_SECURITY_CAMERA_1
	setevent EVENT_SECURITY_CAMERA_2
	setevent EVENT_SECURITY_CAMERA_3
	setevent EVENT_SECURITY_CAMERA_4
	setevent EVENT_SECURITY_CAMERA_5
	end

.SecretSwitchOff:
	writetext TeamRocketBaseB1FSwitchOffText
	waitbutton
	closetext
	end

TeamRocketBaseB1FHyperPotion:
	itemball HYPER_POTION

TeamRocketBaseB1FNugget:
	itemball NUGGET

TeamRocketBaseB1FGuardSpec:
	itemball GUARD_SPEC

TeamRocketBaseB1FHiddenRevive:
	hiddenitem REVIVE, EVENT_TEAM_ROCKET_BASE_B1F_HIDDEN_REVIVE

SecurityCameraMovement1:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

SecurityCameraMovement2:
	big_step UP
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	turn_head RIGHT
	step_end

SecurityCameraMovement3:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

SecurityCameraMovement4:
; he jumps over a trap
	jump_step UP
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	turn_head RIGHT
	step_end

SecurityCameraMovement5:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

SecurityCameraMovement6:
	big_step UP
	big_step UP
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	step_end

SecurityCameraMovement7:
	big_step UP
	big_step UP
	big_step UP
	big_step RIGHT
	big_step UP
	big_step UP
	big_step LEFT
	step_end

SecurityCameraMovement8:
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

SecurityCameraMovement9:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

CameraGrunt1SeenText:
	text "오옷!"
	line "침입자 발견!"
	done

CameraGrunt1BeatenText:
	text "젠장"
	line "물러날 때인가……"
	done

CameraGrunt2SeenText:
	text "다음은 내 차례닷!"
	line "놓치지 않겠어!"
	done

CameraGrunt2BeatenText:
	text "포켓몬 동상이 노려보고 있다"
	
	para "비밀 스위치를 끄지 않는 한"
	line "네놈앞에 나타나주겠다!"
	done
	
ScientistJedSeenText:
	text "이곳은 원래 닌자의 소굴"
	
	para "여러 장치로"
	line "침입자를 막을 것이다!"
	done

ScientistJedBeatenText:
	text "음- 역시……"
	done

ScientistJedAfterBattleText:
	text "…… 알았다"
	line "아지트의 비밀을 가르쳐주마"
	
	para "이 앞에 있는 것은 워프판넬"
	line "멍청하게 올라서 버리면"
	cont "입구까지 튕겨져버린다!"
	done

GruntM16SeenText:
	text "오호! 그 이상 나아갈 건가?"
	line "폭탄이 장치되어 있으니까"
	cont "밟으면 쾅 하고 터져버릴껄!"
	done

GruntM16BeatenText:
	text "쾅!!"
	done

GruntM16AfterBattleText:
	text "실은 나 역시도 어느 곳에서"
	line "폭발할지 기억하지 못해"
	cont "배짱으로 나아갈 수 밖에 없다"
	done

TeamRocketBaseB1FSecurityCameraText:
	text "페르시온 포켓몬 동상……"
	line "웬지 눈이 빛나고 있는 것 같다"
	done

TeamRocketBaseB1FSecretSwitchText:
	text "비밀의 스위치 발견!"
	line "눌러볼까!……꾹 하고말야!"
	done

TeamRocketBaseB1FSwitchOffText:
	text "스위치가 꺼져있다……"
	done

TeamRocketBaseB1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 27,  2, MAHOGANY_MART_1F, 3
	warp_event  3, 14, TEAM_ROCKET_BASE_B2F, 1
	warp_event  5, 15, TEAM_ROCKET_BASE_B1F, 4
	warp_event 25,  2, TEAM_ROCKET_BASE_B1F, 3

	db 30 ; coord events
	; There are five security cameras in the base.
	; Walking in front of one triggers two Rocket Grunts.
	coord_event 24,  2, SCENE_DEFAULT, SecurityCamera1a
	coord_event 24,  3, SCENE_DEFAULT, SecurityCamera1b
	coord_event  6,  2, SCENE_DEFAULT, SecurityCamera2a
	coord_event  6,  3, SCENE_DEFAULT, SecurityCamera2b
	coord_event 24,  6, SCENE_DEFAULT, SecurityCamera3a
	coord_event 24,  7, SCENE_DEFAULT, SecurityCamera3b
	coord_event 22, 16, SCENE_DEFAULT, SecurityCamera4
	coord_event  8, 16, SCENE_DEFAULT, SecurityCamera5
	; There are spots on the floor that trigger a Pokémon battle.
	; Each Pokémon (Voltorb, Koffing, Geodude) knows Selfdestruct.
	coord_event  2,  7, SCENE_DEFAULT, ExplodingTrap1
	coord_event  3,  7, SCENE_DEFAULT, ExplodingTrap2
	coord_event  4,  7, SCENE_DEFAULT, ExplodingTrap3
	coord_event  1,  8, SCENE_DEFAULT, ExplodingTrap4
	coord_event  3,  8, SCENE_DEFAULT, ExplodingTrap5
	coord_event  5,  8, SCENE_DEFAULT, ExplodingTrap6
	coord_event  3,  9, SCENE_DEFAULT, ExplodingTrap7
	coord_event  4,  9, SCENE_DEFAULT, ExplodingTrap8
	coord_event  1, 10, SCENE_DEFAULT, ExplodingTrap9
	coord_event  2, 10, SCENE_DEFAULT, ExplodingTrap10
	coord_event  3, 10, SCENE_DEFAULT, ExplodingTrap11
	coord_event  5, 10, SCENE_DEFAULT, ExplodingTrap12
	coord_event  2, 11, SCENE_DEFAULT, ExplodingTrap13
	coord_event  4, 11, SCENE_DEFAULT, ExplodingTrap14
	coord_event  1, 12, SCENE_DEFAULT, ExplodingTrap15
	coord_event  2, 12, SCENE_DEFAULT, ExplodingTrap16
	coord_event  4, 12, SCENE_DEFAULT, ExplodingTrap17
	coord_event  5, 12, SCENE_DEFAULT, ExplodingTrap18
	coord_event  1, 13, SCENE_DEFAULT, ExplodingTrap19
	coord_event  3, 13, SCENE_DEFAULT, ExplodingTrap20
	coord_event  4, 13, SCENE_DEFAULT, ExplodingTrap21
	coord_event  5, 13, SCENE_DEFAULT, ExplodingTrap22

	db 9 ; bg events
	bg_event 19, 11, BGEVENT_READ, TeamRocketBaseB1FSecretSwitch
	bg_event 24,  1, BGEVENT_UP, TeamRocketBaseB1FSecurityCamera
	bg_event  6,  1, BGEVENT_UP, TeamRocketBaseB1FSecurityCamera
	bg_event  8, 15, BGEVENT_UP, TeamRocketBaseB1FSecurityCamera
	bg_event 22, 15, BGEVENT_UP, TeamRocketBaseB1FSecurityCamera
	bg_event 24,  5, BGEVENT_UP, TeamRocketBaseB1FSecurityCamera
	bg_event 20, 11, BGEVENT_READ, TeamRocketBaseB1FBookshelf
	bg_event 21, 11, BGEVENT_READ, TeamRocketBaseB1FBookshelf
	bg_event  3, 11, BGEVENT_ITEM, TeamRocketBaseB1FHiddenRevive

	db 6 ; object events
	object_event  0,  0, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_SECURITY_GRUNTS
	object_event  2,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM16, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 18, 12, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerScientistJed, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 27,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB1FHyperPotion, EVENT_TEAM_ROCKET_BASE_B1F_HYPER_POTION
	object_event 14, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB1FNugget, EVENT_TEAM_ROCKET_BASE_B1F_NUGGET
	object_event 21, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB1FGuardSpec, EVENT_TEAM_ROCKET_BASE_B1F_GUARD_SPEC
