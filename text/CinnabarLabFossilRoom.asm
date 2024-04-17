_CinnabarLabFossilRoomScientist1Text::
	text "Olá´!"

	para "Eu ser uma doutor"
	line "muito importante!"

	para "Aqui eu estudar os"
	line "raros fó´sseis de"
	cont "#MON!"

	para "Ei! Você^ ter algum"
	line "fó´ssil para mim?"
	prompt

_CinnabarLabFossilRoomScientist1NoFossilsText::
	text "Nã~o! Mas que pena!"
	done

_CinnabarLabFossilRoomScientist1GoForAWalkText::
	text "Eu demorar um"
	line "pouco!"

	para "Você^ ir dar uma"
	line "passeio rá´pido!"
	done

_CinnabarLabFossilRoomScientist1FossilIsBackToLifeText::
	text "Onde você^ estava?"

	para "Seu fó´ssil está´"
	line "de volta a vida!"

	para "Era um @"
	text_ram wStringBuffer
	text_start
	line "como eu pensava!"
	prompt

_CinnabarLabFossilRoomScientist1SeesFossilText::
	text "Oh! Esse ser"
	line "@"
	text_ram wcd6d
	text "!"

	para "E´´ um fó´ssil de"
	line "@"
	text_ram wStringBuffer
	text ", um"
	cont "#MON que já´"
	cont "está´ extinto!"

	para "Minha Má´quina de"
	line "Ressurreiçã~o vai"
	cont "trazer esse #-"
	cont "MON de volta á` "
	cont "vida! Tudo bem?"
	done

_CinnabarLabFossilRoomScientist1TakesFossilText::
	text "Entã~o! Se apresse"
	line "e me dê^ isso!"

	para "<PLAYER> entregou"
	line "o @"
	text_ram wcd6d
	text "!"
	prompt

_CinnabarLabFossilRoomScientist1GoForAWalkText2::
	text "Eu demorar um"
	line "pouco!"

	para "Você^ ir dar uma"
	line "passeio rá´pido!"
	done

_CinnabarLabFossilRoomScientist1ComeAgainText::
	text "Aiyah! Você^ voltar"
	line "depois!"
	done
