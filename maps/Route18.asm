	const_def 2 ; object constants
	const ROUTE18_YOUNGSTER1
	const ROUTE18_YOUNGSTER2

Route18_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperBoris:
	trainer BIRD_KEEPER, BORIS, EVENT_BEAT_BIRD_KEEPER_BORIS, BirdKeeperBorisSeenText, BirdKeeperBorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBorisAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperBob:
	trainer BIRD_KEEPER, BOB, EVENT_BEAT_BIRD_KEEPER_BOB, BirdKeeperBobSeenText, BirdKeeperBobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBobAfterBattleText
	waitbutton
	closetext
	end

Route18Sign:
	jumptext Route18SignText

BirdKeeperBorisSeenText:
	text "포켓몬 찾기의 요령은"
	line "풀숲을 발견하면"
	cont "먼저 들어가 보는 것이야!"
	done
	
BirdKeeperBorisBeatenText:
	text "히익-!"
	done

BirdKeeperBorisAfterBattleText:
	text "너 정도로 강할 수 있다면"
	line "대전하는 것도 즐겁겠지"
	done
	
BirdKeeperBobSeenText:
	text "자전거 길이"
	line "무지개시티의 지름길이지!"
	done
	
BirdKeeperBobBeatenText:
	text "…… ……후우!"
	done

BirdKeeperBobAfterBattleText:
	text "자전거를 가지고 있지 않아서"
	line "지름길을 이용 할 수 없지만말야"
	done
	
Route18SignText:
	text "이곳은 18번 도로"
	line "무지개시티 …… 연분홍시티"
	done
	
Route18_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  6, ROUTE_17_ROUTE_18_GATE, 3
	warp_event  2,  7, ROUTE_17_ROUTE_18_GATE, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  9,  5, BGEVENT_READ, Route18Sign

	db 2 ; object events
	object_event  9, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBoris, -1
	object_event 13,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBob, -1
