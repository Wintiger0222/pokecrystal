	const_def 2 ; object constants
	const WISETRIOSROOM_SAGE1
	const WISETRIOSROOM_SAGE2
	const WISETRIOSROOM_SAGE3
	const WISETRIOSROOM_SAGE4
	const WISETRIOSROOM_SAGE5
	const WISETRIOSROOM_SAGE6

WiseTriosRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .WiseTrioCallback

.DummyScene0:
	end

.DummyScene1:
	end

.WiseTrioCallback:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .NoWiseTrio
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .WiseTrio2
	checkitem CLEAR_BELL
	iftrue .WiseTrio2
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

.WiseTrio2:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

.NoWiseTrio:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

WiseTriosRoomSage1Script:
	jumptextfaceplayer WiseTriosRoomSage1Text

WiseTriosRoomSage2Script:
	jumptextfaceplayer WiseTriosRoomSage2Text

WiseTriosRoomSage3Script:
	jumptextfaceplayer WiseTriosRoomSage3Text

WiseTriosRoom_CannotEnterTinTowerScript:
	turnobject WISETRIOSROOM_SAGE3, UP
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE3, 20
	follow PLAYER, WISETRIOSROOM_SAGE3
	applymovement PLAYER, MovementData_0x98622
	stopfollow
	turnobject PLAYER, RIGHT
	opentext
	writetext WiseTriosRoomSage3BlocksExitText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_SAGE3, MovementData_0x98625
	turnobject WISETRIOSROOM_SAGE3, LEFT
	end

TrainerSageGaku:
	trainer SAGE, GAKU, EVENT_BEAT_SAGE_GAKU, SageGakuSeenText, SageGakuBeatenText, 0, .Script

.Script:
	opentext
	writetext SageGakuAfterBattleText
	waitbutton
	closetext
	end

TrainerSageMasa:
	trainer SAGE, MASA, EVENT_BEAT_SAGE_MASA, SageMasaSeenText, SageMasaBeatenText, 0, .Script

.Script:
	opentext
	writetext SageMasaAfterBattleText
	waitbutton
	closetext
	end

TrainerSageKoji:
	trainer SAGE, KOJI, EVENT_BEAT_SAGE_KOJI, SageKojiSeenText, SageKojiBeatenText, 0, .Script

.Script:
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .KojiAllowsPassage
	pause 10
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE6, 20
	opentext
	writetext SageKojiAfterBattleQuestionText
	buttonsound
	writetext SageKojiAfterBattleSpeechText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_SAGE6, MovementData_0x98628
	turnobject WISETRIOSROOM_SAGE6, UP
	setevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	setscene SCENE_FINISHED
	end

.KojiAllowsPassage:
	opentext
	writetext SageKojiAfterBattleFinalText
	waitbutton
	closetext
	end

MovementData_0x98622:
	step LEFT
	step LEFT
	step_end

MovementData_0x98625:
	step RIGHT
	step DOWN
	step_end

MovementData_0x98628:
	step RIGHT
	step DOWN
	step_end

WiseTriosRoomSage1Text:;TRANSLATED
	text"이게 무슨 일인가!"

	para"스이쿤 앤테이 라이코님께서"
	line"눈을 뜨셨다는 것인가…"

	para"그 전설이 마침내"
	line"일어나고 있는 것인가?"
	done

WiseTriosRoomSage2Text:;TRANSLATED
	text"저희도 불탄 탑에서"
	line"수행을 하고 있지만"
	cont"구멍이 열렸다니"
	cont"들어본 적도 없습니다"

	para"누군가가 일부러 구멍을 만들었다고" 
	line"밖에는 생각하지 못하겠습니다…"
	done
	
WiseTriosRoomSage3BlocksExitText:;TRANSLATED
	text"방울탑은 인주 체육관의"
	line"배지를 가지고 있으면"
	cont"들어갈 수 있지만"

	para"스이쿤 앤테이 라이코님께서"
	line"눈을 뜨신 지금"

	para"들어오는 것을 삼가주기를 원한다!"
	done

WiseTriosRoomSage3Text:;TRANSLATED
	text"우리는 전설의 포켓몬을"
	line"지키고 있는 3인방이다"
	done

SageGakuSeenText:;TRANSLATED
	text"전설에 따르면 포켓몬과"
	line"마음이 통할수 있는"
	cont"인물이 나타나게 될 때"

	para"방울탑에서 그 인물을 시험할것이다"
	line"…라고 하지"

	para"그 전설대로"

	para"포켓몬… 스이쿤님께서"
	line"오시게 되었다!"

	para"우리 3인방이"
	line"너에게 그 자격이 있는지"
	cont"확인해 보이겠다!"
	done

SageGakuBeatenText:;TRANSLATED
	text"예상 이상으로 강하다…"
	line"……　어쩌면……"
	done

SageGakuAfterBattleText:;TRANSLATED
	text"네가 주무시고 계시는"
	line";스이쿤 앤테이 라이코님을"
	cont"봤다는 것인가"

	para"믿을 수가 없구만!"

	para"전설에서는 주무시고 계시는"
	line"동안에는 모습이 보이지 않는다…"
	cont"…라고 했었는데……"
	done

SageMasaSeenText:;TRANSLATED
	text"당신에게 진실을 알려드려도"
	line"좋을 지 아닐 지"

	para"이쪽부터 보여 드리겠습니다"
	done

SageMasaBeatenText:;TRANSLATED
	text"…………"
	line"진실을 알려드리도록 하죠"
	done
	
SageMasaAfterBattleText:;TRANSLATED
	text"옛날에는 9층탑이"
	line"두 개 있었습니다"

	para"포켓몬이 깨어난다고"
	line"일컬어지는 황동탑"

	para"포켓몬이 쉰다고"
	line"일컬어지는 방울탑이었죠"

	para"분명 아름다운 광경이었음이"
	line"틀림 없습니다"

	para"그때의 황동탑에서는"
	line"거대한 은색 포켓몬이"
	cont"날다가 쉬곤 했다고 하지요"

	para"그런데…"

	para"지금부터 대략 150년 전"
	line"한 탑에"
	cont"벼락이 떨어졌다고 합니다"

	para"그 때문에 그 탑은"
	line"엄청난 화염에 싸여"
	cont"3일을 불탔다고 합니다"

	para"그리고…"

	para"갑자기 큰비가 내려"
	line"불이 꺼졌습니다"

	para"이 탑이 지금의 불탄탑입니다"
	done

SageKojiSeenText:;TRANSLATED
	text"자네의 힘을 보도록 하겠다!"
	done

SageKojiBeatenText:;TRANSLATED
	text"가 강해… 너무 강하다"
	line"어째서인가!?"
	done

SageKojiAfterBattleQuestionText:;TRANSLATED
	text"자네!　혹시!?"
	line"전설의 포켓몬이"
	cont"기다리고 있는 자인가!?"
	done

SageKojiAfterBattleSpeechText:;TRANSLATED
	text"역시나……"

	para"저희 3인방은"
	line"전설의 포켓몬을 지키고"

	para"진실된 힘과 마음을"
	line"가진 사람을 지나가게 한다고"
	cont"불리고 있습니다"

	para"지나가 주십시오"

	para"그리고 앞에 있는 방울탑에"
	line"들어가주십시오"

	para"스이쿤님께서 당신을"
	line"시험에 들게 하실 것입니다"
	done

SageKojiAfterBattleFinalText:;TRANSLATED
	para"지나가 주십시오"

	para"스이쿤님께서 당신을"
	line"시험에 들게 하실 것입니다"
	done

WiseTriosRoom_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7,  4, ECRUTEAK_CITY, 4
	warp_event  7,  5, ECRUTEAK_CITY, 5
	warp_event  1,  4, ECRUTEAK_TIN_TOWER_ENTRANCE, 5

	db 1 ; coord events
	coord_event  7,  4, SCENE_DEFAULT, WiseTriosRoom_CannotEnterTinTowerScript

	db 0 ; bg events

	db 6 ; object events
	object_event  6,  2, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage1Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  6,  7, SPRITE_SAGE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage2Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  7,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage3Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  4,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageGaku, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  4,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageMasa, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  6,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageKoji, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
