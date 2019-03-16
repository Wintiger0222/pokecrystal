	const_def 2 ; object constants
	const SAFFRONGYM_SABRINA
	const SAFFRONGYM_GRANNY1
	const SAFFRONGYM_YOUNGSTER1
	const SAFFRONGYM_GRANNY2
	const SAFFRONGYM_YOUNGSTER2
	const SAFFRONGYM_GYM_GUY

SaffronGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SaffronGymSabrinaScript:
	faceplayer
	opentext
	checkflag ENGINE_MARSHBADGE
	iftrue .FightDone
	writetext SabrinaIntroText
	waitbutton
	closetext
	winlosstext SabrinaWinLossText, 0
	loadtrainer SABRINA, SABRINA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SABRINA
	setevent EVENT_BEAT_MEDIUM_REBECCA
	setevent EVENT_BEAT_MEDIUM_DORIS
	setevent EVENT_BEAT_PSYCHIC_FRANKLIN
	setevent EVENT_BEAT_PSYCHIC_JARED
	opentext
	writetext ReceivedMarshBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MARSHBADGE
	writetext SabrinaMarshBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext SabrinaFightDoneText
	waitbutton
	closetext
	end

TrainerMediumRebecca:
	trainer MEDIUM, REBECCA, EVENT_BEAT_MEDIUM_REBECCA, MediumRebeccaSeenText, MediumRebeccaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumRebeccaAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicFranklin:
	trainer PSYCHIC_T, FRANKLIN, EVENT_BEAT_PSYCHIC_FRANKLIN, PsychicFranklinSeenText, PsychicFranklinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFranklinAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumDoris:
	trainer MEDIUM, DORIS, EVENT_BEAT_MEDIUM_DORIS, MediumDorisSeenText, MediumDorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumDorisAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicJared:
	trainer PSYCHIC_T, JARED, EVENT_BEAT_PSYCHIC_JARED, PsychicJaredSeenText, PsychicJaredBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicJaredAfterBattleText
	waitbutton
	closetext
	end

SaffronGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SABRINA
	iftrue .SaffronGymGuyWinScript
	writetext SaffronGymGuyText
	waitbutton
	closetext
	end

.SaffronGymGuyWinScript:
	writetext SaffronGymGuyWinText
	waitbutton
	closetext
	end

SaffronGymStatue:
	checkflag ENGINE_MARSHBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, SABRINA, SABRINA1
	jumpstd gymstatue2

SabrinaIntroText:
	text "초련『…… 역시 왔구나!"
	
	para "네가 올꺼라는 예감이"
	line "3년전부터 있었어"
	
	para "너의 목적은"
	line "다시말해 내가 가진 이 배지"
	
	para "나는 싸움을"
	line "좋아하지 않지만……"
	cont "배지를 어울리는 사람에게"
	cont "전하는 것이 관장의 사명"
	
	para "네가 원한다면"
	line "나의 에스퍼 능력을"
	cont "보여주겠어!"
	done

SabrinaWinLossText:
	text "초련『이 강력함……!"
	line "예상을 뛰어넘는구나……!"
	cont "완벽하게 미래 예지는"
	cont "되지 않는 것 일지도……"
	
	para "잘 알겠다 나의"
	line "골드배지를"
	cont "너에게 주겠어"
	done

ReceivedMarshBadgeText:
	text "<PLAYER>는(은)"
	line "골드배지를 얻었다!"
	done

SabrinaMarshBadgeText:
	text "초련『그 골드배지는"
	line "너의 잠재되어 있는 힘을"
	cont "끌어내어 주는 물건……"
	
	para "너의 강함을"
	line "정확하게 예지하지 못 했지만"
	cont "이것만은 확실히 알아……"
	
	para "너의 미래는 밝고"
	line "훌륭한 챔피언으로서"
	cont "모두에게 환영받을꺼야!"
	done

SabrinaFightDoneText:
	text "초련『……너의"
	line "포켓몬을 향한 애정이"
	cont "나의 초능력보다"
	cont "뛰어난 것 같아……"
	
	para "그 애정의 힘도"
	line "초능력의 한가지"
	cont "난 그렇게 생각해……"
	done

MediumRebeccaSeenText:
	text "그대가 쓰러뜨려 온"
	line "것들의 힘이"
	cont "나의 몸에 전해져 온다!"
	done

MediumRebeccaBeatenText:
	text "강하다 너무 강해!"
	done

MediumRebeccaAfterBattleText:
	text "그대의 힘의 원류는"
	line "어디인가!"
	done
	
PsychicFranklinSeenText:
	text "초능력은"
	line "마음의 힘!"
	done

PsychicFranklinBeatenText:
	text "마음의 강함에"
	line "졌-다!!"
	done

PsychicFranklinAfterBattleText:
	text "기술뿐이 아니라"
	line "마음까지도 단련되어져 있다!"
	done
	
MediumDorisSeenText:
	text "후후후……"
	line "보인다 보여……!"
	
	para "그대의 마음속이"
	line "확실하게 보이는구나!"
	done
	
MediumDorisBeatenText:
	text "마음속을 읽어도"
	line "지는 것은 지는 것!"
	done

MediumDorisAfterBattleText:
	text "이럴 수가!"
	line "그대에게 질 것을"
	cont "예측하고 있었는데"
	cont "잊고있었다!"
	done
	
PsychicJaredSeenText:
	text "옆의 격투 도장은"
	line "이전에 이 마을의"
	cont "체육관이었다!"
	done

PsychicJaredBeatenText:
	text "생각대로 되지 않는군……"
	done

PsychicJaredAfterBattleText:
	text "도장의 사범"
	line "태권왕도"
	
	para "초련에게 호되게"
	line "당했단다!"
	done

SaffronGymGuyText:
	text "여어!"
	line "미래의 챔피언!"
	
	para "너 정도의 트레이너라면"
	line "에스퍼타입의 공략방법쯤은"
	cont "물론 알고 있겠지!"
	
	para "기대하겠어!"
	line "행운을 빌께!"
	done

SaffronGymGuyWinText:
	text "훌륭한 시합이었다!"
	done
	
SaffronGym_MapEvents:
	db 0, 0 ; filler

	db 32 ; warp events
	warp_event  8, 17, SAFFRON_CITY, 2
	warp_event  9, 17, SAFFRON_CITY, 2
	warp_event 11, 15, SAFFRON_GYM, 18
	warp_event 19, 15, SAFFRON_GYM, 19
	warp_event 19, 11, SAFFRON_GYM, 20
	warp_event  1, 11, SAFFRON_GYM, 21
	warp_event  5,  3, SAFFRON_GYM, 22
	warp_event 11,  5, SAFFRON_GYM, 23
	warp_event  1, 15, SAFFRON_GYM, 24
	warp_event 19,  3, SAFFRON_GYM, 25
	warp_event 15, 17, SAFFRON_GYM, 26
	warp_event  5, 17, SAFFRON_GYM, 27
	warp_event  5,  9, SAFFRON_GYM, 28
	warp_event  9,  3, SAFFRON_GYM, 29
	warp_event 15,  9, SAFFRON_GYM, 30
	warp_event 15,  5, SAFFRON_GYM, 31
	warp_event  1,  5, SAFFRON_GYM, 32
	warp_event 19, 17, SAFFRON_GYM, 3
	warp_event 19,  9, SAFFRON_GYM, 4
	warp_event  1,  9, SAFFRON_GYM, 5
	warp_event  5,  5, SAFFRON_GYM, 6
	warp_event 11,  3, SAFFRON_GYM, 7
	warp_event  1, 17, SAFFRON_GYM, 8
	warp_event 19,  5, SAFFRON_GYM, 9
	warp_event 15, 15, SAFFRON_GYM, 10
	warp_event  5, 15, SAFFRON_GYM, 11
	warp_event  5, 11, SAFFRON_GYM, 12
	warp_event  9,  5, SAFFRON_GYM, 13
	warp_event 15, 11, SAFFRON_GYM, 14
	warp_event 15,  3, SAFFRON_GYM, 15
	warp_event  1,  3, SAFFRON_GYM, 16
	warp_event 11,  9, SAFFRON_GYM, 17

	db 0 ; coord events

	db 1 ; bg events
	bg_event  8, 15, BGEVENT_READ, SaffronGymStatue

	db 6 ; object events
	object_event  9,  8, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronGymSabrinaScript, -1
	object_event 17, 16, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerMediumRebecca, -1
	object_event  3, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicFranklin, -1
	object_event  3,  4, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerMediumDoris, -1
	object_event 17,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicJared, -1
	object_event  9, 14, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronGymGuyScript, -1
