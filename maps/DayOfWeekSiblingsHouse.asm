	const_def 2 ; object constants
	const DAYOFWEEKSIBLINGSHOUSE_POKEDEX

DayOfWeekSiblingsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DayOfWeekSiblingsHousePokedexScript:
	opentext
	writetext DayOfWeekSiblingsHousePokedexText1
	yesorno
	iffalse .End
	writetext DayOfWeekSiblingsHousePokedexText2
	yesorno
	iffalse .End
	writetext DayOfWeekSiblingsHousePokedexText3
	waitbutton
.End:
	closetext
	end

DayOfWeekSiblingsHousePokedexText1:
	text "……노트에 무언가 써져 있다"
	line "읽겠습니까?"
	done

DayOfWeekSiblingsHousePokedexText2:
	text "……포켓몬 트레이너에게"
	line "협력하는 것이"
	cont "우리들 형제의 기쁨"
	
	para "포켓몬 트레이너가 말을 걸면"
	line "편리한 도구를 줍시다!"
	
	para "동생들에게"
	line "장녀 월희로부터……"
	
	para "다음 페이지도 읽을까?"
	done

DayOfWeekSiblingsHousePokedexText3:
	text "월요일의 월희"
	line "…… 40번 터널"
	
	para "화요일의 화홍"
	line "…… 29번 도로"
	
	para "수요일의 수방"
	line "…… 분노의 호수"
	
	para "목요일의 목인"
	line "…… 36번 도로"
	
	para "금요일의 금순"
	line "…… 32번 도로"
	
	para "토요일의 토영"
	line "…… 검은먹시티"
	
	para "일요일의 일식"
	line "…… 37번 도로"
	done

DayOfWeekSiblingsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_26, 3
	warp_event  3,  7, ROUTE_26, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  3,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayOfWeekSiblingsHousePokedexScript, -1
