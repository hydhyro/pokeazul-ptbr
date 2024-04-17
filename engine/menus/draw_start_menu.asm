; function that displays the start menu
DrawStartMenu::
 ld hl, wPlayerName
  ld b, -1
.loop
  inc b
  ld a, [hli]
  cp "@"
  jr nz, .loop

	ld a, b
	cp 8
	jr nz, .normalgame

	CheckEvent EVENT_GOT_POKEDEX
; menu with pokedex
	hlcoord 9, 0 	;onde começa 
	ld b, $0e		;tamanho vertical 
	ld c, $09		;tamanho horizontal
	jr nz, .drawTextBoxBorder
; shorter menu if the player doesn't have the pokedex
	hlcoord 9, 0 	;onde começa 
	ld b, $0c		;tamanho vertical 
	ld c, $09		;tamanho horizontal
	jr .drawTextBoxBorder

.normalgame
	CheckEvent EVENT_GOT_POKEDEX
; menu with pokedex
	hlcoord 10, 0
	ld b, $0e
	ld c, $08
	jr nz, .drawTextBoxBorder
; shorter menu if the player doesn't have the pokedex
	hlcoord 10, 0
	ld b, $0c
	ld c, $08
.drawTextBoxBorder
	call TextBoxBorder
	ld a, D_DOWN | D_UP | START | B_BUTTON | A_BUTTON
	ld [wMenuWatchedKeys], a
	ld a, $02
	ld [wTopMenuItemY], a ; Y position of first menu choice
	
	
	ld hl, wPlayerName
  ld b, -1
.loop2
  inc b
  ld a, [hli]
  cp "@"
  jr nz, .loop2

	ld a, b
	cp 8
	jr nz, .normalXY
	

	ld a, $0a
	jr .normalcont
.normalXY	
	ld a, $0b

.normalcont	
	ld [wTopMenuItemX], a ; X position of first menu choice
	ld a, [wBattleAndStartSavedMenuItem] ; remembered menu selection from last time
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	xor a
	ld [wMenuWatchMovingOutOfBounds], a
	ld hl, wd730
	set 6, [hl] ; no pauses between printing each letter
	
	ld a, b
	cp 8
	jr nz, .normaltextxy	
	
	hlcoord 11, 2
	jr .normalconttextxy
.normaltextxy	
	hlcoord 12, 2
	
.normalconttextxy	

	CheckEvent EVENT_GOT_POKEDEX
; case for not having pokedex
	ld a, $06
	jr z, .storeMenuItemCount
; case for having pokedex
	ld de, StartMenuPokedexText
	call PrintStartMenuItem
	ld a, $07
.storeMenuItemCount
	ld [wMaxMenuItem], a ; number of menu items
	ld de, StartMenuPokemonText
	call PrintStartMenuItem
	ld de, StartMenuItemText
	call PrintStartMenuItem
	ld de, wPlayerName ; player's name
	call PrintStartMenuItem
	ld a, [wd72e]
	bit 6, a ; is the player using the link feature?
; case for not using link feature
	ld de, StartMenuSaveText
	jr z, .printSaveOrResetText
; case for using link feature
	ld de, StartMenuResetText
.printSaveOrResetText
	call PrintStartMenuItem
	ld de, StartMenuOptionText
	call PrintStartMenuItem
	ld de, StartMenuExitText
	call PlaceString
	ld hl, wd730
	res 6, [hl] ; turn pauses between printing letters back on
	ret

StartMenuPokedexText:
	db "#DEX@"

StartMenuPokemonText:
	db "#MON@"

StartMenuItemText:
	db "ITENS@"

StartMenuSaveText:
	db "SALVAR@"

StartMenuResetText:
	db "RESETAR@"

StartMenuExitText:
	db "SAIR@"

StartMenuOptionText:
	db "OPÇO~~ES@"

PrintStartMenuItem:
	push hl
	call PlaceString
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	ret
