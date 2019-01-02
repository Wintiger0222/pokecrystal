	const_def 2 ; object constants
	const SPROUTTOWER3F_SAGE1
	const SPROUTTOWER3F_SAGE2
	const SPROUTTOWER3F_SAGE3
	const SPROUTTOWER3F_SAGE4
	const SPROUTTOWER3F_POKE_BALL1
	const SPROUTTOWER3F_POKE_BALL2
	const SPROUTTOWER3F_SILVER

SproutTower3F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

SproutTower3FRivalScene:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	pause 15
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	applymovement PLAYER, MovementData_0x184a1d
	applymovement SPROUTTOWER3F_SILVER, MovementData_0x184a22
	opentext
	writetext SproutTowerElderLecturesRivalText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SPROUTTOWER3F_SILVER, 15
	turnobject SPROUTTOWER3F_SILVER, DOWN
	pause 15
	applymovement SPROUTTOWER3F_SILVER, MovementData_0x184a24
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext SproutTowerRivalOnlyCareAboutStrongText
	waitbutton
	closetext
	turnobject SPROUTTOWER3F_SILVER, UP
	opentext
	writetext SproutTowerRivalUsedEscapeRopeText
	pause 15
	closetext
	playsound SFX_WARP_TO
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SPROUTTOWER3F_SILVER
	waitsfx
	special FadeInQuickly
	setscene SCENE_FINISHED
	special RestartMapMusic
	end

SageLiScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM05_FLASH
	iftrue .GotFlash
	writetext SageLiSeenText
	waitbutton
	closetext
	winlosstext SageLiBeatenText, 0
	loadtrainer SAGE, LI
	startbattle
	reloadmapafterbattle
	opentext
	writetext SageLiTakeThisFlashText
	buttonsound
	verbosegiveitem HM_FLASH
	setevent EVENT_GOT_HM05_FLASH
	setevent EVENT_BEAT_SAGE_LI
	writetext SageLiFlashExplanationText
	waitbutton
	closetext
	end

.GotFlash:
	writetext SageLiAfterBattleText
	waitbutton
	closetext
	end

TrainerSageJin:
	trainer SAGE, JIN, EVENT_BEAT_SAGE_JIN, SageJinSeenText, SageJinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJinAfterBattleText
	waitbutton
	closetext
	end

TrainerSageTroy:
	trainer SAGE, TROY, EVENT_BEAT_SAGE_TROY, SageTroySeenText, SageTroyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageTroyAfterBattleText
	waitbutton
	closetext
	end

TrainerSageNeal:
	trainer SAGE, NEAL, EVENT_BEAT_SAGE_NEAL, SageNealSeenText, SageNealBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNealAfterBattleText
	waitbutton
	closetext
	end

SproutTower3FPainting:
	jumptext SproutTower3FPaintingText

SproutTower3FStatue:
	jumptext SproutTower3FStatueText

SproutTower3FPotion:
	itemball POTION

SproutTower3FEscapeRope:
	itemball ESCAPE_ROPE

MovementData_0x184a1d:
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x184a22:
	step UP
	step_end

MovementData_0x184a24:
	step RIGHT
	step DOWN
	step_end

SproutTowerElderLecturesRivalText:
	text "주지『그대의 실력"
	line "틀림없이 진짜로세"
	
	para "약속대로"
	line "이 비전머신을 건네줌세"
	
	para "하지만 조금은 더"
	line "소중하게 다뤄야 될 것이오"
	
	para "그대의 싸움방식 너무 과격하오"
	line "포켓몬은 싸움의"
	cont "도구가 아닌 것을……"
	done

SproutTowerRivalOnlyCareAboutStrongText:
	text "…… …… ……"
	
	para "…… 흥!"
	line "주지녀석 지껄이는 것치곤"
	cont "전혀 반응이 없었다"
	
	para "…… 당연하겠지"
	line "포켓몬에게 다정하게라든지"
	cont "싱거운 말만 지껄이는 녀석에게"
	cont "나는 지지않아"
	
	para "내가 중요하게 여기는 것은"
	line "강하고 이기는 포켓몬뿐"
	
	para "그 이외의 포켓몬 같은 건"
	line "어떻게되던 간에 상관없어"
	done

SproutTowerRivalUsedEscapeRopeText:
	text "<RIVAL>는(은)"
	line "동굴탈출 로프를 사용했다!"
	done

SageLiSeenText:
	text "여기까지 잘 오셨소!"
	
	para "이 모다피의 탑은"
	line "포켓몬과 사람이"
	cont "밝은 미래를 만들 수 있을까"
	cont "수행으로 확인하는 장소"
	
	para "그리고 마지막 시련은"
	line "바로 나일세"
	
	para "그대와 포켓몬의 인연을"
	line "확인해보겠소이다!"
	done

SageLiBeatenText:
	text "우움"
	line "훌륭하오"
	done

SageLiTakeThisFlashText:
	text "그대와"
	line "포켓몬이라면 이 비전을"
	cont "잘 다룰 수 있을 것이라 믿소"
	
	para "플래시의 비전머신을"
	line "가져가도록 하시오!"
	done
	
SageLiFlashExplanationText:
	text "플래시를 가르치면"
	line "어떠한 어두운 곳에서도"
	cont "밝게 할 수 있소!"
	
	para "하지만 싸우지 않을 때"
	line "사용하는 것은 도라지 체육관에서"
	cont "받을 수 있는 배지가 필요하오"
	done

SageLiAfterBattleText:
	text "그대의 여행이"
	line "많은 결실을 맺도록 빌겠소이다"
	done

SageJinSeenText:
	text "포켓몬의 길에 도달하도록"
	line "수행을 하고있소!"
	done
	
SageJinBeatenText:
	text "짐의 수행은 아직"
	line "끝나지 않았소…"
	done
	
SageJinAfterBattleText:
	text "포켓몬이 강해질때"
	line "트레이너 역시 강해진다"
	
	para "아니 트레이너가 강해진다면"
	line "포켓몬 역시 강해지는 것이 진리"
	done

SageTroySeenText:
	text "그대가 포켓몬을"
	line "얼마만큼 신뢰하고있는가"
	cont "내가 확인해보겠소!"
	done

SageTroyBeatenText:
	text "우움!"
	line "신뢰하고 있었구려!"
	done

SageTroyAfterBattleText:
	text "주지스님이 계신 곳까지"
	line "얼마 남지 않았소이다!"
	done

SageNealSeenText:
	text "주지스님께서 주시는"
	line "비전머신은"
	cont "어떤 어둠도 밝게 비추지요"
	done

SageNealBeatenText:
	text "밝게 빛나는 것은"
	line "내 머리-!"
	done
	
SageNealAfterBattleText:
	text "그대가 나아가는 길이"
	line "눈부심으로 가득하길 빌겠소이다"
	done
	
SproutTower3FPaintingText:
	text "힘찬 터치로"
	line "모다피가 그려져 있다……"
	done

SproutTower3FStatueText:
	text "포켓몬이 받들어 모셔지고 있군……"
	line "어딘가 장엄한 기분이 드는군"
	done

SproutTower3F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 10, 14, SPROUT_TOWER_2F, 4

	db 1 ; coord events
	coord_event 11,  9, SCENE_DEFAULT, SproutTower3FRivalScene

	db 6 ; bg events
	bg_event  8,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event 11,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event  9,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event 10,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event  5, 15, BGEVENT_READ, SproutTower3FStatue
	bg_event 14, 15, BGEVENT_READ, SproutTower3FStatue

	db 7 ; object events
	object_event  8, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageJin, -1
	object_event  8,  8, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageTroy, -1
	object_event 10,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SageLiScript, -1
	object_event 11, 11, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageNeal, -1
	object_event  6, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FPotion, EVENT_SPROUT_TOWER_3F_POTION
	object_event 14,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FEscapeRope, EVENT_SPROUT_TOWER_3F_ESCAPE_ROPE
	object_event 10,  4, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_SPROUT_TOWER
