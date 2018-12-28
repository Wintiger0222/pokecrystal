	const_def 2 ; object constants
	const ROUTE14_POKEFAN_M1
	const ROUTE14_YOUNGSTER
	const ROUTE14_POKEFAN_M2
	const ROUTE14_KIM

Route14_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Kim:
	faceplayer
	opentext
	trade NPC_TRADE_KIM
	waitbutton
	closetext
	end

TrainerPokefanmCarter:
	trainer POKEFANM, CARTER, EVENT_BEAT_POKEFANM_CARTER, PokefanmCarterSeenText, PokefanmCarterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmCarterAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperRoy:
	trainer BIRD_KEEPER, ROY, EVENT_BEAT_BIRD_KEEPER_ROY, BirdKeeperRoySeenText, BirdKeeperRoyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRoyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmTrevor:
	trainer POKEFANM, TREVOR, EVENT_BEAT_POKEFANM_TREVOR, PokefanmTrevorSeenText, PokefanmTrevorBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmTrevorAfterBattleText
	waitbutton
	closetext
	end

PokefanmCarterSeenText:	
	text "고생해서 손에 넣은"
	line "자랑스런 포켓몬과 승부다!"
	done
	
PokefanmCarterBeatenText:
	text "우와아……!"
	done

PokefanmCarterAfterBattleText:
	text "꼬부기 파이리 이상해씨"
	line "이 조합은 확실히"
	cont "밸런스가 좋다고 생각한다!"
	done
	
BirdKeeperRoySeenText:
	text "제일 좋아하는 새 포켓몬과"
	line "넓은 하늘을 나는 것이 나의 꿈!"
	done

BirdKeeperRoyBeatenText:
	text "푸드득 푸드득!"
	line "날개를 펼쳐도 나는 날 수 없군!"
	done

BirdKeeperRoyAfterBattleText:
	text "너의 포켓몬"
	line "비전 기술 공중날기라는 것"
	cont "물론 가르쳤겠지?"
	cont "부럽구낭……"
	done
	
PokefanmTrevorSeenText:
	text "Hi. Did you know…?"

	para "#MON get more"
	line "friendly if you"

	para "train them in a"
	line "place that they"
	cont "remember."
	done

PokefanmTrevorBeatenText:
	text "Where did I meet"
	line "this PSYDUCK?"
	done

PokefanmTrevorAfterBattleText:
	text "If only there were"
	line "an easy way to"

	para "identify where I"
	line "got my #MON…"
	done

;PokefanmTrevorSeenText_Old:	
;	text "체육관 트레이너 전원과"
;	line "싸웠단말인가?"
;	done
	
;PokefanmTrevorBeatenText_Old:	
;	text "우와-!"
;	line "강하다!!"
;	done
	
;UnknownText_0x1ad660_Old:	
;	text "관동지방의 배지를 가지고 있으면"
;	line "대전에서 유리하게 된단다!"
;	done
	
	
Route14_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 11, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmCarter, -1
	object_event 11, 27, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRoy, -1
	object_event  6, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmTrevor, -1
	object_event  7,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 4, Kim, -1
