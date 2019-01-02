	const_def 2 ; object constants
	const VERMILIONGYM_SURGE
	const VERMILIONGYM_GENTLEMAN
	const VERMILIONGYM_ROCKER
	const VERMILIONGYM_SUPER_NERD
	const VERMILIONGYM_GYM_GUY

VermilionGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VermilionGymSurgeScript:
	faceplayer
	opentext
	checkflag ENGINE_THUNDERBADGE
	iftrue .FightDone
	writetext LtSurgeIntroText
	waitbutton
	closetext
	winlosstext LtSurgeWinLossText, 0
	loadtrainer LT_SURGE, LT_SURGE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_GENTLEMAN_GREGORY
	setevent EVENT_BEAT_GUITARIST_VINCENT
	setevent EVENT_BEAT_JUGGLER_HORTON
	opentext
	writetext ReceivedThunderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_THUNDERBADGE
	writetext LtSurgeThunderBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext LtSurgeFightDoneText
	waitbutton
	closetext
	end

TrainerGentlemanGregory:
	trainer GENTLEMAN, GREGORY, EVENT_BEAT_GENTLEMAN_GREGORY, GentlemanGregorySeenText, GentlemanGregoryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanGregoryAfterBattleText
	waitbutton
	closetext
	end

TrainerGuitaristVincent:
	trainer GUITARIST, VINCENT, EVENT_BEAT_GUITARIST_VINCENT, GuitaristVincentSeenText, GuitaristVincentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristVincentAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerHorton:
	trainer JUGGLER, HORTON, EVENT_BEAT_JUGGLER_HORTON, JugglerHortonSeenText, JugglerHortonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerHortonAfterBattleText
	waitbutton
	closetext
	end

VermilionGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LTSURGE
	iftrue .VermilionGymGuyWinScript
	writetext VermilionGymGuyText
	waitbutton
	closetext
	end

.VermilionGymGuyWinScript:
	writetext VermilionGymGuyWinText
	waitbutton
	closetext
	end

VermilionGymTrashCan:
	jumptext VermilionGymTrashCanText

VermilionGymStatue:
	checkflag ENGINE_THUNDERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext LT_SURGE, LT_SURGE1, MEM_BUFFER_1
	jumpstd gymstatue2

LtSurgeIntroText:
	text "마티스『헤이!"
	line "푸어 리틀키드!"
	
	para "미에게 싸움을 걸다니"
	line "유는 주제도 모르는군!"
	cont "미의 일렉트로닉 포켓몬"
	cont "넘버원이다!"
	
	para "전장에서는 진 적이"
	line "없다!!"
	
	para "유-도 적군의 솔져처럼"
	line "찌릿찌릿 감전시켜주지!"
	done

LtSurgeWinLossText:
	text "마티스『오- 노-!"
	line "유-는 스트롱"
	
	para "오케이!"
	line "오렌지배지를 주마!"
	done

ReceivedThunderBadgeText:
	text "<PLAYER>는(은) 마티스로부터"
	line "오렌지배지를 얻었다!"
	done

LtSurgeThunderBadgeText:
	text "마티스『오렌지배지를 지니고 있으면"
	line "유-의 포켓몬 스피드업!"
	
	para "미에게 이겼다는 증거!"
	line "소중히 해라 굿바이!"
	done

LtSurgeFightDoneText:
	text "마티스『헤이! 키드!"
	line "열심히 하고 있나"
	
	para "미랑 포켓몬도"
	line "열심히 지내고 있단다!"
	done

GentlemanGregorySeenText:
	text "마티스 소령을"
	line "쓰러뜨리러 왔는가!"
	cont "그렇게는 놔둘 수 없다!"
	done

GentlemanGregoryBeatenText:
	text "죄송합니다!"
	line "마티스 소령님!"
	done

GentlemanGregoryAfterBattleText:
	text "군대에 있을 적 이야기다……"
	line "나는 마티스 소령님덕에"
	cont "생명을 건졌단다……!"
	done

GuitaristVincentSeenText:
	text "전기 조련사의 실력을"
	line "마티스님이 인정해주셨다"
	cont "그런 나를 이길 수 있을까?"
	done
	
GuitaristVincentBeatenText:
	text "히익- 감전되었다!"
	done

GuitaristVincentAfterBattleText:
	text "체육관의 장치가 움직이고 있다면"
	line "너같은건 쓰러뜨릴 수 있었는데.!"
	done

JugglerHortonSeenText:
	text "너는 내가 쓰러뜨린다!"
	line "각오해랏!"
	done

JugglerHortonBeatenText:
	text "크아악!"
	line "강하닷!"
	done

JugglerHortonAfterBattleText:
	text "나에게 이겼다고해서"
	line "안심하지 말아라……"
	cont "마티스 소령님은 강하니까……"
	done

VermilionGymGuyText:
	text "여어-!"
	line "미래의 챔피언!"
	cont "너 운 좋다!"
	
	para "늘 마티스는 신중하게"
	line "함정을 장치해 놓았지만"
	cont "지금은 운 좋게도 고장중!"
	
	para "마음을 놓지말고"
	line "마티스랑 싸우거라!"
	done

VermilionGymGuyWinText:
	text "익사이팅한 시합이었다!"
	line "긴장했었다!"
	done

VermilionGymTrashCanText:
	text "잠만보 동상……!"
	line "안에는 쓰레기만이!"
	done

VermilionGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, VERMILION_CITY, 7
	warp_event  5, 17, VERMILION_CITY, 7

	db 0 ; coord events

	db 17 ; bg events
	bg_event  1,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  1,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  1, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3, 15, BGEVENT_READ, VermilionGymStatue
	bg_event  6, 15, BGEVENT_READ, VermilionGymStatue

	db 5 ; object events
	object_event  5,  2, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VermilionGymSurgeScript, -1
	object_event  8,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGentlemanGregory, -1
	object_event  4,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 3, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGuitaristVincent, -1
	object_event  0, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerJugglerHorton, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, VermilionGymGuyScript, -1
