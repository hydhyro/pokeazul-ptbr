_MrPsychicsHouseMrPsychicYouWantedThisText::
	text "...Espere! nã~o"
	line "diga uma palavra!"

	para "Você^ queria isso!"
	prompt

_MrPsychicsHouseMrPsychicReceivedTM29Text::
	text "<PLAYER> recebeu"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_MrPsychicsHouseMrPsychicTM29ExplanationText::
	text "MT29 conté´m"
	line "PSI´´QUICO!"

	para "Esse golpe pode"
	line "abaixar o atribu-"
	cont "to de ESPECIAL do"
	cont "seu adversá´rio."
	done

_MrPsychicsHouseMrPsychicTM29NoRoomText::
	text "Onde pretender por"
	line "isso, se você^"
	cont "nã~o tem espaço?"
	done
