	const_def 2 ; object constants
	const CIANWOODPOKECENTER1F_NURSE
	const CIANWOODPOKECENTER1F_LASS
	const CIANWOODPOKECENTER1F_GYM_GUY
	const CIANWOODPOKECENTER1F_SUPER_NERD

CianwoodPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CianwoodPokecenter1FNurseScript:
	jumpstd pokecenternurse

CianwoodPokecenter1FLassScript:
	jumptextfaceplayer CianwoodPokecenter1FLassText

CianwoodGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_CHUCK
	iftrue .CianwoodGymGuyWinScript
	opentext
	writetext CianwoodGymGuyText
	waitbutton
	closetext
	end

.CianwoodGymGuyWinScript:
	opentext
	writetext CianwoodGymGuyWinText
	waitbutton
	closetext
	end

CianwoodPokecenter1FSuperNerdScript:
IF DEF(_MOBILE)
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer CianwoodPokecenter1FUnusedText1
	
.mobile
	jumptextfaceplayer CianwoodPokecenter1FUnusedText2

ELSE
	jumptextfaceplayer CianwoodPokecenter1FSuperNerdText
ENDC

CianwoodPokecenter1FLassText:
	text "이 마을의 매니아랑 만났니?"

	para "진귀한 포켓몬을 가지고 있어서"
	line "늘 자랑하고 있으니까"
	done

CianwoodGymGuyText:;TRANSLATED
	text "이 마을의 포켓몬 체육관은"
	line "난폭한 녀석들 투성이야!"
	
	para "근처에 있으면 나까지"
	line "끝장날 것 같아"
	
	para "미안하지만 여기서 어드바이스를"
	line "체육관 관장이 사용하는 것은"
	cont "격투포켓몬!"
	
	para "그렇다면 이쪽은"
	line "에스퍼포켓몬으로 상대를!"
	cont "상대방이 파워를 발휘하기 전에"
	cont "쓰러뜨려야 한다!"
	
	para"그것보다…"
	line"체육관 한가운데에 있는"
	cont"거대한 바위!"

	para"저걸 제대로 움직이지 않으면"
	line"관장한테 도달할 수 없다!"

	para"진행할수 없게 되면"
	line"한번 나가보는 것도 중요해"
	done

CianwoodGymGuyWinText:
	text "<PLAYER>! 이겼지?"
	line "그 표정을 보면 알 수 있지!"
	done

CianwoodPokecenter1FUnusedText1:;TRANSLATED
; unreferenced
	text"자신의 포켓몬을"
	line"다른사람에게 보여주고 싶어!"

	para"도라지시티의 친구에게"
	line"내가 키운 포켓몬"
	cont"보여주고 싶은데…"
	done

CianwoodPokecenter1FUnusedText2:;TRANSLATED
; unreferenced
	text"최근　모바일 어댑터로"
	line"도라지시티의 친구랑"
	cont"통신대전을 하고있어"

	para"지금은 5 대 7!"
	line"아직 끝나지 않았다고!"
	done

CianwoodPokecenter1FSuperNerdText:;TRANSLATED
	text"자신의 포켓몬을"
	line"다른사람에게 보여주고 싶어!"

	para "배틀을 많이 해서"
	line "내 포켓몬을 자랑할거야!"
	done
	
CianwoodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, CIANWOOD_CITY, 3
	warp_event  4,  7, CIANWOOD_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FLassScript, -1
	object_event  5,  3, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodGymGuyScript, -1
	object_event  8,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FSuperNerdScript, -1
