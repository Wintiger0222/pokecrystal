	const_def 2 ; object constants
	const ROUTE36_YOUNGSTER1
	const ROUTE36_YOUNGSTER2
	const ROUTE36_WEIRD_TREE
	const ROUTE36_LASS1
	const ROUTE36_FISHER
	const ROUTE36_FRUIT_TREE
	const ROUTE36_ARTHUR
	const ROUTE36_FLORIA
	const ROUTE36_SUICUNE

Route36_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE36_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE36_SUICUNE

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ArthurCallback

.DummyScene0:
	end

.DummyScene1:
	end

.ArthurCallback:
	checkcode VAR_WEEKDAY
	ifequal THURSDAY, .ArthurAppears
	disappear ROUTE36_ARTHUR
	return

.ArthurAppears:
	appear ROUTE36_ARTHUR
	return

Route36SuicuneScript:
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	turnobject PLAYER, UP
	applymovement ROUTE36_SUICUNE, Route36SuicuneMovement
	disappear ROUTE36_SUICUNE
	turnobject PLAYER, DOWN
	pause 10
	setscene SCENE_ROUTE36_NOTHING
	clearevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setmapscene CIANWOOD_CITY, SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE
	end

SudowoodoScript:
	checkitem SQUIRTBOTTLE
	iftrue .Fight

	waitsfx
	playsound SFX_SANDSTORM
	applymovement ROUTE36_WEIRD_TREE, SudowoodoShakeMovement
	end

.Fight:
	opentext
	writetext UseSquirtbottleText
	yesorno
	iffalse DidntUseSquirtbottleScript
	closetext
WateredWeirdTreeScript:: ; export (for when you use Squirtbottle from pack)
	opentext
	writetext UsedSquirtbottleText
	waitbutton
	closetext
	waitsfx
	playsound SFX_SANDSTORM
	applymovement ROUTE36_WEIRD_TREE, SudowoodoShakeMovement
	opentext
	writetext SudowoodoAttackedText
	waitbutton
	closetext
	loadwildmon SUDOWOODO, 20
	startbattle
	setevent EVENT_FOUGHT_SUDOWOODO
	ifequal DRAW, DidntCatchSudowoodo
	disappear ROUTE36_WEIRD_TREE
	variablesprite SPRITE_WEIRD_TREE, SPRITE_TWIN
	reloadmapafterbattle
	end

DidntUseSquirtbottleScript:
	closetext
	end

DidntCatchSudowoodo:
	reloadmapafterbattle
	applymovement ROUTE36_WEIRD_TREE, WeirdTreeMovement_Flee
	disappear ROUTE36_WEIRD_TREE
	variablesprite SPRITE_WEIRD_TREE, SPRITE_TWIN
	special LoadUsedSpritesGFX
	special RefreshSprites
	end

Route36FloriaScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
	iftrue .SecondTimeTalking
	setevent EVENT_MET_FLORIA
	writetext FloriaText1
	waitbutton
	closetext
	clearevent EVENT_FLORIA_AT_FLOWER_SHOP
	checkcode VAR_FACING
	ifequal UP, .Up
	applymovement ROUTE36_FLORIA, FloriaMovement1
	disappear ROUTE36_FLORIA
	end

.Up:
	applymovement ROUTE36_FLORIA, FloriaMovement2
	disappear ROUTE36_FLORIA
	end

.SecondTimeTalking:
	writetext FloriaText2
	waitbutton
	closetext
	end

Route36RockSmashGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM08_ROCK_SMASH
	iftrue .AlreadyGotRockSmash
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .ClearedSudowoodo
	writetext RockSmashGuyText1
	waitbutton
	closetext
	end

.ClearedSudowoodo:
	writetext RockSmashGuyText2
	buttonsound
	verbosegiveitem TM_ROCK_SMASH
	iffalse .NoRoomForTM
	setevent EVENT_GOT_TM08_ROCK_SMASH
.AlreadyGotRockSmash:
	writetext RockSmashGuyText3
	waitbutton
.NoRoomForTM:
	closetext
	end

Route36LassScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .ClearedSudowoodo
IF DEF(_MOBILE)
	special Mobile_DummyReturnFalse
	iftrue .mobile
ENDC
	writetext Route36LassText
	waitbutton
	closetext
	end

.ClearedSudowoodo:
	writetext Route36LassText_ClearedSudowoodo
	waitbutton
	closetext
	end

IF DEF(_MOBILE)
.mobile
	writetext UnknownText_0x1945b8
	waitbutton
	closetext
	end
ENDC

TrainerSchoolboyAlan1:
	trainer SCHOOLBOY, ALAN1, EVENT_BEAT_SCHOOLBOY_ALAN, SchoolboyAlan1SeenText, SchoolboyAlan1BeatenText, 0, .Script

.Script:
	writecode VAR_CALLERID, PHONE_SCHOOLBOY_ALAN
	endifjustbattled
	opentext
	checkflag ENGINE_ALAN
	iftrue .ChooseRematch
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftrue .GiveFireStone
	checkcellnum PHONE_SCHOOLBOY_ALAN
	iftrue .NumberAccepted
	checkevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgainForPhoneNumber
	writetext UnknownText_0x1947aa
	buttonsound
	setevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	jump .ContinueAskForPhoneNumber

.AskAgainForPhoneNumber:
	scall .AskNumber2
.ContinueAskForPhoneNumber:
	askforphonenumber PHONE_SCHOOLBOY_ALAN
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	trainertotext SCHOOLBOY, ALAN1, MEM_BUFFER_0
	scall .RegisteredNumber
	jump .NumberAccepted

.ChooseRematch:
	scall .Rematch
	winlosstext SchoolboyAlan1BeatenText, 0
	copybytetovar wAlanFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer SCHOOLBOY, ALAN1
	startbattle
	reloadmapafterbattle
	loadvar wAlanFightCount, 1
	clearflag ENGINE_ALAN
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, ALAN2
	startbattle
	reloadmapafterbattle
	loadvar wAlanFightCount, 2
	clearflag ENGINE_ALAN
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, ALAN3
	startbattle
	reloadmapafterbattle
	loadvar wAlanFightCount, 3
	clearflag ENGINE_ALAN
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, ALAN4
	startbattle
	reloadmapafterbattle
	loadvar wAlanFightCount, 4
	clearflag ENGINE_ALAN
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, ALAN5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ALAN
	end

.GiveFireStone:
	scall .Gift
	verbosegiveitem FIRE_STONE
	iffalse .BagFull
	clearflag ENGINE_ALAN_HAS_FIRE_STONE
	setevent EVENT_ALAN_GAVE_FIRE_STONE
	jump .NumberAccepted

.BagFull:
	jump .PackFull

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

.Gift:
	jumpstd giftm
	end

.PackFull:
	jumpstd packfullm
	end

TrainerPsychicMark:
	trainer PSYCHIC_T, MARK, EVENT_BEAT_PSYCHIC_MARK, PsychicMarkSeenText, PsychicMarkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicMarkAfterBattleText
	waitbutton
	closetext
	end

ArthurScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	iftrue .AlreadyGotStone
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, ArthurNotThursdayScript
	checkevent EVENT_MET_ARTHUR_OF_THURSDAY
	iftrue .MetArthur
	writetext MeetArthurText
	buttonsound
	setevent EVENT_MET_ARTHUR_OF_THURSDAY
.MetArthur:
	writetext ArthurGivesGiftText
	buttonsound
	verbosegiveitem HARD_STONE
	iffalse .BagFull
	setevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	writetext ArthurGaveGiftText
	waitbutton
	closetext
	end

.AlreadyGotStone:
	writetext ArthurThursdayText
	waitbutton
.BagFull:
	closetext
	end

ArthurNotThursdayScript:
	writetext ArthurNotThursdayText
	waitbutton
	closetext
	end

Route36Sign:
	jumptext Route36SignText

RuinsOfAlphNorthSign:
	jumptext RuinsOfAlphNorthSignText

Route36TrainerTips1:
	jumptext Route36TrainerTips1Text

Route36TrainerTips2:
	jumptext Route36TrainerTips2Text

Route36FruitTree:
	fruittree FRUITTREE_ROUTE_36

SudowoodoShakeMovement:
	tree_shake ; shake
	step_end

WeirdTreeMovement_Flee:
	fast_jump_step UP
	fast_jump_step UP
	step_end

FloriaMovement1:
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

FloriaMovement2:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Route36SuicuneMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	remove_sliding
	step_end

UseSquirtbottleText:
	text "이상한 나무다!"
	line "꼬부기 물뿌리개를 사용하겠습니까?"
	done

UsedSquirtbottleText:
	text "<PLAYER>는(은)"
	line "꼬부기 물뿌리개를 사용했다!"
	done

SudowoodoAttackedText:
	text "이상한 나무는"
	line "꼬부기 물뿌리개를 싫어하고 있다"
	
	para "이상한 나무가 덤벼들었다"
	done

FloriaText1:;TRANSLATE
	text"나는　플라워숍의 꽃님"

	para"저기저기　들어봐　들어봐!"

	para"이상한　나무에　물을 뿌려보니"
	line"놀라서 튀어오르는거 있지!"

	para"분명　정체는　포켓몬일 거야"

	para"분명히　물을　뿌리고　있으면"
	line"정체를　드러낼 꺼야!"

	para"그래!"
	line"언니에게 이 일을　말해서"
	cont"물뿌리개　빌려달라　해야지!"
	done
	
FloriaText2:;TRANSLATE
	text"우리　언니에게"
	line"이상한　나무　얘기를　했는데"
	cont"위험하니까　그만두라고 했어!"

	para"꼭두에게 이기면"
	line"물뿌리개　빌려　주려나아……"
	done

RockSmashGuyText1:
	text "우-쒸!"
	
	para "나의 강렬한 때려부수기로"
	line "나무 한그루랑 두그루를 뚝 하고 "
	cont "부러뜨려볼까 하고 생각했는데……"
	
	para "통하지도 않지!"
	line "분하기도 하지!"
	done

RockSmashGuyText2:
	text "그대가 저 방해되는 나무를"
	line "치워주셨는가?"
	
	para "고맙다고 말하지!"
	line "이것을 드리지!"
	done

UnknownText_0x19451a:
	text "<PLAYER>는(은)"
	line "기술머신08을 받았다!"
	done

RockSmashGuyText3:
	text "내용물은 필살 바위깨기!"
	line "이것이 있으면"
	cont "돌덩어리등을 한방에 부술 수 있지"
	
	para "방해되는 돌덩어리는"
	line "부수는게 좋다고 생각하지!"
	done
	
UnknownText_0x1945b8:;TRANSLATE
	text "이상한 나무가 생겨서"
	line "금빛시티에 갈 수 없어"

	para"엄청 큰 포켓몬센터가"
	line"있다고 해서"
	cont"보러 갈려"
	done

Route36LassText:
	text "이상한 나무가 생겨서"
	line "금빛시티에 쇼핑하러 갈 수 없어"
	cont "누가 어떻게든 해주었음 좋겠는데"
	done

Route36LassText_ClearedSudowoodo:
	text "마치 없어진 것 처럼"
	line "이상한 나무가 사라져버렸다……"
	
	para "엥? 포켓몬이었다고?"
	done
	
PsychicMarkSeenText:
	text "너의 생각을 맞춰보겠다"
	done

PsychicMarkBeatenText:
	text "맞추지 못했다"
	done

PsychicMarkAfterBattleText:
	text "상대방의 생각을 읽고"
	line "공격을 할 수 있으면 강할텐데"
	done

SchoolboyAlan1SeenText:
	text "어떤 포켓몬을 상대로해도"
	line "확실히 예습은 해놓았지!"
	done

SchoolboyAlan1BeatenText:
	text "얼라리……?"
	line "계산이 틀렸나?"
	done

UnknownText_0x1947aa:
	text "우으으으으 매일 5시간씩"
	line "공부를 했었는데……"
	
	para "교과서만으로는"
	line "배울 수 없는 것이 많이 있구나"
	done

MeetArthurText:
	text "목인『넌 누구냐?"
	
	para "나는 목요일의 목인"
	done

ArthurGivesGiftText:
	text "자 이걸줄께!"
	done
	
ArthurGaveGiftText:
	text "목인『바위타입의 사용하는"
	line "포켓몬에게 지니게해봐"
	
	para "바위타입 기술의"
	line "공격력이 상승할테니까"
	done
ArthurThursdayText:
	text "목인『나는"
	line "목요일의 목인!"
	cont "7남매의 차남이야!"
	done
	
ArthurNotThursdayText:
	text "목인『오늘은 목요일이"
	line "아닌가……"
	cont "유감이군"
	done

Route36SignText:
	text "이곳은 36번 도로"
	done

RuinsOfAlphNorthSignText:
	text "알프의 유적"
	line "북쪽 입구"
	done

Route36TrainerTips1Text:
	text "득이 되는 게시판!"
	
	para "같은 종류의 포켓몬이라도"
	line "강한 정도는 여러가지"
	
	para "처음은 거의 같아도"
	line "키움에따라 크게 바뀝니다"
	done

Route36TrainerTips2Text:
	text "득이 되는 게시판!"
	
	para "구멍파기라고 하는"
	line "기술을 사용하면 순간"
	cont "입구까지 돌아올 수 있습니다"
	
	para "동굴등을 탐험할 때"
	line "그 기술을 배운 포켓몬이"
	cont "한마리 있으면 편리하겠죠"
	done

Route36_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 18,  8, ROUTE_36_NATIONAL_PARK_GATE, 3
	warp_event 18,  9, ROUTE_36_NATIONAL_PARK_GATE, 4
	warp_event 47, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 1
	warp_event 48, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 2

	db 2 ; coord events
	coord_event 20,  7, SCENE_ROUTE36_SUICUNE, Route36SuicuneScript
	coord_event 22,  7, SCENE_ROUTE36_SUICUNE, Route36SuicuneScript

	db 4 ; bg events
	bg_event 29,  1, BGEVENT_READ, Route36TrainerTips2
	bg_event 45, 11, BGEVENT_READ, RuinsOfAlphNorthSign
	bg_event 55,  7, BGEVENT_READ, Route36Sign
	bg_event 21,  7, BGEVENT_READ, Route36TrainerTips1

	db 9 ; object events
	object_event 20, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicMark, -1
	object_event 31, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSchoolboyAlan1, -1
	object_event 35,  9, SPRITE_WEIRD_TREE, SPRITEMOVEDATA_SUDOWOODO, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SudowoodoScript, EVENT_ROUTE_36_SUDOWOODO
	object_event 51,  8, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36LassScript, -1
	object_event 44,  9, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36RockSmashGuyScript, -1
	object_event 21,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36FruitTree, -1
	object_event 46,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ArthurScript, EVENT_ROUTE_36_ARTHUR_OF_THURSDAY
	object_event 33, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route36FloriaScript, EVENT_FLORIA_AT_SUDOWOODO
	object_event 21,  6, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAW_SUICUNE_ON_ROUTE_36
