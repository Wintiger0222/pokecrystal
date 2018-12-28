	const_def 2 ; object constants
	const ROUTE17ROUTE18GATE_OFFICER

Route17Route18Gate_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end

Route17Route18GateOfficerScript:
	jumptextfaceplayer Route17Route18GateOfficerText

Route17Route18GateBicycleCheck:
	checkitem BICYCLE
	iffalse .NoBicycle
	end

.NoBicycle:
	showemote EMOTE_SHOCK, ROUTE17ROUTE18GATE_OFFICER, 15
	turnobject PLAYER, UP
	opentext
	writetext Route17Route18GateCannotPassText
	waitbutton
	closetext
	applymovement PLAYER, Route17Route18GateCannotPassMovement
	end

Route17Route18GateCannotPassMovement:
	step RIGHT
	turn_head LEFT
	step_end

Route17Route18GateOfficerText:
	text "자전거 길"
	line "여기서부터는 오르막길입니다"
	done
	
Route17Route18GateCannotPassText:
	text "아- 이봐 너!"
	line "자전거 가지고 있지 않니?"
	
	para "여기부터는"
	line "자전거 길!"
	cont "자전거가 없으면 달릴 수 없단다!"
	done
	
Route17Route18Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ROUTE_17, 1
	warp_event  0,  5, ROUTE_17, 2
	warp_event  9,  4, ROUTE_18, 1
	warp_event  9,  5, ROUTE_18, 2

	db 2 ; coord events
	coord_event  5,  4, SCENE_DEFAULT, Route17Route18GateBicycleCheck
	coord_event  5,  5, SCENE_DEFAULT, Route17Route18GateBicycleCheck

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route17Route18GateOfficerScript, -1
