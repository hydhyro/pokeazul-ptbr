_SSAnneCaptainsRoomRubCaptainsBackText::
	text "CAPITA~~O: Ooargh..."
	line "Nã~o me sinto bem."
	cont "Urrp! Enjoado..."

	para "<PLAYER> esfregou"
	line "as costas do"
	cont "CAPITA~~O!"

	para "Esfrega-esfrega..."
	line "Esfrega-esfrega...@"
	text_end

_SSAnneCaptainsRoomCaptainIFeelMuchBetterText::
	text "CAPITA~~O: Ufa!"
	line "Obrigado! Já´ me"
	cont "sinto bem melhor!"

	para "Você^ quer ver"
	line "minha té´cnica"
	cont "de CORTAR?"

	para "Eu poderia te"
	line "mostrar se nã~o"
	cont "estivesse mal..."

	para "Já´ sei! Você^ pode"
	line "ficar com isso!"

	para "Ensine isso para"
	line "um #MON e o"
	cont "veja CORTAR a"
	cont "qualquer hora!"
	prompt

_SSAnneCaptainsRoomCaptainReceivedHM01Text::
	text "<PLAYER> ganhou"
	line "a @"
	text_ram wStringBuffer
	text "!@"
	text_end

_SSAnneCaptainsRoomCaptainNotSickAnymoreText::
	text "CAPITA~~O: Ufa!"

	para "Agora que já´ nã~o"
	line "estou mais tã~o"
	cont "enjoado, acho que"
	cont "é´ hora de partir."
	done

_SSAnneCaptainsRoomCaptainHM01NoRoomText::
	text "Ah nã~o! Você^ nã~o"
	line "tem espaço pra"
	cont "carregar isso!"
	done

_SSAnneCaptainsRoomTrashText::
	text "Eca! Nã~o deveria"
	line "ter olhado isso!"
	done

_SSAnneCaptainsRoomSeasickBookText::
	text "Como Nã~o Ficar"
	line "Enjoado no Mar..."
	cont "O CAPITA~~O estava"
	cont "lendo isso!"
	done
