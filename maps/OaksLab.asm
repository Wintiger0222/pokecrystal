	const_def 2 ; object constants
	const OAKSLAB_OAK
	const OAKSLAB_SCIENTIST1
	const OAKSLAB_SCIENTIST2
	const OAKSLAB_SCIENTIST3

OaksLab_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

.DummyScene:
	end

Oak:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .CheckPokedex
	checkevent EVENT_TALKED_TO_OAK_IN_KANTO
	iftrue .CheckBadges
	writetext OakWelcomeKantoText
	buttonsound
	setevent EVENT_TALKED_TO_OAK_IN_KANTO
.CheckBadges:
	readvar VAR_BADGES
	ifequal NUM_BADGES, .OpenMtSilver
	ifequal NUM_JOHTO_BADGES, .Complain
	sjump .AhGood

.CheckPokedex:
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	writetext OakLabGoodbyeText
	waitbutton
	closetext
	end

.OpenMtSilver:
	writetext OakOpenMtSilverText
	buttonsound
	setevent EVENT_OPENED_MT_SILVER
	sjump .CheckPokedex

.Complain:
	writetext OakNoKantoBadgesText
	buttonsound
	sjump .CheckPokedex

.AhGood:
	writetext OakYesKantoBadgesText
	buttonsound
	sjump .CheckPokedex

OaksAssistant1Script:
	jumptextfaceplayer OaksAssistant1Text

OaksAssistant2Script:
	jumptextfaceplayer OaksAssistant2Text

OaksAssistant3Script:
	jumptextfaceplayer OaksAssistant3Text

OaksLabBookshelf:
	jumpstd difficultbookshelf

OaksLabPoster1:
	jumptext OaksLabPoster1Text

OaksLabPoster2:
	jumptext OaksLabPoster2Text

OaksLabTrashcan:
	jumptext OaksLabTrashcanText

OaksLabPC:
	jumptext OaksLabPCText

OakWelcomeKantoText:
	text "오박사『오오 <PLAY_G>!"
	line "잘 와주었다!"
	
	para "어떠냐?"
	line "관동의 트레이너들도"
	cont "상대하기가 벅차지!"
	done

OakLabDexCheckText:
	text "어디 어디 포켓몬 도감은"
	line "어느정도나 완성했느냐"
	
	para "흐음 흠……"
	done

OakLabGoodbyeText:
	text "이 근처까지 온다면"
	line "또 들리거라"
	done

OakOpenMtSilverText:
	text "오박사『오오! 굉장하구나!"
	line "관동의  배지도 전부 모았느냐!"
	cont "내가 생각한대로구나!"
	
	para "그래! <PLAY_G>이"
	line "은빛 산에 들어갈 수 있도록"
	cont "연락을 해두마"
	
	para "은빛 산에는 야생 포켓몬이"
	line "많이 살고 있는 커다란 산이란다"
	
	para "보통의 트레이너에게는 위험해서"
	line "들어갈 수 없도록 해 놓았지만"
	cont "<PLAY_G>이라면 걱정 없겠지!"
	
	para "석영고원에 가 보거라"
	line "그곳에서 은빛 산으로 갈 수 있다"
	done

OakNoKantoBadgesText:
	text "오박사『오잉?"
	line "관동의 배지를"
	cont "모으지 않은 것 같구나"
	
	para "관동의 체육관 관장들도"
	line "성도에 지지 않을 정도로"
	cont "기본이 잘 갖추어져 있단다"
	cont "도전해 보는것이 어떻겠느냐?"
	done
	
OakYesKantoBadgesText:
	text "오박사『관동 배지를"
	line "모은 것 같구나!"
	
	para "힘들었겠지만"
	line "경험은 <PLAY_G>의"
	cont "힘이 될꺼란다"
	
	para "전부 모았다면"
	line "또 놀러오너라"
	cont "내가 선물을 주마"
	
	para "<PLAY_G>"
	line "힘내거라!"
	done

OaksAssistant1Text:
	text "박사님의 포켓몬 강좌"
	line "관동에서는 방송하지 않습니다"
	cont "듣고싶은데 유감이네요"
	done
	
OaksAssistant2Text:
	text "<PLAY_G>이"
	line "도감을 만들어주어서"
	cont "박사님의 연구가"
	cont "잘 진행되고 있어요!"
	done
	
OaksAssistant3Text:
	text "……여기서만의 이야기입니다!"
	
	para "오박사님의 포켓몬 강좌는"
	line "생방송이 아니랍니다!"
	done

OaksLabPoster1Text:
	text "스타트 버튼을 누르자!"
	line "누르면 메뉴가 뜬다"
	done

OaksLabPoster2Text:
	text "세이브를 함에는 포켓몬 레포트"
	line "자주 쓰면 좋다"
	done

OaksLabTrashcanText:
	text "안은 텅 비었다……"
	done

OaksLabPCText:
	text "컴퓨터를 보면"
	line "전자메일이 와 있다!"
	
	para "…… …… ……"
	
	para "오박사님의 연구는"
	line "잘 진행되고 있습니까"
	
	para "내쪽은……"
	line "한창 힘내고 있는 중입니다"
	
	para "그건 그렇고<PLAY_G>이"
	line "열심히 하고 있다는 소문을 들어서"
	cont "매우 기쁘답니다!"
	
	para "……연두마을의 공박사로부터"
	line "…… …… ……"
	done

OaksLab_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, PALLET_TOWN, 3
	warp_event  5, 11, PALLET_TOWN, 3

	db 0 ; coord events

	db 16 ; bg events
	bg_event  6,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  0,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  3,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  6,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  4,  0, BGEVENT_READ, OaksLabPoster1
	bg_event  5,  0, BGEVENT_READ, OaksLabPoster2
	bg_event  9,  3, BGEVENT_READ, OaksLabTrashcan
	bg_event  0,  1, BGEVENT_READ, OaksLabPC

	db 4 ; object events
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Oak, -1
	object_event  1,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant1Script, -1
	object_event  8,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant2Script, -1
	object_event  1,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant3Script, -1
