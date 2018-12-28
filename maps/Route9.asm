	const_def 2 ; object constants
	const ROUTE9_YOUNGSTER1
	const ROUTE9_LASS1
	const ROUTE9_YOUNGSTER2
	const ROUTE9_LASS2
	const ROUTE9_POKEFAN_M1
	const ROUTE9_POKEFAN_M2

Route9_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerCamperDean:
	trainer CAMPER, DEAN, EVENT_BEAT_CAMPER_DEAN, CamperDeanSeenText, CamperDeanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperDeanAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHeidi:
	trainer PICNICKER, HEIDI, EVENT_BEAT_PICNICKER_HEIDI, PicnickerHeidiSeenText, PicnickerHeidiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHeidiAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperSid:
	trainer CAMPER, SID, EVENT_BEAT_CAMPER_SID, CamperSidSeenText, CamperSidBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSidAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerEdna:
	trainer PICNICKER, EDNA, EVENT_BEAT_PICNICKER_EDNA, PicnickerEdnaSeenText, PicnickerEdnaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerEdnaAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerTim:
	trainer HIKER, TIM, EVENT_BEAT_HIKER_TIM, HikerTimSeenText, HikerTimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerTimAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerSidney:
	trainer HIKER, SIDNEY, EVENT_BEAT_HIKER_SIDNEY, HikerSidneySeenText, HikerSidneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerSidneyAfterBattleText
	waitbutton
	closetext
	end

Route9Sign:
	jumptext Route9SignText

Route9HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_9_HIDDEN_ETHER

CamperDeanSeenText:
	text "돌산 터널을"
	line "탐험하러 왔단다!"
	done

CamperDeanBeatenText:
	text "이 이런!"
	done

CamperDeanAfterBattleText:
	text "터널에 들어가기 전"
	line "포켓몬이 상처를 입었다"
	cont "포켓몬센터에 가야지!"
	done

PicnickerHeidiSeenText:
	text "너 피크닉 한 적 있니?"
	line "굉장히 재미있어!"
	done

PicnickerHeidiBeatenText:
	text "아아앙-!"
	done

PicnickerHeidiAfterBattleText:
	text "많이 과자를 만들어서"
	line "모두함께 먹는거야!"
	cont "맛있단다!"
	done

CamperSidSeenText:
	text "어이 너!"
	line "담배 함부로 버리는 것은 금지다!"
	done

CamperSidBeatenText:
	text "주의만 준 것 뿐인데……"
	done
	
CamperSidAfterBattleText:
	text "담배같은건 피지 않는군"
	line "내가 잘못봤다"
	done

PicnickerEdnaSeenText:
	text "쓰레기는 꼭 자신이"
	line "가지고 돌아가지 않으면 안 되지"
	done

PicnickerEdnaBeatenText:
	text "아아……"
	line "져버렸다……"
	done

PicnickerEdnaAfterBattleText:
	text "전기도 소중하지만"
	line "자연도 소중히 하거라"
	done

HikerTimSeenText:
	text "산-은 은-빛-……"
	
	para "은빛이라는 산이"
	line "성도에 있지?"
	done
	
HikerTimBeatenText:
	text "노래에 열중해서"
	line "포켓몬을 소홀하게……"
	done

HikerTimAfterBattleText:
	text "싸움은 집중력!"
	done

HikerSidneySeenText:
	text "비밀을 가르쳐주겠다!"
	line "그러나 그전에 포켓몬이다!"
	done

HikerSidneyBeatenText:
	text "제기럴!"
	line "졌단말인가!"
	done

HikerSidneyAfterBattleText:
	text "폭이 좁은 강을 건너면"
	line "커다란 발전소가 있단다"
	done

Route9SignText:
	text "이곳은 9번 도로"
	line "블루시티 …… 돌산 터널"
	done

Route9_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 48, 15, ROCK_TUNNEL_1F, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 15,  7, BGEVENT_READ, Route9Sign
	bg_event 41, 15, BGEVENT_ITEM, Route9HiddenEther

	db 6 ; object events
	object_event 23, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperDean, -1
	object_event 39,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerHeidi, -1
	object_event 11,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerCamperSid, -1
	object_event 12, 15, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerEdna, -1
	object_event 28,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerTim, -1
	object_event 36, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerHikerSidney, -1
