	const_def 2 ; object constants
	const GOLDENRODPOKECENTER1F_NURSE
	const GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_LASS
	const GOLDENRODPOKECENTER1F_POKEFAN_F

GoldenrodPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodPokecenter1FNurseScript:
	jumpstd pokecenternurse

GoldenrodPokecenter1F_GSBallSceneLeft:
	setval BATTLETOWERACTION_CHECKMOBILEEVENT
	special BattleTowerAction
	ifequal MOBILE_EVENT_OBJECT_GS_BALL, .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, 0, 7
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, MovementData_0x6105a
	turnobject PLAYER, UP
	opentext
	writetext UnknownText_0x622f0
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext UnknownText_0x62359
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, MovementData_0x61060
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GoldenrodPokecenter1F_GSBallSceneRight:
	setval BATTLETOWERACTION_CHECKMOBILEEVENT
	special BattleTowerAction
	ifequal MOBILE_EVENT_OBJECT_GS_BALL, .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, 0, 7
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, MovementData_0x61065
	turnobject PLAYER, UP
	opentext
	writetext UnknownText_0x622f0
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext UnknownText_0x62359
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, MovementData_0x6106c
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GoldenrodPokecenter1FGameboyKidScript:
	jumptextfaceplayer GoldenrodPokecenter1FGameboyKidText

GoldenrodPokecenter1FLassScript:
	jumptextfaceplayer GoldenrodPokecenter1FLassText

GoldenrodPokecenter1FPokefanF:
	faceplayer
	opentext
	writetext UnknownText_0x623fb
	waitbutton
	writetext UnknownText_0x6248c
	yesorno
	iffalse .NoEonMail
	takeitem EON_MAIL
	iffalse .NoEonMail
	writetext UnknownText_0x62549
	waitbutton
	writetext UnknownText_0x624a4
	waitbutton
	verbosegiveitem REVIVE
	iffalse .NoRoom
	writetext UnknownText_0x624e9
	waitbutton
	closetext
	end

.NoEonMail:
	writetext UnknownText_0x62509
	waitbutton
	closetext
	end

.NoRoom:
	giveitem EON_MAIL
	writetext UnknownText_0x6252a
	waitbutton
	closetext
	end

MovementData_0x6105a:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

MovementData_0x61060:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

MovementData_0x61065:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

MovementData_0x6106c:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

; unused
UnknownText_0x61072:
	text"포켓몬커뮤니케이션센터"
	line"트레이드코너에 어서오세요!"

	para"여기에선"
	line"한 번도 만나지 못한 친구들과"
	cont"포켓몬 교환이 가능합니다"
	done

UnknownText_0x610ce:
	text"교환하기 위해서는 포켓몬을"
	line"맡겨주셔야 합니다만…"

	para"교환하시겠습니까?"
	done

UnknownText_0x61111:
	text"다음은 어떤 포켓몬을"
	line"가지고 싶은지 선택해주세요"
	done

UnknownText_0x6113b:
	text"알겠습니다"
	line"당신의　@"
	text_ram wStringBuffer3
	text"과(와)"
	cont"@"
	text_ram wStringBuffer4
	text "의"
	cont"교환을 시작하도록 하겠습니다"

	para"그러면 당신의 포켓몬을"
	line"맡아두도록 하겠습니다"

	para"방을 준비하고 있으므로"
	line"잠시만 기다려주세요……"
	done

UnknownText_0x611c9:
	text"알겠습니다 당신의　@"
	text_ram wStringBuffer3
	text"과(와)"
	line"당신이 발견하지 못한 포켓몬과의"
	cont"교환을 시작하도록 하겠습니다"

	para"그러면 당신의 포켓몬을"
	line"맡아두도록 하겠습니다"

	para"방을 준비하고 있으므로"
	line"잠시만 기다려주세요……"
	done

UnknownText_0x61271:
	text"당신의 포켓몬"
	line"확실히 맡아두었습니다"

	para"교환상대를 찾기 위해서는"
	line"많은 시간이 걸리기 때문에"
	cont"잠시 시간을 두신 후 다시 와 주세요"
	done

UnknownText_0x612d8:
	text"어라?가지고 계신 포켓몬이"
	line"1마리 밖에 없는거 같네요……"

	para"가지고 계신 포켓몬을 늘리신 후"
	line"다시 방문해 주세요"
	done

UnknownText_0x61344:
	text"다음번의"
	line"이용을 기다리고 있겠습니다!"
	done

UnknownText_0x6135f:
	text"통신에러"
	done


UnknownText_0x61375:
	text"그 포켓몬을 맡기게 되면"
	line"싸울 수 있는 포켓몬이"

	para"없어져 버립니다!"
	done

UnknownText_0x613a9:
	text"대단히 죄송합니다"
	line"알은 맡길 수 없습니다"
	done

UnknownText_0x613c8:
	text"포켓몬에 이상이 있어서"
	line"맡길 수 없습니다!"
	done

UnknownText_0x61409:
	text"어라?　당신…　포켓몬을"
	line"맡기고 있는 상태네요?"
	done

UnknownText_0x61438:
	text"그렇다면 방을 찾겠습니다"
	line"잠시만 기다려주세요……"
	done


UnknownText_0x6145c:
	text"기다리셨습니다！　교환 상대가"
	line"나타난거같습니다"
	done

UnknownText_0x6149a:
	text"당신의 새로운 동료입니다"
	line"귀여워해 주세요"

	para"그렇다면 다음번의"
	line"이용을 기다리고 있겠습니다!"
	done
	
UnknownText_0x614ed:
	text"하지만 당신의 포켓몬이"
	line"가득인거 같습니다……"

	para"수중의 포켓몬을 맡기신 후에"
	line"다시 와주세요"
	done

UnknownText_0x61544:
	text"유감입니다만…"
	line"교환상대가 나타나지 않았습니다"

	para"맡아둔 포켓몬을"
	line"다시 데려가시겠습니까?"
	done

UnknownText_0x615a5:
	text"포켓몬을 "
	line"되돌려 드렸습니다"
	done
	
UnknownText_0x615c2:
	text"유감입니다만…"
	line"교환상대가 나타나지 않았습니다"

	para"길게 맡겨졌기 때문에"
	line"당신의 포켓몬이"
	cont"무척 외로워하고 있는거 같습니다"

	para"때문에 맡아두고 있는 포켓몬을"
	line"한 번 되돌려드리겠습니다…"
	done


UnknownText_0x6166e:
	text"다음번의"
	line"이용을 기다리고 있겠습니다!"
	done
	
UnknownText_0x61689:
	text"그럼 계속해서"
	line"포켓몬을 맡아두도록 하겠습니다"
	done

UnknownText_0x616b4:
	text"어라?　"
	line"포켓몬을 맡기신 뒤로 "
	cont"아직 조금밖에 시간이"
	cont"지나지 않은거 같네요"

	para"조금 더 시간이 지난 후에"
	line"다시 방문해 주세요"
	done

UnknownText_0x616fb:
	text"센터에 접속하기 전에"
	line"레포트를 쓰겠습니다"
	done

UnknownText_0x61727:
	text"그러면 교환에 내놓고 싶은"
	line"포켓몬을 골라주세요"
	done
	
UnknownText_0x61749:
	text"정말 죄송합니다 "
	line"교환을 중지하도록 하겠습니다"
	done
UnknownText_0x6176f:
	text"아!"

	para"「알 티켓」을 가지고계신"
	line"분이시군요!"

	para"알교환권은 특별한 포켓몬을"
	line"특별한 분들에게만 나눠드리는"
	cont"교환권입니다"
	done

UnknownText_0x617d2:
	text"그럼 간단히 설명하도록"
	line"하겠습니다!"

	para"트레이드 코너의 교환에선"
	line"만난적 없는 친구들과"
	cont"교환을 하기때문에"
	cont"시간이 걸리지만"

	para"수수께끼의 알은"
	line"당신을 위해 특별히"
	cont"준비된 것이기 때문에"
	cont"금방 받을 수 있습니다!"

	para"지금부터 센터에 있는"
	line"여러 방들 중에"

	para"1개의 방을 골라"
	line"거기에 있는 수수께끼의 알을"
	cont"보내보겠습니다"
	done

UnknownText_0x6191f:
	text"준비하고있으니"
	line"잠시만 기다려주세요……"
	done

UnknownText_0x61936:
	text"기다리셨습니다!"
	line"수수께끼의 알을 받았습니다!"

	para"이건 수수께끼의 알입니다"

	para"알이 깨어날 때 까지"
	line"소중하게 키워주세요"
	done

UnknownText_0x61996:
	text"정말 죄송합니다!"

	para"지금 알티켓 서비스는"
	line"중지중에 있습니다"
	done

UnknownText_0x619db:
	text"포켓몬 뉴스머신이다!"
	done

UnknownText_0x619f5:
	text"무엇을 하겠습니까?"
	done

UnknownText_0x61a11:
	text"포켓몬 뉴스는"
	line"모두의 포켓몬 레포트를"
	cont"모아서 만드는 뉴스입니다!"

	para"새로운 뉴스를 불러올 경우"
	line"당신의 포켓몬 레포트를"
	cont"보낼 수 있습니다"

	para"보내지는 레포트의 내용은"
	line"당신의 모험기록과"
	cont"모바일 프로필입니다"

	para"전화번호는 보낼 수 없습니다"

	para"뉴스는 모두로부터 보내집니다"
	line"레포트를 통해 여러가지"
	cont"내용을 알게될 수 있습니다"

	para"어쩌면 당신의 이름도"
	line"뉴스에 나올 수 있습니다!"
	done

UnknownText_0x61b7c:
	text"새로운 뉴스를"
	line"불러오겠습니까?"
	done

UnknownText_0x61b9d:
	text"새로운 뉴스를 불러옵니다"
	line"잠시 그대로 기다려주세요"
	done
	
UnknownText_0x61bc4:
	text"전뉴스가 없습니다!"
	done

UnknownText_0x61bdb:
	text"뉴스 데이터가 손상되었습니다"
	line"다시 불러와주세요"
	done

UnknownText_0x61c18:
	text"준비중…"
	line"잠시 후에 시도해주세요"
	done

UnknownText_0x61c4b:
	text"뉴스머신을 조작하기 전에"
	line"레포트를 작성합니다"
	done

UnknownText_0x61c89:
	text"커다란 포켓몬 센터네ー"
	line"굉장하지ー"

	para"여긴 이제 막 생긴참이야"
	line"새로운 기기들이"
	cont"잔뜩있어!"
	done

UnknownText_0x61cef:
	text"트레이드 코너로 새롭게"
	line"즐기는 법을 발견했어"

	para"구구에게 메일을 지니게 하고"
	line"원하는 포켓몬을 구구로 해서"
	cont"교환에 내보내는거야!"

	para"다들 이렇게 하면"
	line"다양한 사람들과"
	cont"펜팔이 될 수 있어!"

	para"이름하여 구구메일!"

	para"…유행하면 친구들 잔뜩"
	line"생길지도!"
	done

UnknownText_0x61dfd:
	text"여기는 만난적 없는 사람들과"
	line"포켓몬을 교환할 수 있는"
	cont"곳이래!"

	para"근데 지금은 아직"
	line"조정중인가봐"
	done

UnknownText_0x61e5c:
	text"방금 모르는 여자애한테"
	line"통통코를 받았어!"

	para"원하는 포켓몬하고"
	line"교환할 수 있다는건 좋네!"
	done

UnknownText_0x61eb2:
	text"민수의 통통코를 받았는데 "
	line"이름이 철준이 였어!"
	cont"심지어 우리아빠랑 똑같은 이름…"
	done

UnknownText_0x61efa:
	text"뉴스머신이라니 뭐야?"

	para"라디오보다 넓은 지역의"
	line"정보도 알 수 있는건가?"
	done

UnknownText_0x61f48:
	text"포켓몬 커뮤니케이션 센터랑"
	line"모든 포켓몬 센터가"
	cont"전파로 이어져있대!"

	para"분명 지금부터"
	line"여러 사람들과 통신이 "
	cont"되는거네!"
	done

UnknownText_0x61fc9:
	text"여기있는 시설은"
	line"아직 사용할 수 없는거 같지만"

	para"누구보다 빨리"
	line"소문의 장소를 보러왔다는"
	cont"기쁨이 있네!"
	done

UnknownText_0x6202c:
	text"요저번 뉴스에"
	line"내 이름이 나와서 깜짝 놀랐어！"
	done

UnknownText_0x6206d:
	text"최신정보를 언제나"
	line"체크하지 않으면 마음이 안놓여!"
	done

UnknownText_0x620a1:
	text"뉴스에 이름이 실려서"
	line"엄청나게 유명해진다면"
	cont"분명 사인해달라고 줄을 서겠지…"

	para"으ー음 어떻게 해야 실릴 수 있지?"
	done

GoldenrodPokecenter1FGameboyKidText:
	text"2층에 있는 콜로세움에서"
	line"통신대전이 되겠지"

	para"벽에 내 성적이"
	line"붙어있으니 질 수 없어"
	done

UnknownText_0x62173:
	text"금빛시티 포켓몬센터에서"
	line"본적없는 세계가 있다고 해서"
	cont"서둘러 와봤는데…"

	para"아직 이런저런 준비로"
	line"어수선 하구먼…"
	done

UnknownText_0x62222:
	text"여기 있으니"
	line"새로운 것들을 잔뜩 볼 수 있어서"
	cont"젊어지는 기분이 들어"
	done

GoldenrodPokecenter1FLassText:
	text"레벨을 아무리 올려도"
	line"타입상성이란게 있어서"

	para"절대적으로 강한 포켓몬이란건"
	line"좀처럼 없는거같아"
	done

UnknownText_0x622f0:
	text"<PLAYER>씨죠?"

	para"축하드려요!"

	para"이번만 특별히…라는 이유로"
	line"GS볼 이라는걸"
	cont"보내드릴게요！"

	para"자 여기 받아주세요!"
	done

UnknownText_0x62359:
	text"또 이용해주세요!"
	done
UnknownText_0x62370:
	text"포켓몬 커뮤니케이션 센터"
	line"1층 안내"
	cont"왼쪽　…　관리실"
	cont"중앙　…　트레이드 코너"
	cont"오른쪽　…　포켓몬 뉴스"
	done

UnknownText_0x623c7:
	text"포켓몬 뉴스 머신이다!"

	para"아직 뉴스는 못보는거같다…"
	done

UnknownText_0x623fb:
	text "어머 짐이 무거워보이네!"

	para "혹시 브이브이메일이라는 거"
	line "가지고 있니?"

	para "우리 딸이 그걸 찾고 있는데"
	line "하나만 부탁해도 될까?"
	done

UnknownText_0x6248c:
	text "브이브이메일을 줄까?"
	done

UnknownText_0x624a4:
	text "고마워!"
	line "답례로 이걸 줄게!"
	done

UnknownText_0x624e9:
	text "우리 딸이 좋아할 거야!"
	done

UnknownText_0x62509:
	text "없다면 어쩔 수 없네"
	done

UnknownText_0x6252a:
	text "그럼… "
	line "나중에 줘도 돼"
	done

UnknownText_0x62549:
	text "<PLAYER>는(은)"
	line "브이브이메일을 주었다"
	done

GoldenrodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  7, GOLDENROD_CITY, 15
	warp_event  4,  7, GOLDENROD_CITY, 15
	warp_event  0,  6, POKECOM_CENTER_ADMIN_OFFICE_MOBILE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 2 ; coord events
	coord_event  3,  7, SCENE_DEFAULT, GoldenrodPokecenter1F_GSBallSceneLeft
	coord_event  4,  7, SCENE_DEFAULT, GoldenrodPokecenter1F_GSBallSceneRight

	db 0 ; bg events

	db 5 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FNurseScript, -1
	object_event 16,  8, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FLassScript, -1
	object_event  7,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FPokefanF, -1
