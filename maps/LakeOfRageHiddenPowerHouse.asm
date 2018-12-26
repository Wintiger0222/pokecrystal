	const_def 2 ; object constants
	const LAKEOFRAGEHIDDENPOWERHOUSE_FISHER

LakeOfRageHiddenPowerHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

HiddenPowerGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM10_HIDDEN_POWER
	iftrue .AlreadyGotItem
	writetext HiddenPowerGuyText1
	buttonsound
	verbosegiveitem TM_HIDDEN_POWER
	iffalse .Done
	setevent EVENT_GOT_TM10_HIDDEN_POWER
	writetext HiddenPowerGuyText2
	waitbutton
	closetext
	end
.AlreadyGotItem:
	writetext HiddenPowerGuyText3
	waitbutton
.Done:
	closetext
	end

HiddenPowerHouseBookshelf:
	jumpstd difficultbookshelf

HiddenPowerGuyText1:
	text "…… …… ……"
	line "일부러 이렇게 누추한 곳 까지……"
	
	para "나는 이곳에서 명상을 함으로"
	line "새로운 힘을 익혔다!"
	
	para "그 힘을"
	line "너의 포켓몬에게도 나눠주마"
	cont "이것을 가지고 가거라"
	done
	
HiddenPowerGuyText2:
	text "…… 알겠느냐"
	line "그것은 본능을 깨우는 파워"
	
	para "포켓몬의 힘을 끌어내서"
	line "공격을 하는 기술!"
	
	para "그러나 가르친 포켓몬에 따라"
	line "타입과 위력은 달라진다"
	done
	
HiddenPowerGuyText3:
	text "지금은 명상중…… ……"
	done

LakeOfRageHiddenPowerHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, LAKE_OF_RAGE, 1
	warp_event  3,  7, LAKE_OF_RAGE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, HiddenPowerHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, HiddenPowerHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HiddenPowerGuy, -1
