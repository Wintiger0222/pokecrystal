	const_def 2 ; object constants
	const DRAGONSDENB1F_POKE_BALL1
	const DRAGONSDENB1F_CLAIR
	const DRAGONSDENB1F_SILVER
	const DRAGONSDENB1F_COOLTRAINER_M
	const DRAGONSDENB1F_COOLTRAINER_F
	const DRAGONSDENB1F_TWIN1
	const DRAGONSDENB1F_TWIN2
	const DRAGONSDENB1F_POKE_BALL2
	const DRAGONSDENB1F_POKE_BALL3

DragonsDenB1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DRAGONSDENB1F_NOTHING
	scene_script .DummyScene1 ; SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .CheckSilver

.DummyScene0:
	end

.DummyScene1:
	end

.CheckSilver:
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iftrue .CheckDay
	disappear DRAGONSDENB1F_SILVER
	return

.CheckDay:
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .AppearSilver
	ifequal THURSDAY, .AppearSilver
	disappear DRAGONSDENB1F_SILVER
	return

.AppearSilver:
	appear DRAGONSDENB1F_SILVER
	return

DragonsDenB1F_ClairScene:
	appear DRAGONSDENB1F_CLAIR
	opentext
	writetext ClairText_Wait
	pause 30
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, LEFT
	playmusic MUSIC_CLAIR
	applymovement DRAGONSDENB1F_CLAIR, MovementDragonsDen_ClairWalksToYou
	opentext
	writetext ClairText_GiveDragonbreathDragonDen
	buttonsound
	giveitem TM_DRAGONBREATH
	iffalse .BagFull
	getitemname STRING_BUFFER_3, TM_DRAGONBREATH
	writetext NotifyReceiveDragonbreath
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext ClairText_DescribeDragonbreathDragonDen
	buttonsound
	writetext ClairText_WhatsTheMatterDragonDen
	waitbutton
	closetext
	sjump .FinishClair

.BagFull:
	writetext ClairText_NoRoom
	waitbutton
	closetext
.FinishClair:
	applymovement DRAGONSDENB1F_CLAIR, MovementDragonsDen_ClairWalksAway
	special FadeOutMusic
	pause 30
	special RestartMapMusic
	disappear DRAGONSDENB1F_CLAIR
	setscene SCENE_DRAGONSDENB1F_NOTHING
	end

TrainerCooltrainermDarin:
	trainer COOLTRAINERM, DARIN, EVENT_BEAT_COOLTRAINERM_DARIN, CooltrainermDarinSeenText, CooltrainermDarinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermDarinAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfCara:
	trainer COOLTRAINERF, CARA, EVENT_BEAT_COOLTRAINERF_CARA, CooltrainerfCaraSeenText, CooltrainerfCaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfCaraAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsLeaandpia1:
	trainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, TwinsLeaandpia1SeenText, TwinsLeaandpia1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsLeaandpia1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsLeaandpia2:
	trainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, TwinsLeaandpia2SeenText, TwinsLeaandpia2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsLeaandpia2AfterBattleText
	waitbutton
	closetext
	end

DragonsDenB1FDragonFangScript:
; This whole script is written out rather than as an itemball
; because it's left over from the GS event.
	giveitem DRAGON_FANG
	iffalse .BagFull
	disappear DRAGONSDENB1F_POKE_BALL1
	opentext
	getitemname STRING_BUFFER_3, DRAGON_FANG
	writetext Text_FoundDragonFang
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

.BagFull:
	opentext
	getitemname STRING_BUFFER_3, DRAGON_FANG
	writetext Text_FoundDragonFang
	buttonsound
	writetext Text_NoRoomForDragonFang
	waitbutton
	closetext
	end

DragonsDenB1FSilverScript:
	playmusic MUSIC_RIVAL_ENCOUNTER
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .SilverTalkAgain
	writetext SilverText_Training1
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	special RestartMapMusic
	end

.SilverTalkAgain:
	writetext SilverText_Training2
	waitbutton
	closetext
	special RestartMapMusic
	end

DragonShrineSignpost:
	jumptext DragonShrineSignpostText

DragonsDenB1FCalcium:
	itemball CALCIUM

DragonsDenB1FMaxElixer:
	itemball MAX_ELIXER

DragonsDenB1FHiddenRevive:
	hiddenitem REVIVE, EVENT_DRAGONS_DEN_B1F_HIDDEN_REVIVE

DragonsDenB1FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_POTION

DragonsDenB1FHiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_ELIXER

MovementDragonsDen_ClairWalksToYou:
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	step_end

MovementDragonsDen_ClairWalksAway:
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	step_end

ClairText_Wait:
	text "기다려!"
	done
	
ClairText_GiveDragonbreathDragonDen:
	text"이향『아깐 미안했어…"
	line"사과의 표시로 이걸 받아줘"
	done

NotifyReceiveDragonbreath:
	text "<PLAYER>는(은) 이향으로부터"
	line "기술머신24를 얻었다!"
	done

ClairText_DescribeDragonbreathDragonDen:
	text"안에 들어 있는 것은"
	line"용의 숨결"

	para"…… 그다지 화려하진 않아"
	line"필요 없으면 무리해서"
	cont"가지고 가지 않아도 좋아"
	done

ClairText_NoRoom:
	text"어라?"
	line"그 이상은 지닐 수 없는거 같네…"
	cont"체육관에서 기다릴게"
	cont"갖고싶다면 정리 하고 오도록 해"
	done

ClairText_WhatsTheMatterDragonDen:
	text"이향『뭐하고있어?"
	line"포켓몬리그에 갈거잖아?"

	para"어디있는진 알고 있는거야?"

	para"여기서 라면 흠…"
	line"일단 연두마을에 가는게 좋겠네"

	para"거기서 파도타기로"
	line"동쪽으로 가다보면"
	cont"포켓몬리그에 도착할거야"
	cont"분명 험난한 길이 될거야"

	para"하지만…　포켓몬리그라도"
	line"지면 절대 용서 안할거야!"

	para"네가 져버리면 뱃지를 건낸게"
	line"의미가 없어지잖아!"

	para"…응원할게"
	done

DragonShrineSignpostText:
	text"용의 사당"

	para"용이 굴에 있다고 한다"
	line"드래곤 포켓몬을 받들어 모신다"
	done

SilverText_Training1:
	text"……　……　……"
	line"뭐야 <PLAYER>(이)잖아……"

	para"……　미안하지만 너의"
	line"상대가 되어줄 생각은 없다"

	para"지금의 이 녀석들로서는"
	line"너에게 이길 수 없으니까"
	cont"그런 무책임한 짓은 시킬 수 없지"

	para"그렇게하지 않으면"
	line"최강의 트레이너는"
	cont"될 수 없으니까……"
	done

SilverText_Training2:
	text"……　……　……"

	para"후우……"
	line"사람의 방해를 해서는 안되지!"
	done

CooltrainermDarinSeenText:
	text"네놈!　뭐하는 놈이냐!"
	line"멋대로 들어오지 말라고!"
	done
	
CooltrainermDarinBeatenText:
	text"으윽 강해!"
	done

CooltrainermDarinAfterBattleText:
	text"이 앞에 있는 사당엔"
	line"우리 드래곤 조련사 일족의"
	cont"장로님이 계신다…"

	para"멋대로 쳐들어가서"
	line"실례되는 짓거리는 하지 말라고!"
	done

CooltrainerfCaraSeenText:
	text"이런데까지"
	line"들어오면 안되는거 아니니!"
	done

CooltrainerfCaraBeatenText:
	text"싫어어　져버렸어어"
	done

CooltrainerfCaraAfterBattleText:
	text"조금만 있으면 장로님이"
	line"드래곤을 써도 좋다고 허락해 주실거야"

	para"허락을 받은 다음엔"
	line"장로님도 인정할정도의"
	cont"훌륭한 드래곤 조련사가 될테야"
	done

TwinsLeaandpia1SeenText:
	text"모르는 사람이에요ー"
	done

TwinsLeaandpia1BeatenText:
	text"아파요ー"
	done

TwinsLeaandpia1AfterBattleText:
	text"왠지 목호오빠를"
	line"상대한거 같은 기분이에요ー"
	done

TwinsLeaandpia2SeenText:
	text"당신 누구인가요ー"
	done

TwinsLeaandpia2BeatenText:
	text"너무해요ー"
	done

TwinsLeaandpia2AfterBattleText:
	text"할아버지한테 일러바쳐서"
	line"엄청 혼내달라고 할거에요ー"
	done

Text_FoundDragonFang:
	text "<PLAYER>는(은)"
	line "@"
	text_ram wStringBuffer3
	text "를(을)"
	cont "발견했다!"
	done

Text_NoRoomForDragonFang:
	text "그러나 <PLAYER>는(은)"
	line "더 이상 도구를 지닐 수 없다!"
	done

DragonsDenB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 20,  3, DRAGONS_DEN_1F, 3
	warp_event 19, 29, DRAGON_SHRINE, 1

	db 1 ; coord events
	coord_event 19, 30, SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM, DragonsDenB1F_ClairScene

	db 4 ; bg events
	bg_event 18, 24, BGEVENT_READ, DragonShrineSignpost
	bg_event 33, 29, BGEVENT_ITEM, DragonsDenB1FHiddenRevive
	bg_event 21, 17, BGEVENT_ITEM, DragonsDenB1FHiddenMaxPotion
	bg_event 31, 15, BGEVENT_ITEM, DragonsDenB1FHiddenMaxElixer

	db 9 ; object events
	object_event 35, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FDragonFangScript, EVENT_DRAGONS_DEN_B1F_DRAGON_FANG
	object_event 14, 30, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRAGONS_DEN_CLAIR
	object_event 20, 23, SPRITE_SILVER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FSilverScript, EVENT_RIVAL_DRAGONS_DEN
	object_event 20,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermDarin, -1
	object_event  8,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfCara, -1
	object_event  4, 17, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsLeaandpia1, -1
	object_event  4, 18, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsLeaandpia2, -1
	object_event 30,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DragonsDenB1FCalcium, EVENT_DRAGONS_DEN_B1F_CALCIUM
	object_event  5, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DragonsDenB1FMaxElixer, EVENT_DRAGONS_DEN_B1F_MAX_ELIXER
