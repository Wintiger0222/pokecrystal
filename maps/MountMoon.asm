	const_def 2 ; object constants
	const MOUNTMOON_SILVER

MountMoon_MapScripts:
	db 2 ; scene scripts
	scene_script .RivalEncounter ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.RivalEncounter:
	priorityjump .RivalBattle
	end

.DummyScene:
	end

.RivalBattle:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	applymovement MOUNTMOON_SILVER, MountMoonSilverMovementBefore
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext MountMoonSilverTextBefore
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext MountMoonSilverTextWin, MountMoonSilverTextLoss
	setlasttalked MOUNTMOON_SILVER
	loadtrainer RIVAL2, RIVAL2_1_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Totodile:
	winlosstext MountMoonSilverTextWin, MountMoonSilverTextLoss
	setlasttalked MOUNTMOON_SILVER
	loadtrainer RIVAL2, RIVAL2_1_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Chikorita:
	winlosstext MountMoonSilverTextWin, MountMoonSilverTextLoss
	setlasttalked MOUNTMOON_SILVER
	loadtrainer RIVAL2, RIVAL2_1_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.FinishBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext MountMoonSilverTextAfter
	waitbutton
	closetext
	applymovement MOUNTMOON_SILVER, MountMoonSilverMovementAfter
	disappear MOUNTMOON_SILVER
	setscene SCENE_FINISHED
	setevent EVENT_BEAT_RIVAL_IN_MT_MOON
	playmapmusic
	end

MountMoonSilverMovementBefore:
	step LEFT
	step LEFT
	step LEFT
	step_end

MountMoonSilverMovementAfter:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MountMoonSilverTextBefore:
	text "…… …… ……"

	para "오래간만이로군 <PLAYER>"

	para "……난 너에게 지고 나서부터"
	line "내 자신에게 무엇이 부족한가"
	cont "이녀석들과 함께"
	cont "계속 생각해왔다……"

	para "그리고 발견해냈다 대답을"
	line "<PLAYER>!"
	cont "너에게 보여주겠어"
	done

MountMoonSilverTextWin:
	text "…… …… ……"

	para "이녀석들이 지닌 힘"
	line "최대한으로 발휘할 수 있도록"
	cont "키웠다 라고 생각했는데……"

	para "…… 아직 부족한 것인가"
	done

MountMoonSilverTextAfter:
	text "…… …… ……"

	para "…… 확실히 나의 패배다"
	
	para "그건 인정하겠어"
	line "하지만 이것으로 끝은 아니야"

	para "언젠가 최강의"
	line "포켓몬 트레이너가 되어 보이겠어"

	para "…… 이녀석들도"
	line "내 의지에 따라와 줄 꺼야"

	para "…… 잘 들어둬 <PLAYER>"
	line "언젠가 너를 쓰러뜨리고"
	cont "나의 강함을 가르쳐줄 테니까"
	done

MountMoonSilverTextLoss:
	text "…… …… ……"

	para "이것으로 빚은 갚았다"

	para "…… 다음은 이녀석들과 함께"
	line "챔피언을 쓰러뜨리고"
	cont "세계 최강의"
	cont "포켓몬 트레이너가 될꺼야"
	done

MountMoon_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  3,  3, ROUTE_3, 1
	warp_event 15, 15, ROUTE_4, 1
	warp_event 13,  3, MOUNT_MOON, 7
	warp_event 15, 11, MOUNT_MOON, 8
	warp_event 25,  5, MOUNT_MOON_SQUARE, 1
	warp_event 25, 15, MOUNT_MOON_SQUARE, 2
	warp_event 25,  3, MOUNT_MOON, 3
	warp_event 25, 13, MOUNT_MOON, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  3, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_RIVAL
