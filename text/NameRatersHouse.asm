_NameRatersHouseNameRaterWantMeToRateText::
	text "Olá´, olá´! Eu sou o"
	line "NOMEADOR OFICIAL!"

	para "Quer que eu avalie"
	line "o apelido dos"
	cont "seus #MON?"
	done

_NameRatersHouseNameRaterWhichPokemonText::
	text "Qual #MON"
	line "devo avaliar?"
	prompt

_NameRatersHouseNameRaterGiveItANiceNameText::
	text ", entã~o?"
	line "Esse é´ um apelido"
	cont "muito bom!"

	para "Mas, gostaria de"
	line "trocar por outro"
	cont "ainda melhor?"

	para "Que tal?"
	done

_NameRatersHouseNameRaterWhatShouldWeNameItText::
	text "O´´timo! Que nome"
	line "vamos por?"
	prompt

_NameRatersHouseNameRaterPokemonHasBeenRenamedText::
	text "OK! Esse #MON"
	line "agora se chama"
	cont "@"
	text_ram wBuffer
	text "!"

	para "Esse é´ um nome"
	line "muito melhor que"
	cont "o anterior!"
	done

_NameRatersHouseNameRaterComeAnyTimeYouLikeText::
	text "Tudo bem! Volte"
	line "quando quiser!"
	done

_NameRatersHouseNameRaterATrulyImpeccableNameText::
	text_ram wcd6d
	text ", que?"
	line "Mas esse nome"
	cont "está´ perfeito!"

	para "Cuide bem do"
	line "@"
	text_ram wcd6d
	text "!"
	done
