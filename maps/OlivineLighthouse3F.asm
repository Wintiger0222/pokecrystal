	const_def 2 ; object constants
	const OLIVINELIGHTHOUSE3F_SAILOR
	const OLIVINELIGHTHOUSE3F_GENTLEMAN
	const OLIVINELIGHTHOUSE3F_YOUNGSTER
	const OLIVINELIGHTHOUSE3F_POKE_BALL

OlivineLighthouse3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperTheo:
	trainer BIRD_KEEPER, THEO, EVENT_BEAT_BIRD_KEEPER_THEO, BirdKeeperTheoSeenText, BirdKeeperTheoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperTheoAfterBattleText
	waitbutton
	closetext
	end

TrainerGentlemanPreston:
	trainer GENTLEMAN, PRESTON, EVENT_BEAT_GENTLEMAN_PRESTON, GentlemanPrestonSeenText, GentlemanPrestonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanPrestonAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorTerrell:
	trainer SAILOR, TERRELL, EVENT_BEAT_SAILOR_TERRELL, SailorTerrellSeenText, SailorTerrellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorTerrellAfterBattleText
	waitbutton
	closetext
	end

OlivineLighthouse3FEther:
	itemball ETHER

BirdKeeperTheoSeenText:
	text "넌 뭐냐?"
	line "문병이냐? 아님 놀리러왔냐?"
	cont "놀리러왔다면 돌아가 줘!"
	done

BirdKeeperTheoBeatenText:
	text "정말이군"
	line "문병하러 와줬구나"
	done

BirdKeeperTheoAfterBattleText:
	text "어떡게 해서 위로 올라가지?"
	line "문병하러 가고싶은데"
	cont "갈 수 없어서 곤란해 하고있어"
	done

SailorTerrellSeenText:
	text "바다의 사나이는 강함과 부드러움"
	line "그 두가지를 겸해 가지고 있다"
	cont "너는 어떠니?"
	done

SailorTerrellBeatenText:
	text "너의 싸우는 방식은"
	line "강함과 부드러움을 느끼게 한다"
	done

SailorTerrellAfterBattleText:
	text "담청시티에 되돌아왔을 때"
	line "포켓몬 체육관에 들려봤는데……"
	
	para "체육관 관장이 사용하는 포켓몬의"
	line "타입이 언제부턴가 바뀌어 있었다"
	done

GentlemanPrestonSeenText:
	text "나는 이 세상을 여행하며"
	line "포켓몬을 단련시키고 있다"
	cont "나와 약간 승부해보겠니?"
	done

GentlemanPrestonBeatenText:
	text "하아……"
	line "아직도 수행이 부족하군"
	done

GentlemanPrestonAfterBattleText:
	text "규리는 원래"
	line "롱스톤 같은 바위타입의"
	cont "포켓몬을 사용하는"
	cont "포켓몬 트레이너였다"
	done

OlivineLighthouse3F_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 13,  3, OLIVINE_LIGHTHOUSE_4F, 1
	warp_event  5,  3, OLIVINE_LIGHTHOUSE_2F, 2
	warp_event  9,  5, OLIVINE_LIGHTHOUSE_4F, 4
	warp_event 16, 11, OLIVINE_LIGHTHOUSE_2F, 5
	warp_event 17, 11, OLIVINE_LIGHTHOUSE_2F, 6
	warp_event 16,  9, OLIVINE_LIGHTHOUSE_4F, 5
	warp_event 17,  9, OLIVINE_LIGHTHOUSE_4F, 6
	warp_event  8,  3, OLIVINE_LIGHTHOUSE_4F, 7
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_4F, 8

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  9,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSailorTerrell, -1
	object_event 13,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGentlemanPreston, -1
	object_event  3,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperTheo, -1
	object_event  8,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse3FEther, EVENT_OLIVINE_LIGHTHOUSE_3F_ETHER
