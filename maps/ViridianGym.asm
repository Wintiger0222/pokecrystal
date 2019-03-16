	const_def 2 ; object constants
	const VIRIDIANGYM_BLUE
	const VIRIDIANGYM_GYM_GUY

ViridianGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ViridianGymBlueScript:
	faceplayer
	opentext
	checkflag ENGINE_EARTHBADGE
	iftrue .FightDone
	writetext LeaderBlueBeforeText
	waitbutton
	closetext
	winlosstext LeaderBlueWinText, 0
	loadtrainer BLUE, BLUE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLUE
	opentext
	writetext Text_ReceivedEarthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_EARTHBADGE
	writetext LeaderBlueAfterText
	waitbutton
	closetext
	end

.FightDone:
	writetext LeaderBlueEpilogueText
	waitbutton
	closetext
	end

ViridianGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BLUE
	iftrue .ViridianGymGuyWinScript
	writetext ViridianGymGuyText
	waitbutton
	closetext
	end

.ViridianGymGuyWinScript:
	writetext ViridianGymGuyWinText
	waitbutton
	closetext
	end

ViridianGymStatue:
	checkflag ENGINE_EARTHBADGE
	iftrue .Beaten
	jumpstd gymstatue1

.Beaten:
	gettrainername STRING_BUFFER_4, BLUE, BLUE1
	jumpstd gymstatue2

LeaderBlueBeforeText:
	text "그린『어이 왔구나"
	
	para "홍련에서는 좀"
	line "신경과민이 되었지만"
	cont "지금은 잡념없이"
	cont "싸우고 싶은 생각 뿐이다"
	
	para "…… …… ……"
	
	para "네가 성도의 체육관을"
	line "전부 제패 했다고?"
	
	para "성도의 레벨이"
	line "낮은 것은 아닌가?"
	
	para "뭐 좋아"
	line "싸워보면 알 수 있는 것"
	cont "너의 실력이"
	cont "진짜인가 아닌가를!"
	
	para "간다!"
	line "성도의 어린이!"
	done

LeaderBlueWinText:
	text "그린『바보같이!"
	
	para "내가 이런 녀석에게"
	line "지다니!!"
	
	para "…… …… ……"
	line "…… 쳇 할 수 없군"
	cont "자 그린배지다"
	cont "너에게 주겠어!"
	done

Text_ReceivedEarthBadge:
	text "<PLAYER>는(은) 그린으로부터"
	line "그린배지를 받았다!"
	done
	
LeaderBlueAfterText:
	text "그린『…… …… ……"
	
	para "내가 잘못 알았다"
	line "너는 진짜 실력꾼이다"
	cont "강한 트레이너다"
	cont "사심 없이 받아들이겠어!"
	
	para "하지만!"
	line "잊지말아라!"
	
	para "언젠가 내가 너를"
	line "쓰러뜨릴테니까!"
	done

LeaderBlueEpilogueText:
	text "그린『알아들었느냐!"
	
	para "내가 쓰러뜨릴 때까지"
	line "지지는 않겠지!"
	done

ViridianGymGuyText:
	text "여-어!"
	line "미래의 챔피언!"
	cont "상태는 어때?"
	cont "호조인 것 같구나!"
	
	para "3년전 챔피언과"
	line "싸웠던 남자가"
	cont "이 체육관의 관장이다"
	
	para "상당히 벅찬 상대일껄"
	line "열심히 하거라!"
	done

ViridianGymGuyWinText:
	text "역시 강하구나!"
	line "나 눈물이 나오려고해"
	cont "감동적인 승부였단다!"
	done

ViridianGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, VIRIDIAN_CITY, 1
	warp_event  5, 17, VIRIDIAN_CITY, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, ViridianGymStatue
	bg_event  6, 13, BGEVENT_READ, ViridianGymStatue

	db 2 ; object events
	object_event  5,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianGymBlueScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianGymGuyScript, EVENT_VIRIDIAN_GYM_BLUE
