BillPhoneMornGreetingText:
	text "안녕!"

	para "이곳은 포켓몬 저장시스템"
	line "관리 서비스!"
	done

BillPhoneDayGreetingText:
	text "안녕!"

	para "이곳은 포켓몬 저장시스템"
	line "관리 서비스!"
	done

BillPhoneNiteGreetingText:
	text "수고했어요!"

	para "이곳은 포켓몬 저장시스템"
	line "관리 서비스!"
	done

BillPhoneGenericText:
	text "이름은 뭐라고 하냐?"

	para "그래 <PLAY_G>인가"
	line "잠깐 기다려라!"

	para "…… …… …… …… ……"
	line " …… …… …… ……"
	done

BillPhoneNotFullText:
	text "네 네 오래 기다렸어요!"

	para "<PLAY_G>이 사용하는 박스"
	line "아직 @"
	text_ram wStringBuffer3
	text "마리"
	cont "비어있어"

	para "점점 많이 맡겨줘!"
	done

BillPhoneNearlyFullText:
	text "네 네 오래 기다렸어요!"

	para "<PLAY_G>이 사용하는 박스"
	line "지금 @"
	text_ram wStringBuffer3
	text "마리밖에"
	cont "비어있지 않아"

	para "슬슬 정리해두는 편이"
	line "좋지 않겠니?"
	done
	
BillPhoneFullText:
	text "네 네 오래 기다렸어요!"

	para "<PLAY_G>이 사용하는 박스"
	line "전혀 비어있지 않아!"

	para "정리해 주겠니"
	line "이젠 포켓몬을 맡길 수 없어!"
	done


BillPhoneNewlyFullText:
	text "여보세요 <PLAY_G>?"

	para "나 이수재야!"
	line "늘 이용해줘서 고마워"

	para "지금 전송한 포켓몬으로"
	line "박스가 가득 찼어!"

	para "컴퓨터 정리를 하지 않으면"
	line "더 이상 맡길 수 없단다!"

	para "그럼 바이바이!"
	done
