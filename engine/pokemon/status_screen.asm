DrawHP:
; Draws the HP bar in the stats screen
	call GetPredefRegisters
	ld a, $1
	jr DrawHP_

DrawHP2:
; Draws the HP bar in the party screen
	call GetPredefRegisters
	ld a, $2

DrawHP_:
	ld [wHPBarType], a
	push hl
	ld a, [wLoadedMonHP]
	ld b, a
	ld a, [wLoadedMonHP + 1]
	ld c, a
	or b
	jr nz, .nonzeroHP
	xor a
	ld c, a
	ld e, a
	ld a, $6
	ld d, a
	jp .drawHPBarAndPrintFraction
.nonzeroHP
	ld a, [wLoadedMonMaxHP]
	ld d, a
	ld a, [wLoadedMonMaxHP + 1]
	ld e, a
	predef HPBarLength
	ld a, $6
	ld d, a
	ld c, a
.drawHPBarAndPrintFraction
	pop hl
	push de
	push hl
	push hl
	call DrawHPBar
	pop hl
	ldh a, [hUILayoutFlags]
	bit 0, a
	jr z, .printFractionBelowBar
	ld bc, $9 ; right of bar
	jr .printFraction
.printFractionBelowBar
	ld bc, SCREEN_WIDTH + 1 ; below bar
.printFraction
	add hl, bc
	ld de, wLoadedMonHP
	lb bc, 2, 3
	call PrintNumber
	ld a, "/"
	ld [hli], a
	ld de, wLoadedMonMaxHP
	lb bc, 2, 3
	call PrintNumber
	pop hl
	pop de
	ret


; Predef 0x37
StatusScreen:
	call LoadMonData
	ld a, [wMonDataLocation]
	cp BOX_DATA
	jr c, .DontRecalculate
; mon is in a box or daycare
	ld a, [wLoadedMonBoxLevel]
	ld [wLoadedMonLevel], a
	ld [wCurEnemyLVL], a
	ld hl, wLoadedMonHPExp - 1
	ld de, wLoadedMonStats
	ld b, $1
	call CalcStats ; Recalculate stats
.DontRecalculate
	ld hl, wd72c
	set 1, [hl]
	ld a, $33
	ldh [rNR50], a ; Reduce the volume
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	call UpdateSprites
	call LoadHpBarAndStatusTilePatterns
	ld de, BattleHudTiles1  ; source
	ld hl, vChars2 tile $6d ; dest
	lb bc, BANK(BattleHudTiles1), 3
	call CopyVideoDataDouble ; ·│ :L and halfarrow line end
	ld de, BattleHudTiles2
	ld hl, vChars2 tile $78
	lb bc, BANK(BattleHudTiles2), 1
	call CopyVideoDataDouble ; │
	ld de, BattleHudTiles3
	ld hl, vChars2 tile $76
	lb bc, BANK(BattleHudTiles3), 2
	call CopyVideoDataDouble ; ─ ┘
	ld de, PTile
	ld hl, vChars2 tile $72
	lb bc, BANK(PTile), 1
	call CopyVideoDataDouble ; bold P (for PP)
	call LoadTREINADORgfx
	ldh a, [hTileAnimations]
	push af
	xor a
	ldh [hTileAnimations], a
	hlcoord 19, 1
	lb bc, 6, 10
	call DrawLineBox ; Draws the box around name, HP and status
	ld de, -6
	add hl, de
	ld [hl], "<DOT>"
	dec hl
	ld [hl], "№"
	hlcoord 19, 9
	lb bc, 8, 6
	call DrawLineBox ; Draws the box around types, ID No. and OT
	hlcoord 11, 9
	ld de, Type1Text
	call PlaceString ; "TYPE1/"
	hlcoord 11, 3
	predef DrawHP
	ld hl, wStatusScreenHPBarColor
	call GetHealthBarColor
	ld b, SET_PAL_STATUS_SCREEN
	call RunPaletteCommand
	hlcoord 9, 6
	ld de, wLoadedMonStatus
	call PrintStatusConditionEX
	jr nz, .StatusWritten
	hlcoord 9, 6
	ld de, OKText
	call PlaceString ; "OK"
.StatusWritten
	hlcoord 9, 6
	ld de, StatusText
	call PlaceString ; "STATUS/"
						;hlcoord 19, 6		;
						;lb bc, 1, 10		;
						;call DrawLineBox	;redesenha as setas para esconder quarta letra dos status
	
	hlcoord 14, 2
	call PrintLevelFull ; Pokémon level
	ld a, [wMonHIndex]
	ld [wd11e], a
	ld [wd0b5], a
	predef IndexToPokedex
	hlcoord 3, 7
	ld de, wd11e
	lb bc, LEADING_ZEROES | 1, 3
	call PrintNumber ; Pokémon no.
	hlcoord 11, 10
	predef PrintMonType
	ld hl, NamePointers2
	call .GetStringPointer
	ld d, h
	ld e, l
	hlcoord 9, 1
	call PlaceString ; Pokémon name
	ld hl, OTPointers
	call .GetStringPointer
	ld d, h
	ld e, l
	




	
;;checks if OT name is 8 characters long hydalt
  ld b, -1
  ld a, [hl]
  cp "<TRAINER>" ;checa se é um pokémon de troca interna
  jr z, .nameis8 ;se for, pula para o texto de 8 caracteres, senão continua
  ;ld b, 0
.loop
  inc b
  ld a, [hli]
  ;cp "<TRAINER>" ;checa se é um pokémon de troca interna
  ;jr z, .nameis8 ;se for, pula para o texto de 8 caracteres, senão continua
  cp "@" ;checa se chegou ao terminador
  jr nz, .loop ;se não leu @, volta para o loop e adiciona 1 na contagem

	ld a, b;carrega a contagem do B
	cp 8;verifica se se é 8
	jr nz, .name7under ; Jump to .REDtx if count is 8 or greater


.nameis8
	hlcoord 11, 16 ;coordenada de one 1 tile antes
	jp .normalcodecontinue

.name7under
	hlcoord 12, 16;posição normal
	;cp 1 ;checks if its one character only (TRAINER) in game trade name
	;jp nz, .normalcodecontinue;if not 1, skip next coord
	;hlcoord 11, 16;reload coord that fit 8 character names perfectly
;fim da checagem
.normalcodecontinue
	call PlaceString 
;;end print OT	
	hlcoord 12, 14
	ld de, wLoadedMonOTID
	lb bc, LEADING_ZEROES | 2, 5
	call PrintNumber ; ID Number
	ld d, $0
	call PrintStatsBox
	call Delay3
	call GBPalNormal
	hlcoord 1, 0
	call LoadFlippedFrontSpriteByMonIndex ; draw Pokémon picture
	ld a, [wcf91]
	call PlayCry ; play Pokémon cry
	call WaitForTextScrollButtonPress ; wait for button
	pop af
	ldh [hTileAnimations], a
	ret

.GetStringPointer
	ld a, [wMonDataLocation]
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMonDataLocation]
	cp DAYCARE_DATA
	ret z
	ld a, [wWhichPokemon]
	jp SkipFixedLengthTextEntries

OTPointers:
	dw wPartyMonOT
	dw wEnemyMonOT
	dw wBoxMonOT
	dw wDayCareMonOT

NamePointers2:
	dw wPartyMonNicks
	dw wEnemyMonNicks
	dw wBoxMonNicks
	dw wDayCareMonName

Type1Text:
	db   "TIPO1/"
	next ""
	; fallthrough
Type2Text:
	db   "TIPO2/"
	next ""
	; fallthrough
IDNoText:
	db   "№<ID>/"
	next ""
	; fallthrough
OTText:
	db   "TO/"
	next "@"

StatusText:
	db "@"

OKText:
	db " Estado/OK@"

; Draws a line starting from hl high b and wide c
DrawLineBox:
	ld de, SCREEN_WIDTH ; New line
.PrintVerticalLine
	ld [hl], $78 ; │
	add hl, de
	dec b
	jr nz, .PrintVerticalLine
	ld [hl], $77 ; ┘
	dec hl
.PrintHorizLine
	ld [hl], $76 ; ─
	dec hl
	dec c
	jr nz, .PrintHorizLine
	ld [hl], $6f ; ← (halfarrow ending)
	ret

PTile: INCBIN "gfx/font/P.1bpp"

PrintStatsBox:
	ld a, d
	and a ; a is 0 from the status screen
	jr nz, .DifferentBox
	hlcoord 0, 8
	ld b, 8
	ld c, 9
	call TextBoxBorder ; Draws the box
	hlcoord 1, 9 ; Start printing stats from here
	ld bc, $1a ; Number offset
	jr .PrintStats
.DifferentBox
	hlcoord 9, 2
	ld b, 8
	ld c, 9
	call TextBoxBorder
	hlcoord 10, 3
	ld bc, $1a
.PrintStats
	push bc
	push hl
	ld de, StatsText
	call PlaceString
	pop hl
	pop bc
	add hl, bc
	ld de, wLoadedMonAttack
	lb bc, 2, 3
	call PrintStat
	ld de, wLoadedMonDefense
	call PrintStat
	ld de, wLoadedMonSpeed
	call PrintStat
	ld de, wLoadedMonSpecial
	jp PrintNumber
PrintStat:
	push hl
	call PrintNumber
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	ret

StatsText:
	db   "ATAQUE"
	next "DEFESA"
	next "AGILIDADE"
	next "ESPECIAL@"

StatusScreen2:
	ldh a, [hTileAnimations]
	push af
	xor a
	ldh [hTileAnimations], a
	ldh [hAutoBGTransferEnabled], a
	ld bc, NUM_MOVES + 1
	ld hl, wMoves
	call FillMemory
	ld hl, wLoadedMonMoves
	ld de, wMoves
	ld bc, NUM_MOVES
 call CopyData						;======================golpes alternativos
    ld a, 1							;======================golpes alternativos
    ld [wUseAlternateMoveNames], a	;======================golpes alternativos
    callfar FormatMovesString		;======================golpes alternativos
    xor a							;======================golpes alternativos
    ld [wUseAlternateMoveNames], a	;======================golpes alternativos
	hlcoord 9, 2
	lb bc, 5, 10
	call ClearScreenArea ; Clear under name
	hlcoord 19, 3
	ld [hl], $78
	hlcoord 0, 8
	ld b, 8
	ld c, 18
	call TextBoxBorder ; Draw move container
	hlcoord 2, 9
	ld de, wMovesString
	call PlaceString ; Print moves
	ld a, [wNumMovesMinusOne]
	inc a
	ld c, a
	ld a, $4
	sub c
	ld b, a ; Number of moves ?
	hlcoord 11, 10
	ld de, SCREEN_WIDTH * 2
	ld a, "<BOLD_P>"
	call StatusScreen_PrintPP ; Print "PP"
	ld a, b
	and a
	jr z, .InitPP
	ld c, a
	ld a, "-"
	call StatusScreen_PrintPP ; Fill the rest with --
.InitPP
	ld hl, wLoadedMonMoves
	decoord 14, 10
	ld b, 0
.PrintPP
	ld a, [hli]
	and a
	jr z, .PPDone
	push bc
	push hl
	push de
	ld hl, wCurrentMenuItem
	ld a, [hl]
	push af
	ld a, b
	ld [hl], a
	push hl
	callfar GetMaxPP
	pop hl
	pop af
	ld [hl], a
	pop de
	pop hl
	push hl
	ld bc, wPartyMon1PP - wPartyMon1Moves - 1
	add hl, bc
	ld a, [hl]
	and $3f
	ld [wStatusScreenCurrentPP], a
	ld h, d
	ld l, e
	push hl
	ld de, wStatusScreenCurrentPP
	lb bc, 1, 2
	call PrintNumber
	ld a, "/"
	ld [hli], a
	ld de, wMaxPP
	lb bc, 1, 2
	call PrintNumber
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	ld d, h
	ld e, l
	pop hl
	pop bc
	inc b
	ld a, b
	cp $4
	jr nz, .PrintPP
.PPDone
	hlcoord 9, 3
	ld de, StatusScreenExpText
	call PlaceString
	ld a, [wLoadedMonLevel]
	push af
	cp MAX_LEVEL	;hydalt altera a posição das coisas para pokémon de lv 99 e lv100
	jr z, .Level100 ;se for lv 100 o atual, pula pro código que altera pra esquerda
	inc a;se não, aumenta 1 lv
	ld [wLoadedMonLevel], a ; Increase temporarily if not 100
	cp MAX_LEVEL;checa novamente pra ver se o next level é 100
	jr z, .Level100;se nextLV for 100, pula para o código que altera pra esquerda
;se não, segue o código normal
	hlcoord 14, 6
	ld [hl], "p"
		hlcoord 15, 6
		ld [hl], "/"
	;inc hl ;removido para poder usar "P/" em vez de "<to> "
	inc hl
	call PrintLevelFull
	pop af
	ld [wLoadedMonLevel], a
	ld de, wLoadedMonExp
	hlcoord 12, 4
	lb bc, 3, 7
	call PrintNumber ; exp
	call CalcExpToLevelUp
	ld de, wLoadedMonExp
	hlcoord 7, 6
	lb bc, 3, 7
	call PrintNumber ; exp needed to level up
	jp .normalcode;pula o .level100 que era a ordem normal
	
.Level100;código editado para imprimir os números de next level, <to> p/ e o lv100, tum 1 tile pra esquerda
	hlcoord 13, 6
	ld [hl], "p"
		hlcoord 14, 6
		ld [hl], "/"
	;inc hl;removido para poder usar "P/" em vez de "<to> "
	inc hl
	call PrintLevelFull
	pop af
	ld [wLoadedMonLevel], a
	ld de, wLoadedMonExp
	hlcoord 12, 4
	lb bc, 3, 7
	call PrintNumber ; exp
	call CalcExpToLevelUp
	ld de, wLoadedMonExp
	hlcoord 6, 6
	lb bc, 3, 7
	call PrintNumber ; exp needed to level up
;segue normal o código original	
.normalcode	;hydalt acima altera a posição das coisas para pokémon de lv 99 e lv100
	hlcoord 9, 0
	call StatusScreen_ClearName
	hlcoord 9, 1
	call StatusScreen_ClearName
	ld a, [wMonHIndex]
	ld [wd11e], a
	call GetMonName
	hlcoord 9, 1
	call PlaceString
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	call WaitForTextScrollButtonPress ; wait for button
	pop af
	ldh [hTileAnimations], a
	ld hl, wd72c
	res 1, [hl]
	ld a, $77
	ldh [rNR50], a
	call GBPalWhiteOut
	jp ClearScreen

CalcExpToLevelUp:
	ld a, [wLoadedMonLevel]
	cp MAX_LEVEL
	jr z, .atMaxLevel
	inc a
	ld d, a
	callfar CalcExperience
	ld hl, wLoadedMonExp + 2
	ldh a, [hExperience + 2]
	sub [hl]
	ld [hld], a
	ldh a, [hExperience + 1]
	sbc [hl]
	ld [hld], a
	ldh a, [hExperience]
	sbc [hl]
	ld [hld], a
	ret
.atMaxLevel
	ld hl, wLoadedMonExp
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

StatusScreenExpText:
	db   "Pontos.EXP"
	next "Pró´x.Nível@"

StatusScreen_ClearName:
	ld bc, 10
	ld a, " "
	jp FillMemory

StatusScreen_PrintPP:
; print PP or -- c times, going down two rows each time
	ld [hli], a
	ld [hld], a
	add hl, de
	dec c
	jr nz, StatusScreen_PrintPP
	ret

LoadTREINADORgfx:; Carrega o gráfico TREINADOR para os ingame Trade Trainer's name
    ld de, TREINADORgfx ; the graphic data
    ld hl, vChars1 tile $3b ; where in vram it will be placed
    lb bc, BANK(TREINADORgfx), 7 ; number of tiles the graphic takes up horizontally
    jp CopyVideoData