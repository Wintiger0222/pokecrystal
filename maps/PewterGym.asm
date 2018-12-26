	const_def 2 ; object constants
	const PEWTERGYM_BROCK
	const PEWTERGYM_YOUNGSTER
	const PEWTERGYM_GYM_GUY

PewterGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PewterGymBrockScript:
	faceplayer
	opentext
	checkflag ENGINE_BOULDERBADGE
	iftrue .FightDone
	writetext BrockIntroText
	waitbutton
	closetext
	winlosstext BrockWinLossText, 0
	loadtrainer BROCK, BROCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_CAMPER_JERRY
	opentext
	writetext ReceivedBoulderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_BOULDERBADGE
	writetext BrockBoulderBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext BrockFightDoneText
	waitbutton
	closetext
	end

TrainerCamperJerry:
	trainer CAMPER, JERRY, EVENT_BEAT_CAMPER_JERRY, CamperJerrySeenText, CamperJerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperJerryAfterBattleText
	waitbutton
	closetext
	end

PewterGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BROCK
	iftrue .PewterGymGuyWinScript
	writetext PewterGymGuyText
	waitbutton
	closetext
	end

.PewterGymGuyWinScript:
	writetext PewterGymGuyWinText
	waitbutton
	closetext
	end

PewterGymStatue:
	checkflag ENGINE_BOULDERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext BROCK, BROCK1, MEM_BUFFER_1
	jumpstd gymstatue2

BrockIntroText:
	text "웅『성도에서"
	line "도전하다니 특이하군"
	
	para "나는 회색시티 포켓몬 체육관"
	line "관장인 웅!"
	cont "바위 타입의 전문가다!"
	
	para "약간 긁히는 정도의 공격은"
	line "내 포켓몬들에게는 효과가 없다"
	cont "아프지도 가렵지도 않지!"
	
	para "오너라!"
	done

BrockWinLossText:
	text "웅『……방어를 웃도는"
	line "강렬한 공격……"
	cont "내 예상을 넘어섰다……!"
	
	para "자 이 배지를"
	line "가지고 가라!"
	done

ReceivedBoulderBadgeText:
	text "<PLAYER>는(은) 웅으로부터"
	line "회색배지를 받았다!"
	done

BrockBoulderBadgeText:
	text "웅『고맙다"
	line "<PLAY_G>!"
	cont "좋은 시합이었어!"
	
	para "내 회색배지로"
	line "너의 포켓몬은"
	cont "더욱 강해진단다"
	cont "조금은 분하지만 말야!"
	done

BrockFightDoneText:
	text "웅『세상은 참 넓구나……"
	line "이렇게 강한 트레이너가"
	cont "아직도 많이 존재한다"
	
	para "나도 더욱 더"
	line "강한 트레이너가 되겠다!"
	done

CamperJerrySeenText:
	text "이곳은 바위 포켓몬을"
	line "다루는 트레이너의 체육관!"
	
	para "바위타입은 방어력이"
	line "높으니까!"
	
	para "싸움이 장기화될꺼다!"
	line "각오해랏!"
	done

CamperJerryBeatenText:
	text "싸움은 마음먹은대로 되지 않는군"
	done
	
CamperJerryAfterBattleText:
	text "웅이님은 강하단다!"
	line "방심하면 큰 코 다칠꺼야"
	cont "성도의 트레이너!"
	done

PewterGymGuyText:
	text "오- 미래의 챔피언"
	line "상태가 좋아보이는군"
	
	para "관동의 체육관 관장이랑"
	line "싸웠는가?"
	
	para "성도에 뒤지지 않을 만큼"
	line "상대하기 벅찬 녀석들이지!"
	done
	
PewterGymGuyWinText:
	text "역시 미래의 챔피언!"
	line "스릴 있는 싸움이었다!"
	cont "감동했단다 정말!"
	done
	
PewterGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 13, PEWTER_CITY, 2
	warp_event  5, 13, PEWTER_CITY, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  2, 11, BGEVENT_READ, PewterGymStatue
	bg_event  7, 11, BGEVENT_READ, PewterGymStatue

	db 3 ; object events
	object_event  5,  1, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterGymBrockScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperJerry, -1
	object_event  6, 11, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, PewterGymGuyScript, -1
