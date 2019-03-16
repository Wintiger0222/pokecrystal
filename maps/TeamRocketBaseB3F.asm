	const_def 2 ; object constants
	const TEAMROCKETBASEB3F_LANCE
	const TEAMROCKETBASEB3F_ROCKET1
	const TEAMROCKETBASEB3F_MOLTRES
	const TEAMROCKETBASEB3F_ROCKET_GIRL
	const TEAMROCKETBASEB3F_ROCKET2
	const TEAMROCKETBASEB3F_SCIENTIST1
	const TEAMROCKETBASEB3F_SCIENTIST2
	const TEAMROCKETBASEB3F_ROCKET3
	const TEAMROCKETBASEB3F_SILVER
	const TEAMROCKETBASEB3F_POKE_BALL1
	const TEAMROCKETBASEB3F_POKE_BALL2
	const TEAMROCKETBASEB3F_POKE_BALL3
	const TEAMROCKETBASEB3F_POKE_BALL4
	const TEAMROCKETBASEB3F_POKE_BALL5

TeamRocketBaseB3F_MapScripts:
	db 4 ; scene scripts
	scene_script .LanceGetsPassword ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER
	scene_script .DummyScene2 ; SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS
	scene_script .DummyScene3 ; SCENE_TEAMROCKETBASEB3F_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .CheckGiovanniDoor

.LanceGetsPassword:
	prioritysjump LanceGetPasswordScript
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.CheckGiovanniDoor:
	checkevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	iftrue .OpenSesame
	return

.OpenSesame:
	changeblock 10, 8, $07 ; floor
	return

LanceGetPasswordScript:
	turnobject PLAYER, LEFT
	pause 5
	turnobject TEAMROCKETBASEB3F_MOLTRES, RIGHT
	pause 20
	applymovement TEAMROCKETBASEB3F_LANCE, MovementData_0x6e12a
	opentext
	writetext LanceGetPasswordText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB3F_LANCE, MovementData_0x6e12c
	disappear TEAMROCKETBASEB3F_LANCE
	setscene SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER
	end

RocketBaseRival:
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	appear TEAMROCKETBASEB3F_SILVER
	applymovement TEAMROCKETBASEB3F_SILVER, RocketBaseRivalEnterMovement
	turnobject PLAYER, LEFT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext RocketBaseRivalText
	waitbutton
	closetext
	playsound SFX_TACKLE
	applymovement PLAYER, RocketBaseRivalShovesPlayerMovement
	applymovement TEAMROCKETBASEB3F_SILVER, RocketBaseRivalLeaveMovement
	disappear TEAMROCKETBASEB3F_SILVER
	setscene SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS
	special RestartMapMusic
	end

TeamRocketBaseB3FRocketScript:
	jumptextfaceplayer TeamRocketBaseB3FRocketText

RocketBaseBossLeft:
	applymovement PLAYER, MovementData_0x6e133
	sjump RocketBaseBoss

RocketBaseBossRight:
	applymovement PLAYER, MovementData_0x6e13a
RocketBaseBoss:
	pause 30
	showemote EMOTE_SHOCK, TEAMROCKETBASEB3F_ROCKET1, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject TEAMROCKETBASEB3F_ROCKET1, DOWN
	opentext
	writetext ExecutiveM4BeforeText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB3F_ROCKET1, MovementData_0x6e142
	winlosstext ExecutiveM4BeatenText, 0
	setlasttalked TEAMROCKETBASEB3F_ROCKET1
	loadtrainer EXECUTIVEM, EXECUTIVEM_4
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_4
	opentext
	writetext ExecutiveM4AfterText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB3F_ROCKET1, MovementData_0x6e144
	playsound SFX_TACKLE
	applymovement TEAMROCKETBASEB3F_ROCKET1, MovementData_0x6e147
	disappear TEAMROCKETBASEB3F_ROCKET1
	setscene SCENE_TEAMROCKETBASEB3F_NOTHING
	end

RocketBaseMurkrow:
	opentext
	writetext RocketBaseMurkrowText
	waitbutton
	closetext
	setevent EVENT_LEARNED_HAIL_GIOVANNI
	end

SlowpokeTailGrunt:
	trainer GRUNTF, GRUNTF_5, EVENT_BEAT_ROCKET_GRUNTF_5, GruntF5SeenText, GruntF5BeatenText, 0, GruntF5Script

GruntF5Script:
	endifjustbattled
	opentext
	writetext GruntF5AfterBattleText
	waitbutton
	closetext
	setevent EVENT_LEARNED_SLOWPOKETAIL
	end

RaticateTailGrunt:
	trainer GRUNTM, GRUNTM_28, EVENT_BEAT_ROCKET_GRUNTM_28, GruntM28SeenText, GruntM28BeatenText, 0, GruntM28Script

GruntM28Script:
	endifjustbattled
	opentext
	writetext GruntM28AfterBattleText
	waitbutton
	closetext
	setevent EVENT_LEARNED_RATICATE_TAIL
	end

TrainerScientistRoss:
	trainer SCIENTIST, ROSS, EVENT_BEAT_SCIENTIST_ROSS, ScientistRossSeenText, ScientistRossBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRossAfterBattleText
	waitbutton
	closetext
	end

TrainerScientistMitch:
	trainer SCIENTIST, MITCH, EVENT_BEAT_SCIENTIST_MITCH, ScientistMitchSeenText, ScientistMitchBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMitchAfterBattleText
	waitbutton
	closetext
	end

TeamRocketBaseB3FLockedDoor:
	conditional_event EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE, .Script

.Script:
	opentext
	checkevent EVENT_LEARNED_SLOWPOKETAIL
	iffalse .NeedsPassword
	checkevent EVENT_LEARNED_RATICATE_TAIL
	iffalse .NeedsPassword
	sjump .OpenSesame

.NeedsPassword:
	writetext TeamRocketBaseB3FLockedDoorNeedsPasswordText
	waitbutton
	closetext
	end

.OpenSesame:
	writetext TeamRocketBaseB3FLockedDoorOpenSesameText
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock 10, 8, $07 ; floor
	reloadmappart
	closetext
	setevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	waitsfx
	end

TeamRocketBaseB3FOathScript:
	jumpstd teamrocketoath

TeamRocketBaseB3FProtein:
	itemball PROTEIN

TeamRocketBaseB3FXSpecial:
	itemball X_SPECIAL

TeamRocketBaseB3FFullHeal:
	itemball FULL_HEAL

TeamRocketBaseB3FIceHeal:
	itemball ICE_HEAL

TeamRocketBaseB3FUltraBall:
	itemball ULTRA_BALL

MovementData_0x6e12a:
	step RIGHT
	step_end

MovementData_0x6e12c:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x6e133:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	turn_head UP
	step_end

MovementData_0x6e13a:
	step UP
	step UP
	step LEFT
	step UP
	step LEFT
	step LEFT
	turn_head UP
	step_end

MovementData_0x6e142:
	step DOWN
	step_end

MovementData_0x6e144:
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_0x6e147:
	fix_facing
	fast_jump_step LEFT
	remove_fixed_facing
	step_sleep 8
	step_sleep 8
	slow_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

RocketBaseRivalEnterMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBaseRivalLeaveMovement:
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

RocketBaseRivalShovesPlayerMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

LanceGetPasswordText:
	text "목호『두목의 방에 들어가기 위해선"
	line "문의 패스워드가"
	cont "2개 필요한 것 같다"
	
	para "그 패스워드는"
	line "일부의 로켓단원에게만"
	cont "알려져 있는 것 같아"
	
	para "그쪽의 로케단원이"
	line "정중하게 가르쳐주었단다"
	
	para "<PLAY_G>! 힘을 내서"
	line "비밀을 알아내도록 해!"
	done

TeamRocketBaseB3FRocketText:
	text "우우우……"
	line "망토의 사내놈 너무나도 강하군……"
	done

RocketBaseRivalText:
	text "…… …… ……"
	
	para "로켓단을 쳐부수는 것은"
	line "나역시 이야기했잖아"
	
	para "…… 그것보다도"
	line "그 망토의 드래곤 조련사"
	cont "녀석은 도대체 어떤 놈이냐?"
	
	para "내 포켓몬이"
	line "전부 맥을 못 추고 당했어……"
	
	para "진건 어찌되었든 좋아"
	line "더욱더"
	cont "강한 포켓몬을 손에 넣으면"
	cont "녀석에게도 이길 수 있어"
	
	para "그것보다 맘에 들지 않는 것은"
	line "그 녀석의 대사……"
	
	para "너는 포켓몬에 대한"
	line "사랑과 신뢰가 부족하다 라고"
	
	para "그런 나약한 말을 하는 녀석에게"
	line "졌다고 생각하니까 열 받아!"
	
	para "…… 흥! 네녀석"
	line "상대 같은건 해줄 수 없어 "
	done

ExecutiveM4BeforeText:
	text "뭐야 너는?"
	line "이곳은 우리들의 두목"
	cont "비주기님의 방"
	
	para "비주기님은 3년전"
	line "해산을 시킨 후로 계속"
	cont "지금도 수행중……"
	
	para "하지만 언젠가는"
	line "돌아오실 것을 믿고"
	cont "이곳을 이렇게 지키고 있다"
	
	para "어떤 녀석이던"
	line "이곳을 소란 피우게 놔둘것 같냐!"
	done

ExecutiveM4BeatenText:
	text "크으으……"
	line "이길 방법이 없군"
	
	para "비주기님"
	line "용서를……"
	done

ExecutiveM4AfterText:
	text "이럴 순 없지"
	line "져서 풀이죽어있을때가 아냐"
	cont "동료들에게 알리지않으면……"
	done

RocketBaseMurkrowText:
	text "니로우『패스워드 는……"
	
	para "비주기님 만세"
	done

GruntF5SeenText:
	text "패스워드를 알고 있느냐구?"
	line "그래 알고 있을지도 모르지"
	
	para "하지만 약한 녀석들에게는"
	line "가르쳐주지 않겠다!"
	done

GruntF5BeatenText:
	text "알았다니까"
	line "가르쳐주면 되잖아"
	done

GruntF5AfterBattleText:
	text "두목님 방문의 패스워드는……"
	
	para "야돈의 꼬리"
	
	para "다만 2개를 갖추지 않으면"
	line "전혀 의미가 없지만말야"
	done

GruntM28SeenText:
	text "캬하하하!"
	
	para "위대한 이몸을 쓰러뜨리겠다고?"
	line "배짱한번 두둑하군"
	
	para "마음에 들었다!"
	line "나에게서 이기면"
	cont "두목님 방문의 패스워드를"
	cont "가르쳐주지!"
	done

GruntM28BeatenText:
	text "으갸갸갸!"
	line "잘 하잖아!"
	done

GruntM28AfterBattleText:
	text "캬하하하!"
	
	para "두목님 방문의 패스워드를"
	line "가르쳐주겠다"
	cont "확실히 레트라의 꼬리였다"
	done

ScientistRossSeenText:
	text "예전에는 실프주식회사에서"
	line "지금은 로켓단에서"
	cont "이렇게해서 실험하고 있지"
	
	para "방해하는 것 들은 용서없다"
	done
	
ScientistRossBeatenText:
	text "안되겠군……"
	line "작전 실패였어"
	done

ScientistRossAfterBattleText:
	text "포켓몬을 괴롭히는 전파……"
	
	para "실험은 성공"
	line "나도 출세할 것이 틀림 없어"
	cont "진 것 정도야 어찌되든 괜찮겠지"
	done

ScientistMitchSeenText:
	text "실험때문에 포켓몬이 괴로워해도"
	line "나에게는 상관 없어"
	done
	
ScientistMitchBeatenText:
	text "생각하는 것은 특기이지만"
	line "싸우는 것은 소질이 없다"
	done

ScientistMitchAfterBattleText:
	text "이상한 전파를 파워 업해서"
	line "전국에 흘려보내면……"
	
	para "상상하는 것 만으로도 두근거린다"
	done

TeamRocketBaseB3FLockedDoorNeedsPasswordText:
	text "문이 닫혀있다……"
	
	para "열기 위해서는"
	line "패스워드가 2개 필요한 것 같다"
	done

TeamRocketBaseB3FLockedDoorOpenSesameText:
	text "문이 닫혀있다……"
	
	para "<PLAYER>는(은) 2개의"
	line "패스워드를 입력했다"
	
	para "문이 열렸다!"
	done

TeamRocketBaseB3F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  2, TEAM_ROCKET_BASE_B2F, 2
	warp_event 27,  2, TEAM_ROCKET_BASE_B2F, 3
	warp_event  3,  6, TEAM_ROCKET_BASE_B2F, 4
	warp_event 27, 14, TEAM_ROCKET_BASE_B2F, 5

	db 3 ; coord events
	coord_event 10,  8, SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS, RocketBaseBossLeft
	coord_event 11,  8, SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS, RocketBaseBossRight
	coord_event  8, 10, SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER, RocketBaseRival

	db 10 ; bg events
	bg_event 10,  9, BGEVENT_IFNOTSET, TeamRocketBaseB3FLockedDoor
	bg_event 11,  9, BGEVENT_IFNOTSET, TeamRocketBaseB3FLockedDoor
	bg_event 10,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event 11,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event 12,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event 13,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  4, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  5, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  6, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  7, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript

	db 14 ; object events
	object_event 25, 14, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LanceGetPasswordScript, EVENT_TEAM_ROCKET_BASE_B3F_LANCE_PASSWORDS
	object_event  8,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B3F_EXECUTIVE
	object_event  7,  2, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RocketBaseMurkrow, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 21,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, SlowpokeTailGrunt, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  5, 14, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, RaticateTailGrunt, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 23, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerScientistRoss, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 11, 15, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerScientistMitch, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 24, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeamRocketBaseB3FRocketScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  4,  5, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_TEAM_ROCKET_BASE
	object_event  1, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FProtein, EVENT_TEAM_ROCKET_BASE_B3F_PROTEIN
	object_event  3, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FXSpecial, EVENT_TEAM_ROCKET_BASE_B3F_X_SPECIAL
	object_event 28,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FFullHeal, EVENT_TEAM_ROCKET_BASE_B3F_FULL_HEAL
	object_event 17,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FIceHeal, EVENT_TEAM_ROCKET_BASE_B3F_ICE_HEAL
	object_event 14, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FUltraBall, EVENT_TEAM_ROCKET_BASE_B3F_ULTRA_BALL
