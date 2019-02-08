	const_def 2 ; object constants
	const MOUNTMORTAR1FINSIDE_BOULDER
	const MOUNTMORTAR1FINSIDE_POKE_BALL1
	const MOUNTMORTAR1FINSIDE_POKE_BALL2
	const MOUNTMORTAR1FINSIDE_POKE_BALL3
	const MOUNTMORTAR1FINSIDE_POKE_BALL4
	const MOUNTMORTAR1FINSIDE_POKE_BALL5
	const MOUNTMORTAR1FINSIDE_SUPER_NERD1
	const MOUNTMORTAR1FINSIDE_SUPER_NERD2
	const MOUNTMORTAR1FINSIDE_POKE_BALL6
	const MOUNTMORTAR1FINSIDE_POKE_BALL7

MountMortar1FInside_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerPokemaniacMiller:
	trainer POKEMANIAC, MILLER, EVENT_BEAT_POKEMANIAC_MILLER, PokemaniacMillerSeenText, PokemaniacMillerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacMillerAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdMarkus:
	trainer SUPER_NERD, MARKUS, EVENT_BEAT_SUPER_NERD_MARKUS, SupernerdMarkusSeenText, SupernerdMarkusBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdMarkusAfterBattleText
	waitbutton
	closetext
	end

MountMortar1FBoulder:
	jumpstd strengthboulder

MountMortar1FInsideEscapeRope:
	itemball ESCAPE_ROPE

MountMortar1FInsideMaxRevive:
	itemball MAX_REVIVE

MountMortar1FInsideHyperPotion:
	itemball HYPER_POTION

MountMortar1FInsideMaxPotion:
	itemball MAX_POTION

MountMortar1FInsideNugget:
	itemball NUGGET

MountMortar1FInsideIron:
	itemball IRON

MountMortar1FInsideUltraBall:
	itemball ULTRA_BALL

MountMortar1FInsideHiddenMaxRepel:
	hiddenitem MAX_REPEL, EVENT_MOUNT_MORTAR_1F_INSIDE_HIDDEN_MAX_REPEL

PokemaniacMillerSeenText:;TRANSLATED
	text"이번에는 지지 않는다!"
	done

PokemaniacMillerBeatenText:;TRANSLATED
	text"이런 꼬맹이한테 지다니…"
	done

PokemaniacMillerAfterBattleText:;TRANSLATED
	text"이 전에　태권도　소년과"
	line"승부를 했지만"

	para"엉망진창　되어버려"
	line"너덜너덜하게 당해버렸다…"

	para"수행을 하러"
	line"들어갔는데　잘 지내려나?"
	done

SupernerdMarkusSeenText:;TRANSLATED
	text"어-이!　혜음-!"
	done

SupernerdMarkusBeatenText:;TRANSLATED
	text"뭐야 다른사람이잖아…"
	done

SupernerdMarkusAfterBattleText:;TRANSLATED
	text"절구산을"
	line"조사하러 동료와 왔지만"
	cont"도중에　떨어져 버렸어…"

	para"폭포오르기를 사용하는"
	line"시드라를 가진"
	cont"트레이너를 본 적 있어?"
	done

MountMortar1FInside_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 11, 47, MOUNT_MORTAR_1F_OUTSIDE, 5
	warp_event 29, 47, MOUNT_MORTAR_1F_OUTSIDE, 6
	warp_event  5, 39, MOUNT_MORTAR_1F_OUTSIDE, 8
	warp_event 33, 41, MOUNT_MORTAR_1F_OUTSIDE, 9
	warp_event  3, 19, MOUNT_MORTAR_B1F, 1
	warp_event  9,  9, MOUNT_MORTAR_2F_INSIDE, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 30, 11, BGEVENT_ITEM, MountMortar1FInsideHiddenMaxRepel

	db 10 ; object events
	object_event 21, 43, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortar1FBoulder, -1
	object_event 35, 38, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FInsideEscapeRope, EVENT_MOUNT_MORTAR_1F_INSIDE_ESCAPE_ROPE
	object_event 16, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FInsideMaxRevive, EVENT_MOUNT_MORTAR_1F_INSIDE_MAX_REVIVE
	object_event 10, 27, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FInsideHyperPotion, EVENT_MOUNT_MORTAR_1F_INSIDE_HYPER_POTION
	object_event 22, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FInsideMaxPotion, EVENT_MOUNT_MORTAR_1F_INSIDE_MAX_POTION
	object_event 35, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FInsideNugget, EVENT_MOUNT_MORTAR_1F_INSIDE_NUGGET
	object_event 33, 43, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacMiller, -1
	object_event 24, 28, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdMarkus, -1
	object_event  8, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FInsideIron, EVENT_MOUNT_MORTAR_1F_INSIDE_IRON
	object_event 17, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar1FInsideUltraBall, EVENT_MOUNT_MORTAR_1F_INSIDE_ULTRA_BALL
