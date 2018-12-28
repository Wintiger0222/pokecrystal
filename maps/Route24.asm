	const_def 2 ; object constants
	const ROUTE24_ROCKET

Route24_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route24RocketScript:
	faceplayer
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketSeenText
	waitbutton
	closetext
	winlosstext Route24RocketBeatenText, -1
	loadtrainer GRUNTM, GRUNTM_31
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketAfterBattleText
	buttonsound
	special FadeOutMusic
	writetext Route24RocketDisappearsText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear ROUTE24_ROCKET
	pause 25
	special FadeInQuickly
	playmapmusic
	end

Route24RocketSeenText:
	text "헤-이 키-드"
	line "나 로켓단 멤버다"
	
	para "다른나라의 컨트리에서 커밍한"
	line "넘버원 트레이너다!"
	
	para "나 혼자서 생각한"
	line "스톱 더 에네르기로"
	cont "피플들은 놀라서 바둥바둥"
	cont "패닉이 될꺼야!"
	
	para "마이 오퍼레이션"
	line "유에게 알려줄 수 없-어!"
	
	para "그러나 벗!"
	line "나에게서 윈 한다면"
	cont "나 남자답게 시크릿을"
	cont "유-에게 가르쳐주겠어!"
	
	para "헤-이! 키-드!"
	line "렛츠 배틀 비긴이다!"
	done

Route24RocketBeatenText:
	text "오우 노-!"
	line "아이 캔트 빌리브"
	
	para "유-는 블루베리 스트로베리"
	line "……쏘리 마이미스테이크"
	cont "유-는 베리 스트롱"
	cont "이길 수가 없-어"
	done

Route24RocketAfterBattleText:
	text "알겠습니다……"
	line "마이 시크릿 가르쳐주겠어요"
	
	para "머신부품 훔쳐서 숨겨놓은 곳은"
	line "인 더 짐 오브 블루시티"
	
	para "물속을 룩포해보면"
	line "유-는 꼭 찾아낼꺼야"
	cont "저스트 센터 근처입니다요!"
	
	para "그러-나!"
	line "돈 포겟!"
	
	para "로켓단은 유-를 반드시"
	line "찾아내 쓰러뜨릴껍니다!"
	cont "성도의 마이 프랜드"
	cont "모두 이곳으로 올껍니다!"
	done

Route24RocketDisappearsText:
	text "…… …… ……"
	line "…… …… ……"
	cont "왓?"
	cont "로켓단 브로큰?"
	cont "사라져버렸나요?"
	
	para "오우! 노-!"
	line "나 이제부터"
	cont "어떡하면 좋을까요!?"
	done

Route24_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  8,  7, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route24RocketScript, EVENT_ROUTE_24_ROCKET
