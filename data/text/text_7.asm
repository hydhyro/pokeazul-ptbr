_ItemUseText001::
	text "<PLAYER> usou@"
	text_end

_ItemUseText002::
	text_ram wStringBuffer
	text "!"
	done

_GotOnBicycleText1::
	text "<PLAYER> subiu na@"
	text_end

_GotOnBicycleText2::
	text_ram wStringBuffer
	text "!"
	prompt

_GotOffBicycleText1::
	text "<PLAYER> desceu da@"
	text_end

_GotOffBicycleText2::
	text " @"
	text_ram wStringBuffer
	text "."
	prompt

_ThrewAwayItemText::
	text "Jogou fora"
	line "@"
	text_ram wcd6d
	text "."
	prompt

_IsItOKToTossItemText::
	text "Quer jogar fora"
	line "@"
	text_ram wStringBuffer
	text "?"
	prompt

_TooImportantToTossText::
	text "Isso é´ importante"
	line "demais! Nã~o pode"
	cont "jogar fora assim!"
	prompt

_AlreadyKnowsText::
	text_ram wcd6d
	text " já´ sabe"
	line "@"
	text_ram wStringBuffer
	text "!"
	prompt

_ConnectCableText::
	text "Certo, conecte o"
	line "cabo, entã~o!"
	prompt

_TradedForText::
	text "<PLAYER> trocou"
	line "@"
	text_ram wInGameTradeGiveMonName
	text " por"
	cont "@"
	text_ram wInGameTradeReceiveMonName
	text "!@"
	text_end

_WannaTrade1Text::
	text "Eu procuro por um"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "! Quer"

	para "trocar por um"
	line "@"
	text_ram wInGameTradeReceiveMonName
	text "? "
	done

_NoTrade1Text::
	text "Ahhh!"
	line "Tudo bem..."
	done

_WrongMon1Text::
	text "Que? Esse nã~o é´"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "!"

	para "Se conseguir um,"
	line "volte aqui!"
	done

_Thanks1Text::
	text "Ei, obrigado(a)!"
	done

_AfterTrade1Text::
	text "Como vai meu velho"
	line "@"
	text_ram wInGameTradeReceiveMonName
	text "?"
	done

_WannaTrade2Text::
	text "Olá´! Gostaria"
	line "de trocar"

	para "seu @"
	text_ram wInGameTradeGiveMonName
	text " por"
	line "meu @"
	text_ram wInGameTradeReceiveMonName
	text "?"
	done

_NoTrade2Text::
	text "Bem, se você^"
	line "nã~o quer..."
	done

_WrongMon2Text::
	text "Hmm? Esse nã~o é´ um"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "."

	para "Lembre-se de mim"
	line "quando pegar um."
	done

_Thanks2Text::
	text "Obrigado(a)!"
	done

_AfterTrade2Text::
	text "Olá´! O seu velho" ;troca raichu troca poli
	line "amigo @"
	text_ram wInGameTradeGiveMonName
	text_start
	cont "é´ mesmo incrível!"
	done

_WannaTrade3Text::
	text "Oi! Você^ tem um"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "?"

	para "Quer trocar por"
	line "um @"
	text_ram wInGameTradeReceiveMonName
	text "?"
	done

_NoTrade3Text::
	text "Ah, que chato."
	done

_WrongMon3Text::
	text "...Esse nã~o é´"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "."

	para "Se pegar um"
	line "troque comigo!"
	done

_Thanks3Text::
	text "Obrigado(a), "
	line "amigo!"
	done

_AfterTrade3Text::
	text "Como vai meu velho"
	line "@"
	text_ram wInGameTradeReceiveMonName
	text "?"

	para "Meu @"
	text_ram wInGameTradeGiveMonName
	text " "
	line "está´ muito bem!"
	done

_NothingToCutText::
	text "Nã~o tem nada"
	line "para CORTAR aqui!"
	prompt

_UsedCutText::
	text_ram wcd6d
	text " cortou"
	line "o arbusto fora!"
	prompt

;não usado-yellow	
;_PokemonText::
;	text "#MON!"
;	done
;
;_DontHavePokemonText::
;	text "Você^ nã~o possui"
;	line "um #MON!"
;	prompt
