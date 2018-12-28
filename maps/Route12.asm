	const_def 2 ; object constants
	const ROUTE12_FISHER1
	const ROUTE12_FISHER2
	const ROUTE12_FISHER3
	const ROUTE12_FISHER4
	const ROUTE12_POKE_BALL1
	const ROUTE12_POKE_BALL2

Route12_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerFisherKyle:
	trainer FISHER, KYLE, EVENT_BEAT_FISHER_KYLE, FisherKyleSeenText, FisherKyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherKyleAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMartin:
	trainer FISHER, MARTIN, EVENT_BEAT_FISHER_MARTIN, FisherMartinSeenText, FisherMartinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMartinAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherStephen:
	trainer FISHER, STEPHEN, EVENT_BEAT_FISHER_STEPHEN, FisherStephenSeenText, FisherStephenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherStephenAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherBarney:
	trainer FISHER, BARNEY, EVENT_BEAT_FISHER_BARNEY, FisherBarneySeenText, FisherBarneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherBarneyAfterBattleText
	waitbutton
	closetext
	end

Route12Sign:
	jumptext Route12SignText

FishingSpotSign:
	jumptext FishingSpotSignText

Route12Calcium:
	itemball CALCIUM

Route12Nugget:
	itemball NUGGET

Route12HiddenElixer:
	hiddenitem ELIXER, EVENT_ROUTE_12_HIDDEN_ELIXER

FisherMartinSeenText:
	text "낚시는 인내"
	line "포켓몬도 인내!"
	done
	
FisherMartinBeatenText:
	text "인 인!"
	done

FisherMartinAfterBattleText:
	text "성격이 급한 나는"
	line "낚시는 어울리지 않을지도……"
	done

FisherStephenSeenText:
	text "낚시를 하면서 라디오에"
	line "귀를 기울이는 행복!"
	done

FisherStephenBeatenText:
	text "라디오를 들어가면서였기에……"
	line "그래서 진거야!"
	done

FisherStephenAfterBattleText:
	text "관동의 라디오 방송"
	line "들어본 적 있니?"
	cont "여러 방송을 하고있단다"
	done

FisherBarneySeenText:
	text "일상의 생활에서"
	line "소중한 것은 뭘까요?"
	done
	
FisherBarneyBeatenText:
	text "정답은 이 다음 바로!"
	done
	
FisherBarneyAfterBattleText:
	text "나는 역시"
	line "전기라고 생각한다"
	
	para "그게 아니라면 발전소가"
	line "움직이지 않는 정도로 그렇게"
	cont "모두들 법석거리지는 않을꺼야"
	done

FisherKyleSeenText:
	text "너는 기억하고 있니……!?"
	done

FisherKyleBeatenText:
	text "기억하고 있냐구-!?"
	done

FisherKyleAfterBattleText:
	text "포켓몬이 낚일 때의"
	line "그 낚싯대에 전해지는 느낌!"
	cont "낚시의 묘미야!"
	done

Route12SignText:
	text "이곳은 12번 도로"
	line "북쪽 …… 보라타운"
	done
	
FishingSpotSignText:
	text "이곳은 낚시의 명소"
	done

Route12_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 11, 33, ROUTE_12_SUPER_ROD_HOUSE, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event 11, 27, BGEVENT_READ, Route12Sign
	bg_event 13,  9, BGEVENT_READ, FishingSpotSign
	bg_event 14, 13, BGEVENT_ITEM, Route12HiddenElixer

	db 6 ; object events
	object_event  5, 13, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherMartin, -1
	object_event 14, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherStephen, -1
	object_event 10, 38, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerFisherBarney, -1
	object_event  6,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherKyle, -1
	object_event  5, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12Calcium, EVENT_ROUTE_12_CALCIUM
	object_event  5, 51, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12Nugget, EVENT_ROUTE_12_NUGGET
