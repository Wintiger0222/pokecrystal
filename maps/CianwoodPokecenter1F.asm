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
	jumptextfaceplayer CianwoodPokecenter1FSuperNerdText;아마 일본어판에서 CianwoodPokecenter1FUnusedText1와 2, 모바일기능버전시구현필요

CianwoodPokecenter1FLassText:
	text "이 마을의 매니아랑 만났니?"

	para "진귀한 포켓몬을 가지고 있어서"
	line "늘 자랑하고 있으니까"
	done

CianwoodGymGuyText:
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
	
	para"それから…"
	line"ジムの　まんなかにある　おおいわ!"

	para"あれを　うまく　うごかさないと"
	line"ジムりーダーには　あえないぜ!"

	para"さきにすすめなく　なったら"
	line"いちど　そとにでるのも　だいじだぞ"
	done

CianwoodGymGuyWinText:
	text "<PLAYER>! 이겼지?"
	line "그 표정을 보면 알 수 있지!"
	done

CianwoodPokecenter1FUnusedText1:
; unreferenced
	text"じぶんの　ポケモンって"
	line"ひとにみせたく　なるよね!"

	para"キキョウの　ともだちに"
	line"ぼくが　そだてた　ポケモン"
	cont"みせて　あげたいな…"
	done

CianwoodPokecenter1FUnusedText2:
; unreferenced
	text"さいきん　モバイルアダプタで"
	line"キキョウの　ともだちと"
	cont"つうしんたいせん　してるんだ"

	para"いま　5しょう　7はい!"
	line"まだまだ　これからだよね!"
	done

CianwoodPokecenter1FSuperNerdText:
	text "I love showing off"
	line "the #MON that"

	para "I've raised."
	line "Don't you?"

	para "I'm going to get"
	line "into a bunch of"

	para "battles, and show"
	line "off my #MON!"
	done
; 나는 내가 키운 #MON을 자랑하는 것을 좋아한다. 그렇지 않나요? 나는 많은 전투에 참가해서 내 #MON을 자랑할 거야!
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
