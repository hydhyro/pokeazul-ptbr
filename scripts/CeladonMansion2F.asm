CeladonMansion2F_Script:
	call EnableAutoTextBoxDrawing
	ret

CeladonMansion2F_TextPointers:
	dw hyd
	dw hydpoke
	dw pc
	dw CeladonMansion2Text1

hyd:
	text_far _hyd
	text_end
		
hydpoke:
	text_far _hydpoke
	text_asm
	ld a, FARFETCHD
	call PlayCry
	call WaitForSoundToFinish
	ld hl, hydpoke2
	ret
	;jp TextScriptEnd
	
hydpoke2:
	text_far _hydpoke2
	text_end
pc:
	text_far _pc
	text_asm
					ldh a, [hUILayoutFlags]	;faz o caimento de linha ser 0
					set 2, a				;faz o caimento de linha ser 0
					ldh [hUILayoutFlags], a	;faz o caimento de linha ser 0
	call LoadTildabordaGFX	
	call hydsitesGFX
	call hydsites2GFX
	hlcoord 1, 13
	ld de, HydSite
	call PlaceString
					ld hl, hUILayoutFlags	;recupera o caimento de linha para o padrão 1
					res 2, [hl]				;recupera o caimento de linha para o padrão 1
	
	jp TextScriptEnd

CeladonMansion2Text1:
	text_far _CeladonMansion2FMeetingRoomSignText
	text_end
	
HydSite:						
	;db 	 "  Hyd<pes1> Traduçõ~~es"
	db   ""
	next " klmnop abcdefghi"
	next " たちつてとなにぬねのはひふへほま"
	next "たちつ¥×<DOT>/,♀012345678@"
	;next "https://discord.gg/"
	;next "    dzTkZVY3E4@"
	;next "    dzTkZVYみEむ@"3E4
	
LoadTildabordaGFX:; Carrega o gráfico TREINADOR para os ingame Trade Trainer's name
   ld de, tildabordagfx ; the graphic data
   ld hl, vChars1 tile $6a ; where in vram it will be placed
   lb bc, BANK(tildabordagfx), 1 ; number of tiles the graphic takes up horizontally
   jp CopyVideoData
   
tildabordagfx: INCBIN "gfx/font/tildaborda.2bpp"
tildabordagfxEnd:

hydsitesGFX:; Carrega o gráfico TREINADOR para os ingame Trade Trainer's name
  ld de, HydRightsgfx ; the graphic data
  ld hl, vChars1 tile $20 ; where in vram it will be placed
  lb bc, BANK(HydRightsgfx), 16 ; number of tiles the graphic takes up horizontally
  call CopyVideoData
  ld de, hydsitesgfx ; the graphic data
  ld hl, vChars1 tile $40 ; where in vram it will be placed
  lb bc, BANK(hydsitesgfx), 16 ; number of tiles the graphic takes up horizontally
   jp CopyVideoData
   
hydsites2GFX:
  ld de, hydsites2gfx ; the graphic data
  ld hl, vChars1 tile $70 ; where in vram it will be placed
  lb bc, BANK(hydsites2gfx), 15 ; number of tiles the graphic takes up horizontally
  jp CopyVideoData

hydsitesgfx: INCBIN "gfx/font/hydsites.2bpp"
hydsitesgfxEnd:

hydsites2gfx: INCBIN "gfx/font/hydsites2.2bpp"
hydsites2gfxEnd:

HydRightsgfx: INCBIN "gfx/splash/hydrights.2bpp"
HydRightsgfxEnd: