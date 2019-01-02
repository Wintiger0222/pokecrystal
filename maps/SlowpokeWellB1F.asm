	const_def 2 ; object constants
	const SLOWPOKEWELLB1F_ROCKET1
	const SLOWPOKEWELLB1F_ROCKET2
	const SLOWPOKEWELLB1F_ROCKET3
	const SLOWPOKEWELLB1F_ROCKET_GIRL
	const SLOWPOKEWELLB1F_SLOWPOKE1
	const SLOWPOKEWELLB1F_SLOWPOKE2
	const SLOWPOKEWELLB1F_KURT
	const SLOWPOKEWELLB1F_BOULDER
	const SLOWPOKEWELLB1F_POKE_BALL

SlowpokeWellB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SlowpokeWellB1FKurtScript:
	jumptextfaceplayer SlowpokeWellB1FKurtText

TrainerGruntM29:
	trainer GRUNTM, GRUNTM_29, EVENT_BEAT_ROCKET_GRUNTM_29, GruntM29SeenText, GruntM29BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM29AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM1:
	trainer GRUNTM, GRUNTM_1, EVENT_BEAT_ROCKET_GRUNTM_1, GruntM1SeenText, GruntM1BeatenText, 0, .Script

.Script:
	opentext
	writetext TrainerGruntM1WhenTalkText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SLOWPOKEWELLB1F_ROCKET1
	disappear SLOWPOKEWELLB1F_ROCKET2
	disappear SLOWPOKEWELLB1F_ROCKET3
	disappear SLOWPOKEWELLB1F_ROCKET_GIRL
	pause 15
	special FadeInQuickly
	disappear SLOWPOKEWELLB1F_KURT
	moveobject SLOWPOKEWELLB1F_KURT, 11, 6
	appear SLOWPOKEWELLB1F_KURT
	applymovement SLOWPOKEWELLB1F_KURT, KurtSlowpokeWellVictoryMovementData
	turnobject PLAYER, RIGHT
	opentext
	writetext KurtLeaveSlowpokeWellText
	waitbutton
	closetext
	setevent EVENT_CLEARED_SLOWPOKE_WELL
	variablesprite SPRITE_AZALEA_ROCKET, SPRITE_SILVER
	setmapscene AZALEA_TOWN, SCENE_AZALEATOWN_RIVAL_BATTLE
	clearevent EVENT_ILEX_FOREST_APPRENTICE
	clearevent EVENT_ILEX_FOREST_FARFETCHD
	setevent EVENT_CHARCOAL_KILN_FARFETCH_D
	setevent EVENT_CHARCOAL_KILN_APPRENTICE
	setevent EVENT_SLOWPOKE_WELL_SLOWPOKES
	setevent EVENT_SLOWPOKE_WELL_KURT
	clearevent EVENT_AZALEA_TOWN_SLOWPOKES
	clearevent EVENT_KURTS_HOUSE_SLOWPOKE
	clearevent EVENT_KURTS_HOUSE_KURT_1
	special FadeOutPalettes
	special HealParty
	pause 15
	warp KURTS_HOUSE, 3, 3
	end

TrainerGruntM2:
	trainer GRUNTM, GRUNTM_2, EVENT_BEAT_ROCKET_GRUNTM_2, GruntM2SeenText, GruntM2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM2AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF1:
	trainer GRUNTF, GRUNTF_1, EVENT_BEAT_ROCKET_GRUNTF_1, GruntF1SeenText, GruntF1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF1AfterBattleText
	waitbutton
	closetext
	end

SlowpokeWellB1FSlowpokeWithMailScript:
	faceplayer
	opentext
	cry SLOWPOKE
	writetext SlowpokeWellB1FSlowpokeWithMailText
	yesorno
	iftrue .ReadMail
	closetext
	end

.ReadMail:
	writetext SlowpokeWellB1FSlowpokeMailText
	waitbutton
	closetext
	end

SlowpokeWellB1FTaillessSlowpokeScript:
	faceplayer
	opentext
	writetext SlowpokeWellB1FTaillessSlowpokeText
	cry SLOWPOKE
	waitbutton
	closetext
	end

SlowpokeWellB1FBoulder:
	jumpstd strengthboulder

SlowpokeWellB1FSuperPotion:
	itemball SUPER_POTION

KurtSlowpokeWellVictoryMovementData:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	step LEFT
	step UP
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	turn_head LEFT
	step_end

SlowpokeWellB1FKurtText:
	text "강집『오오 <PLAYER>인가"

	para "위에서 망을보던 녀석은"
	line "큰소리로 혼쭐을 내니까"
	cont "도망쳤지만……"
	
	para "나는 우물에서 떨어져버려"
	line "허리를 다쳐 움직일 수 없단다"
	
	para "젠장…… 다치지만 않았으면"
	line "내 포켓몬이"
	cont "착착 혼을 낼 수 있을텐데……"
	
	para "이보게 <PLAYER>!"
	line "내 대신"
	cont "트레이너의 정신을 보여주거라!"
	done

KurtLeaveSlowpokeWellText:
	text "강집『<PLAYER>잘해주었다"
	line "로켓단녀석들"
	cont "싹 도망쳤단다"
	
	para "허리 상태도 좋아졌구"
	line "나도 돌아가 봐야겠다"
	done

GruntM29SeenText:
	text "젠장 위에서 감시하고 있었는데"
	line "뭐야 저 노인은"
	
	para "갑자기 큰소리를 지르니까"
	line "놀라서 우물에 떨어져버렸잖아"
	
	para "에-이 기분전환으로"
	line "너를 괴롭혀볼까!"
	done

GruntM29BeatenText:
	text "아- 이런-"
	line "전혀 안되겠군!"
	done

GruntM29AfterBattleText:
	text "그렇다 우리들이"
	line "야돈의 꼬리를 잘라서"
	cont "팔고있었다"
	
	para "이것도 저것도 다 돈벌기 위해서"
	line "맞아 돈을 위해서라면"
	cont "무엇이든 하는것이 바로 로켓단!"
	done

GruntM1SeenText:
	text "뭐냐?"
	
	para "우리의 일을 방해할 것이라면"
	line "용서하지 않겠다!"
	done

GruntM1BeatenText:
	text "쿠웃 꼬맹이"
	line "꽤 잘하는군! 하지만"
	cont "다음부터는 그렇게 않될 것이다"
	done

TrainerGruntM1WhenTalkText:
	text "확실히 우리 로켓단은"
	line "3년전에 해산했다"
	
	para "하지만 이렇게 지하로 숨어들어"
	line "활동을 계속해온 것이다"
	
	para "이제부터 어떤 일이 일어날까"
	line "즐겁게 기다리는게 좋을꺼다!"
	done

GruntM2SeenText:
	text "꼬리 자르는 것을 그만두라고?"
	
	para "누가 시킨다고 그만둔다면"
	line "로켓단이 아니지!"
	done

GruntM2BeatenText:
	text "너 너무나도 강하군……"
	done

GruntM2AfterBattleText:
	text "돈을 번다고는 하지만"
	line "야돈의 꼬리를 팔다니……"
	
	para "조무래기는 괴로워……"
	done

GruntF1SeenText:
	text "꼬리 자르는 것을 그만두라고?"
	
	para "자- 우리들"
	line "전원을 쓰러뜨려 보아랏!"
	done

GruntF1BeatenText:
	text "이런 얄미운 녀석"
	done

GruntF1AfterBattleText:
	text "야돈의 꼬리 같은 거"
	line "금방 또다시 생기잖아"
	cont "그것을 파는게 뭐가 나빠!"
	done

SlowpokeWellB1FSlowpokeWithMailText:
	text "야돈이다……"
	line "꼬리가 잘려있어……"
	
	para "오잉? 메일을 가지고있다"
	line "읽어볼까?"
	done

SlowpokeWellB1FSlowpokeMailText:
	text "<PLAYER>는(은)"
	line "메일을 읽어보았다!"
	
	para "할아버지랑 야돈이랑 사이좋게"
	line "집지키고 있거라! 아버지로부터"
	done

SlowpokeWellB1FTaillessSlowpokeText:
	text "야돈이다……"
	line "꼬리가 잘려있다……"
	done
	
SlowpokeWellB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17, 15, AZALEA_TOWN, 6
	warp_event  7, 11, SLOWPOKE_WELL_B2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 9 ; object events
	object_event 15,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM29, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  5,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM2, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event 10,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  7,  4, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FSlowpokeWithMailScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	object_event  6,  2, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FTaillessSlowpokeScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	object_event 16, 14, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FKurtScript, EVENT_SLOWPOKE_WELL_KURT
	object_event  3,  2, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FBoulder, -1
	object_event 10,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SlowpokeWellB1FSuperPotion, EVENT_SLOWPOKE_WELL_B1F_SUPER_POTION
