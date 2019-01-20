	const_def 2 ; object constants
	const ROUTE43_SUPER_NERD1
	const ROUTE43_SUPER_NERD2
	const ROUTE43_SUPER_NERD3
	const ROUTE43_FISHER
	const ROUTE43_LASS
	const ROUTE43_YOUNGSTER
	const ROUTE43_FRUIT_TREE
	const ROUTE43_POKE_BALL

Route43_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .CheckIfRockets

.CheckIfRockets:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .NoRockets
	setmapscene ROUTE_43_GATE, SCENE_DEFAULT
	return

.NoRockets:
	setmapscene ROUTE_43_GATE, SCENE_FINISHED
	return

TrainerCamperSpencer:
	trainer CAMPER, SPENCER, EVENT_BEAT_CAMPER_SPENCER, CamperSpencerSeenText, CamperSpencerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSpencerAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacBen:
	trainer POKEMANIAC, BEN, EVENT_BEAT_POKEMANIAC_BEN, PokemaniacBenSeenText, PokemaniacBenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacBenAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacBrent:
	trainer POKEMANIAC, BRENT1, EVENT_BEAT_POKEMANIAC_BRENT, PokemaniacBrentSeenText, PokemaniacBrentBeatenText, 0, .Script

.Script:
	writecode VAR_CALLERID, PHONE_POKEMANIAC_BRENT
	endifjustbattled
	opentext
	checkflag ENGINE_BRENT
	iftrue .WantsBattle
	checkcellnum PHONE_POKEMANIAC_BRENT
	iftrue .NumberAccepted
	checkevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PokemaniacBrentAfterBattleText
	buttonsound
	setevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	jump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEMANIAC_BRENT
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	trainertotext POKEMANIAC, BRENT1, MEM_BUFFER_0
	scall .RegisteredNumber
	jump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext PokemaniacBrentBeatenText, 0
	copybytetovar wBrentFightCount
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight3:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer POKEMANIAC, BRENT1
	startbattle
	reloadmapafterbattle
	loadvar wBrentFightCount, 1
	clearflag ENGINE_BRENT
	end

.LoadFight1:
	loadtrainer POKEMANIAC, BRENT2
	startbattle
	reloadmapafterbattle
	loadvar wBrentFightCount, 2
	clearflag ENGINE_BRENT
	end

.LoadFight2:
	loadtrainer POKEMANIAC, BRENT3
	startbattle
	reloadmapafterbattle
	loadvar wBrentFightCount, 3
	clearflag ENGINE_BRENT
	end

.LoadFight3:
	loadtrainer POKEMANIAC, BRENT4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BRENT
	end

.AskNumber1:
	jumpstd asknumber1m
	end

.AskNumber2:
	jumpstd asknumber2m
	end

.RegisteredNumber:
	jumpstd registerednumberm
	end

.NumberAccepted:
	jumpstd numberacceptedm
	end

.NumberDeclined:
	jumpstd numberdeclinedm
	end

.PhoneFull:
	jumpstd phonefullm
	end

.Rematch:
	jumpstd rematchm
	end

TrainerPokemaniacRon:
	trainer POKEMANIAC, RON, EVENT_BEAT_POKEMANIAC_RON, PokemaniacRonSeenText, PokemaniacRonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacRonAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMarvin:
	trainer FISHER, MARVIN, EVENT_BEAT_FISHER_MARVIN, FisherMarvinSeenText, FisherMarvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMarvinAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerTiffany:
	trainer PICNICKER, TIFFANY3, EVENT_BEAT_PICNICKER_TIFFANY, PicnickerTiffanySeenText, PicnickerTiffanyBeatenText, 0, .Script

.Script:
	writecode VAR_CALLERID, PHONE_PICNICKER_TIFFANY
	endifjustbattled
	opentext
	checkflag ENGINE_TIFFANY
	iftrue .WantsBattle
	checkflag ENGINE_TIFFANY_HAS_PINK_BOW
	iftrue .HasPinkBow
	checkcellnum PHONE_PICNICKER_TIFFANY
	iftrue .NumberAccepted
	checkpoke CLEFAIRY
	iffalse .NoClefairy
	checkevent EVENT_TIFFANY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PicnickerTiffanyWantsPicnicText
	buttonsound
	setevent EVENT_TIFFANY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	jump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_TIFFANY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	trainertotext PICNICKER, TIFFANY3, MEM_BUFFER_0
	scall .RegisteredNumber
	jump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext PicnickerTiffanyBeatenText, 0
	copybytetovar wTiffanyFightCount
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight3:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, TIFFANY3
	startbattle
	reloadmapafterbattle
	loadvar wTiffanyFightCount, 1
	clearflag ENGINE_TIFFANY
	end

.LoadFight1:
	loadtrainer PICNICKER, TIFFANY1
	startbattle
	reloadmapafterbattle
	loadvar wTiffanyFightCount, 2
	clearflag ENGINE_TIFFANY
	end

.LoadFight2:
	loadtrainer PICNICKER, TIFFANY2
	startbattle
	reloadmapafterbattle
	loadvar wTiffanyFightCount, 3
	clearflag ENGINE_TIFFANY
	end

.LoadFight3:
	loadtrainer PICNICKER, TIFFANY4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TIFFANY
	end

.HasPinkBow:
	scall .Gift
	verbosegiveitem PINK_BOW
	iffalse .NoRoom
	clearflag ENGINE_TIFFANY_HAS_PINK_BOW
	setevent EVENT_TIFFANY_GAVE_PINK_BOW
	jump .NumberAccepted

.NoRoom:
	jump .PackFull

.NoClefairy:
	writetext PicnickerTiffanyClefairyText
	waitbutton
	closetext
	end

.AskNumber1:
	jumpstd asknumber1f
	end

.AskNumber2:
	jumpstd asknumber2f
	end

.RegisteredNumber:
	jumpstd registerednumberf
	end

.NumberAccepted:
	jumpstd numberacceptedf
	end

.NumberDeclined:
	jumpstd numberdeclinedf
	end

.PhoneFull:
	jumpstd phonefullf
	end

.Rematch:
	jumpstd rematchf
	end

.Gift:
	jumpstd giftf
	end

.PackFull:
	jumpstd packfullf
	end

Route43Sign1:
	jumptext Route43Sign1Text

Route43Sign2:
	jumptext Route43Sign2Text

Route43TrainerTips:
	jumptext Route43TrainerTipsText

Route43FruitTree:
	fruittree FRUITTREE_ROUTE_43

Route43MaxEther:
	itemball MAX_ETHER

PokemaniacBenSeenText:
	text "나는 포켓몬을 아주 좋아해!"
	
	para "그래서 늘 언제나 계속"
	line "포켓몬이랑 함께 있단다!"
	done

PokemaniacBenBeatenText:
	text "도대체!"
	done
	

PokemaniacBenAfterBattleText:
	text "포켓몬 이외의 좋아하는 것?"
	
	para "…… 라디오의 호두님"
	line "틀림없이 예쁠꺼야"
	done
	
PokemaniacBrentSeenText:
	text "너 뭔가 희귀한"
	line "포켓몬 가지고있지 않니?"
	done

PokemaniacBrentBeatenText:
	text "내 포켓몬!"
	done
	
PokemaniacBrentAfterBattleText:
	text "나라면 희귀한 포켓몬을"
	line "가지고있는 것 만으로도 행복해"
	done

PokemaniacRonSeenText:
	text "내말좀 들어줘!"
	
	para "<RIVAL>(이)라고 하는 녀석이"
	line "내 소중한 포켓몬을"
	cont "바보취급 했어!"
	
	para "제기럴"
	line "내 포켓몬은 굉장하다니까"
	done

PokemaniacRonBeatenText:
	text "어떠니 나의 니드킹"
	line "꽤 잘하지?"
	done

PokemaniacRonAfterBattleText:
	text "어떤 포켓몬을 좋아한다는 것"
	line "사람들 각각으로 좋다고 생각해"
	
	para "강한 포켓몬 만이"
	line "포켓몬이라고는 할 수 없으니까"
	done

FisherMarvinSeenText:
	text "최근에 슬럼프에 빠졌단다"
	line "사용하고 있는 도구가 나쁜걸까"
	
	para "뭐 어떻든 기분이나 전환하자"
	line "포켓몬 승부다!"
	done
	
FisherMarvinBeatenText:
	text "졌지만"
	line "좋은 기분전환이 되었단다"
	done

FisherMarvinAfterBattleText:
	text "흐으음…… 역시 낚아 올린"
	line "포켓몬을 잡으려 한다면"
	cont "강집 할아버지의 루어볼이지"
	
	para "하이퍼볼보다도"
	line "단연 잡기 쉽단다!"
	done
	
CamperSpencerSeenText:
	text "포켓몬이랑 함께 있으면"
	line "여러가지를 할 수 있어서 즐거워!"
	done

CamperSpencerBeatenText:
	text "지면 재미없지"
	done

CamperSpencerAfterBattleText:
	text "분노의 호수에 뭔가 있니?"
	line "우리들은 캠프를 할 작정인데"
	done

PicnickerTiffanySeenText:
	text "너도 분노의 호수에 가니?"
	line "그전에 잠깐 같이 놀자!"
	done
	
PicnickerTiffanyBeatenText:
	text "너무 과하게 놀았다"
	done

PicnickerTiffanyWantsPicnicText:
	text "포켓몬이랑 함께 피크닉"
	line "너도 함께하면 어떠니?"
	done
	
PicnickerTiffanyClefairyText:;TRANSLATED
	text"저기　내　삐삐"
	line"너무　귀엽지않아?"
	done

Route43Sign1Text:
	text "이곳은 43번 도로"
	line "분노의 호수"
	cont "…… 황토마을"
	done
	
Route43Sign2Text:
	text "이곳은 43번 도로"
	line "분노의 호수"
	cont "…… 황토마을"
	done

Route43TrainerTipsText:
	text "득이 되는 게시판!"
	
	para "포켓몬에게는 타입의"
	line "상성이 있습니다"
	
	para "레벨이 높아도 그것만으로"
	line "이길 수는 없습니다"
	
	para "자신의 포켓몬 타입은"
	line "무엇이 특기고 무엇이 약한가"
	cont "파악을 해 놓읍시다"
	done
	
Route43_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  9, 51, ROUTE_43_MAHOGANY_GATE, 1
	warp_event 10, 51, ROUTE_43_MAHOGANY_GATE, 2
	warp_event 17, 35, ROUTE_43_GATE, 3
	warp_event 17, 31, ROUTE_43_GATE, 1
	warp_event 18, 31, ROUTE_43_GATE, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event 13,  3, BGEVENT_READ, Route43Sign1
	bg_event 11, 49, BGEVENT_READ, Route43Sign2
	bg_event 16, 38, BGEVENT_READ, Route43TrainerTips

	db 8 ; object events
	object_event 13,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPokemaniacBen, -1
	object_event 13, 20, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacBrent, -1
	object_event 14,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPokemaniacRon, -1
	object_event  4, 16, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerFisherMarvin, -1
	object_event  9, 25, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerTiffany, -1
	object_event 13, 40, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperSpencer, -1
	object_event  1, 26, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route43FruitTree, -1
	object_event 12, 32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route43MaxEther, EVENT_ROUTE_43_MAX_ETHER
