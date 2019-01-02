	const_def 2 ; object constants
	const SILPHCO1F_RECEPTIONIST
	const SILPHCO1F_OFFICER

SilphCo1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SilphCoReceptionistScript:
	jumptextfaceplayer SilphCoReceptionistText

SilphCoOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_UP_GRADE
	iftrue .GotUpGrade
	writetext SilphCoOfficerText
	buttonsound
	verbosegiveitem UP_GRADE
	iffalse .NoRoom
	setevent EVENT_GOT_UP_GRADE
.GotUpGrade:
	writetext SilphCoOfficerText_GotUpGrade
	waitbutton
.NoRoom:
	closetext
	end

SilphCoReceptionistText:
	text "어서오세요!"
	line "실프주식회사"
	cont "본사 빌딩입니다!"
	done

SilphCoOfficerText:
	text "2층 이상의 층은"
	line "사원만 들어갈 수 있단다"
	
	para "하지만 멀리서부터"
	line "일부러 와준 너에게는"
	cont "이것을 주마!"
	done

SilphCoOfficerText_GotUpGrade:
	text "실프주식회사의"
	line "신제품이란다!"
	cont "아직 어디에서도 팔지 않아!"
	done
	
SilphCo1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SAFFRON_CITY, 7
	warp_event  3,  7, SAFFRON_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  4,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoReceptionistScript, -1
	object_event 13,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoOfficerScript, -1
