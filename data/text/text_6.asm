_ItemUseBallText00::
	text "Ele desviou da"
	line "BOLA jogada!"

	para "Nã~o pode capturar"
	line "esse #MON!"
	prompt

_ItemUseBallText01::
	text "Você^ errou o"
	line "#MON!"
	prompt

_ItemUseBallText02::
	text "Droga! O #MON"
	line "se libertou!"
	prompt

_ItemUseBallText03::
	text "Ahh! Parecia que"
	line "tinha capturado!"
	prompt

_ItemUseBallText04::
	text "Puxa! Estava"
	line "tã~o perto!"
	prompt

_ItemUseBallText05::
	text "Tudo certo!"
	line "@"
	text_ram wEnemyMonNick
	text " foi"
	cont "capturado!@"
	text_end

_ItemUseBallText07::
	text_ram wBoxMonNicks
	text " foi"
	line "transferido para"
	cont "o PC do BILL!"
	prompt

_ItemUseBallText08::
	text_ram wBoxMonNicks
	text " foi"
	line "transferido para"
	cont "o PC de Algué´m!"
	prompt

_ItemUseBallText06::
	;text "Uma nova pá´gina"
	;line "foi adicionada na"
	;cont "sua POKE´´DEX"
	;cont "para @"
	text "Sua POKèDEX foi"
	line "atualizada com"
	cont "novas informaçõ~es"
	cont "sobre @"



	;text "Nova entrada na"
	;line "#DEuX adicionada"
	;cont "para @"
	text_ram wEnemyMonNick
	text "!@"
	text_end

_SurfingGotOnText::
	text "<PLAYER> subiu"
	line "em @"
	text_ram wcd6d
	text "!"
	prompt

_SurfingNoPlaceToGetOffText::
	text "Nã~o tem lugar"
	line "para descer!"
	prompt

_VitaminStatRoseText::
	text_ram wStringBuffer
	text " de"
	line "@"
	text_ram wcd6d
	text " subiu."
	prompt

_VitaminNoEffectText::
	text "Nã~o faz mais"
	line "nenhum efeito."
	prompt

_ThrewBaitText::
	text "<PLAYER> jogou"
	line "uma ISCA."
	done

_ThrewRockText::
	text "<PLAYER> jogou"
	line "uma PEDRA."
	done

_PlayedFluteNoEffectText::
	text "Tocou a #"
	line "FLAUTA."

	para "E´´ uma melodia"
	line "contagiosa!"
	prompt

_FluteWokeUpText::
	text "#MON dormindo"
	line "acordaram."
	prompt

_PlayedFluteHadEffectText::
	text "<PLAYER> tocou a"
	line "# FLAUTA.@"
	text_end

_CoinCaseNumCoinsText::
	text "Fichas"
	line "@"
	text_bcd wPlayerCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " "
	prompt

_ItemfinderFoundItemText::
	text "Isso! LOCALIZADOR"
	line "encontrou algo"
	cont "nos arredores."
	prompt

_ItemfinderFoundNothingText::
	text "Nada! LOCALIZADOR"
	line "nã~o achou nada."
	prompt

_RaisePPWhichTechniqueText::
	text " ";text "Aumentar os PP de"	;Removido pois o menu de golpes aparece
			;line "qual té´cnica?"		;por cima e esse texto foi reescrito
	done

_RestorePPWhichTechniqueText::
	text " ";text "Restaurar os PP de"	;Removido pois o menu de golpes aparece
			;line "qual té´cnica?"		;por cima e esse texto foi reescrito
	done

_PPMaxedOutText::
	text_ram wStringBuffer
	text ""
	line "já´ tem PP má´ximo."
	prompt

_PPIncreasedText::
	text_ram wStringBuffer
	text ""
	line "expandiu seus PP."
	prompt

_PPRestoredText::
	text "Os PP foram"
	line "restaurados."
	prompt

_BootedUpTMText::
	text "Ativou uma MT!"
	prompt

_BootedUpHMText::
	text "Ativou uma MT"
	line "Oculta!"
	prompt

_TeachMachineMoveText::
	text "Ela conté´m"
	line "@"
	text_ram wStringBuffer
	text "!"

	para "Quer ensinar"
	line "@"
	text_ram wStringBuffer
	text_start
	cont "para um #MON?"
	done

_MonCannotLearnMachineMoveText::
	text_ram wcd6d
	text " nã~o é´"
	line "compatível com"
	cont "@"
	text_ram wStringBuffer
	text "."

	para "Ele nã~o aprende"
	line "@"
	text_ram wStringBuffer
	text "."
	prompt

_ItemUseNotTimeText::
	text "CARVALHO: Nã~o"
	line "é´ hora de usar"
	cont "isso, <PLAYER>!"
	prompt

_ItemUseNotYoursToUseText::
	text "Nã~o é´ seu para"
	line "você^ usar!"
	prompt

_ItemUseNoEffectText::
	text "Nã~o vai fazer"
	line "nenhum efeito."
	prompt

_ThrowBallAtTrainerMonText1::
	text "O treinador"
	line "bloqueou a BOLA!"
	prompt

_ThrowBallAtTrainerMonText2::
	text "Nã~o seja"
	line "um ladrã~o!"
	prompt

_NoCyclingAllowedHereText::
	text "Nã~o pode"
	next "pedalar aqui."
	prompt

_NoSurfingHereText::
	text "Nã~o pode SURFAR"
	line "@"
	text_ram wcd6d
	text " aqui!"
	prompt

_BoxFullCannotThrowBallText::
	text "A # CAIXA"
	line "está´ lotada! Nã~o"
	cont "pode usar isso!"
	prompt
