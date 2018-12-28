	const_def 2 ; object constants
	const POKEMONFANCLUB_GENTLEMAN
	const POKEMONFANCLUB_RECEPTIONIST
	const POKEMONFANCLUB_FISHER
	const POKEMONFANCLUB_TEACHER
	const POKEMONFANCLUB_FAIRY
	const POKEMONFANCLUB_ODDISH

PokemonFanClub_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PokemonFanClubPresidentScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	iftrue .HeardSpeech
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT_BUT_BAG_WAS_FULL
	iftrue .HeardSpeechButBagFull
	writetext UnknownText_0x191881
	yesorno
	iffalse .NotListening
	writetext UnknownText_0x191911
	buttonsound
.HeardSpeechButBagFull:
	writetext UnknownText_0x191a3d
	buttonsound
	verbosegiveitem RARE_CANDY
	iffalse .BagFull
	setevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	writetext UnknownText_0x191a72
	waitbutton
	closetext
	end

.HeardSpeech:
	writetext UnknownText_0x191ae0
	waitbutton
	closetext
	end

.NotListening:
	writetext UnknownText_0x191b38
	waitbutton
.BagFull:
	closetext
	end

PokemonFanClubReceptionistScript:
	jumptextfaceplayer PokemonFanClubReceptionistText

PokemonFanClubClefairyGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	iftrue .GotLostItem
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .FoundClefairyDoll
	writetext UnknownText_0x191ba0
	waitbutton
	closetext
	end

.FoundClefairyDoll:
	writetext UnknownText_0x191bff
	checkevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	iftrue .MetCopycat
	waitbutton
	closetext
	end

.MetCopycat:
	buttonsound
	writetext UnknownText_0x191c5a
	buttonsound
	waitsfx
	giveitem LOST_ITEM
	iffalse .NoRoom
	disappear POKEMONFANCLUB_FAIRY
	writetext UnknownText_0x191d0a
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	closetext
	end

.GotLostItem:
	writetext UnknownText_0x191d1e
	waitbutton
	closetext
	end

.NoRoom:
	writetext UnknownText_0x191d58
	waitbutton
	closetext
	end

PokemonFanClubTeacherScript:
	jumptextfaceplayer PokemonFanClubTeacherText

PokemonFanClubClefairyDollScript:
	jumptext ClefairyDollText

PokemonFanClubBayleefScript:
	opentext
	writetext FanClubBayleefText
	cry BAYLEEF
	waitbutton
	closetext
	end

PokemonFanClubListenSign:
	jumptext PokemonFanClubListenSignText

PokemonFanClubBraggingSign:
	jumptext PokemonFanClubBraggingSignText

UnknownText_0x191881:
	text "포켓몬 애호가 클럽"
	line "회장은 나다!"
	
	para "키워온 포켓몬은"
	line "150마리를 넘는다!"
	
	para "포켓몬에 관해서는"
	line "정말 시끄럽단다!"
	
	para "너는 나의 포켓몬 자랑을"
	line "듣고싶어서 왔느냐?"
	done
	
	
UnknownText_0x191911:
	text "그래!"
	line "그렇다면 바로 시작해 볼까"
	
	para "저기…… 내가 좋아하는"
	line "날쌩마가…… ……"
	
	para "…… 그래서…… 이……"
	line "…… …… 귀여워서……"
	cont "참을 수 없어…… 크……"
	cont "…… 더욱이…… 뭐……"
	cont "대단해서…… …… 서……"
	cont "…… 그렇게 생각하는가……"
	cont "…… 하-!"
	
	para "…… …… 포옹하고……"
	line "나쁠 때도……"
	cont "목욕할 때도……"
	cont "…… 그렇지…… ……"
	cont "…… …… 대단해……!"
	cont "…… 아름다워……"
	cont "…… …… 이야!"
	cont "벌써 이렇게 시간이"
	cont "좀 지나치게 길게 말했구나!"
	done

UnknownText_0x191a3d:
	text "나의 포켓몬 자랑을"
	line "얌전하게 들어준 선물로"
	cont "……이것을 주마!"
	done
	
UnknownText_0x191a72:
	text "포켓몬이 강해지는"
	line "이상한 사탕!"
	
	para "나는 함께 싸워서"
	line "강해지는 방법을"
	cont "좋아해서"
	
	para "그 사탕을 너에게 주겠다"
	done

UnknownText_0x191ae0:
	text "이야- <PLAY_G>!"
	
	para "또 나의 포켓몬 자랑을"
	line "듣기위해 왔구나"
	
	para "……응? 아니야?"
	line "뭐야…… 쑥스럽게"
	done
	
UnknownText_0x191b38:
	text "뭐야 재미없게……"
	line "듣고싶어지면 오너라!"
	done

PokemonFanClubReceptionistText:
	text "우리 회장님은"
	line "정말 포켓몬에대해 시끄러워!"
	done

UnknownText_0x191ba0:
	text "손가락을 흔들고 있는"
	line "동작이라고 한다면……"
	cont "므흣-!"
	cont "삐삐 참을 수 없어!"
	done

UnknownText_0x191bff:
	text "삐삐를 매우 좋아하지만"
	line "어떡게해도 잡을 수 없어서"
	
	para "할 수 없이"
	line "주워온 삐삐인형으로"
	cont "참고 있단다……"
	done

UnknownText_0x191c5a:
	text "그래 이 인형을"
	line "잃어버린 여자아이가"
	cont "슬퍼하겠구나……"
	
	para "알았어!"
	line "삐삐인형을 그 아이에게"
	cont "돌려줘 줘!"
	
	para "나는 내 힘으로"
	line "삐삐랑 친구가 될꺼야!"
	done

UnknownText_0x191d0a:
	text "<PLAYER>는(은)"
	line "삐삐인형을 맡았다!"
	done

UnknownText_0x191d1e:
	text "진짜 삐삐랑"
	line "반드시 친구가 될꺼야!"
	done

UnknownText_0x191d58:
	text "너의 가방이"
	line "가득 찬 것 같다!"
	done

PokemonFanClubTeacherText:
	text "볼래 볼래!"
	line "내 베이리프"
	
	para "머리의 나뭇잎이"
	line "너무나 귀엽단다!"
	done

ClefairyDollText:
	text "삐삐다!"
	line "…… ?"
	
	para "뭐야 삐삐인형이잖아!"
	done
	
FanClubBayleefText:
	text "베이리프『리 리-프!"
	done
	
PokemonFanClubListenSignText:
	text "포켓몬 주인들의 자랑꺼리는"
	line "조용히 귀를 기울이자!"
	done

PokemonFanClubBraggingSignText:
	text "다른 사람의 자랑 이야기는"
	line "10배로 돌려주자"
	done

PokemonFanClub_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, VERMILION_CITY, 3
	warp_event  3,  7, VERMILION_CITY, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  7,  0, BGEVENT_READ, PokemonFanClubListenSign
	bg_event  9,  0, BGEVENT_READ, PokemonFanClubBraggingSign

	db 6 ; object events
	object_event  3,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubPresidentScript, -1
	object_event  4,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonFanClubReceptionistScript, -1
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubClefairyGuyScript, -1
	object_event  7,  2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubTeacherScript, -1
	object_event  2,  4, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubClefairyDollScript, EVENT_VERMILION_FAN_CLUB_DOLL
	object_event  7,  3, SPRITE_ODDISH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonFanClubBayleefScript, -1
