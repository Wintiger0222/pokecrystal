	const_def 2 ; object constants
	const TEAMROCKETBASEB2F_ROCKET1
	const TEAMROCKETBASEB2F_ROCKET_GIRL
	const TEAMROCKETBASEB2F_LANCE
	const TEAMROCKETBASEB2F_DRAGON
	const TEAMROCKETBASEB2F_ELECTRODE1
	const TEAMROCKETBASEB2F_ELECTRODE2
	const TEAMROCKETBASEB2F_ELECTRODE3
	const TEAMROCKETBASEB2F_ELECTRODE4
	const TEAMROCKETBASEB2F_ELECTRODE5
	const TEAMROCKETBASEB2F_ELECTRODE6
	const TEAMROCKETBASEB2F_ROCKET2
	const TEAMROCKETBASEB2F_ROCKET3
	const TEAMROCKETBASEB2F_ROCKET4
	const TEAMROCKETBASEB2F_POKE_BALL

TeamRocketBaseB2F_MapScripts:
	db 4 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS
	scene_script .DummyScene2 ; SCENE_TEAMROCKETBASEB2F_ELECTRODES
	scene_script .DummyScene3 ; SCENE_TEAMROCKETBASEB2F_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .TransmitterDoorCallback

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.TransmitterDoorCallback:
	checkevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	iftrue .OpenDoor
	return

.OpenDoor:
	changeblock 14, 12, $07 ; floor
	return

RocketBaseBossFLeft:
	moveobject TEAMROCKETBASEB2F_LANCE, 9, 13
	sjump RocketBaseBossFScript

RocketBaseBossFRight:
	moveobject TEAMROCKETBASEB2F_ROCKET_GIRL, 21, 16
	moveobject TEAMROCKETBASEB2F_ROCKET1, 21, 16
	moveobject TEAMROCKETBASEB2F_DRAGON, 10, 13
	moveobject TEAMROCKETBASEB2F_LANCE, 10, 13
RocketBaseBossFScript:
	appear TEAMROCKETBASEB2F_ROCKET_GIRL
	appear TEAMROCKETBASEB2F_ROCKET1
	opentext
	writetext UnknownText_0x6d2ad
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, MovementData_0x6d21f
	playmusic MUSIC_ROCKET_ENCOUNTER
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, MovementData_0x6d224
	turnobject PLAYER, UP
	applymovement TEAMROCKETBASEB2F_ROCKET1, MovementData_0x6d22f
	opentext
	writetext UnknownText_0x6d2c3
	waitbutton
	closetext
	cry DRAGONITE
	turnobject TEAMROCKETBASEB2F_ROCKET_GIRL, LEFT
	turnobject PLAYER, LEFT
	appear TEAMROCKETBASEB2F_DRAGON
	applymovement TEAMROCKETBASEB2F_DRAGON, MovementData_0x6d236
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, MovementData_0x6d23b
	applymovement TEAMROCKETBASEB2F_ROCKET1, MovementData_0x6d24c
	appear TEAMROCKETBASEB2F_LANCE
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d244
	opentext
	writetext UnknownText_0x6d38c
	waitbutton
	closetext
	turnobject PLAYER, RIGHT
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, MovementData_0x6d241
	opentext
	writetext UnknownText_0x6d3bd
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_ROCKET1, MovementData_0x6d24a
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, MovementData_0x6d248
	winlosstext UnknownText_0x6d45c, 0
	setlasttalked TEAMROCKETBASEB2F_ROCKET_GIRL
	loadtrainer EXECUTIVEF, EXECUTIVEF_2
	startbattle
	disappear TEAMROCKETBASEB2F_DRAGON
	setevent EVENT_TEAM_ROCKET_BASE_B2F_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_GRUNT_WITH_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_EXECUTIVEF_2
	opentext
	writetext UnknownText_0x6d4c6
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear TEAMROCKETBASEB2F_ROCKET1
	disappear TEAMROCKETBASEB2F_ROCKET_GIRL
	disappear TEAMROCKETBASEB2F_ROCKET2
	disappear TEAMROCKETBASEB2F_ROCKET3
	disappear TEAMROCKETBASEB2F_ROCKET4
	pause 15
	special FadeInQuickly
	setscene SCENE_TEAMROCKETBASEB2F_ELECTRODES
	clearevent EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	turnobject TEAMROCKETBASEB2F_LANCE, DOWN
	opentext
	writetext UnknownText_0x6d5d8
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d250
	turnobject PLAYER, UP
	opentext
	writetext UnknownText_0x6d64e
	waitbutton
	closetext
	follow TEAMROCKETBASEB2F_LANCE, PLAYER
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d254
	stopfollow
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d258
	opentext
	writetext UnknownText_0x6d6cf
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d267
	disappear TEAMROCKETBASEB2F_LANCE

RocketBaseCantLeaveScript:
	applymovement PLAYER, MovementData_0x6d271
	end

RocketBaseLancesSideScript:
	opentext
	writetext UnknownText_0x6d7ea
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x6d278
	end

LanceHealsScript1:
	turnobject PLAYER, UP
	sjump LanceHealsCommon

LanceHealsScript2:
	turnobject PLAYER, RIGHT
	turnobject TEAMROCKETBASEB2F_LANCE, LEFT
LanceHealsCommon:
	opentext
	writetext LanceHealsText1
	waitbutton
	closetext
	special FadeOutPalettes
	special StubbedTrainerRankings_Healings
	playsound SFX_FULL_HEAL
	special HealParty
	special FadeInPalettes
	opentext
	writetext LanceHealsText2
	waitbutton
	closetext
	setscene SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS
	setevent EVENT_LANCE_HEALED_YOU_IN_TEAM_ROCKET_BASE
	readvar VAR_FACING
	ifequal RIGHT, .FacingRight
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d212
	disappear TEAMROCKETBASEB2F_LANCE
	end

.FacingRight:
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d219
	disappear TEAMROCKETBASEB2F_LANCE
	end

TrainerGruntM17:
	trainer GRUNTM, GRUNTM_17, EVENT_BEAT_ROCKET_GRUNTM_17, GruntM17SeenText, GruntM17BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM17AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM18:
	trainer GRUNTM, GRUNTM_18, EVENT_BEAT_ROCKET_GRUNTM_18, GruntM18SeenText, GruntM18BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM18AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM19:
	trainer GRUNTM, GRUNTM_19, EVENT_BEAT_ROCKET_GRUNTM_19, GruntM19SeenText, GruntM19BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM19AfterBattleText
	waitbutton
	closetext
	end

RocketElectrode1:
	cry ELECTRODE
	loadwildmon ELECTRODE, 23
	startbattle
	iftrue TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE1
	disappear TEAMROCKETBASEB2F_ELECTRODE4
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalse TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, MovementData_0x6d28c
	sjump RocketBaseElectrodeScript

RocketElectrode2:
	cry ELECTRODE
	loadwildmon ELECTRODE, 23
	startbattle
	iftrue TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE2
	disappear TEAMROCKETBASEB2F_ELECTRODE5
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalse TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, MovementData_0x6d299
	sjump RocketBaseElectrodeScript

RocketElectrode3:
	cry ELECTRODE
	loadwildmon ELECTRODE, 23
	startbattle
	iftrue TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE3
	disappear TEAMROCKETBASEB2F_ELECTRODE6
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalse TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, MovementData_0x6d2a4
	sjump RocketBaseElectrodeScript

TeamRocketBaseB2FReloadMap:
	reloadmapafterbattle
	end

RocketBaseElectrodeScript:
	moveobject TEAMROCKETBASEB2F_LANCE, 18, 6
	appear TEAMROCKETBASEB2F_LANCE
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d27a
	turnobject PLAYER, RIGHT
	opentext
	writetext UnknownText_0x6d809
	buttonsound
	verbosegiveitem HM_WHIRLPOOL
	setevent EVENT_GOT_HM06_WHIRLPOOL
	writetext UnknownText_0x6d8f8
	waitbutton
	closetext
	turnobject TEAMROCKETBASEB2F_LANCE, DOWN
	opentext
	writetext UnknownText_0x6d994
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d283
	disappear TEAMROCKETBASEB2F_LANCE
	setevent EVENT_CLEARED_ROCKET_HIDEOUT
	clearflag ENGINE_ROCKET_SIGNAL_ON_CH20
	setevent EVENT_ROUTE_43_GATE_ROCKETS
	setevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	setscene SCENE_TEAMROCKETBASEB2F_NOTHING
	clearevent EVENT_LAKE_OF_RAGE_CIVILIANS
	setevent EVENT_TURNED_OFF_SECURITY_CAMERAS
	setevent EVENT_SECURITY_CAMERA_1
	setevent EVENT_SECURITY_CAMERA_2
	setevent EVENT_SECURITY_CAMERA_3
	setevent EVENT_SECURITY_CAMERA_4
	setevent EVENT_SECURITY_CAMERA_5
	end

TeamRocketBaseB2FLockedDoor:
	conditional_event EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER, .Script

.Script:
	opentext
	checkevent EVENT_LEARNED_HAIL_GIOVANNI
	iftrue .KnowsPassword
	writetext UnknownText_0x6dd39
	waitbutton
	closetext
	end

.KnowsPassword:
	writetext UnknownText_0x6dd6b
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock 14, 12, $07 ; floor
	reloadmappart
	closetext
	setevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	waitsfx
	end

TeamRocketBaseB2FTransmitterScript:
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .Deactivated
	writetext UnknownText_0x6dda7
	waitbutton
	closetext
	end

.Deactivated:
	writetext UnknownText_0x6de03
	waitbutton
	closetext
	end

TeamRocketBaseB2FTMThief:
	itemball TM_THIEF

TeamRocketBaseB2FHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_TEAM_ROCKET_BASE_B2F_HIDDEN_FULL_HEAL

MovementData_0x6d212:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MovementData_0x6d219:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MovementData_0x6d21f:
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_end

MovementData_0x6d224:
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	turn_head DOWN
	step_end

MovementData_0x6d22f:
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

MovementData_0x6d236:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_0x6d23b:
	fix_facing
	set_sliding
	jump_step RIGHT
	remove_sliding
	remove_fixed_facing
	step_end

MovementData_0x6d241:
	slow_step DOWN
	turn_head LEFT
	step_end

MovementData_0x6d244:
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MovementData_0x6d248:
	big_step LEFT
	step_end

MovementData_0x6d24a:
	big_step LEFT
	step_end

MovementData_0x6d24c:
	big_step LEFT
	big_step UP
	turn_head LEFT
	step_end

MovementData_0x6d250:
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

MovementData_0x6d254:
	step UP
	step UP
	step UP
	step_end

MovementData_0x6d258:
	step_sleep 8
	step LEFT
	step LEFT
	turn_head UP
	step_sleep 8
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_sleep 8
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

MovementData_0x6d267:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x6d271:
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

MovementData_0x6d278:
	step LEFT
	step_end

MovementData_0x6d27a:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x6d283:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x6d28c:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MovementData_0x6d299:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MovementData_0x6d2a4:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

UnknownText_0x6d2ad:
	text "거기까지다!"
	done

UnknownText_0x6d2c3:
	text "꼬마에게 놀림을 당한다면"
	line "로켓단의"
	cont "프라이드에 손상이 가겠지"
	
	para "니녀석이 얼마나 강한진 모르지만"
	line "우리 둘을 동시에"
	cont "상대하기는 무리겠지?"
	
	para "미안하지만"
	line "각오하는 것이 좋을꺼다"
	done
	
UnknownText_0x6d38c:
	text "그런말 하지말고"
	line "어디서든 놀아주지 않겠어?"
	done

UnknownText_0x6d3bd:
	text "동료가 있었군"
	line "마음에 들지 않아"
	
	para "비주기님이 안 계시는 것을 대신해"
	line "내가 한수 가르쳐주지"
	
	para "로켓단에 덤벼들면"
	line "어떻게 된다는 것을!"
	done

UnknownText_0x6d45c:
	text "어머 강하군"
	
	para "안타깝네"
	line "니가 로켓단에 있었다면"
	cont "간부가 될 수 있었을 텐데"
	done

UnknownText_0x6d4c6:
	text "…… 이 아지트도 끝이로군"
	
	para "뭐 좋아"
	line "전파의 실험도"
	cont "잘 되었던 것 같고"
	cont "이따위 아지트 어떻게되던 상관없어"
	
	para "우리들의"
	line "목표는 더욱 위대하다"
	
	para "로켓단의 무서움을"
	line "조만간에 알 수 있도록 해주겠다"
	
	para "그때를 즐겁게 기다려라……"
	line "후후후"
	done
	

UnknownText_0x6d5d8:
	text "목호『후우 이것으로"
	line "아지트 안의 로켓단원의"
	cont "모두를 쓰러뜨린건가!"
	
	para "도중에 싸웠던"
	line "소년이 걱정되는데……"
	done
	
UnknownText_0x6d64e:
	text "미안했다 <PLAY_G>"
	line "네가 열심히 싸우는 것을 보고"
	cont "약간은 내가 나설 때를 기다렸단다"
	
	para "그건 그렇고 다음은"
	line "이상한 전파를 멈추는 것뿐인가……"
	done

UnknownText_0x6d6cf:
	text "이것이 장치……"
	line "스위치는 발견되지 않는군"
	
	para "어쩔 수 없다"
	line "붐볼을 기절시켜보자"
	
	para "그렇게하면 이상한"
	line "전파도 나오지 않게 되겠지"
	
	para "포켓몬이 나쁜 것은 아니니까"
	line "약간은 걱정이 되지만"
	
	para "<PLAY_G>"
	line "반씩 나눠서 해보자"
	done

UnknownText_0x6d7ea:
	text "목호『이쪽은 나에게 맡겨 줘"
	done
	
UnknownText_0x6d809:
	text "목호『드디어"
	line "이상한 전파가 멈췄다"
	
	para "이것으로 호수도"
	line "원래의 모습으로 돌아오겠지"
	cont "이게 다 네 덕분이야"
	
	para "포켓몬을 대신해서"
	line "고맙다는 말을 하지!"
	
	para "그래!"
	line "이걸 가지고가!"
	
	para "좀전에 발견한 것인데"
	line "내게는 필요 없으니까"
	done

UnknownText_0x6d8e6:
	text "<PLAYER>는(은) 목호에게서"
	line "비전머신06을 얻었다!"
	done

UnknownText_0x6d8f8:
	text "그것은 바다 회오리!"
	
	para "포켓몬에게 가르치면"
	line "거친 바다 위라도 나아갈 수 있어"
	
	para "하지만 황토마을의"
	line "체육관 배지를 지니고 있지 않으면"
	cont "사용할 수 없으니까 주의해"
	done

UnknownText_0x6d994:
	text "<PLAY_G>!"
	
	para "포켓몬 마스터에의"
	line "길은 멀고도 험난하다고 말한다……"
	cont "그래도 목표로 삼을 텐가?"
	
	para "…… …… …… ……"
	line "그래"
	cont "그렇겠지"
	
	para "포기할 정도라면"
	line "처음부터 꿈을 갖지 않았겠지"
	
	para "자 그럼 또 만나자!"
	done
	

LanceHealsText1:
	text "목호『견딜만 하니?"
	
	para "너의 포켓몬"
	line "대부분 상처를 입은 것 같군"
	cont "내 약을 나누어주마"
	done

LanceHealsText2:
	text "목호『자- <PLAY_G>"
	line "포켓몬을 위하여 힘을 내자!"
	done

GruntM17SeenText:
	text "문이 열리지 않는다구?"
	
	para "그건 그럴꺼다"
	line "로켓단만이 알고있는"
	cont "패스워드가 필요하기 때문이지"
	done
	
GruntM17BeatenText:
	text "져 졌나?"
	done

GruntM17AfterBattleText:
	text "나는 조무래기에 불과하니까"
	line "패스워드는 가르쳐주지 않았어"
	cont "안됐군"
	done

GruntM18SeenText:
	text "우우 꼬맹인가……"
	line "어쩐지 좋지않은 기분이"
	cont "방해물은 쓰러뜨리지 않으면!"
	done

GruntM18BeatenText:
	text "우우 역시 졌다"
	done

GruntM18AfterBattleText:
	text "우우 요전의 임무로"
	line "포켓몬을 훔칠 때도"
	cont "눈매가 날카로운"
	cont "빨갛고 긴머리의 꼬맹이에게"
	cont "엄청나게 당했었는데……"
	done
	
GruntM19SeenText:
	text "갈팡질팡하면 눈에 거슬리잖아!"
	done

GruntM19BeatenText:
	text "우아아아……"
	done

GruntM19AfterBattleText:
	text "그쪽 문의 패스워드를"
	line "알고있는 것은 두목뿐이다"
	
	para "두목이 있는 곳?"
	line "글쎄 직접 찾아보시지"
	done

UnknownText_0x6dd39:
	text "문이 닫혀있다……"
	
	para "열기 위해서는"
	line "패스워드 1개가 필요하다"
	done
UnknownText_0x6dd6b:
	text "문이 닫혀있다……"
	
	para "<PLAYER>는(은)"
	line "패스워드를 입력했다"
	
	para "문이 열렸다!"

UnknownText_0x6dda7:
	text "괴전파 발생장치"
	line "쩌렁쩌렁 동작하고 있다"
	done

UnknownText_0x6de03:
	text "괴전파 발생장치"
	line "어쩐지 멈춘 것 같다"
	done

TeamRocketBaseB2F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  3, 14, TEAM_ROCKET_BASE_B1F, 2
	warp_event  3,  2, TEAM_ROCKET_BASE_B3F, 1
	warp_event 27,  2, TEAM_ROCKET_BASE_B3F, 2
	warp_event  3,  6, TEAM_ROCKET_BASE_B3F, 3
	warp_event 27, 14, TEAM_ROCKET_BASE_B3F, 4

	db 9 ; coord events
	coord_event  5, 14, SCENE_DEFAULT, LanceHealsScript1
	coord_event  4, 13, SCENE_DEFAULT, LanceHealsScript2
	coord_event 14, 11, SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS, RocketBaseBossFLeft
	coord_event 15, 11, SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS, RocketBaseBossFRight
	coord_event 14, 12, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseCantLeaveScript
	coord_event 15, 12, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseCantLeaveScript
	coord_event 12,  3, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript
	coord_event 12, 10, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript
	coord_event 12, 11, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript

	db 23 ; bg events
	bg_event 14, 12, BGEVENT_IFNOTSET, TeamRocketBaseB2FLockedDoor
	bg_event 15, 12, BGEVENT_IFNOTSET, TeamRocketBaseB2FLockedDoor
	bg_event 17,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 16,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 15,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 14,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 13,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  7, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  6, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  5, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 13,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 14,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 15,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 16,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  5, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  6, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  7, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 26,  7, BGEVENT_ITEM, TeamRocketBaseB2FHiddenFullHeal

	db 14 ; object events
	object_event 20, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_GRUNT_WITH_EXECUTIVE
	object_event 20, 16, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_EXECUTIVE
	object_event  5, 13, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	object_event  9, 13, SPRITE_DRAGON, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_DRAGONITE
	object_event  7,  5, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketElectrode1, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	object_event  7,  7, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketElectrode2, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	object_event  7,  9, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketElectrode3, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	object_event 22,  5, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	object_event 22,  7, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	object_event 22,  9, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	object_event 25, 13, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM17, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM18, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 21, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerGruntM19, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  3, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB2FTMThief, EVENT_TEAM_ROCKET_BASE_B2F_TM_THIEF
