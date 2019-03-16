	const_def 2 ; object constants
	const LAKEOFRAGEMAGIKARPHOUSE_FISHING_GURU

LakeOfRageMagikarpHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MagikarpLengthRaterScript:
	faceplayer
	opentext
	checkevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	iftrue .GetReward
	checkevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	iftrue .AskedForMagikarp
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	checkevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	iftrue .ExplainedHistory
	writetext MagikarpLengthRaterText_LakeOfRageHistory
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	end

.ExplainedHistory:
	writetext MagikarpLengthRaterText_MenInBlack
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MagikarpLengthRaterText_WorldsLargestMagikarp
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	end

.AskedForMagikarp:
	setval MAGIKARP
	special FindPartyMonThatSpecies
	iffalse .ClearedRocketHideout
	writetext MagikarpLengthRaterText_YouHaveAMagikarp
	waitbutton
	special CheckMagikarpLength
	ifequal MAGIKARPLENGTH_NOT_MAGIKARP, .NotMagikarp
	ifequal MAGIKARPLENGTH_REFUSED, .Refused
	ifequal MAGIKARPLENGTH_TOO_SHORT, .TooShort
	; MAGIKARPLENGTH_BEAT_RECORD
	sjump .GetReward

.GetReward:
	writetext MagikarpLengthRaterText_Memento
	buttonsound
	verbosegiveitem ELIXER
	iffalse .NoRoom
	writetext MagikarpLengthRaterText_Bonus
	waitbutton
	closetext
	clearevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.NoRoom:
	closetext
	setevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.TooShort:
	writetext MagikarpLengthRaterText_TooShort
	waitbutton
	closetext
	end

.NotMagikarp:
	writetext MagikarpLengthRaterText_NotMagikarp
	waitbutton
	closetext
	end

.Refused:
	writetext MagikarpLengthRaterText_Refused
	waitbutton
	closetext
	end

LakeOfRageMagikarpHouseUnusedRecordSign:
; unused
	jumptext LakeOfRageMagikarpHouseUnusedRecordText

MagikarpHouseBookshelf:
	jumpstd difficultbookshelf

MagikarpLengthRaterText_LakeOfRageHistory:
	text "이 분노의 호수는 갸라도스가"
	line "폭주해서 날뛴 자국의 구덩이에"
	cont "빗물이 고여서 생겼다고 한다"
	
	para "할아버지의 할아버지 그리고"
	line "그 위의 할아버지의 말씀이었지만"
	
	para "전에는 생기 넘치는"
	line "잉어킹이 낚이던"
	cont "호수였는데……"
	
	para "도대체 어떻게 된걸까?"
	done

MagikarpLengthRaterText_MenInBlack:
	text "호수가 이상해진 것은"
	line "검은 옷의 사내들이"
	cont "어슬렁거리기 시작하고부터다"
	done

MagikarpLengthRaterText_WorldsLargestMagikarp:
	text "우와 분노의 호수"
	line "예전처럼 생기 넘치는"
	cont "잉어킹이 잡히게 되었다"
	
	para "이것으로 세계제일의"
	line "커다란 잉어킹을 보려고 하는"
	cont "꿈이 이루어질 것 같다"
	
	para "너는 낚시대를 가지고 있느냐?"
	line "괜찮다면 좀 도와주거라"
	done

MagikarpLengthRaterText_YouHaveAMagikarp:
	text "오 잉어킹을 가지고 있구나"
	line "그럼 자랑할만한 잉어킹을"
	cont "보여주거라"
	done

MagikarpLengthRaterText_Memento:
	text "이녀석은 훌륭하구나!"
	
	para "너의 실력에 감탄했다"
	line "기념으로 이것을 가지고 가거라"
	done
MagikarpLengthRaterText_Bonus:
	text "중요한 것은 기록이니까"
	line "그건 부록 같은 것이지"
	done
	
MagikarpLengthRaterText_TooShort:
	text "이녀석은 대단해! 라고"
	
	para "말하고 싶지만 전에 낚은 것이"
	line "더 컸었단다"
	done

MagikarpLengthRaterText_NotMagikarp:
	text "뭐라!"
	line "그건 잉어킹이 아니란다"
	done

MagikarpLengthRaterText_Refused:
	text "그런가……"
	line "보여줄만한 놈은 낚지 못했는가"
	cont "뭐 다음에는 굉장한 것을 보여줘라"
	done

LakeOfRageMagikarpHouseUnusedRecordText:
	text "지금의 기록……"
	
	para "@"
	text_ram wStringBuffer3
	text " ……"
	line "@"
	text_ram wStringBuffer4
	text_end

	text_end ; unused

LakeOfRageMagikarpHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, LAKE_OF_RAGE, 2
	warp_event  3,  7, LAKE_OF_RAGE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, MagikarpHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MagikarpHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MagikarpLengthRaterScript, -1
