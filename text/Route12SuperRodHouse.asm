_Route12SuperRodHouseFishingGuruDoYouLikeToFishText::
	text "Eu sou o irmã~o"
	line "caçula do GURU"
	cont "DA PESCARIA!"

	para "Eu simplesmente"
	line "aaaaamo pescar!"

	para "Você^ gosta"
	line "de pescar?"
	done

_Route12SuperRodHouseFishingGuruReceivedSuperRodText::
	text "SUPER! Eu gostei"
	line "do seu estilo!"

	para "Pegue isso e vá´"
	line "pescar, jovem!"

	para "<PLAYER> recebeu"
	line "a @"
	text_ram wStringBuffer
	text "!@"
	text_end

_Route12SuperRodHouseFishingGuruFishingWayOfLifeText::
	text_start

	para "Pescaria é´ um "
	line "estilo de vida!"

	para "De mares aos rios,"
	line "vá´ e pesque um"
	cont "grandã~o, jovem!"
	done

_Route12SuperRodHouseFishingGuruThatsDisappointingText::
	text "Ah... Isso é´ tã~o"
	line "decepcionante..."
	done

_Route12SuperRodHouseFishingGuruTryFishingText::
	text "Olá´, jovem"
	line "<PLAYER>!"

	para "Use a SUPER VARA"
	line "em qualquer á´gua!"
	cont "Você^ pode pegar"
	cont "diversos tipos"
	cont "de #MON."

	para "Tente pescar em"
	line "qualquer lugar"
	cont "que puder!"
	done

_Route12SuperRodHouseFishingGuruNoRoomText::
	text "Ah nã~o!"

	para "Eu tenho um"
	line "presente para"
	cont "para você^, mas"
	cont "você^ nã~o tem"
	cont "espaço para ele!"
	done
