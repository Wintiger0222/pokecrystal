	const_def 2 ; object constants
	const MANIASHOUSE_ROCKER

ManiasHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ManiaScript:
	faceplayer
	opentext
	checkevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	iftrue .default_postevent
	checkevent EVENT_GOT_SHUCKIE
	iftrue .alreadyhaveshuckie
	writetext ManiaText_AskLookAfterShuckle
	yesorno
	iffalse .refusetotakeshuckie
	special GiveShuckle
	iffalse .partyfull
	writetext ManiaText_TakeCareOfShuckle
	buttonsound
	waitsfx
	writetext ManiaText_GotShuckle
	playsound SFX_KEY_ITEM
	waitsfx
	closetext
	setevent EVENT_GOT_SHUCKIE
	end

.alreadyhaveshuckie
	checkflag ENGINE_GOT_SHUCKIE_TODAY
	iffalse .returnshuckie
	writetext ManiaText_TakeCareOfShuckle
	waitbutton
	closetext
	end

.partyfull
	writetext ManiaText_PartyFull
	waitbutton
	closetext
	end

.refusetotakeshuckie
	writetext ManiaText_IfHeComesBack
	waitbutton
	closetext
	end

.returnshuckie
	writetext ManiaText_CanIHaveMyMonBack
	yesorno
	iffalse .refused
	special ReturnShuckle
	ifequal SHUCKIE_WRONG_MON, .wrong
	ifequal SHUCKIE_REFUSED, .refused
	ifequal SHUCKIE_HAPPY, .superhappy
	ifequal SHUCKIE_FAINTED, .default_postevent
	; SHUCKIE_RETURNED
	writetext ManiaText_ThankYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.wrong
	writetext ManiaText_ShuckleNotThere
	waitbutton
	closetext
	end

.superhappy
	writetext ManiaText_ShuckleLikesYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.refused
	writetext ManiaText_SameAsBeingRobbed
	waitbutton
	closetext
	end

.nothingleft
	writetext ManiaText_ShuckleIsYourLastMon
	waitbutton
	closetext
	end

.default_postevent
	writetext ManiaText_HappinessSpeech
	waitbutton
	closetext
	end

ManiasHouseUnusedBookshelf:
; unused
	jumpstd picturebookshelf

ManiaText_AskLookAfterShuckle:
	text "뭐 뭐냐……"
	
	para "너랑 같은정도의 나이또래로"
	line "눈매가 사납고"
	cont "머리가 길고"
	cont "어쩐지 겁이나는 소년에게"
	cont "소중한 포켓몬을 빼앗겼어!"
	
	para "손에는 1마리 남아 있지만"
	line "또 빼앗기면 어떡하지……"
	
	para "너는 강한 것 같구나"
	line "빨리 포켓몬을 맡아줘!"
	done
	
ManiaText_TakeCareOfShuckle:
	text "자 자 부탁할께!"
	line "소중하게 키워줘"
	done

ManiaText_GotShuckle:
	text "<PLAYER>는(은) 매니아로부터"
	line "포켓몬을 맡았다!"
	done

ManiaText_PartyFull:
	text "포켓몬이 잔뜩 있잖아"
	done

ManiaText_IfHeComesBack:
	text "그 그런"
	line "또 빼앗기면 어떡하나"
	done

ManiaText_CanIHaveMyMonBack:
	text "내 포켓몬 잘 있니?"
	
	para "더 이상 빼앗길 염려도 없고"
	line "포켓몬 돌려주면 좋겠어"
	done

ManiaText_ThankYou:
	text "고마워!"
	done

ManiaText_ShuckleNotThere:
	text "내 포켓몬 없잖아"
	done

ManiaText_ShuckleLikesYou:
	text "내 포켓몬"
	line "너에게 정이 들었구나"
	
	para "알았어! 포켓몬 양보할께!"
	line "그 대신 소중히 키워줘"
	done

ManiaText_SameAsBeingRobbed:
	text "그 그런"
	line "그렇다면 빼앗긴거랑 같잖아"
	done
	
ManiaText_HappinessSpeech:
	text "포켓몬에게 있어서 행복이란"
	line "소중히 키워주는 사람과"
	cont "함께 지내는 것이 아닐까"
	done

ManiaText_ShuckleIsYourLastMon:
	text "내가 그 포켓몬을 받으면"
	line "너는 싸우지 못하게 되는군!"
	done

ManiasHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CIANWOOD_CITY, 1
	warp_event  3,  7, CIANWOOD_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ManiaScript, -1
