ParryNoMatchText:
	text "Nothing can match"				;내 @
	line "my @"
	text_ram wStringBuffer4
	text " now."							;이젠 최강이려나
	done

UnknownText_0x66fc0:
	text "Yeah, we KO'd a"					;그렇지
	line "wild @"							;지난 번에는 야생의 @
	text_ram wStringBuffer4
	text "!"								;도 쓰러뜨렸다구

	para "That was OK, but I"				;사실 쓰러뜨리는 게 아니라
	line "wanted to get it…"				;갖고 싶었지만서도…
	done

UnknownText_0x67001:
	text "And yesterday, we"				;어제는 야생의 @
	line "spotted a wild"

	para "@"
	text_ram wStringBuffer4
	text "."								;가 나타났길래
	line "We were debating"

	para "whether to catch"					;쓰러뜨릴 지 잡을 지
	line "it or beat it."					;의논하고 있었는데

	para "When along came"					;그러다가 어떤 사람이
	line "another guy who"					;갑자기 나타나서는

	para "caught it!"						;포켓몬을 잡아가더라고
	line "How about that!"
	done

UnknownText_0x67096:
	text "You're thinking"					;분명 한 번 
	line "you'd like to"					;겨뤄보고 싶은 거지

	para "battle me. Am I"					;말은 필요 없어
	line "right or what?"					;얼굴이나 목소리로 알 수 있지

	para "Yep! We'll meet on"				;그럼 @
	line "@"
	text_ram wStringBuffer5
	text "!"								;로 와서 한 번 붙자
	done

UnknownText_0x670eb:
	text "OK, give me a call"				;좋아
	line "again!"							;그럼 나중에 또 전화 줘
	done

ParryBattleWithMeText:
	text "You'll battle with"				;나중에 다시
	line "me again, right?"					;배틀 하는 거지?
	done

ParryHaventYouGottenToText:
	text "Haven't you gotten"				;아직 @
	line "to @"
	text_ram wStringBuffer5
	text "?"								;안 도착했으려나

	para "Waiting here isn't"				;여기서 기다리는 것도
	line "bad, but I'd sure"				;나쁘진 않은데
	cont "like to battle!"					;그래도 배틀이 더 좋지
	done
