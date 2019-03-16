	const_def 2 ; object constants
	const ROUTE27SANDSTORMHOUSE_GRANNY

Route27SandstormHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SandstormHouseWoman:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM37_SANDSTORM
	iftrue .AlreadyGotItem
	special GetFirstPokemonHappiness
	writetext SandstormHouseWomanText1
	buttonsound
	ifgreater 150 - 1, .Loyal
	sjump .Disloyal

.Loyal:
	writetext SandstormHouseWomanLoyalText
	buttonsound
	verbosegiveitem TM_SANDSTORM
	iffalse .Done
	setevent EVENT_GOT_TM37_SANDSTORM
.AlreadyGotItem:
	writetext SandstormHouseSandstormDescription
	waitbutton
.Done:
	closetext
	end

.Disloyal:
	writetext SandstormHouseWomanDisloyalText
	waitbutton
	closetext
	end

SandstormHouseBookshelf:
	jumpstd magazinebookshelf

SandstormHouseWomanText1:
	text "히히히"
	line "포켓몬 데리고 어딜 가느냐?"
	
	para "포켓몬 리그인가"
	line "모두 이겨낼 수 있는 강한"
	cont "인연을 지니고 있는가?"
	
	para "어디어디 너의 포켓몬……"
	done
	
SandstormHouseWomanLoyalText:
	text "오오 꽤나 잘 따르는구나"
	line "좋은 트레이너를 보면 기뻐진단다"
	
	para "이것은 떠나보내는 선물이다"
	line "가지고 가거라!"
	done

SandstormHouseSandstormDescription:
	text "기술머신37은 모래바람!"
	
	para "사용하면 서로 데미지를 입는"
	line "상급자 수준의 기술"
	
	para "그럼 열심히 하거라"
	done

SandstormHouseWomanDisloyalText:
	text "조금더 친해지지 않으면"
	line "이기는 것은 어려울 것 같구나"
	
	para "트레이너와 포켓몬을 이어주는 것은"
	line "서로의 믿음이니까"
	done
	
Route27SandstormHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_27, 1
	warp_event  3,  7, ROUTE_27, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, SandstormHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, SandstormHouseBookshelf

	db 1 ; object events
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SandstormHouseWoman, -1
