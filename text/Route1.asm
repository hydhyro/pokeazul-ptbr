_Route1Youngster1MartSampleText::
	text "Oi! Eu trabalho na"
	line "LOJA #MON."

	para "E´´ uma lojinha de"
	line "conveniê^ncias,"
	cont "venha nos visitar"
	cont "lá´ na CIDADE"
	cont "VIRIDIANA."

	para "Já´ sei, vou te dar"
	line "uma amostrinha!"
	cont "Aqui está´!"
	prompt

_Route1Youngster1GotPotionText::
	text "<PLAYER> ganhou"
	line "uma @"
	text_ram wStringBuffer
	text "!@"
	text_end

_Route1Youngster1AlsoGotPokeballsText::
	text "També´m temos"
	line "# BOLAs para"
	cont "capturar #MON!"
	done

_Route1Youngster1NoRoomText::
	text "Parece que você^ já´"
	line "nã~o tem espaço!"
	done

_Route1Youngster2Text::
	text "Vê^ esses barrancos"
	line "ao longo da rota?"

	para "Parece assustador,"
	line "mas você^ pode"
	cont "pular deles."

	para "Assim você^ vai"
	line "pode chegar no"
	cont "VILAREJO PALETA"
	cont "bem mais rá´pido."
	done

_Route1SignText::
	text "ROTA 1"
	line "VILAREJO PALETA -"
	cont "CIDADE VIRIDIANA"
	done
