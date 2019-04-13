	const_def 2 ; object constants
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST1
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST2
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST3

PokecomCenterAdminOfficeMobile_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PokecomCenterAdminOfficeMobileScientist1Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist1Text

PokecomCenterAdminOfficeMobileScientist2Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist2Text

PokecomCenterAdminOfficeMobileScientist3Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist3Text

PokecomCenterAdminOfficeMobileComputer1:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text
	waitbutton
.loop:
	reloadmappart
	loadmenu .Computer1MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .PokeComClub
	ifequal 2, .MobileCenter
	sjump .Quit

.PokeComClub:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text_PokeComClub
	waitbutton
	sjump .loop

.MobileCenter:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text_MobileCenter
	waitbutton
	sjump .loop

.Quit:
	closetext
	end

.Computer1MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
IF DEF (_CRYSTALMOBILE)
	db "포켓몬 통신 클럽@" ; # COM CLUB
	db "모바일 센터@" ; MOBILE CENTER
	db "그만두다@" ; QUIT
ELSE;번역하지마세요
	db "#　つうしん　クラブ@" ; # COM CLUB
	db "モバイルセンター@" ; MOBILE CENTER
	db "やめる@" ; QUIT
ENDC

PokecomCenterAdminOfficeMobileComputer2:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text
	waitbutton
.loop:
	reloadmappart
	loadmenu .Computer2MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .UsePhone
	ifequal 2, .DontUsePhone
	sjump .Quit

.UsePhone:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text_UsePhone
	waitbutton
	sjump .loop

.DontUsePhone:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text_DontUsePhone
	waitbutton
	sjump .loop

.Quit:
	closetext
	end

.Computer2MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
IF DEF (_CRYSTALMOBILE)
	db "전화를 사용할 경우@" ; Use phone
	db "전화가 연결되지 않을경우@" ; Don't use phone
	db "그만두다@" ; QUIT
ELSE;번역하지마세요
	db "でんわ<WO>つかうとき@" ; Use phone
	db "でんわ<GA>つながらないとき@" ; Don't use phone
	db "やめる@" ; QUIT
ENDC

PokecomCenterAdminOfficeMobileComputer3:
	jumptext PokecomCenterAdminOfficeMobileComputer3Text

PokecomCenterAdminOfficeMobileScientist1Text:
	text"포켓몬 커뮤니케이션 센터와"
	line"모바일 센터는"

	para"멀리있는 <TRAINER>끼리나"
	line"모르는 <TRAINER>끼리도"
	cont"대전이나 교환이 되었으면"
	cont"하는 마음에서 "
	cont"만들었습니다"
	done

PokecomCenterAdminOfficeMobileScientist2Text:
	text"처음 모바일을 써서"
	line"통신이 성공했을 때는"
	cont"감동 했었지?"

	para"우리도 처음에 통신"
	line"실험이 성공했을 때는"
	cont"온몸이 전율했어"
	done

PokecomCenterAdminOfficeMobileScientist3Text:
	text"이정도로 커다란 시설이"
	line"생긴건 전화기술이"
	cont"크게 발전했기 때문이란다"
	done

PokecomCenterAdminOfficeMobileComputer1Text:
	text"모바일 어댑터를 사용할 때에"
	line"대해 적혀있다"
	done

PokecomCenterAdminOfficeMobileComputer1Text_PokeComClub:
	text"포켓몬센터 2층에 있는"
	line"포켓몬 통신클럽에서"

	para"모바일 어댑터를 사용해서"
	line"멀리 있는 친구와"
	cont"대전이나 교환이 가능해요"

	para"통신은 같은 종류의"
	line"모바일 어댑터를 사용하고있는"
	cont"친구와 시도해주세요"
	done

PokecomCenterAdminOfficeMobileComputer1Text_MobileCenter:
	text"트레이드 코너에선 교환하거나"
	line"포켓몬 뉴스를 볼 경우엔"

	para"모바일 센터라는 곳으로"
	line"전화를 겁니다"

	para"모바일 센터에 연결하기 위해"
	line"먼저 모바일 센터에"
	cont"등록해 주세요"
	done

PokecomCenterAdminOfficeMobileComputer2Text:
	text"전화를 사용할 때에 "
	line"대해서 적혀있다"
	done

PokecomCenterAdminOfficeMobileComputer2Text_UsePhone:
	text"전화와 모바일 어댑터를"
	line"확실히 연결해주세요"

	para"전파가 들어오기 쉬운"
	line"장소에서 통신해주세요"

	para"통신중엔 전화를"
	line"조작하거나 끄지 말아주세요"
	done

PokecomCenterAdminOfficeMobileComputer2Text_DontUsePhone:
	text"전화 회선이 밀릴때에는"
	line"잘 연결되지 않을 수 있습니다"

	para"그 경우 조금 기다린 뒤"
	line"다시 걸어주세요"

	para"아무리 해도 잘 연결이 안되거나"
	line"에러의 의미를 알 수 없을 때에는"

	para"서포트 센터에 들리거나"
	line"설명서를 읽어주세요"
	done

PokecomCenterAdminOfficeMobileComputer3Text:
	text"관리실에서 메일이 왔다!"

	para"……　……　……"

	para"『포켓몬 커뮤니케이션 센터"
	line"스태프들에게"

	para"전파로 통신이 가능하므로"
	line"전국의 포켓몬 <TRAINER>가"
	cont"교류 가능하게"
	cont"되었습니다!"

	para"언젠가 온 세계의"
	line"포켓몬<TRAINER> 전원이 "
	cont"통신할 수 있는 날 까지"
	cont"힘내세요!"

	para"……　……　……"
	done

PokecomCenterAdminOfficeMobile_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0, 31, GOLDENROD_POKECENTER_1F, 3
	warp_event  1, 31, GOLDENROD_POKECENTER_1F, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6, 26, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer1
	bg_event  6, 28, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer2
	bg_event  3, 26, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer3

	db 3 ; object events
	object_event  4, 28, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist1Script, -1
	object_event  7, 27, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist2Script, -1
	object_event  7, 29, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist3Script, -1
