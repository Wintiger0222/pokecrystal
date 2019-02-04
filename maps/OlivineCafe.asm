	const_def 2 ; object constants
	const OLIVINECAFE_SAILOR1
	const OLIVINECAFE_FISHING_GURU
	const OLIVINECAFE_SAILOR2

OlivineCafe_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OlivineCafeStrengthSailorScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM04_STRENGTH
	iftrue .GotStrength
	writetext OlivineCafeStrengthSailorText
	buttonsound
	verbosegiveitem HM_STRENGTH
	setevent EVENT_GOT_HM04_STRENGTH
.GotStrength:
	writetext OlivineCafeStrengthSailorText_GotStrength
	waitbutton
	closetext
	end

OlivineCafeFishingGuruScript:
	jumptextfaceplayer OlivineCafeFishingGuruText

OlivineCafeSailorScript:
	jumptextfaceplayer OlivineCafeSailorText

OlivineCafeStrengthSailorText:
	text "뭐야? 꽤나"
	line "약해보이는 포켓몬이구나"

	para "그래가지고는"
	line "커다란 바위도 밀수 없을껄"

	para "이것을 사용해서"
	line "괴력의 기술을 가르쳐주거라!"
	done

OlivineCafeStrengthSailorText_GotStrength:
	text "바다 위에서 의지할 수 있는 것은"
	line "내 자신의 육체뿐"
	cont "강한 힘이 자랑꺼리란다!"
	done
	
OlivineCafeFishingGuruText:;TRANSLATED
	text"이 담청카페에는"
	line"힘이 자랑인　바다사나이가"
	cont"만족하는　메뉴가　잔뜩!"
	done

OlivineCafeSailorText:;TRANSLATED
	text"이 마을에 들를땐 항상"
	line"이 담청 카페에 들러"

	para"여기의　밥은　언제 먹어도"
	line"힘이 세지는것 같아!"
	done

OlivineCafe_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, OLIVINE_CITY, 7
	warp_event  3,  7, OLIVINE_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  4,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeStrengthSailorScript, -1
	object_event  7,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeFishingGuruScript, -1
	object_event  6,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeSailorScript, -1
