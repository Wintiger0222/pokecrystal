	const_def 2 ; object constants
	const ROUTE38ECRUTEAKGATE_OFFICER

Route38EcruteakGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route38EcruteakGateOfficerScript:
	jumptextfaceplayer Route38EcruteakGateOfficerText

Route38EcruteakGateOfficerText:;TRANSLATED
	text"너는　어디서　왔니?"

	para"에엣 연두마을!?"

	para"아아　공박사님이"
	line"계시는　마을　말이구나"
	cont"대단히　멀리에서　온 거구나"
	done

Route38EcruteakGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ROUTE_38, 1
	warp_event  0,  5, ROUTE_38, 2
	warp_event  9,  4, ECRUTEAK_CITY, 14
	warp_event  9,  5, ECRUTEAK_CITY, 15

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route38EcruteakGateOfficerScript, -1
