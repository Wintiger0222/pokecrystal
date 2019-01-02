	const_def 2 ; object constants
	const VERMILIONMART_CLERK
	const VERMILIONMART_SUPER_NERD
	const VERMILIONMART_BUENA

VermilionMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VermilionMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_VERMILION
	closetext
	end

VermilionMartSuperNerdScript:
	jumptextfaceplayer VermilionMartSuperNerdText

VermilionMartBuenaScript:
	jumptextfaceplayer VermilionMartBuenaText

VermilionMartSuperNerdText:
	text "관동에는 로켓단이 없어"
	line "단지 그것만으로도 기뻐진단다!"
	done

VermilionMartBuenaText:
	text "노랑시티의 상점까지"
	line "쇼핑하러 가려고 생각하고 있어"
	done

VermilionMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, VERMILION_CITY, 5
	warp_event  3,  7, VERMILION_CITY, 5

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMartClerkScript, -1
	object_event  5,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionMartSuperNerdScript, -1
	object_event  8,  6, SPRITE_BUENA, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionMartBuenaScript, -1
