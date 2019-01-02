	const_def 2 ; object constants
	const SEAFOAMGYM_BLAINE
	const SEAFOAMGYM_GYM_GUY

SeafoamGym_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

SeafoamGymBlaineScript:
	faceplayer
	opentext
	checkflag ENGINE_VOLCANOBADGE
	iftrue .FightDone
	writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, 0
	loadtrainer BLAINE, BLAINE1
	startbattle
	iftrue .ReturnAfterBattle
	appear SEAFOAMGYM_GYM_GUY
.ReturnAfterBattle:
	reloadmapafterbattle
	setevent EVENT_BEAT_BLAINE
	opentext
	writetext ReceivedVolcanoBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_VOLCANOBADGE
	writetext BlaineAfterBattleText
	waitbutton
	closetext
	end

.FightDone:
	writetext BlaineFightDoneText
	waitbutton
	closetext
	end

SeafoamGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	iftrue .TalkedToSeafoamGymGuyScript
	writetext SeafoamGymGuyWinText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	end

.TalkedToSeafoamGymGuyScript:
	writetext SeafoamGymGuyWinText2
	waitbutton
	closetext
	end

BlaineIntroText:
	text "강연『우오오-옷!"
	
	para "홍련에 있던 내 체육관이"
	line "사라져버렸다!"
	
	para "불꽃 포켓몬을 조종하는"
	line "내 체육관이"
	cont "화산에 타버렸어!"
	
	para "우오오-옷!"
	
	para "그러나 나는 이 동굴에서"
	line "체육관 관장일을 계속하고 있다!"
	
	para "나를 쓰러뜨리면"
	line "배지를 건네주마!"
	
	para "우오오-옷!"
	line "화상 치료제는 잘 준비했는가!"
	done

BlaineWinLossText:
	text "강연『후 …… 훌륭해!"
	line "내가 졌다……!"
	
	para "진홍색배지를 받아라!"
	done

ReceivedVolcanoBadgeText:
	text "<PLAYER>는(은) 강연으로부터"
	line "진홍색배지를 얻었다!"
	done

BlaineAfterBattleText:
	text "강연『이번엔 내가 졌지만"
	line "홍련마을 체육관을 고쳐서"
	cont "다음에는 꼭 이기겠다!"
	cont "언젠가 다시한번 겨루자!"
	done

BlaineFightDoneText:
	text "강연『내 불꽃 포켓몬을"
	line "파워업 시키겠어!"
	done

SeafoamGymGuyWinText:
	text "어-이!"
	
	para "…… 엥?"
	line "끝난 것 같구나"
	
	para "미안 미안!"
	line "홍련섬의 체육관이 없어져서"
	cont "찾고있었어 나!"
	
	para "뭐 내 어드바이스 없이도"
	line "엄청 강해보이니까"
	cont "이긴다고 믿고있었어!"
	done

SeafoamGymGuyWinText2:
	text "체육관 관장이 있다면"
	line "그곳이 포켓몬 체육관"
	cont "건물같은 것은 관계 없단다"
	done
	
SeafoamGym_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  5, ROUTE_20, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1
	object_event  6,  5, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamGymGuyScript, EVENT_SEAFOAM_GYM_GYM_GUY
