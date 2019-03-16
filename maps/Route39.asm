	const_def 2 ; object constants
	const ROUTE39_SAILOR
	const ROUTE39_POKEFAN_M
	const ROUTE39_POKEFAN_F1
	const ROUTE39_MILTANK1
	const ROUTE39_MILTANK2
	const ROUTE39_MILTANK3
	const ROUTE39_MILTANK4
	const ROUTE39_PSYCHIC_NORMAN
	const ROUTE39_FRUIT_TREE
	const ROUTE39_POKEFAN_F2

Route39_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route39Miltank:
	opentext
	writetext Route39MiltankText
	cry MILTANK
	waitbutton
	closetext
	end

TrainerPokefanmDerek:
	trainer POKEFANM, DEREK1, EVENT_BEAT_POKEFANM_DEREK, PokefanmDerekSeenText, PokefanmDerekBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_POKEFANM_DEREK
	endifjustbattled
	opentext
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftrue .HasNugget
	checkcellnum PHONE_POKEFANM_DEREK
	iftrue .NumberAccepted
	checkpoke PIKACHU
	iffalse .WantsPikachu
	checkevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PokefanMDerekText_NotBragging
	buttonsound
	setevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEFANM_DEREK
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, POKEFANM, DEREK1
	scall .RegisteredNumber
	sjump .NumberAccepted

.HasNugget:
	scall .Gift
	verbosegiveitem NUGGET
	iffalse .NoRoom
	clearflag ENGINE_DEREK_HAS_NUGGET
	sjump .NumberAccepted

.NoRoom:
	sjump .PackFull

.WantsPikachu:
	writetext PokefanMDerekPikachuIsItText
	waitbutton
	closetext
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

.Gift:
	jumpstd giftm
	end

.PackFull:
	jumpstd packfullm
	end

TrainerPokefanfRuth:
	trainer POKEFANF, RUTH, EVENT_BEAT_POKEFANF_RUTH, PokefanfRuthSeenText, PokefanfRuthBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfRuthAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorEugene:
	trainer SAILOR, EUGENE, EVENT_BEAT_SAILOR_EUGENE, SailorEugeneSeenText, SailorEugeneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorEugeneAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicNorman:
	trainer PSYCHIC_T, NORMAN, EVENT_BEAT_PSYCHIC_NORMAN, PsychicNormanSeenText, PsychicNormanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNormanAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfJaime:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_POKEFANF_JAIME
	iftrue .Beaten
	writetext PokefanfJaimeSeenText
	waitbutton
	closetext
	winlosstext PokefanfJaimeBeatenText, 0
	loadtrainer POKEFANF, JAIME
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEFANF_JAIME
	closetext
	end

.Beaten:
	writetext PokefanfJaimeAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext PokefanfJaimeHopeItGetsDarkText
	waitbutton
	closetext
	end

Route39Sign:
	jumptext Route39SignText

MoomooFarmSign:
	jumptext MoomooFarmSignText

Route39TrainerTips:
	jumptext Route39TrainerTipsText

Route39FruitTree:
	fruittree FRUITTREE_ROUTE_39

Route39HiddenNugget:
	hiddenitem NUGGET, EVENT_ROUTE_39_HIDDEN_NUGGET

Route39MiltankText:
	text"ミルタンク『ン　モー!"
	done

SailorEugeneSeenText:
	text"ひさしぶりにアサギにもどってきた"
	line"どれ　ポケモン　たたかわせてみるか!"
	done

SailorEugeneBeatenText:
	text"がーん!"
	done

SailorEugeneAfterBattleText:
	text "내 포켓몬"
	line "외국에서 잡아서 키웠단다"
	cont "오랜 선상생활의 소중한 녀석이지!"
	done

PokefanmDerekSeenText:
	text"わたしの　ピカチュウちゃん"
	line"じまん　しちゃおうかな!"
	done

PokefanmDerekBeatenText:
	text"ピカチュウちゃんを　じまん"
	line"する　ひまが　なかった…"
	done

PokefanMDerekText_NotBragging:
	text "사람의 자랑꺼리는 듣지않는다!"
	line "왜냐면 그것이"
	cont "애호가 클럽의 규칙!"
	done
	
PokefanfRuthSeenText:
	text "너 귀여운 포켓몬을"
	line "보여주지 않으려고?"
	done

PokefanfRuthBeatenText:
	text "졌어도 괜찮아요"
	done

PokefanfRuthAfterBattleText:
	text "당신은 포켓몬의"
	line "아기라는 것을 알고 있나요?"
	cont "틀림없이 매우 귀여울꺼예요"
	done

PokefanMDerekPikachuIsItText:
	text"やっぱり　ピカチュウでしょう!"
	line"キミも　そうだと　おもいませんか?"
	done

PsychicNormanSeenText:
	text "너의 포켓몬"
	line "무엇을 할 수 있나 보여줘!"
	done

PsychicNormanBeatenText:
	text "좋구나 너의 포켓몬"
	line "좋은 가능성을 가지고 있구나"
	done

PsychicNormanAfterBattleText:
	text "포켓몬은 여러가지"
	line "능력을 지니고있지"
	
	para "그것처럼 사람도"
	line "여러 가능성을 가지고 있는거야"
	done

PokefanfJaimeHopeItGetsDarkText:
	text"うふふっ"
	line"はやく　よるにならないかしら"
	done

PokefanfJaimeSeenText:
	text"ちょうど　よかった"
	line"ポケモン　しょうぶ　しましょう"
	done

PokefanfJaimeBeatenText:
	text"あら　ざんねん　だわ…"
	done

PokefanfJaimeAfterBattleText:
	text"この　ニャースちゃんとは　よるに"
	line"この　39ばん　どうろで　であったの"

	para"だからなのかは　わからない　けど…"
	line"よるにこのばしょで　つよくなると"
	cont"とっても　きげんが　よくって"

	para"ほかの　ばしょで　つよく　なるよりも"
	line"たくさん　なついてくれる　みたいなの"
	done


Route39SignText:
	text "이곳은 39번 도로"
	line "담청시티 …… 인주시티"
	done

MoomooFarmSignText:
	text "튼튼 목장"
	line "맛있는 직접 짠 우유를 드세요!"
	done

Route39TrainerTipsText:
	text "득이 되는 게시판!"
	
	para "박치기로 나무를 흔들 때"
	line "떨어지는 포켓몬은"
	cont "나무에따라 여러가지입니다"
	
	para "여러 나무에 박치기를 합시다!"
	done

Route39_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  1,  3, ROUTE_39_BARN, 1
	warp_event  5,  3, ROUTE_39_FARMHOUSE, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event  5, 31, BGEVENT_READ, Route39TrainerTips
	bg_event  9,  5, BGEVENT_READ, MoomooFarmSign
	bg_event 15,  7, BGEVENT_READ, Route39Sign
	bg_event  5, 13, BGEVENT_ITEM, Route39HiddenNugget

	db 10 ; object events
	object_event 13, 29, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSailorEugene, -1
	object_event 10, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmDerek, -1
	object_event 11, 19, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanfRuth, -1
	object_event  3, 12, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  6, 11, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  4, 15, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  8, 13, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event 13,  7, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicNorman, -1
	object_event  9,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39FruitTree, -1
	object_event  4, 22, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerPokefanfJaime, -1
