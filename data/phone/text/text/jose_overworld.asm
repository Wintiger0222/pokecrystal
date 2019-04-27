JoseAskNumber1Text:
	text "If my @"							;내 @
	text_ram wStringBuffer4
	text_start
	line "sees anything"					;예쁜 것만 보면

	para "pretty, it goes"					;꼭 날아들어서
	line "and gets it."						;줍고는 하는데

	para "Do you like pretty"				;그런 물건을 좋아한다면
	line "things?"

	para "I could share if"					;지금 쌓인 물건 중에서
	line "it gets some more."				;몇 개 나눠주고 싶은데 말야

	para "What's your phone"				;혹시 갖고 싶으면
	line "number? I'll call."				;번호라도 알려주지 않겠어?

	para "Don't expect a"					;물건이 아주 많은 건 아니니
	line "whole lot, OK?"					;너무 기대는 하지 마
	done

JoseAskNumber2Text:
	text "Do you like pretty"				;반짝반짝한 물건을
	line "things?"							;좋아한다면

	para "I could share if"					;내 파오리가 주운
	line "FARFETCH'D goes"					;물건들 몇 개 정도
	cont "and gets more."					;나눠줄 수 있을 거 같은데

	para "What's your phone"				;전화번호 좀 알려줄래?
	line "number? I'll call."
	done

JoseNumberAcceptedText:
	text "I'll call you as"					;그럼 좋은 게 생기면
	line "soon as I get"					;전화하도록 할게
	cont "something pretty."
	done

JoseNumberDeclinedText:
	text "You sure? Well,"					;싫다고?
	line "tell me if you"					;생각이 바뀌면
	cont "change your mind."				;다시 와
	done

JosePhoneFullText:
	text "Huh? Your phone"					;으음…
	line "list is full."					;번호가 안 들어가네
	done

JoseRematchText:
	text "Tweet! Tweeeet!"

	para "Kept me waiting!"					;기다렸다고!
	line "Go, FARFETCH'D!"					;가라! 파오리!
	done

JoseGiftText:
	text "Kept me waiting!"					;조금 오래 걸렸네
	line "Look, this is it!"				;이게 내가 말한 그거야

	para "See? Isn't it some"				;반짝반짝해서
	line "kind of pretty?"					;예쁘잖아?
	done

JosePackFullText:
	text "Huh? You don't"					;이게 참 좋은 물건인데
	line "have anywhere to"					;넣을 자리가 없네…

	para "put this. Better"					;나중에 다시 와서 받아가
	line "come back for it."
	done
