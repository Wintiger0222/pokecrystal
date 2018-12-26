	const_def 2 ; object constants
	const KARENSROOM_KAREN

KarensRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .KarensRoomDoors

.LockDoor:
	priorityjump .KarensDoorLocksBehindYou
	end

.DummyScene:
	end

.KarensRoomDoors:
	checkevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_KARENS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	return

.KarensDoorLocksBehindYou:
	applymovement PLAYER, KarensRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KarenScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_KAREN
	iftrue KarenScript_AfterBattle
	writetext KarenScript_KarenBeforeText
	waitbutton
	closetext
	winlosstext KarenScript_KarenBeatenText, 0
	loadtrainer KAREN, KAREN1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_KAREN
	opentext
	writetext KarenScript_KarenDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	reloadmappart
	closetext
	setevent EVENT_KARENS_ROOM_EXIT_OPEN
	waitsfx
	end

KarenScript_AfterBattle:
	writetext KarenScript_KarenDefeatText
	waitbutton
	closetext
	end

KarensRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

KarenScript_KarenBeforeText:
UnknownText_0x180c27:	;No.02421 [D:0x0016935E] [L:259]
	text "나는 사천왕인 카렌"
	
	para "네가 <PLAYER>(이)로군"
	line "흐음 굉장히 재미있을 것 같네"
	
	para "내가 사랑하고 있는 것은"
	line "악 타입의 포켓몬!"
	
	para "와일드하고 터프한 느낌"
	line "멋있겠지?"
	cont "게다가 엄-청나게 강하단다"
	
	para "네가 상대가 될 수 있을까?"
	line "힘을내서 우리들을"
	cont "즐겁게 해 주었으면 좋겠다"
	
	para "자 그럼 시작할까!"
	done

KarenScript_KarenBeatenText:
	text "흐음 잘하잖아"
	line "강하다는 것은 아주 멋있지"
	done

KarenScript_KarenDefeatText:
	text "강한 포켓몬"
	
	para "약한 포켓몬"
	
	para "그런것은 사람 나름"
	
	para "정말 강한 트레이너라면"
	line "좋아하는 포켓몬으로"
	cont "승리 할 수 있도록 노력해야해"
	
	para "좋아 너는"
	line "중요한 것을 알고 있는 듯 하니까"
	
	para "다음 관문을 향해 가거라"
	line "챔피언이 너를 기다릴꺼야"
	done

KarensRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 17, BRUNOS_ROOM, 3
	warp_event  5, 17, BRUNOS_ROOM, 4
	warp_event  4,  2, LANCES_ROOM, 1
	warp_event  5,  2, LANCES_ROOM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  7, SPRITE_KAREN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KarenScript_Battle, -1
