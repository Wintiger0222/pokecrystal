	const_def 2 ; object constants
	const ROUTE21_SWIMMER_GIRL
	const ROUTE21_SWIMMER_GUY
	const ROUTE21_FISHER

Route21_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmermSeth:
	trainer SWIMMERM, SETH, EVENT_BEAT_SWIMMERM_SETH, SwimmermSethSeenText, SwimmermSethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSethAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfNikki:
	trainer SWIMMERF, NIKKI, EVENT_BEAT_SWIMMERF_NIKKI, SwimmerfNikkiSeenText, SwimmerfNikkiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNikkiAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherArnold:
	trainer FISHER, ARNOLD, EVENT_BEAT_FISHER_ARNOLD, FisherArnoldSeenText, FisherArnoldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherArnoldAfterBattleText
	waitbutton
	closetext
	end

SwimmermSethSeenText:
	text "힘내라!"
	line "육지가 보인다!"
	done

SwimmermSethBeatenText:
	text "풍덩!"
	done

SwimmermSethAfterBattleText:
	text "홍련마을의 분화구에서"
	line "폼을 잡던 녀석이 한명 있었는데"
	done

SwimmerfNikkiSeenText:
	text "내가 이기면 내몸에 선텐오일을"
	line "발라주었으면 좋겠어!"
	done

SwimmerfNikkiBeatenText:
	text "햇볕에 탄 피부가 걱정이야……"
	done

SwimmerfNikkiAfterBattleText:
	text "기미 주근깨가 걱정이야"
	line "지금 그런 것을 주의할 나이니까"
	done

FisherArnoldSeenText:
	text "낚시도 질렸다!"
	line "그래! 승부다!"
	done

FisherArnoldBeatenText:
	text "참패했다……"
	done

FisherArnoldAfterBattleText:
	text "얌전하게 낚시를 하고있어……"
	done

Route21_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 11, 16, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNikki, -1
	object_event  2, 30, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSeth, -1
	object_event 14, 22, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherArnold, -1
