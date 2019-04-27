UnknownText_0x1b4f21:
	text "Hello, this is"					;여보세요 @
	line "@"
	text_ram wStringBuffer3
	text "."								;입니다

	para "Oh! Good morning,"				;오 <PLAYER>
	line "<PLAYER>."						;좋은 아침!
	done

UnknownText_0x1b4f4d:
	text "Hello, this is"					;여보세요 @
	line "@"
	text_ram wStringBuffer3
	text "."								;입니다

	para "Oh! Good day,"					;오 <PLAYER>
	line "<PLAYER>."						;날이 좋네
	done

UnknownText_0x1b4f75:
	text "Hello, this is"					;여보세요 @
	line "@"
	text_ram wStringBuffer3
	text "."								;입니다

	para "Oh! Good evening,"				;오 <PLAYER>
	line "<PLAYER>."						;슬슬 저녁이네
	done

UnknownText_0x1b4fa1:
	text "Hello, <PLAYER>."					;안녕 <PLAYER>
	line "Good morning."

	para "This is @"						;@
	text_ram wStringBuffer3
	text "."								;인데
	line "Were you asleep?"					;지금 자니?
	done

UnknownText_0x1b4fda:
	text "Hi, <PLAYER>."					;<PLAYER> 안녕
	line "This is @"						;@
	text_ram wStringBuffer3
	text "."								;인데

	para "How are you doing?"				;요즘 잘 지내?
	done

UnknownText_0x1b5004:
	text "Hi, <PLAYER>."					;<PLAYER> 안녕
	line "This is @"						;@
	text_ram wStringBuffer3
	text "."								;인데

	para "Were you awake?"					;지금 안 자고 있지?
	done

UnknownText_0x1b502b:
	text "Keeping your"						;그래서 너의 포켓몬은
	line "#MON happy?"						;행복하게 지내고 있어?

	para "My @"								;내 @
	text_ram wStringBuffer4
	text " is"								;말이라면
	line "healthy. It eats a"				;매일 음식을 잔뜩 주니까
	cont "lot every day."					;건강하고 행복해하지
	done
