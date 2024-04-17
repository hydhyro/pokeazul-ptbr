_CopycatsHouse2FCopycatDoYouLikePokemonText::
	text "<PLAYER>: Oi! Você^"
	line "gosta de #MON?"

	para "<PLAYER>: Hã~ nã~o,"
	line "eu acabei de"
	cont "perguntar isso."

	para "<PLAYER>: Hã~h?"
	line "Você^ é´ estranha!"

	para "COPIADORA: Hmm?"
	line "Parar de imitar?"

	para "Mas, é´ meu passa-"
	line "tempo favorito!"
	prompt

_CopycatsHouse2FCopycatTM31PreReceiveText::
	text "Oh uau!"
	line "Uma # BONECA!"

	para "Pra mim?"
	line "Obrigada!"

	para "Você^ pode ficar"
	line "com isso, entã~o!"
	prompt

_CopycatsHouse2FCopycatReceivedTM31Text::
	text "<PLAYER> recebeu"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_CopycatsHouse2FCopycatTM31Explanation1Text::
	text_start

	para "MT31 conté´m meu"
	line "golpe favorito,"
	cont "MI´´MICA!"

	para "Use isso em um"
	line "bom #MON!@"
	text_end

_CopycatsHouse2FCopycatTM31Explanation2Text::
	text "<PLAYER>: Oi! "
	line "Obrigado pela"
	cont "MT31!"

	para "<PLAYER>: Perdã~o?"

	para "<PLAYER>: Você^"
	line "realmente acha"
	cont "divertido ficar"
	cont "me imitando?"

	para "COPIADORA:"
	line "Pode apostar!"
	cont "E´´ o maior barato!"
	done

_CopycatsHouse2FCopycatTM31NoRoomText::
	text "Você^ nã~o quer isso"
	line "aqui? Precisa de"
	cont "mais espaço para"
	cont "poder pegar isso.@"
	text_end

_CopycatsHouse2FDoduoText::
	text "DODUO: Giiih!"

	para "ESPELHO ESPELHO"
	line "MEU, QUEM E´´ MAIS"
	cont "BELA DO QUE EU?"
	done

_CopycatsHouse2FRareDollText::
	text "Isso é´ um #MON"
	line "raro! Hã~?"
	cont "E´´ só´ uma boneca!"
	done

_CopycatsHouse2FSNESText::
	text "Um jogo do MARIO"
	line "com ele usando um"
	cont "balde na cabeça!"
	done

_CopycatsHouse2FPCMySecretsText::
	text "..."

	para "Meus Segredos!"

	para "Habilidade: "
	line "Imitar!"
	para "Passa-tempo: Cole-"
	line "cionar bonecas!"
	para "#MON Favorito:"
	line "CLEFAIRY!"
	done

_CopycatsHouse2FPCCantSeeText::
	text "Hã~? Eu nã~o vejo"
	line "nada, doutor!"
	done
