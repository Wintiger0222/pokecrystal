	const_def 2 ; object constants
	const OLIVINEGYM_JASMINE
	const OLIVINEGYM_GYM_GUY

OlivineGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OlivineGymJasmineScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JASMINE
	iftrue .FightDone
	writetext Jasmine_SteelTypeIntro
	waitbutton
	closetext
	winlosstext Jasmine_BetterTrainer, 0
	loadtrainer JASMINE, JASMINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	opentext
	writetext Text_ReceivedMineralBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
	checkcode VAR_BADGES
	scall OlivineGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue .GotIronTail
	writetext Jasmine_BadgeSpeech
	buttonsound
	verbosegiveitem TM_IRON_TAIL
	iffalse .NoRoomForIronTail
	setevent EVENT_GOT_TM23_IRON_TAIL
	writetext Jasmine_IronTailSpeech
	waitbutton
	closetext
	end

.GotIronTail:
	writetext Jasmine_GoodLuck
	waitbutton
.NoRoomForIronTail:
	closetext
	end

OlivineGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

OlivineGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_JASMINE
	iftrue .OlivineGymGuyWinScript
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalse .OlivineGymGuyPreScript
	opentext
	writetext OlivineGymGuyText
	waitbutton
	closetext
	end

.OlivineGymGuyWinScript:
	opentext
	writetext OlivineGymGuyWinText
	waitbutton
	closetext
	end

.OlivineGymGuyPreScript:
	opentext
	writetext OlivineGymGuyPreText
	waitbutton
	closetext
	end

OlivineGymStatue:
	checkflag ENGINE_MINERALBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext JASMINE, JASMINE1, MEM_BUFFER_1
	jumpstd gymstatue2

Jasmine_SteelTypeIntro:
	text "…… 등대에서는"
	line "고마웠어요"
	
	para "…… 하지만 승부는 별도니까"
	line "다시 한번 자기소개를 하겠어요"
	
	para "나는 체육관 관장인 규리"
	line "사용하는 포켓몬은"
	cont "강철타입입니다"
	
	para "…… 강철타입에 대해서"
	line "알고 있습니까?"
	
	para "최근에 발견한지 얼마 되지 않은"
	line "포켓몬의 타입입니다"
	
	para "…… 저 저기"
	line "그럼 시작하겠습니다"
	done

Jasmine_BetterTrainer:
	text "…… 포켓몬 트레이너로서"
	line "당신 쪽이 더 뛰어난 것 같군요"
	cont "강함과 부드러움도"
	
	para "…… 그럼 리그의 규칙대로"
	line "배지를 드리겠습니다"
	done
	
Text_ReceivedMineralBadge:
	text "<PLAYER>는(은) 규리로부터"
	line "스틸배지를 받았다!"
	done

Jasmine_BadgeSpeech:
	text "…… 스틸배지에는"
	line "포켓몬의 방어력을"
	cont "올려주는 효과가 있어"
	
	para "…… 저어 그리고 이것도 받아요"
	done

Text_ReceivedTM09:
	text "<PLAYER>는(은) 규리로부터"
	line "기술머신09를 받았다!"
	done

Jasmine_IronTailSpeech:
	text "…… 그 기술머신을 사용하면"
	line "아이언테일을 가르칠 수 있습니다"
	done

Jasmine_GoodLuck:
	text "저 저기……"
	line "그다지 말은 잘 못하겠지만"
	
	para "…… 힘내세요"
	done

OlivineGymGuyText:
	text "규리가 사용하는 포켓몬은"
	line "발견된지 얼마 되지 않은"
	cont "강철타입을 지니고 있다"
	
	para "어떤 특징일까"
	line "나도 잘 모르고 있단다"
	done

OlivineGymGuyWinText:
	text "이야아 멋있었어"
	line "강철타입……"
	cont "바로 미지의 도구였어!"
	done

OlivineGymGuyPreText:
	text "체육관 관장인 규리"
	line "등대의 포켓몬"
	cont "상태가 나뻐서"
	cont "계속 간병하고 있단다"
	
	para "강한 트레이너라고 하는 것은"
	line "온화함을 지니고 있구나"
	done

OlivineGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, OLIVINE_CITY, 2
	warp_event  5, 15, OLIVINE_CITY, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, OlivineGymStatue
	bg_event  6, 13, BGEVENT_READ, OlivineGymStatue

	db 2 ; object events
	object_event  5,  3, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymJasmineScript, EVENT_OLIVINE_GYM_JASMINE
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymGuyScript, -1
