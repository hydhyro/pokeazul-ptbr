_DaycareGentlemanIntroText::
	text "Eu cuido dessa"
	line "CRECHE #MON!"
	cont "Gostaria que eu"
	cont "cuidasse de um de"
	cont "seus #MON?"
	done

_DaycareGentlemanWhichMonText::
	text "Qual #MON"
	line "eu devo cuidar?"
	prompt

_DaycareGentlemanWillLookAfterMonText::
	text "Está´ bem, vou "
	line "cuidar bem do"
	cont "seu @"
	text_ram wcd6d
	text_start
	cont "."
	prompt

_DaycareGentlemanComeSeeMeInAWhileText::
	text "Volte depois de"
	line "algum tempo."
	done

_DaycareGentlemanMonHasGrownText::
	text "Seu @"
	text_ram wcd6d
	text_start
	line "cresceu um pouco!"

	para "O seu nível, "
	line "aumentou em @"
	text_decimal wDayCareNumLevelsGrown, 1, 3
	text "!"

	para "Nã~o é´ demais?"
	prompt

_DaycareGentlemanOweMoneyText::
	text "Você^ me deve ¥@"
	text_bcd wDayCareTotalCost, 2 | LEADING_ZEROES | LEFT_ALIGN
	text_start
	line "pelos cuidados"
	cont "que tive com"
	cont "esse #MON."
	cont "Quer retirar seu"
	cont "@"
	text_ram wDayCareMonName
	text " agora?"
	done

_DaycareGentlemanGotMonBackText::
	text "<PLAYER> pegou"
	line "@"
	text_ram wDayCareMonName
	text ""
	cont "de volta."
	done

_DaycareGentlemanMonNeedsMoreTimeText::
	text "Já´ voltou?"
	line "Seu @"
	text_ram wcd6d
	text_start
	cont "precisa de mais"
	cont "tempo comigo."
	prompt
