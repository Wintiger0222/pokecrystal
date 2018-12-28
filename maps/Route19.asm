	const_def 2 ; object constants
	const ROUTE19_SWIMMER_GIRL
	const ROUTE19_SWIMMER_GUY1
	const ROUTE19_SWIMMER_GUY2
	const ROUTE19_SWIMMER_GUY3
	const ROUTE19_FISHER1
	const ROUTE19_FISHER2

Route19_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .ClearRocks

.ClearRocks:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .Done
	changeblock  6,  6, $7a ; rock
	changeblock  8,  6, $7a ; rock
	changeblock 10,  6, $7a ; rock
	changeblock 12,  8, $7a ; rock
	changeblock  4,  8, $7a ; rock
	changeblock 10, 10, $7a ; rock
.Done:
	return

TrainerSwimmerfDawn:
	trainer SWIMMERF, DAWN, EVENT_BEAT_SWIMMERF_DAWN, SwimmerfDawnSeenText, SwimmerfDawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDawnAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermHarold:
	trainer SWIMMERM, HAROLD, EVENT_BEAT_SWIMMERM_HAROLD, SwimmermHaroldSeenText, SwimmermHaroldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermHaroldAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermJerome:
	trainer SWIMMERM, JEROME, EVENT_BEAT_SWIMMERM_JEROME, SwimmermJeromeSeenText, SwimmermJeromeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermJeromeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermTucker:
	trainer SWIMMERM, TUCKER, EVENT_BEAT_SWIMMERM_TUCKER, SwimmermTuckerSeenText, SwimmermTuckerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermTuckerAfterBattleText
	waitbutton
	closetext
	end

Route19Fisher1Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19Fisher1Text
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19Fisher1Text_RocksCleared
	waitbutton
	closetext
	end

Route19Fisher2Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19Fisher2Text
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19Fisher2Text_RocksCleared
	waitbutton
	closetext
	end

Route19Sign:
	jumptext Route19SignText

CarefulSwimmingSign:
	jumptext CarefulSwimmingSignText

SwimmermHaroldSeenText:
	text "Have you ever gone"
	text "어두워 지고나서부터"
	line "바다에서 수영한 적 있니?"
	done
	
SwimmermHaroldBeatenText:
	text "어푸-!"
	done
	
SwimmermHaroldAfterBattleText:
	text "밤이 되면 바다가 깜깜해져서"
	line "빨려들 것 같은 기분이 든단다!"
	done

SwimmermTuckerSeenText:
	text "영차영차……"
	line "연분홍시티까지……"
	cont "으싸으싸…… 조금만 더……"
	done

SwimmermTuckerBeatenText:
	text "빠 빠져 죽겠어!"
	done

SwimmermTuckerAfterBattleText:
	text "애인에게 연분홍시티까지"
	line "헤엄치자고 말했단다……"
	cont "영차영차……"
	done

SwimmerfDawnSeenText:
	text "나는 단정하지 못한 사람"
	line "싫어한단다!"
	done

SwimmerfDawnBeatenText:
	text "수영이라면 이길 수 있는데……"
	done

SwimmerfDawnAfterBattleText:
	text "연분홍시티와 쌍둥이섬을"
	line "왕복할 정도로……"
	cont "힘을 내라! 사나이니까!"
	done

SwimmermJeromeSeenText:
	text "수영……?"
	line "특기가 아니야"
	cont "얕은 곳에서 미역감는 중이야"
	done

SwimmermJeromeBeatenText:
	text "이길 수 있다고 생각했는데……!"
	done

SwimmermJeromeAfterBattleText:
	text "수영을 잘 못해도"
	line "바다는 매우 좋아한다구!"
	done
	
Route19Fisher1Text:
	text "이곳은 공사중이라 지나갈 수 없다"
	line "홍련마을에는 태초마을"
	cont "쪽으로 돌아서 가거라"
	done

Route19Fisher1Text_RocksCleared:
	text "땀을 흠뻑 흘리고"
	line "헤엄이나 한번 쳐볼까!"
	done

Route19Fisher2Text:
	text "이 바위를 치우는데"
	line "얼마나 걸릴까……"
	done

Route19Fisher2Text_RocksCleared:
	text "드디어 공사가 끝났단다!"
	
	para "이것으로 낚시하러 갈 수 있단다!"
	done

Route19SignText:
	text "이곳은 19번 터널"
	line "연분홍시티 …… 쌍둥이섬"
	done

CarefulSwimmingSignText:
	text "헤엄쳐서 쌍둥이섬에 가는 사람은"
	line "반드시 주의해주십시오!"
	
	para "……연분홍시티 경찰서 "
	done

Route19_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  3, ROUTE_19_FUCHSIA_GATE, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event 11, 13, BGEVENT_READ, Route19Sign
	bg_event 11,  1, BGEVENT_READ, CarefulSwimmingSign

	db 6 ; object events
	object_event  9, 23, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerSwimmerfDawn, -1
	object_event 13, 28, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermHarold, -1
	object_event 11, 17, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermJerome, -1
	object_event  8, 23, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerSwimmermTucker, -1
	object_event  9,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, Route19Fisher1Script, -1
	object_event 11,  5, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, Route19Fisher2Script, -1
