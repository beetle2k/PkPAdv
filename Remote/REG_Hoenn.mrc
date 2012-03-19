alias c.search.Littleroot_Town {
  if ($1 == May) && ($start($nick)) {
    if ($dados($nick,Quests,May1)) {
      if ($dados($nick,Quests,League)) {
        msg =$nick $ct $+ Voc� encontra-se com $cc $+ May $+ $ct $+ .
        var %x = $rini(cadastros,$nick,Clock,May), %o = $rini(cadastros,$nick,Info,Online)
        if ($calc(%o - %x) >= 28800) {
          if (!$rini(cadastros,$nick,Quests,May4)) { msg =$nick $chr(160) $cc $+ May $ct $+ - $nick $+ ! Parab�ns primeiramente pelo desempenho na liga pok�mon! Esses 'ribbons', ou medalhas, que seus pok�mon receberam, sem d�vida s�o muito interessantes! | writeini pkp\cadastros\ $+ $nick $+ .ini Quests May4 Ok }
          msg =$nick $chr(160) $cc $+ May $ct $+ - Mas vamos ao que interessa! Uma batalha pok�mon! Sim, agora ser� para valer! Agora quem quer testar as habilidades sou eu, j� que voc� � o campe�o! Hahaha...
          msg =$nick $ct $+ Digite $cc $+ .sim $ct $+ para aceitar ou $cc $+ .nao $ct $+ para rejeitar. | set %confirm. [ $+ [ $nick ] ] CLK:May | return
        }
        else {
          msg =$nick $chr(160) $cc $+ May $ct $+ - Acho que sou melhor como amiga do que como treinadora, n�o acha? Como n�o? Deveria!! Hahaha...
          var %x = $readini(pkp\status.ini,$dados($nick,Info,Region),Legendary), %x1 = $findtok(%x,Latias,0,58), %x2 = $findtok(%x,Latios,0,58), %x3 = $findtok(%x,Rayquaza,0,58)
          if (%x1) || (%x2) {
            if (%x1) && (%x2) { msg =$nick $chr(160) $cc $+ May $ct $+ - $nick $+ ! Voc� sabe da novidade?! Rumores dizem que dois pok�mon desconhecidos, um vermelho e outro azul, est�o sobrevoando toda Hoenn! Eles simplesmente podem aparecer em qualquer lugar, que estranho! Eu gostaria de ver um desses, mas n�o ficaria feliz se n�o conseguisse captur�-lo... }
            else { msg =$nick $chr(160) $cc $+ May $ct $+ - $nick $+ ! Voc� sabe da novidade?! Havia dois pok�mon desconhecidos sobrevoando Hoenn, mas agora apenas um pok�mon $iif(%x1,vermelho,azul) foi visto! Ser� que eles s�o fortes? Eu gostaria de encontra-lo, mas n�o gostaria de perd�-lo de vista, se eu realmente o encontrasse... }
            if (%x3) { msg =$nick $chr(160) $cc $+ May $ct $+ - Ah! Eu soube tamb�m que voc� despertou um pok�mon no topo do Sky Pillar! Quem mora ali perto diz ouvir todo dia o tem�vel rugido daquele pok�mon! Se eu fosse voc�, ficaria longe dali! }
          }
          else {
            if (%x3) { msg =$nick $chr(160) $cc $+ May $ct $+ - $nick $+ ! Eu soube que voc� despertou um pok�mon no topo do Sky Pillar! Quem mora ali perto diz ouvir todo dia o tem�vel rugido daquele pok�mon! Se eu fosse voc�, ficaria longe dali! }
            else { msg =$nick $chr(160) $cc $+ May $ct $+ - Como anda sua PokeDex? Eu n�o posso avali�-lo, mas a minha est� ficando incr�vel! Por qu� voc� n�o fala com meu tio, o Prof Birch? Ele est� no laborat�rio, com certeza! }
          }
        }
      }
      else { msg =$nick $cc $+ May $ct $+ n�o foi encontrada na cidade... }
      return
    }
    else {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ May $+ $ct $+ . | msg =$nick $chr(160) $cc $+ May $ct $+ - Ol�, voc� j� conseguiu seu primeiro pok�mon?
      if ($totalpokes($nick)) {
        msg =$nick $chr(160) $cc $+ May $ct $+ - �timo! Ent�o voc� j� deve estar pronto para capturar pok�mon! Mas antes disso, o que acha de uma batalha? | writeini pkp\cadastros\ $+ $nick $+ .ini Quests May1 Ok
        battle.npc $nick Start_May | sset [ [ B. ] $+ [ $checknickid($nick).ID ] $+ [ .Quest ] ] MAY | var %n = $gettok($rmoves($checknickid($nick).ID,1),1,58)
        msg =$nick $chr(160) $cc $+ May $ct $+ - Esta � a sua primeira batalha? Bem, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , ent�o voc� n�o deve saber como batalhar. Para atacar com seu pok�mon, digite " $+ $cc $+ .Golpe %n $+ $ct $+ ", sem as aspas, e $cc $+ $rini(cadastros,$nick,Team,1) $ct $+ usar� o golpe $cc $+ %n $ct $+ em seu advers�rio. | return
      }
      else { msg =$nick $chr(160) $cc $+ May $ct $+ - Mas o que voc� est� esperando! Meu tio, $cc $+ Prof Birch $+ $ct $+ , est� no laborat�rio. | return }
    }
  }
  elseif ($1 == Birch) || ($1 == Professor) || ($1 == Prof Birch) { msg =$nick $ct $+ Acho que $cc $+ Prof Birch $ct $+ est� no laborat�rio. | return }
  elseif ($1 == Mom) || ($1 == Mam�e) || ($1 == Mae) || ($1 == M�e) {
    if ($start($nick)) {
      msg =$nick $ct $+ Voc� encontra-se com sua m�e.
      var %r = $dados($nick,Info,Region) | if (!$dados($nick,%r,Badges).n) {
        var %x = $rini(cadastros,$nick,Quests,Mom) | if (!%x) { var %x = 1 }
        if (%x == 1) { msg =$nick $chr(160) $cc $+ Mom $ct $+ - Filho, tem alguma d�vida sobre como batalhar? Eu vou tentar te explicar, h� dois m�todos: voc� cria uma batalha e espera por outro treinador, ou ent�o voc� entra numa batalha criada. Para criar uma batalha, digite ' $+ $cc $+ .Criar <pok�mon> $+ $ct $+ ', substituindo $cc $+ <pok�mon> $ct $+ pelo nome do seu pok�mon. A seguir, aguarde pelo seu advers�rio. Agora, se quiser entrar numa batalha de outro treinador, digite ' $+ $cc $+ .Entrar <ID> <pok�mon> $+ $ct $+ ', onde $cc $+ <ID> $ct $+ � o ID da batalha respectiva e $cc $+ <pok�mon> $ct $+ o nome do pok�mon que voc� usar�. Ah, para listar as batalhas criadas e seus IDs, digite ' $+ $cc $+ .Listar $+ $ct $+ '. }
        elseif (%x == 2) { msg =$nick $chr(160) $cc $+ Mom $ct $+ - Para usar algum item, use sempre o comando ' $+ $cc $+ .Item Use <item> $+ $ct $+ ', onde $cc $+ <item> $ct $+ � o item selecionado. Para ver mais fun��es desse comando, digite ' $+ $cc $+ .Item $+ $ct $+ '. Para comprar novos itens, como $cc $+ Poke  Ball $+ $ct $+ , voc� precisar� visitar uma loja, usando o comando ' $+ $cc $+ .Loja $+ $ct $+ '. Aqui em $cc $+ Littleroot $ct $+ n�o h� loja, mas voc� encontrar� alguma nas pr�ximas cidades. Alias, sabe como avan�ar entre cidades? Utilize o comando ' $+ $cc $+ .Cidade Goto $+ $ct $+ ' para saber quais cidades est�o dispon�veis e, a seguir, digite ' $+ $cc $+ .Cidade Goto <localiza��o> $+ $ct $+ ', substituindo-o pelo nome da cidade. }
        elseif (%x == 3) { msg =$nick $chr(160) $cc $+ Mom $ct $+ - Para ver seus dados gerais, digite ' $+ $cc $+ .Dados $+ $ct $+ '. Para ver dados de outros treinadores, use o comando ' $+ $cc $+ .Dados <nick> $+ $ct $+ '. Ah, voc� tamb�m pode ver informa��es detalhadas sobre seu pok�mon usando o comando ' $+ $cc $+ .Dados <pok�mon> $+ $ct $+ ', ou ainda de outros treinadores (se poss�vel), ' $+ $cc $+ .Dados <nick> <pok�mon> $+ $ct $+ '. }
        elseif (%x == 4) { msg =$nick $chr(160) $cc $+ Mom $ct $+ - Querido, voc� pode personalizar seu cadastro, sabia? Utilizando o comando ' $+ $cc $+ .Perfil $+ $ct $+ ' voc� edita seu cadastro, e usando o comando ' $+ $cc $+ .Skin $+ $ct $+ ' voc� muda as cores do $cc $+ $me $+ $ct $+ ! Muito interessante, n�o? }
        else { msg =$nick $chr(160) $cc $+ Mom $ct $+ - $cc $+ $nick $+ $ct $+ , por que n�o d� uma olhada no ' $+ $cc $+ .Ajuda $+ $ct $+ '? Utilizando esse comando, voc� ver� todos os comandos dispon�veis! Se tiver alguma d�vida de como us�-los, lembre-se: informa��es contidas entre $cc $+ < $ct $+ e $cc $+ > $ct $+ s�o campos obrigat�rios, substitua pelo termo correspondente; se tiverem contidas entre $cc $+ ( $ct $+ e $cc $+ ) $+ $ct $+ , ser�o campos opcionais, mas em alguns casos obrigat�rios. Outros treinadores poder�o ajud�-lo se ainda tiver d�vidas, filho. Boa sorte! | var %x = 0 }
        writeini pkp\cadastros\ $+ $nick $+ .ini Quests Mom $calc(%x + 1)
      }
      else {
        if ($dados($nick,Quests,League)) {
          if ($item($nick,Silver Ticket).qnt) {
            if ($dados($nick,Kanto,League)) {
              if ($item($nick,Gold Ticket).qnt) {
                msg =$nick $chr(160) $cc $+ Mom $ct $+ - Ent�o vai viajar novamente? Divirta-se e mande sempre not�cias!
              }
              else { msg =$nick $chr(160) $cc $+ Mom $ct $+ - � bom ver que voc� est� desenvolvendo bastante suas habilidades, filho. Mam�e fica sempre preocupada, mas sei tamb�m que voc� se sair� bem em qualquer desafio. Ah, parece que desenvolveram um navio muito resistente aqui mesmo em $cc $+ Hoenn $+ $ct $+ . Somente uma mente brilhante poderia desenvolv�-lo... Conhece algum especialista em navios, filho? }
            }
            else {
              msg =$nick $chr(160) $cc $+ Mom $ct $+ - Divirta-se, filho!
              msg =$nick $chr(160) $cc $+ Mom $ct $+ - Mam�e sentir� saudades...
            }
          }
          else {
            msg =$nick $chr(160) $cc $+ Mom $ct $+ - Meu filho voc� conseguiu derrotar a liga pok�mon! Estou muito feliz, voc� conseguiu realizar seu sonho!
            msg =$nick $chr(160) $cc $+ Mom $ct $+ - Eu tinha feito uma poupan�a, mas achei melhor gastar o dinheiro comprando essa passagem de navio para $cc $+ Kanto $+ $ct $+ ! Parab�ns filho, receba este presente!
            msg =$nick $ct $+ Parab�ns, voc� ganhou o $cc $+ Silver Ticket $+ $ct $+ ! | item.add $nick Silver Ticket
          }
        }
        else {
          msg =$nick $chr(160) $cc $+ Mom $ct $+ - Filho, como vai sua jornada? Conseguiu capturar muitos pok�mon?
          msg =$nick $chr(160) $cc $+ Mom $ct $+ - N�o se esque�a de visitar a mam�e sempre!
        }
      }
      return
    }
    else { msg =$nick $ct $+ Nada foi encontrado. | return }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. | return }
}
alias c.search.Oldale_Town {
  if ($1 == Thomas) && ($start($nick)) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Thomas $+ $ct $+ , o criador de pok�mon.
    if ($dados($nick,Clock,Thomas)) && ($calc($dados($nick,Info,Online) - $dados($nick,Clock,Thomas)) < 10800) { msg =$nick $chr(160) $cc $+ Thomas $ct $+ - � bom saber que poderemos negociar sempre, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Que tal outra hora? | return }
    if ($totalpokes($nick) > 1) {
      msg =$nick $chr(160) $cc $+ Thomas $ct $+ - Nossa! Seus pok�mon est�o incr�veis! Voc� gostaria de vender algum deles para mim? | msg =$nick $ct $+ Digite $cc $+ .sim $ct $+ para confirmar e $cc $+ .nao $ct $+ para rejeitar.
      set %confirm. [ $+ [ $nick ] ] THM | return
    }
    else { msg =$nick $chr(160) $cc $+ Thomas $ct $+ - Quando tiver mais pok�mon, venha e vamos fazer neg�cio. | return }
  }
  elseif ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    if ($start($nick)) {
      if (!$dados($nick,Quests,Joy1)) {
        msg =$nick $chr(160) $cc $+ Joy $ct $+ - Ser� que voc� est� treinando seus pok�mon corretamente? Deixe-me dar uma olhada em seu time...
        if ($groupev($nick) >= 510) {
          msg =$nick $chr(160) $cc $+ Joy $ct $+ - Parab�ns, seu time est� formid�vel! Desse jeito n�o haver� advers�rio forte o bastante para derrot�-lo em sua jornada!
          msg =$nick $chr(160) $cc $+ Joy $ct $+ - Minha velha amiga desenvolveu um incr�vel sistema de armazenamento de pok�mon em PC. Voc� realmente deveria experimentar...
          if ($item($nick,PC).check == No!) { .msg =$nick $ct $+ Voc� ganhou o item $cc $+ PC $+ $ct $+ . | item.add $nick PC }
          else { .msg =$nick $ct $+ Voc� ganhou uma $cc $+ Small Box $ct $+ em seu $cc $+ PC $+ $ct $+ . | box.add $nick 30 } | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Joy1 Ok
        }
        else { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Seu time ainda n�o est� preparado... Lembre-se de derrotar advers�rios diferentes para aumentar o poder de seus atributos igualmente. Ah, claro, � poss�vel ter um pok�mon de level avan�ado e que n�o esteja treinado! }
        return
      }
    }
    var %pk = $dados($nick,$dados($nick,Team,1),Name), %n = $totalev($nick,%pk), %p = $calc(%n * 100 / 510)
    if (%n < 50) { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Seu pok�mon $cc $+ %pk $ct $+ ainda precisa treinar bastante! }
    elseif (%n < 85) { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Seu pok�mon $cc $+ %pk $ct $+ est� fazendo realmente bons progressos! }
    elseif (%n < 100) { msg =$nick $chr(160) $cc $+ Joy $ct $+ - seu pok�mon $cc $+ %pk $ct $+ desenvolve-se formidavelmente! N�o demorar� at� que seu treinamento esteja completo! }
    else { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Seu pok�mon $cc $+ %pk $ct $+ terminou seu treinamento! Parab�ns pelo seu esfor�o! | return }
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Lembre-se de treinar seu pok�mon com advers�rios diferentes para que o mesmo desenvolva-se de forma balanceada.
    return
  }
  elseif ($1 == Matt) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Matt $+ $ct $+ .
    var %x = $dados($nick,Clock,Matt)
    if (%x) { if ($calc($dados($nick,Info,Online) - $dados($nick,Clock,Matt)) < 600) { msg =$nick $chr(160) $cc $+ Matt $ct $+ - Estou ajudando outros treinadores agora. Ser� que voc� pode voltar em alguns minutos? | return } }
    msg =$nick $chr(160) $cc $+ Matt $ct $+ - Ol�! Vejo que voc� tamb�m � um treinador de pok�mon. J� faz algum tempo que come�ei minha jornada e posso te passar algumas informa��es sobre o treinamento de pok�mon.
    var %x = $rand(1,14) | if (%x == 1) { msg =$nick $chr(160) $cc $+ Matt $ct $+ - De acordo com os advers�rios que seu pok�mon derrota, seus Stats v�o ser alterados. Por exemplo, se quiser aumentar a SPD do seu pok�mon, tente derrotar v�rios Pidgeys e voc� vai ver a diferen�a. }
    elseif (%x == 2) { msg =$nick $chr(160) $cc $+ Matt $ct $+ - Voc� pode ver a "Nature" de seu pok�mon. Cada uma delas indica uma varia��o que seu pok�mon ir� sofrer sobre os Stats dele. Por exemplo, a Nature Calm significa menos ATK no seu pok�mon, por�m ele ter� um acr�scimo em SDEF. }
    elseif (%x == 3) { msg =$nick $chr(160) $cc $+ Matt $ct $+ - As "Traits" s�o habilidades que cada pok�mon tem, e posso dizer que s�o bem �teis. Por exemplo, a Trait Intimidate intimida o advers�rio e diminui seu ATK no in�cio da partida. Incr�vel! }
    elseif (%x == 4) { msg =$nick $chr(160) $cc $+ Matt $ct $+ - � importante deixar seu pok�mon feliz, confian�a entre treinador e pok�mon � fundamental. Pok�mon com "Loyalty" alta s�o bem apreciados. }
    elseif (%x == 5) { msg =$nick $chr(160) $cc $+ Matt $ct $+ - Uns dizem que o melhor ataque � a defesa, outros que um poderoso ataque � sempre vi�vel. Creio que uma boa estrat�gia � indispens�vel para a vit�ria de uma batalha. Tenha calma durante as lutas, e voc� vai se dar bem. }
    elseif (%x == 6) { msg =$nick $chr(160) $cc $+ Matt $ct $+ - As batalhas de tr�s contra tr�s podem ter desfechos impressionantes! Mas detalhe: n�o � poss�vel trocar de pok�mon, a troca � automaticamente realizada ap�s a derrota do mesmo. Organize seu time antes da partida e boa sorte! }
    elseif (%x == 7) { msg =$nick $chr(160) $cc $+ Matt $ct $+ - Os l�deres de gin�sio costumam batalhar com tr�s pok�mon, em leveis altos. � um verdadeiro desafio para o treinador, o que torna a vit�ria uma grande conquista! Prepare seus pok�mon para serem os melhores, e n�o tema os l�deres de gin�sio! }
    elseif (%x == 8) { msg =$nick $chr(160) $cc $+ Matt $ct $+ - A pr�xima cidade � Petalburg. Voc� poder� encontrar um g�nasio, mas n�o creio que poder� lutar ainda. Talvez Roxanne seja sua primeira advers�ria rumo � Liga Pok�mon. }
    elseif (%x == 9) { msg =$nick $chr(160) $cc $+ Matt $ct $+ - Fique sempre atento aos eventos que acontecem em cada cidade. Eu, por exemplo, ensino aos treinadores iniciantes t�cnicas para se desenvolverem ao longo do treinamento. Fique atento a outros eventos nas pr�ximas cidades! }
    elseif (%x == 10) { msg =$nick $chr(160) $cc $+ Matt $ct $+ - Os Technical Machines (TMs) s�o golpes que o treinador pode ensinar ao pok�mon! Voc� pode encontrar alguns destes em lojas ou derrotando l�deres de gin�sio! }
    elseif (%x == 11) { msg =$nick $chr(160) $cc $+ Matt $ct $+ - Mude sempre a ordem de seus pok�mon, muitas vezes o pok�mon que estiver liderando seu grupo interfere nos eventos. Quem sabe sua sorte mude de acordo com o pok�mon no topo do seu time? Fique atento! }
    elseif (%x == 12) { msg =$nick $chr(160) $cc $+ Matt $ct $+ - Esteja preparado para as lutas de gin�sio. Antes de enfrentar o l�der, voc� ter� que derrotar outros treinadores. Ou seja, voc� ter� que vencer v�rias partidas para conquistar uma nova ins�gnea! }
    elseif (%x == 13) { msg =$nick $chr(160) $cc $+ Matt $ct $+ - Se voc� ainda n�o tem o item PC, � bom se preocupar. Eu ouvi boatos de um presente da enfermeira Joy, mas o que raios ser�? Eu estou curioso... Quer saber? Treine seus pok�mon e boa sorte! }
    else { msg =$nick $chr(160) $cc $+ Matt $ct $+ - Pok�mon selvagens podem variar de cidade em cidade. Compre Poke  Balls em lojas para poder captur�-los. }
    writeini pkp\cadastros\ $+ $nick $+ .ini Clock Matt $dados($nick,Info,Online) | return
  }
  else { msg =$nick $ct $+ Nada foi encontrado. | return }
}
alias c.search.Petalburg_City {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Ol�, $nick $+ ! Espero que esteja feliz aqui em Petalburg!
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Voc� poder� encontrar um gin�sio pok�mon! Estou falando da liga pok�mon de Hoenn, voc� n�o sabia?
    if ($start($nick)) {
      var %badges = $dados($nick,$dados($nick,Info,Region),Badges).n, %badges = $iif(!%badges,0,%badges)
      if (%badges < 4) { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Creio que Norman n�o batalhe com voc� at� voc� adquirir mais ins�gneas. Ele � realmente um p�reo duro, voc� vai precisar de mais experi�ncia se quiser venc�-lo! } | else { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Acho que voc� j� est� pronto. Boa sorte em sua jornada treinador! }
    }
    return
  }
  elseif ($1 == Writney) && ($start($nick)) {
    if ($rini(cadastros,$nick,Quests,League)) { msg =$nick $ct $+ Acho que $cc $+ Writney $ct $+ n�o est� mais na cidade... | return }
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Writney $+ $ct $+ , um velho navegador.
    msg =$nick $chr(160) $cc $+ Writney $ct $+ - Ol�, $nick $+ !
    if ($rini(cadastros,$nick,Quests,Stone)) { msg =$nick $chr(160) $cc $+ Writney $ct $+ - Precisa ir a Dewford? | msg =$nick $ct $+ Digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar. | set %confirm. [ $+ [ $nick ] ] WRT:Dewford City | return }
    else { msg =$nick $chr(160) $cc $+ Writney $ct $+ - Este meu Wingull Peeko � adoravel, n�o? Somos companheiros h� bastante tempo. | return }
  }
  elseif ($1 == Derek) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Derek $+ $ct $+ , um treinador pok�mon.
    msg =$nick $chr(160) $cc $+ Derek $ct $+ - Droga! Eu sabia que n�o estava pronto para aquela batalha! Voc� j� viu os pok�mon de Norman?! S�o incr�veis! Mas j� sei o que vou fazer: vou treinar mais e em breve voltarei para desafi�-lo novamente! Ele vai ver s�!
    return
  }
  elseif ($1 == Wally) && ($start($nick)) {
    if ($badge($nick,Balance Badge)) {
      if ($rini(cadastros,$nick,Quests,Wally1)) { msg =$nick $ct $+ Acho que $cc $+ Wally $ct $+ n�o est� mais na cidade... | return }
      else {
        msg =$nick $ct $+ Voc� encontra-se com $cc $+ Wally $+ $ct $+ , um treinador pok�mon.
        msg =$nick $chr(160) $cc $+ Wally $ct $+ - Eu diria que aprendi bastante com a batalha! � assim, junto com meu pok�mon, que eu pretendo batalhar e conquistar minhas ins�gneas. Obrigado, $nick $+ . Obrigado, Norman. Agora entendo tudo claramente.
        msg =$nick $ct $+ Voc� recebeu o item $cc $+ HM03 $+ $ct $+ . | item.add $nick HM03 | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Wally1 Ok
        msg =$nick $chr(160) $cc $+ Wally $ct $+ - Eu vou seguindo a minha pr�pria jornada agora. $nick $+ , nos veremos ainda antes da liga, eu prometo. E esteja preparado. | return
      }
    }
    else { msg =$nick $ct $+ Nada foi encontrado. | return }
  }
  elseif ($1 == Norman) {
    if ($badge($nick,Balance Badge)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Norman $+ $ct $+ , l�der do gin�sio de Petalburg.
      if ($start($nick)) {
        if ($rini(cadastros,$nick,Quests,Wally1)) { msg =$nick $chr(160) $cc $+ Norman $ct $+ - Parab�ns pela excelente batalha no gin�sio. Quem sabe n�o teremos uma segunda algum dia? }
        else { msg =$nick $chr(160) $cc $+ Norman $ct $+ - Wally est� come�ando sua jornada agora, ele quer recompens�-lo pelo aprendizado que obteve enquanto batalh�vamos. }
      }
      else { msg =$nick $chr(160) $cc $+ Norman $ct $+ - Excelente batalha, voc� possui uma habilidade incr�vel como treinador. Boa sorte. }
      return
    }
    else { msg =$nick $cc $+ Norman $ct $+ est� no gin�sio, aguardando seu desafio. | return }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. | return }
}
alias c.search.Moonlight_Woods { msg =$nick $ct $+ Nada foi encontrado. }
alias c.search.Rustboro_City {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Ol�, $nick $+ ! Bem vindo a Rustboro!
    if ($start($nick)) {
      msg =$nick $chr(160) $cc $+ Joy $ct $+ - Ent�o voc� est� participando da liga pok�mon? Bem, aqui � onde os treinadores d�o o seu primeiro passo!
      var %badges = $dados($nick,$dados($nick,Info,Region),Badges).n, %badges = $iif(!%badges,0,%badges)
      if (%badges >= 1) {
        if ($rini(cadastros,$nick,Quests,Joy2)) { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Lembre-se que ao ensinar um HM ao pok�mon, ele n�o poder� esquec�-lo! Boa sorte! }
        else { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Nossa! Voc� ganhou a ins�gnea! Parab�ns, seus pok�mon j� podem usar a t�cnica $cc $+ Cut $+ $ct $+ ! | item.add $nick HM01 | msg =$nick $ct $+ Voc� ganhou o item $cc $+ HM01 $+ $ct $+ ! | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Joy2 Ok }
      }
      else { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Procure pelo gin�sio na cidade para desafi�-lo, por�m isso pode custar caro, voc� vai precisar desembolsar $cc $+ $chr(36) $+ 15000 $ct $+ por desafio! Ent�o, boa sorte! }
    }
    else { msg =$nick $chr(160) $cc $+ Joy $ct $+ - A l�der do gin�sio desta cidade usa pok�mon de pedra. Talvez ela seja 'durona' demais para voc�. }
    return
  }
  elseif ($1 == May) && ($start($nick)) {
    var %badges = $dados($nick,$dados($nick,Info,Region),Badges).n, %badges = $iif(!%badges,0,%badges)
    if (%badges == 1) {
      msg =$nick $chr(160) $cc $+ May $ct $+ - Yay! $nick $+ ! Como sabia que eu estava aqui? Sou t�o previs�vel assim?
      msg =$nick $chr(160) $cc $+ May $ct $+ - Assim que soube da inven��o de PokeDex, eu vim correndo at� Rustboro adquirir a minha!
      if ($item($nick,PokeDex).qnt) { msg =$nick $chr(160) $cc $+ May $ct $+ - N�o se esque�a de... voc� j� tem a PokeDex... ent�o � melhor eu me apressar! | return }
      else { msg =$nick $chr(160) $cc $+ May $ct $+ - N�o se esque�a de pegar a sua tamb�m! | return }
    }
    else { msg =$nick $ct $+ Nada foi encontrado. | return }
  }
  elseif ($findtok(Stone:Mr Stone:Senhor Stone:Sr Stone,$1,0,58)) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Mr Stone $+ $ct $+ , o dono da Devon Corporation.
    if ($start($nick)) {
      if ($rini(cadastros,$nick,Quests,Steven1)) {
        if ($rini(cadastros,$nick,Quests,Stone2)) {
          if ($rini(cadastros,$nick,Quests,Stone3)) {
            if ($rini(cadastros,$nick,Quests,League)) {
              if ($item($nick,Gold Ticket).qnt) && (!$dados($nick,Quests,Tidal)) { msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - Ei, estaremos aguardando a sua presen�a na viagem de inaugura��o do $cc $+ SS Tidal $+ $ct $+ ! Voc� j� tem o ingresso, agora s� precisa ir at� o porto mais pr�ximo. Nosso destino ser� $cc $+ Johto $+ $ct $+ , j� ouviu falar neste continente? | return }
              if (!$item($nick,Gold Ticket).qnt) && ($dados($nick,Quests,Stern4)) {
                msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - Oh c�us, onde raios eu estava com a minha cabe�a! Perd�o, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , mas a inaugura��o do $cc $+ SS Tidal $ct $+ deixou-me um pouco pertubado... Era muita gente para convidar!
                msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - Ainda consegue se lembrar de uma carta que eu pedi para entregar a meu filho, em $cc $+ Dewford City $+ $ct $+ ? Bem, tratava-se do projeto do pr�prio $cc $+ SS Tidal $+ $ct $+ , por isso $cc $+ Steven $ct $+ dirigiu a carta ao capit�o $cc $+ Stern $+ $ct $+ , que ficou encarregado de desenvolv�-lo. Voc� ficar� surpreso com o capit�o do $cc $+ SS Tidal $+ $ct $+ ... N�o direi mais nada, farei com que veja por si mesmo!
                item.add $nick Gold Ticket | msg =$nick $ct $+ Parab�ns, voc� recebeu o item $cc $+ Gold Ticket $+ $ct $+ ! | return
              }
              var %x = $rini(cadastros,$nick,Clock,Stone), %o = $rini(cadastros,$nick,Info,Online)
              if ($calc(%o - %x) >= 18000) { var %x = $rand(0,1) | msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - $nick $+ , olhe, aqui est� uma amostra gr�tis de mais um produto desenvolvido pela minha corpora��o: $cc $+ $iif(%x,Timer Ball,Repeat Ball) $+ $ct $+ ! | item.add $nick $iif(%x,Timer Ball,Repeat Ball) | writeini pkp\cadastros\ $+ $nick $+ .ini Clock Stone %o | return }
              else { msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - Voc� pode conferir as novas Poke  Balls criadas pela $cc $+ Devon Corp $ct $+ como a $cc $+ Repeat Ball $ct $+ e a $cc $+ Timer Ball $ct $+ na loja de milhagens! Elas est�o ficando muito populares entre os treinadores. Por que n�o passa aqui depois? Eu vou arrumar uma amostra gr�tis quando puder. | return }
            }
            else {
              if ($rini(cadastros,$nick,Info,Scope)) { msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - Voc� deve gostar de mist�rios, $nick $+ , por deixar seu $cc $+ Devon Scope $ct $+ ligado aqui em Rustboro. Eu ouvi falar numa floresta escondida por arbustos e muito escura perto de Petalburg City. Voc� sabe alguma coisa a respeito? | return }
              if ($team.hm($nick,Fly) == Ok!) { msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - Utilizar a t�cnica $cc $+ Fly $ct $+ � muito c�modo, n�o? Pena que n�o d� pra chegar em todos os pontos com esta t�cnica. | return }
              msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - Estou desenvolvendo novos tipos de Poke  Balls, em breve voc� ter� alguns desses modelos! Hahaha...
            }
          }
          else {
            if ($rini(cadastros,$nick,Quests,Steven2)) {
              msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - Nossa, voc� andou at� Fortree e voltou a Rustboro! Que caminhada, digo, que v�o! Meu filho avan�a as cidades mais r�pido porque ele usa $cc $+ Running Shoes $+ $ct $+ . Que tal voc� experimentar tamb�m?
              msg =$nick $ct $+ Voc� ganhou o item $cc $+ Running Shoes $+ $ct $+ ! | item.add $nick Running Shoes | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Stone3 Ok
            }
            else { msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - Meu filho Steven � um treinador assim como voc�, por isso est� sempre em sua jornada. Ele me disse que estava em uma cidade que foi constru�da em cima de �rvores, acho que seu nome � Fortree City. }
          }

        }
        else {
          msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - Obrigado, $nick $+ , por entregar a carta a meu filho Steven em Dewford. Receba isto como agradecimento pelo bom trabalho.
          msg =$nick $ct $+ Voc� recebeu cinco $cc $+ Great Balls $+ $ct $+ ! | var %x = 0 | while (%x < 5) { inc %x | item.add $nick Great Ball } | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Stone2 Ok
        }
        return
      }
      else {
        msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - Voc� �...? $nick $+ ! Ah, acho que Prof Birch me falou de voc�.
        msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - Birch pediu-me para lhe entregar o novo produto que nossa corpora��o desenvolveu. Ele me garantiu que voc� � um treinador talentoso!
        if ($badge($nick,Stone Badge)) {
          if ($rini(cadastros,$nick,Quests,Stone)) { msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - Faz tempo que n�o vejo um jovem t�o cheio de energia como voc�! Hahaha... Boa sorte! | if (!$findtok($rini(cadastros,$nick,Info,Visited),Dewford City,0,58)) { msg =$nick $chr(160) $cc $+ Devon $ct $+ - Ah, para ir a Dewford City, basta pegar uma balsa com meu amigo Writney em Petalburg. } | return }
          else {
            msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - Incr�vel! Desculpe ter que faz�-lo provar o quanto � forte, eu j� sabia que voc� era capaz. Quando chegar em $cc $+ Dewford City $+ $ct $+ , quero que entregue esta carta a $cc $+ Steven $+ $ct $+ , meu filho. Para isso, basta pegar uma balsa com $cc $+ Writney $+ $ct $+ , em $cc $+ Petalburg City $+ $ct $+ . Agora chega de conversa e vamos ao que interessa!
            msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - Desenvolvemos uma enciclop�dia pok�mon chamada $cc $+ PokeDex $+ $ct $+ ! Fale com meu assistente $cc $+ Walter $+ $ct $+ , ele vai entregar-lhe uma. Boa sorte, $dados($nick,Info,Nick) $+ , na sua jornada!
            writeini pkp\cadastros\ $+ $nick $+ .ini Quests Stone Ok | return
          }
        }
        else { msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - Mostre-me o seu talento, e derrote a l�der desta cidade, $cc $+ Roxanne $+ $ct $+ . Ser� que voc� consegue? Hmm, claro! Boa sorte! | return }
      }
    }
    else {
      if ($dados($nick,Hoenn,League)) {
        if ($dados($nick,Quests,Stone1)) {
          if ($dados($nick,Quests,Steven1)) {
            if ($item($nick,Gold Ticket).qnt) {
              if ($dados($nick,Quests,Tidal)) {
                var %x = $rini(cadastros,$nick,Clock,Stone), %o = $rini(cadastros,$nick,Info,Online)
                if ($calc(%o - %x) >= 18000) { var %x = $rand(0,1) | msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - $nick $+ , olhe, aqui est� uma amostra gr�tis de mais um produto desenvolvido pela minha corpora��o: $cc $+ $iif(%x,Timer Ball,Repeat Ball) $+ $ct $+ ! | item.add $nick $iif(%x,Timer Ball,Repeat Ball) | writeini pkp\cadastros\ $+ $nick $+ .ini Clock Stone %o }
                else { msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - Voc� pode conferir as novas Poke  Balls criadas pela $cc $+ Devon Corp $ct $+ como a $cc $+ Repeat Ball $ct $+ e a $cc $+ Timer Ball $ct $+ na loja de milhagens! Elas est�o ficando muito populares entre os treinadores. Por que n�o passa aqui depois? Eu vou arrumar uma amostra gr�tis quando puder. }
              }
              else { msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - Estaremos aguardando a sua presen�a na viagem de inaugura��o. Est� ancioso para conhecer $cc $+ Johto $+ $ct $+ ? }
            }
            else {
              msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - Hahaha, vejo que voc� encontrou-se com $cc $+ Steven $+ $ct $+ , meu filho. Ele acabou de me comunicar que adorou a batalha que voc�s tiveram e que, sem d�vida, voc� tinha muito talento...
              msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - Sabe, adoro ajudar treinadores talentosos, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ . N�o vejo outra sa�da a n�o ser convid�-lo a vir conosco a bordo do $cc $+ SS Tidal $+ $ct $+ ! Ser� a viagem de inaugura��o, tenho certeza de que vai gostar. Nosso destino ser� $cc $+ Johto $+ $ct $+ , mas eu pessoalmente terei que voltar pois h� muito trabalho a ser feito...
              msg =$nick $ct $+ Parab�ns, voc� recebeu o item $cc $+ Gold Ticket $+ $ct $+ ! | item.add $nick Gold Ticket
            }
          }
          else { msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - Prepare, estou certo de que, se ele encontr�-lo, voc�s ter�o uma batalha e tanto! }
        }
        else {
          msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - Hahaha, parab�ns! Voc� conseguiu derrotar a liga pok�mon de $cc $+ Hoenn $+ $ct $+ ! Sabe, vou contar-lhe um pequeno segredo: meu filho tamb�m � um treinador muito famoso, mas duvido que voc� tenha ouvido falar nele porque, digamos, ele n�o est� mais na ativa... Bem, voc� encontrar� respostas em $cc $+ Meteor Falls $+ $ct $+ : ele adora pedras raras!
          writeini pkp\cadastros\ $+ $nick $+ .ini Quests Stone1 Ok
        }
      }
      else { msg =$nick $chr(160) $cc $+ Mr Stone $ct $+ - Ent�o voc� � o famoso $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , huh? Voc� certamente � bem popular aqui em $cc $+ Hoenn $+ $ct $+ , pois j� ouvi falar muito de voc�! }
    }
  }
  elseif ($1 == Walter) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Walter $+ $ct $+ , um cientista da Devon.
    if ($rini(cadastros,$nick,Quests,Stone)) {
      if ($rini(cadastros,$nick,Quests,Walter)) { msg =$nick $chr(160) $cc $+ Walter $ct $+ - Para ver informa��es de seu pok�mon com a PokeDex, digite $cc $+ .pokedex <pok�mon> $+ $ct $+ . Agora, vou voltar ao trabalho. | return }
      else { msg =$nick $chr(160) $cc $+ Walter $ct $+ - Huh? Ah sim, desculpe. Aqui est� sua PokeDex. | item.add $nick PokeDex | msg =$nick $ct $+ Voc� ganhou o item $cc $+ PokeDex $+ $ct $+ . | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Walter Ok }
    }
    else {
      msg =$nick $chr(160) $cc $+ Walter $ct $+ - Por favor! Estou ocupado agora! | return
    }
  }
  elseif ($1 == Shelby) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Shelby $+ $ct $+ , a recepcionista da Devon.
    msg =$nick $chr(160) $cc $+ Shelby $ct $+ - Ol�, $nick $+ ! Esta � a Corpora��o Devon, desenvolvemos por aqui tecnologias para uso de treinadores, como voc�! Por favor, n�o fa�a muito barulho, h� cientistas trabalhando.
    return
  }
  elseif ($1 == Roxanne) {
    if ($badge($nick,Stone Badge)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Roxanne $+ $ct $+ , l�der do gin�sio de Rustboro.
      if ($start($nick)) {
        if ($rini(cadastros,$nick,Quests,Joy2)) { msg =$nick $chr(160) $cc $+ Roxanne $ct $+ - Eu nunca achei que perderia usando meus pok�mon e minha estrat�gia. Mas a sua superou a minha, no final das contas. }
        else { msg =$nick $chr(160) $cc $+ Roxanne $ct $+ - Agora que ganhou sua ins�gnea, voc� pode ensinar a t�cnica Cut para seus pok�mon. Procure pela enfermeira do centro pok�mon. }
      }
      else { msg =$nick $chr(160) $cc $+ Roxanne $ct $+ - Muito bem, n�o fico triste por ter perdido uma batalha com algu�m como voc�. � um aprendizado, na verdade. Boa sorte. }
      return
    }
    else { msg =$nick $cc $+ Roxanne $ct $+ est� no gin�sio, aguardando seu desafio. | return }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. } | return
}
alias c.search.Dewford_City {
  if ($1 == Steven) && ($start($nick)) {
    if ($rini(cadastros,$nick,Quests,Steven1)) { msg =$nick $ct $+ Acho que $cc $+ Steven $ct $+ n�o est� mais na cidade. | return }
    else {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Steven Stone $+ $ct $+ . | msg =$nick $chr(160) $cc $+ Steven $ct $+ - Sim?
      if ($rini(cadastros,$nick,Quests,Stone)) { msg =$nick $chr(160) $cc $+ Steven $ct $+ - Hm? Uma carta para mim? | msg =$nick $chr(160) $cc $+ Steven $ct $+ - Ah, agora entendo. Voc� conquistou sua primeira ins�gnea com Roxanne, e logo ap�s fiquei sabendo de sua exist�ncia. Seu nome �... $cc $+ $dados($nick,Info,Nick) $ct $+ certo? Nada mal, para um iniciante. | msg =$nick $chr(160) $cc $+ Steven $ct $+ - Obrigado pela carta. A prop�sito, mostre-a ao capit�o $cc $+ Stern $ct $+ em $cc $+ Slateport City $+ $ct $+ . Aqui est�, o $cc $+ TM47 $+ $ct $+ . Ele ensina a t�cnica Steel Wing, � uma maravilha! Bem, esta � minha deixa. At� mais! | item.add $nick TM47 | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Steven1 Ok | return }
      else { msg =$nick $chr(160) $cc $+ Steven $ct $+ - N�o entendo, n�s nos conhecemos? | return }
    }
  }
  elseif ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Ol�, $nick $+ ! Bem vindo a $cc $+ $dados($nick,Info,Locate) $+ $ct $+ ! Aqui voc� pode encontrar uma bel�ssima praia, e ainda uma caverna rochosa logo ao norte da cidade. Mas cuidado, ouvi rumores de pok�mon fantasma naquela caverna! Assustador, n�o?
    return
  }
  elseif ($1 == Writney) && ($start($nick)) {
    if ($rini(cadastros,$nick,Quests,League)) { msg =$nick $ct $+ Acho que $cc $+ Writney $ct $+ n�o est� mais na cidade... | return }
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Writney $+ $ct $+ , um velho navegador.
    msg =$nick $chr(160) $cc $+ Writney $ct $+ - Ol�, $nick $+ ! Deseja voltar a $cc $+ Petalburg City $ct $+ ou prosseguir at� $cc $+ Slateport City $+ $ct $+ ?
    msg =$nick $ct $+ Para confirmar, digite ' $+ $cc $+ .Sim <destino> $+ $ct $+ ', especificando o destino, ou rejeite digitando ' $+ $cc $+ .nao $+ $ct $+ '. | set %confirm. [ $+ [ $nick ] ] WRT:Petalburg City;Slateport City
    return
  }
  elseif ($1 == Brawly) {
    if ($badge($nick,Knuckle Badge)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Brawly $+ $ct $+ , l�der do gin�sio de Dewford.
      if ($start($nick)) {
        if ($rini(cadastros,$nick,Quests,Steven1)) { msg =$nick $chr(160) $cc $+ Brawly $ct $+ - Com a ins�gnea $cc $+ Knuckle Badge $ct $+ que recebeu neste gin�sio, voc� poder� usar $cc $+ Flash $ct $+ fora das batalhas. | if (!$item($nick,HM05).qnt) { item.add $nick HM05 | msg =$nick $ct $+ Voc� ganhou o item $cc $+ HM05 $+ $ct $+ . } }
        else { msg =$nick $chr(160) $cc $+ Brawly $ct $+ - Quando fui treinar na Granite Cave, conheci um treinador chamado $cc $+ Steven $ct $+ e ele me parece ser muito experiente como treinador de pok�mon. }
      }
      else { msg =$nick $chr(160) $cc $+ Brawly $ct $+ - A for�a de um pok�mon lutador, quando bem utilizada, pode derrubar montanhas... | return }
      return
    }
    else { msg =$nick $cc $+ Brawly $ct $+ est� no gin�sio, aguardando seu desafio. | return }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. | return }
}
alias c.search.Slateport_City {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Ol�, $nick $+ ! Slateport � famosa por causa de sua grande variedade de itens em seu estoque, importadas de todos os cantos do mundo!
    if (!$rini(cadastros,$nick,Quests,Stern1)) { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Ah, ja visitou o museu? Se n�o, � bom dar uma olhada! }
    return
  }
  elseif ($1 == Aqua) || ($1 == Sam) {
    if ($start($nick)) {
      if ($rini(cadastros,$nick,Quests,Stern1)) { msg =$nick $ct $+ Aqueles ladr�es j� sairam da cidade... | return }
      else {
        msg =$nick $ct $+ Voc� encontra-se com $cc $+ Sam $+ $ct $+ , membro da Equipe Aqua.
        msg =$nick $chr(160) $cc $+ Sam $ct $+ (AQUA) - Sim, sou membro da Equipe Aqua. Estou numa miss�o agora!
        if (!$rini(cadastros,$nick,Quests,Aqua1)) { msg =$nick $chr(160) $cc $+ Sam $ct $+ (AQUA) - Ah, garoto, toma isto e vai embora. | item.add $nick TM46 | msg =$nick $ct $+ Voc� ganhou o item $cc $+ TM46 $+ $ct $+ . | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Aqua1 Ok }
        return
      }
    }
    else { msg =$nick $ct $+ Nada foi encontrado. | return }
  }
  elseif ($1 == Stern) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Stern $+ $ct $+ , o famoso capit�o marinho.
    if ($start($nick)) {
      if ($rini(cadastros,$nick,Quests,Stern3)) {
        if ($dados($nick,Kanto,League)) {
          if ($dados($nick,Quests,Stern4)) { msg =$nick $chr(160) $cc $+ Stern $ct $+ - $cc $+ SS Tidal $ct $+ � suficiente capaz de aguentar mares agitados da costa, como � o caso do continente $cc $+ Johto $+ $ct $+ . H� muitos redemoinhos por ali, por isso este navio far� certamente muito sucesso! }
          else {
            msg =$nick $chr(160) $cc $+ Stern $ct $+ - Bravo! Bravo! $cc $+ SS Tidal $ct $+ finalmente foi conclu�do! Voc� devia aproveitar para viajar na viagem de inaugura��o. Ah, n�o foi convidado? Tenho certeza que $cc $+ Mr Stone $ct $+ far� quest�o da sua presen�a naquele navio!
            writeini pkp\cadastros\ $+ $nick $+ .ini Quests Stern4 Ok
          }
        }
        else { msg =$nick $chr(160) $cc $+ Stern $ct $+ - N�o se preocupe, quando eu finalmente concluir o $cc $+ SS Tidal $ct $+ darei um jeito de avis�-lo. Hahaha... }
        if (!$dados($nick,Quests,Tomb)) && ($dados($nick,Quests,League)) {
          if ($dados($nick,Wailord,Name)) && ($dados($nick,Relicanth,Name)) {
            msg =$nick $chr(160) $cc $+ Stern $ct $+ - Me pergunto o que raios voc� faz com $cc $+ Wailord $ct $+ e $cc $+ Relicanth $ct $+ em seu time. Alias, j� suspeito o que pretende fazer.
            msg =$nick $chr(160) $cc $+ Stern $ct $+ - Se estiveres em busca de respostas para a lenda de $cc $+ Pacifidlog Town $+ $ct $+ , saiba que esses pok�mon s�o a chave. Como eu sei? Bem, eu j� pesquisei muito a respeito disso nos �ltimos anos. Sei tamb�m que estes pok�mon precisam estar perfeitamente posicionados no time para que a porta seja aberta.
            msg =$nick $chr(160) $cc $+ Stern $ct $+ - A �nica parte do enigma que ainda n�o consegui decifrar � a localiza��o da porta. Talvez um pok�mon voador $cc $+ consiga $ct $+ alcan��-la, j� que ela est� nos c�us.
          }
          elseif ($dados($nick,Wailord,Name)) { msg =$nick $chr(160) $cc $+ Stern $ct $+ - Hm, � um $cc $+ Wailord $+ $ct $+ ? Ah, sabia! O gigante das �guas... }
          elseif ($dados($nick,Relicanth,Name)) { msg =$nick $chr(160) $cc $+ Stern $ct $+ - Hm, � um $cc $+ Relicanth $+ $ct $+ ? Ah, sabia! O anci�o dos mares... }
          else { msg =$nick $chr(160) $cc $+ Stern $ct $+ - Os mares de $cc $+ Hoenn $ct $+ guardam muitos mist�rios, sabia? $cc $+ Kyogre $ct $+ n�o � o �nico pok�mon anci�o que habita as profundezas. }
        }
        return
      }
      if ($rini(cadastros,$nick,Quests,Stern1)) {
        if ($rini(cadastros,$nick,Quests,Stern2)) {
          if ($rini(cadastros,$nick,Quests,Aqua4)) {
            if ($rini(cadastros,$nick,Quests,Weather)) { msg =$nick $chr(160) $cc $+ Stern $ct $+ - N�o!! Eles acordaram Kyogre! Eu me sinto indiretamente culpado por isso... Eu n�o sabia que minha descoberta fosse provocar esta situa��o! }
            elseif ($rini(cadastros,$nick,Quests,Sky2)) {
              msg =$nick $chr(160) $cc $+ Stern $ct $+ - Ah! $nick $+ ! Eu soube de suas realiza��es em Sootopolis! Saiba que voc� salvou toda Hoenn com isso, al�m de que agora estou mais aliviado. Se a situa��o n�o melhorasse, eu iria passar o resto da minha vida me culpando pelo o que aconteceu... se eu n�o tivesse feito a descoberta... Mas finalmente! Agora estou feliz por tudo ter dado certo!
              var %i = $rand(0,1), %i = $iif(%i,Deepseatooth,Deepseascale) | msg =$nick $chr(160) $cc $+ Stern $ct $+ - Em minhas expedi��es marinhas, eu encontrei um item raro no fundo dos mares: $cc $+ %i $+ $ct $+ ! Aceite este item. Por favor, eu insisto! | item.add $nick %i | msg =$nick $ct $+ Voc� ganhou o item $cc $+ %i $+ $ct $+ . | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Stern3 %i
            }
            else { msg =$nick $chr(160) $cc $+ Stern $ct $+ - Aqueles ladr�es da Equipe Aqua... roubaram meu Submarino Explorer! Logo quando encontramos um pok�mon que estava extinto bem no fundo dos oceanos, em Silver Bay... Se eles estiverem atr�s desse pok�mon... N�o, n�o quero pensar nisso. }
            return
          }
          else {
            msg =$nick $chr(160) $cc $+ Stern $ct $+ - Obrigado por me ajudar. Agora posso concluir meus projetos em paz. | return
          }
        }
        else {
          msg =$nick $chr(160) $cc $+ Stern $ct $+ - Voc� conheceu o jovem Steven, em Dewford?
          if ($rini(cadastros,$nick,Quests,Steven1)) {
            msg =$nick $chr(160) $cc $+ Stern $ct $+ - Ah, ele me mandou uma carta do pai dele? Hmm... hmm... est� certo. Que boas not�cias!
            msg =$nick $chr(160) $cc $+ Stern $ct $+ - Ok, jovem, obrigado por esta carta. Deve ter tido um trabalho para vir deix�-la at� mim, n�o? Certamente. Ent�o, voc� merece isto.
            var %i = $rand(1,7), %i = $iif(%i == 7,Mystic Water,Soft Sand)
            item.add $nick %i | msg =$nick $ct $+ Voc� ganhou o item $cc $+ %i $+ $ct $+ ! | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Stern2 %i | return
          }
          else {
            msg =$nick $chr(160) $cc $+ Stern $ct $+ - Ah, n�o? Que pena... Ah, a prop�sito, ele � filho de Mr Stone. Voc� deve conhec�-lo, suponho. Mas n�o se preocupe, acho que Steven ainda est� em Dewford.
            return
          }
        }
      }
      else {
        msg =$nick $chr(160) $cc $+ Stern $ct $+ - $nick $+ ! Me ajude! Estes ladr�es querem roubar meu projeto do Submarino Explorer!
        msg =$nick $ct $+ Digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar. | set %confirm. [ $+ [ $nick ] ] AQU:1 | return
      }
    }
    else {
      if ($dados($nick,Quests,Stern1)) {
        msg =$nick $chr(160) $cc $+ Stern $ct $+ - O que achou do meu museu? Deu muito trabalho constru�-lo, mas � algo que eu tenho orgulho de ter feito! | return
      }
      else {
        msg =$nick $chr(160) $cc $+ Stern $ct $+ - Ol�, sou o capit�o $cc $+ Stern $+ $ct $+ . Voc� ouviu falar no $cc $+ Submarino Explorer $+ $ct $+ ?
        msg =$nick $chr(160) $cc $+ Stern $ct $+ - Ao naveg�-lo, acabei encontrando uma caverna no fundo do mar, localizada pr�xima a $cc $+ Sootopolis City $+ $ct $+ . Mas roubaram meu submarino e despertaram nesse lugar um pok�mon legend�rio. Quase que causam o fim do mundo...
        msg =$nick $chr(160) $cc $+ Stern $ct $+ - Ent�o voc� � habitante de $cc $+ $dados($nick,Info,Start) $+ $ct $+ ? Interessante, eu adoraria visitar essa regi�o. Ouvi falar que h� pok�mon que n�o aparecem por aqui em $cc $+ Hoenn $+ $ct $+ , � verdade?
        writeini pkp\cadastros\ $+ $nick $+ .ini Quests Stern1 Ok | return
      }
    }
  }
  elseif ($1 == Ricky) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Ricky $+ $ct $+ , um estudante.
    msg =$nick $chr(160) $cc $+ Ricky $ct $+ - Stern, que construiu este belo museu, tamb�m � o l�der de uma equipe de explora��o oce�nica. � por isso que todos o chamam de Capit�o Stern.
    return
  }
  elseif ($1 == Rose) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Rose $+ $ct $+ , uma treinadora pok�mon.
    if ($rini(cadastros,$nick,Quests,Weather)) { msg =$nick $chr(160) $cc $+ Rose $ct $+ - Nossa! Ent�o existe um pok�mon extinto no fundo dos mares...! Estou t�o emocionada... }
    elseif ($rini(cadastros,$nick,Quests,Sky2)) { msg =$nick $chr(160) $cc $+ Rose $ct $+ - Meu sonho foi finalmente realizado, um dos mist�rios dos mares foi descoberto! Nossa, como eu amo o mar! Ser� que existem mais mist�rios em suas profundezas? }
    else { msg =$nick $chr(160) $cc $+ Rose $ct $+ - Quando eu era crian�a, eu costumava visitar o museu todos os dias e sonhava com os mist�rios que existem no fundo dos oceanos... }
    if (!$dados($nick,Quests,Tomb)) && ($dados($nick,Quests,League)) { msg =$nick $chr(160) $cc $+ Rose $ct $+ - Uma porta nos c�us de $cc $+ Pacifidlog Town $+ $ct $+ ? Isso n�o faz o menor sentido. Se realmente existir uma, � melhor procur�-la r�pido. }
    return
  }
  elseif ($1 == Writney) && ($start($nick)) {
    if ($rini(cadastros,$nick,Quests,League)) { msg =$nick $ct $+ Acho que $cc $+ Writney $ct $+ n�o est� mais na cidade... | return }
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Writney $+ $ct $+ , um velho navegador.
    msg =$nick $chr(160) $cc $+ Writney $ct $+ - Ol�, $nick $+ !
    msg =$nick $chr(160) $cc $+ Writney $ct $+ - Precisa ir a Dewford? | msg =$nick $ct $+ Digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar. | set %confirm. [ $+ [ $nick ] ] WRT:Dewford City | return
    return
  }
  elseif ($1 == Aline) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Aline $+ $ct $+ , a respons�vel pelo porto.
    if ($dados($nick,$dados($nick,Info,Start),Badges).n == 8) {
      var %x = $dados($nick,Clock,Ship), %y = 0
      if (%x) { if ($calc($dados($nick,Info,Online) - %x) >= 21600) { var %y = 1 } } | else { var %y = 1 }
      if (%y) {
        if ($item($nick,Gold Ticket).qnt) && ($item($nick,Silver Ticket).qnt) {
          msg =$nick $chr(160) $cc $+ Aline $ct $+ - Oh, este � o $cc $+ Silver Ticket $ct $+ e o $cc $+ Gold Ticket $+ $ct $+ . Deseja embarcar no $cc $+ SS Anne $ct $+ ( $+ $cc $+ $travel.ship($nick,SS Anne) $+ $ct $+ ) ou no $cc $+ SS Tidal $ct $+ ( $+ $cc $+ $travel.ship($nick,SS Tidal) $+ $ct $+ ) $+ ?
          msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim <barco> $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar. | set %confirm. [ $+ [ $nick ] ] SHP:SS Anne;SS Tidal
        }
        elseif ($item($nick,Gold Ticket).qnt) {
          msg =$nick $chr(160) $cc $+ Aline $ct $+ - Oh, este � o $cc $+ Gold Ticket $+ $ct $+ . Deseja embarcar no $cc $+ SS Tidal $+ $ct $+ ?
          msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar. | set %confirm. [ $+ [ $nick ] ] SHP:SS Tidal
        }
        elseif ($item($nick,Silver Ticket).qnt) {
          msg =$nick $chr(160) $cc $+ Aline $ct $+ - Oh, este � o $cc $+ Silver Ticket $+ $ct $+ . Deseja embarcar no $cc $+ SS Anne $+ $ct $+ ?
          msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar. | set %confirm. [ $+ [ $nick ] ] SHP:SS Anne
        }
        else { msg =$nick $chr(160) $cc $+ Aline $ct $+ - Voc� n�o pode embarcar se n�o tiver uma passagem de navio. }
      }
      else { msg =$nick $chr(160) $cc $+ Aline $ct $+ - N�o h� barcos nesse momento. Voc� deve aguardar seis horas $cc $+ online $ct $+ para tentar novamente. Neste momento, faltam aproximadamente $dur($calc(21600 - ($dados($nick,Info,Online) - %x)),$ct,$cc) $+ . }
      return
    }
    else { msg =$nick $chr(160) $cc $+ Aline $ct $+ - Ah, que pena. Infelizmente n�o h� nenhum barco neste momento. | return }
  }
  elseif ($1 == May) && ($start($nick)) {
    if ($rini(cadastros,$nick,Quests,May2)) { msg =$nick $ct $+ Acho que $cc $+ May $ct $+ n�o est� mais na cidade. | return }
    else {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ May $+ $ct $+ .
      msg =$nick $chr(160) $cc $+ May $ct $+ - Ah! $nick $+ ! Estava mesmo precisando te encontrar!
      msg =$nick $chr(160) $cc $+ May $ct $+ - Eu capturei bastante pok�mon nestes ultimos dias, e agora est�o ficando bem fortes!
      msg =$nick $chr(160) $cc $+ May $ct $+ - Ei, que tal uma batalha? Eu usarei cinco pok�mon, organize seu time e manda ver!
      msg =$nick $ct $+ Digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar. | set %confirm. [ $+ [ $nick ] ] MAY:1 | return
    }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. } | return
}
alias c.search.Mauville_City {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do centro pok�mon.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Ol�, $nick $+ ! Seja bem vindo a Mauville. � comum aparecerem pok�mon el�tricos na regi�o e aparelhos eletr�nicos quebrarem, gra�as a uma usina el�trica abandonada, mas acredito que ningu�m tenha acesso a ela atualmente. | return
  }
  elseif ($1 == Russel) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Russel $+ $ct $+ , um treinador pok�mon.
    msg =$nick $chr(160) $cc $+ Russel $ct $+ - Aos arredores de Mauville existe uma usina el�trica abandonada. � por isso que aparecem tantos pok�mon el�tricos, pois esta usina guarda um gerador que emite ondas eletromagn�ticas. N�o sei, mas acho que algu�m ainda tem acesso a ela... | return
  }
  elseif ($1 == Kessy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Kessy $+ $ct $+ , uma criadora pok�mon.
    if ($badge($nick,Dynamo Badge)) {
      if ($item($nick,HM06).qnt) { msg =$nick $chr(160) $cc $+ Kessy $ct $+ - �s vezes eu me sinto mal com este ambiente de Mauville... Mas como est� indo, $nick $+ , sua jornada? Ahh, estou enjoada. }
      else {
        msg =$nick $chr(160) $cc $+ Kessy $ct $+ - Nossa, mas nem o Magneton de Wattson teve energia suficiente para aguentar o poder dos seus pok�mon!
        item.add $nick HM06 | msg =$nick $ct $+ Voc� recebeu o item $cc $+ HM06 $+ $ct $+ .
        msg =$nick $chr(160) $cc $+ Kessy $ct $+ - HM06 � Rock Smash. Agora voc� poder� quebrar as pedras que existem no caminho entre Mauville e Lavaridge. Boa sorte em sua jornada!
      }
    }
    else { msg =$nick $chr(160) $cc $+ Kessy $ct $+ - � impressionante como Magnetons absorvem energia el�trica do ambiente. � com toda essa energia que os pok�mon de Wattson, l�der do gin�sio da cidade, derrotam qualquer oponente! }
    return
  }
  elseif ($1 == Emma) {
    if ($start($nick)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Emma $+ $ct $+ , ela parece assustada.
      if ($rini(cadastros,$nick,Quests,Aqua4)) {
        if ($rini(cadastros,$nick,Quests,Weather)) { msg =$nick $chr(160) $cc $+ Emma $ct $+ - M�e... Estou com medo... Ouvi falar que em $cc $+ Sootopolis $ct $+ uma batalha colossal est� sendo travada... }
        elseif ($rini(cadastros,$nick,Quests,Sky2)) { msg =$nick $chr(160) $cc $+ Emma $ct $+ - $cc $+ Rayquaza $+ $ct $+ ... M�e, eu disse! Aquele raio nos c�us era realmente um pok�mon! }
        else { msg =$nick $chr(160) $cc $+ Emma $ct $+ - Ahn... Mam�e n�o acredita em mim... Estou com um pressentimento ruim... }
      }
      else { msg =$nick $chr(160) $cc $+ Emma $ct $+ - Eu vi! Eu vi! Aquele raio nos c�us era um pok�mon! Eu juro! }
    }
    else {
      msg =$nick $chr(160) $cc $+ Emma $ct $+ - $cc $+ Rayquaza $ct $+ � um pok�mon gigantesco que voa sobre as nuvens... Felizmente eu vi um outra vez, mas ningu�m acredita em mim...
    }
    if (!$dados($nick,Quests,Tomb)) && ($dados($nick,Quests,League)) { msg =$nick $chr(160) $cc $+ Emma $ct $+ - $cc $+ Rayquaza $ct $+ tamb�m mostrou-me onde a porta estava, mas foi muito r�pido. Eu n�o pude v�-la por muito tempo... }
    return
  }
  elseif ($1 == Maria) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Maria $+ $ct $+ , a m�e de Emma.
    msg =$nick $chr(160) $cc $+ Maria $ct $+ - Certo, Emma! Se continuar assustando os visitantes com suas hist�rias eu n�o vou comprar a sua bicicleta!
    if (!$dados($nick,Quests,Tomb)) && ($dados($nick,Quests,League)) { msg =$nick $chr(160) $cc $+ Maria $ct $+ - $cc $+ Emma $ct $+ est� incr�vel hoje... Estou arrependida de t�-la levado a $cc $+ Sootopolis City $ct $+ outra vez. Em menos de $cc $+ dez $ct $+ segundos na cidade, ela berrou sobre uma hist�ria de porta nos c�us... Preciso ter muita paci�ncia para aguentar a mente criativa dela. }
    return
  }
  elseif ($1 == Rydel) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Rydel $+ $ct $+ , dono da loja de bicicletas.
    if ($rini(cadastros,$nick,Quests,Rydel) == Ok) {
      if ($item($nick,Mach Bike).qnt) {
        msg =$nick $chr(160) $cc $+ Rydel $ct $+ - Deseja trocar sua $cc $+ Mach Bike $ct $+ pela $cc $+ Acro Bike $+ $ct $+ ?
        msg =$nick $ct $+ Digite ' $+ $cc $+ .sim $+ $ct $+ ' para confirmar, ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar. | set %confirm. [ $+ [ $nick ] ] RYD:Mach Bike | return
      }
      else {
        msg =$nick $chr(160) $cc $+ Rydel $ct $+ - Deseja trocar sua $cc $+ Acro Bike $ct $+ pela $cc $+ Mach Bike $+ $ct $+ ?
        msg =$nick $ct $+ Digite ' $+ $cc $+ .sim $+ $ct $+ ' para confirmar, ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar. | set %confirm. [ $+ [ $nick ] ] RYD:Acro Bike | return
      }
    }
    else {
      if ($rini(cadastros,$nick,Info,Online) < 259200) { msg =$nick $chr(160) $cc $+ Rydel $ct $+ - Oh, $nick $+ . Assim que voc� tiver suas 72 horas online, venha falar comigo e eu te darei uma bicicleta. | return }
      else {
        if ($start($nick)) { msg =$nick $chr(160) $cc $+ Rydel $ct $+ - Incr�vel! Voc� andou desde Littleroot a p�? Nossa, voc� tem muita garra, garoto. Este � o esp�rito das bicicletas Rydel! } | else { msg =$nick $chr(160) $cc $+ Rydel $ct $+ - Voc� veio de muito longe e nunca teve sequer uma bicicleta! Estou muito comovido, este � o esp�rito das bicicletas Rydel! }
        writeini pkp\cadastros\ $+ $nick $+ .ini Quests Rydel Ok
        item.add $nick Mach Bike | msg =$nick $ct $+ Voc� recebeu o item $cc $+ Mach Bike $+ $ct $+ ! | msg =$nick $chr(160) $cc $+ Rydel $ct $+ - Com a Mach Bike, voc� receber� o dobro de milhagens que normalmente voc� deveria receber. Uma maravilha! | msg =$nick $chr(160) $cc $+ Rydel $ct $+ - Sempre que quiser mudar de bicicleta, venha falar comigo aqui em Mauville. | return
      }
    }
  }
  elseif ($1 == Edgar) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Edgar $+ $ct $+ , um pescador.
    msg =$nick $chr(160) $cc $+ Edgar $ct $+ - Hahaha, desta vez eu peguei um Magikarp dos grandes!
    if ($start($nick)) {
      if (!$item($nick,Old Rod).qnt) {
        msg =$nick $chr(160) $cc $+ Edgar $ct $+ - Ent�o quer dizer que voc� n�o pode pescar? Ora, n�o fique triste, pode ficar com esta $cc $+ Old Rod $+ $ct $+ !
        item.add $nick Old Rod | msg =$nick $chr(160) $cc $+ Edgar $ct $+ - Para pescar usando sua Rod, basta utilizar o item antes de sua batalha com pok�mon selvagem. Lembre-se de parar de usar o item quando n�o quiser mais pescar!
      }
    }
    return
  }
  elseif ($1 == Ana) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Ana $+ $ct $+ , uma treinadora pok�mon.
    msg =$nick $chr(160) $cc $+ Ana $ct $+ - Eu trouxe meus dois pok�mon para o centro de cria��o e obtive um ovo! Mas o que � interessante � que o beb� nasceu com uns golpes que n�o achei que poderia aprender...! | return
  }
  elseif ($1 == Lola) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Lola $+ $ct $+ , a criadora de pok�mon do centro de cria��o.
    msg =$nick $chr(160) $cc $+ Lola $ct $+ - Ol�, $nick $+ . Bem vindo ao Daycare Center, voc� quer obter uma nova gera��o dos seus pok�mon? � muito simples, basta voc� digitar ' $+ $cc $+ .Daycare $+ $ct $+ '. | return
  }
  elseif ($1 == Tob) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Tob $+ $ct $+ , o criador de pok�mon do centro de cria��o.
    msg =$nick $chr(160) $cc $+ Tob $ct $+ - Obter ovos de seus pok�mon � muito importante, pois existem golpes que os pok�mon s� aprendem por cruzamentos. Voc� pode cruzar tamb�m seu pok�mon com o de seu amigo, veja em ' $+ $cc $+ .Daycare $+ $ct $+ '. Mas lembre-se que quem vai ficar com o ovo � quem ficou em modo de espera inicialmente. | return
  }
  elseif ($1 == Wattson) {
    if ($badge($nick,Dynamo Badge)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Wattson $+ $ct $+ , l�der do gin�sio de Mauville.
      msg =$nick $chr(160) $cc $+ Wattson $ct $+ - Hahaha... Gostei bastante de batalhar com voc�, $nick $+ . A prop�sito, j� conhece o centro de cria��o para pok�mon? � logo ali!
      if ($badge($nick,Thunder Badge)) {
        if ($dados($nick,Quests,Wattson) == No) {
          if ($dados($nick,Quests,PPlant)) {
            msg =$nick $chr(160) $cc $+ Wattson $ct $+ - Ah, finalmente o perigo foi embora, gra�a a voc�, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Pode ficar com isto, aumentar� o dano de ataques $cc $+ Electric $+ $ct $+ !
            item.add $nick Magnet | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Wattson Ok | msg =$nick $ct $+ Parab�ns, voc� ganhou o item $cc $+ Magnet $+ $ct $+ !
          }
          else { msg =$nick $chr(160) $cc $+ Wattson $ct $+ - Estou realmente preocupado com a $cc $+ Power Plant $ct $+ de $cc $+ Kanto $+ $ct $+ ... }
        }
        elseif (!$dados($nick,Quests,Wattson)) {
          msg =$nick $chr(160) $cc $+ Wattson $ct $+ - Preciso de um favor urgente, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ . H� um gerador na $cc $+ Power Plant $ct $+ de $cc $+ Kanto $ct $+ que est� esquentando muito, e isso pode causar muitos problemas, principalmente para os pok�mon! Voc� precisa desligar para mim, pode fazer isto?
          item.add $nick Power Key | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Wattson No | msg =$nick $ct $+ Parab�ns, voc� ganhou o item $cc $+ Power Key $+ $ct $+ .
        }
      }
      return
    }
    else { msg =$nick $cc $+ Wattson $ct $+ est� no gin�sio, aguardando seu desafio. | return }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. | return }
}
alias c.search.Verdanturf_Town {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do centro pok�mon.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Ol�. Esta � Verdanturf, que como o pr�prio nome j� diz, a cidade mais verde de Hoenn! � incr�vel, todos estes jardins, a paisagem, a floresta, tudo faz com que este lugar seja realmente lindo. Os pok�mon adoram, pelo menos.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Ao lado existe o Rusturf Tunnel, um t�nel construido pra ser uma rota de f�cil acesso entre Rustboro e Verdanturf, por�m o projeto n�o se concluiu, e atualmente s� conseguem atravessar treinadores com pok�mon fortes. | return
  }
  elseif ($1 == Jay) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Jay $+ $ct $+ , uma naturalista.
    msg =$nick $chr(160) $cc $+ Jay $ct $+ - Este lugar � sem d�vida um para�so. Sinta o cheiro do ar puro e da natureza, este lugar � aben�oado. Sempre que posso eu passo em Verdanturf para relaxar.
    msg =$nick $chr(160) $cc $+ Jay $ct $+ - J� ouviu falar na Battle Tent? Nela voc� pode criar batalhas de at� seis pok�mon, perfeita para pequenas competi��es entre amigos. | return
  }
  elseif ($1 == Jerry) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Jerry $+ $ct $+ , um estudante.
    msg =$nick $chr(160) $cc $+ Jerry $ct $+ - Eu ouvi falar que para quebrar pedras, o pok�mon precisa saber a t�cnica Rock Smash. S� n�o me lembro o que dizia no livro sobre uma ins�gnea... | return
  }
  elseif ($1 == Isabel) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Isabel $+ $ct $+ , uma criadora de pok�mon.
    if ($start($nick)) { msg =$nick $chr(160) $cc $+ Isabel $ct $+ - Seu nome � Koji. Ele est� dentro do Rusturf Tunnel, e n�o consegue quebrar as pedras com a for�a de seus pok�mon lutadores... | return }
    else { msg =$nick $chr(160) $cc $+ Isabel $ct $+ - Eu adoraria poder viajar entre continentes, assim como voc�. Infelizmente eu n�o tenho dinheiro... | return }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. | return }
}
alias c.search.Rusturf_Tunnel {
  if ($1 == Koji) && ($start($nick)) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Koji $+ $ct $+ , um treinador pok�mon.
    if ($item($nick,HM04).qnt) { msg =$nick $chr(160) $cc $+ Koji $ct $+ - HM04 � Strength. Seu pok�mon ser� capaz de mover blocos de pedras suspensos, mas infelizmente n�o conseguir� quebr�-los. }
    else {
      msg =$nick $chr(160) $cc $+ Koji $ct $+ - Voc� tamb�m est� preso? Pode me ajudar? N�o consigo quebrar as pedras...
      if ($team.hm($nick,Rock Smash) == Ok!) {
        msg =$nick $chr(160) $cc $+ Koji $ct $+ - Oh, obrigado. Ent�o para quebrar pedras, preciso usar Rock Smash... Quando sair daqui eu vou atr�s de ensinar esta t�cnica para meus pok�mon lutadores.
        item.add $nick HM04 | msg =$nick $ct $+ Voc� ganhou o item $cc $+ HM04 $+ $ct $+ .
        msg =$nick $chr(160) $cc $+ Koji $ct $+ - Strength permite empurrar blocos de pedra suspensos, mas n�o poder� quebr�-los.
      }
      else { msg =$nick $chr(160) $cc $+ Koji $ct $+ - Vejo que voc� tamb�m n�o consegue... Quando puder, por favor me avise. }
    }
    return
  }
  else { msg =$nick $ct $+ Nada foi encontrado. | return }
}
alias c.search.Lavaridge_Town {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do centro pok�mon.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Ol�, $nick $+ . Esta cidade � Lavaridge, o clima aqui � bem quente porque a cidade est� situada logo ao lado do Mt Chimney. | return
  }
  elseif ($1 == Elliot) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Elliot $+ $ct $+ , um treinador pok�mon.
    msg =$nick $chr(160) $cc $+ Elliot $ct $+ - $nick $+ , vai desafiar o gin�sio? � bom voc� saber que a l�der local usa pok�mon de fogo. Eu tentei desafiar o gin�sio, mas as batalhas individuais com os outros treinadores acabou me derrubando... | return
  }
  elseif ($1 == Ethan) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Ethan $+ $ct $+ , um treinador pok�mon.
    if ($dados($nick,Quests,League)) { msg =$nick $chr(160) $cc $+ Ethan $ct $+ - Vejo que voc� � um treinador muito experiente. No entanto, h� ainda muito para se caminhar at� a posi��o de $cc $+ mestre $ct $+ pok�mon... | return }
    else { msg =$nick $chr(160) $cc $+ Ethan $ct $+ - Voc� � um treinador? Suponho que seja iniciante. Bem, para avan�ar seu n�vel em experi�ncia, voc� precisar� derrotar a liga. Ent�o, at� l� � uma longa caminhada, n�o? } | return
  }
  elseif ($1 == Cyndy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Cyndy $+ $ct $+ , uma habitante da cidade.
    if ($rini(cadastros,$nick,Quests,Cyndy)) {
      msg =$nick $chr(160) $cc $+ Cyndy $ct $+ - Sempre que precisar de um ovo pok�mon, v� ao centro de cria��o em Mauville. | return
    }
    else {
      if ($teampos($nick,Egg)) { msg =$nick $chr(160) $cc $+ Cyndy $ct $+ - Oh, ent�o voc� j� tem um Egg? Quando ele se chocar, eu ficarei feliz de te dar este aqui. }
      else {
        msg =$nick $chr(160) $cc $+ Cyndy $ct $+ - Eu levei meus pok�mon ao centro de cria��o e recebi um ovo, mas n�o tenho condi��es de cri�-lo. Pode levar.
        if ($totalpokes($nick) == 6) { msg =$nick $ct $+ Voc� j� tem $cc $+ seis $ct $+ pok�mon. Libere espa�o no seu time para recebe-lo. | return }
        var %r = $rand(1,10) | if (%r == 10) { var %pk = Wynaut } | elseif (%r > 6) { var %pk = Azurill } | else { var %pk = Pichu } | echo $addpoke($nick,Egg,%pk,Presente de Cyndy em Lavaridge,31: $+ $rand(0,31) $+ : $+ $rand(0,31) $+ : $+ $rand(15,25) $+ : $+ $rand(0,31) $+ : $+ $rand(0,31),0,0)
        msg =$nick $ct $+ Parab�ns! Voc� recebeu um $cc $+ Egg $+ $ct $+ ! | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Cyndy %pk
      }
      return
    }
  }
  elseif ($findtok(Magma:Maxie:Magma Hideout:Hideout,$1-,0,58)) {
    if ($start($nick)) {
      if ($rini(cadastros,$nick,Quests,Magma2)) {
        if ($rini(cadastros,$nick,Quests,Magma2) == Ok) {
          msg =$nick $ct $+ N�o h� mais membros da Equipe $cc $+ Magma $ct $+ em $cc $+ Lavaridge $+ $ct $+ , seu $cc $+ Magma Hideout $ct $+ est� deserto. | return
        }
        else {
          if ($item($nick,Magma Emblem).qnt) {
            if ($team.hm($nick,Strength) == No!) { msg =$nick $ct $+ A entrada do $cc $+ Magma Hideout $ct $+ est� protegida por uma pedra, talvez voc� deva empurr�-la... | return }
            msg =$nick $ct $+ Voc� conseguiu entrar no $cc $+ Magma Hideout $+ $ct $+ , em $cc $+ $rini(cadastros,$nick,Info,Locate) $+ $ct $+ ! Alguns membros est�o tentando expuls�-lo, o que voc� deseja fazer?
            msg =$nick $ct $+ Digite $cc $+ .Sim $ct $+ para batalhar contra eles e $cc $+ .nao $ct $+ para sair do $cc $+ Magma Hideout $+ $ct $+ . | set %confirm. [ $+ [ $nick ] ] MGM:2
          }
          else { msg =$nick $ct $+ Voc� n�o conseguiu encontrar o $cc $+ Magma Hideout $+ $ct $+ , parece que � necess�rio um item para isso. | return }
        }
      }
      else { msg =$nick $ct $+ Nada foi encontrado. }
    }
    else { msg =$nick $ct $+ Nada foi encontrado. }
    return
  }
  elseif ($1 == Isaiah) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Isaiah $+ $ct $+ , um triatleta.
    msg =$nick $chr(160) $cc $+ Isaiah $ct $+ - Nossa, acho que vou subir o Mt Chimney ainda hoje! Tuff.. Tuff.. Melhor eu descansar. | return
  }
  elseif ($1 == Flannery) {
    if ($badge($nick,Heat Badge)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Flannery $+ $ct $+ , l�der do gin�sio de Lavaridge.
      if ($start($nick)) {
        if ($rini(cadastros,$nick,Quests,Cozmo) != Ok) { msg =$nick $chr(160) $cc $+ Flannery $ct $+ - N�o consigo imaginar como seria se o Mt Chimney entrasse em erup��o, imagine, todos os pok�mon que vivem aqui... Seria um desastre! }
        else { msg =$nick $chr(160) $cc $+ Flannery $ct $+ - Antes de me tornar l�der, eu fui a Meteor Falls mas n�o consegui achar nenhum $cc $+ Meteorite $+ $ct $+ . Dizem que aquele lugar � 'especial' por estranhas apari��es de pok�mon desconhecidos. }
      }
      else { msg =$nick $chr(160) $cc $+ Flannery $ct $+ - $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ... Voc� j� ouviu falar no $cc $+ Mt Ember $+ $ct $+ ? Ouvi rumores de que neste lugar, um p�ssaro guardi�o protege seu territ�rio com o calor de suas penas. Meu desejo � encontrar esse lugar. }
      return
    }
    else { msg =$nick $cc $+ Flannery $ct $+ est� no gin�sio, aguardando seu desafio. | return }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. | return }
}
alias c.search.Fallarbor_Town {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do centro pok�mon.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Fallarbor � 'cinzenta' assim por causa das ocasionais fuma�as que o Mt Chimney exala. � por isso que a luminosidade aqui � pouca, e alguns pok�mon incomuns podem aparecer. | return
  }
  elseif ($1 == Penny) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Penny $+ $ct $+ , uma habitante de Lavaridge.
    if ($rini(cadastros,$nick,Quests,Cyndy)) { msg =$nick $chr(160) $cc $+ Penny $ct $+ - Meteor Falls... Ser� apenas mito o que � dito a respeito? Aquele lugar m�stico... Dizem que no passado foi um grande cometa que atingiu nosso planeta e agora � habitado por pok�mon. }
    else { msg =$nick $chr(160) $cc $+ Penny $ct $+ - Tenho uma amiga que precisa de ajuda para criar um pok�mon, ser� que pode ajud�-la? Procure por $cc $+ Cyndy $ct $+ em $cc $+ Lavaridge City $+ $ct $+ . }
    return
  }
  elseif ($1 == Josh) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Josh $+ $ct $+ , um pesquisador.
    msg =$nick $chr(160) $cc $+ Josh $ct $+ - Adoro f�sseis, � por isso que n�o me separo do meu Sandslash! Juntos procuramos por f�sseis, homens e pok�mon trabalhando juntos e construindo a hist�ria! | return
  }
  elseif ($1 == Lanette) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Lanette $+ $ct $+ , uma cientista.
    if ($rini(cadastros,$nick,Quests,Lanette)) {
      if ($start($nick)) {
        if ($rini(cadastros,$nick,Quests,Lanette) == No) {
          if ($groupev($nick) >= 3050) {
            msg =$nick $chr(160) $cc $+ Lanette $ct $+ - Seus pok�mon est�o formid�veis, todo o seu time!
            msg =$nick $chr(160) $cc $+ Lanette $ct $+ - � com muito prazer que eu te dou este Macho Brace.
            msg =$nick $ct $+ Voc� recebeu o item $cc $+ Macho Brace $+ $ct $+ . | item.add $nick Macho Brace | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Lanette Ok
          }
          else { msg =$nick $chr(160) $cc $+ Lanette $ct $+ - Ainda n�o... Mas o desafio continua. }
        }
        else { msg =$nick $chr(160) $cc $+ Lanette $ct $+ - Parab�ns, $nick $+ . Estou convicta de que a liga pok�mon n�o ser� t�o dificil para voc�. Boa sorte! }
      }
      else {
        if ($earl.count($nick) == 17) {
          if ($dados($nick,Quests,Global)) { msg =$nick $chr(160) $cc $+ Lanette $ct $+ - Espero poder ter ajudado bastante em sua jornada. Boa sorte! }
          else {
            msg =$nick $chr(160) $cc $+ Lanette $ct $+ - Adivinhe! Depois de tanto trabalho, finalmente consegui interligar todas as redes. E voc� ser� o primeiro a ver o avan�o da tecnologia sem fio!
            var %x = 1 | while ($exists(pkp\box\ $+ $nick $+ \ $+ %x $+ .ini)) { writeini pkp\box\ $+ $nick $+ \ $+ %x $+ .ini Info Link Hoenn:Kanto:Johto | inc %x }
            msg =$nick $chr(160) $cc $+ Lanette $ct $+ - Que �tima celebra��o para seu desempenho na liga de $cc $+ Johto $+ $ct $+ ! Todas as suas boxes est�o mundialmente interligadas! Fascinante, n�o?
            writeini pkp\cadastros\ $+ $nick $+ .ini Quests Global $dados($nick,Info,Online)
          }
        }
        else { msg =$nick $chr(160) $cc $+ Lanette $ct $+ - A �nica desvantagem � que, para suportar toda a informa��o, ela precisa ter um tamanho muito reduzido... Bem, eu disse que era um prot�tipo, n�o disse? }
      }
      return
    }
    else {
      if ($item($nick,PC).qnt) {
        if ($start($nick)) {
          msg =$nick $chr(160) $cc $+ Lanette $ct $+ - Oh, voc� usa o sistema de PC que eu criei! Muito bem.
          if ($rini(cadastros,$nick,Quests,Joy1)) {
            msg =$nick $chr(160) $cc $+ Lanette $ct $+ - Vejo que minha amiga Joy concedeu o meu sistema a voc�. Significa ent�o que voc� deve treinar seus pok�mon muito bem, n�o?
            msg =$nick $chr(160) $cc $+ Lanette $ct $+ - Ent�o eu te proponho algo. Se voc� me mostrar seis pok�mon em seu melhor estado de treinamento, voc� ganhar� o item Macho Brace, que far� seu pok�mon ganhar o dobro de effort points por batalha. O que acha? Quando estiver pronto, fale comigo.
            writeini pkp\cadastros\ $+ $nick $+ .ini Quests Lanette No
          }
        }
        else {
          msg =$nick $chr(160) $cc $+ Lanette $ct $+ - Espere ai, quer dizer que voc� vem de $cc $+ $dados($nick,Info,Start) $+ $ct $+ ?! Nossa, � realmente uma viagem e tanto! Voc� conheceu o $cc $+ Bill $+ $ct $+ , um pok�maniaco? Bem, ele me ajudou a desenvolver o PC que os treinadores utilizam atualmente.
          msg =$nick $chr(160) $cc $+ Lanette $ct $+ - O problema � que as caixas compradas s� podem ser usadas em sua regi�o de origem. Ainda estamos tentando resolver esses problemas, mas consegui criar um prot�tipo, e adoraria que voc� o testasse. Eu o chamo de $cc $+ Link Box $+ $ct $+ , a primeira caixa que possui uma rede exclusiva e uma �rea de alcance maior!
          writeini pkp\cadastros\ $+ $nick $+ .ini Quests Lanette Ok | box.add $nick 5 | return
        }
      }
      else { msg =$nick $chr(160) $cc $+ Lanette $ct $+ - Nossa, voc� � o primeiro treinador que eu vejo e que n�o anda com um PC... }
    }
    return
  }
  elseif ($1 == Cozmo) {
    if ($rini(cadastros,$nick,Quests,Cozmo)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Prof Cozmo $+ $ct $+ , um estudioso de pok�mon.
      if ($rini(cadastros,$nick,Quests,Cozmo) == Ok) || (!$start($nick)) {
        if ($item($nick,Star Sign)) {
          msg =$nick $chr(160) $cc $+ Prof Cozmo $ct $+ - Ah! N�o foi um pok�mon que eu vi! Foi esse $cc $+ Star Sign $+ $ct $+ . Agora, nem me pergunte como ele foi parar l�!
        }
        else {
          msg =$nick $chr(160) $cc $+ Prof Cozmo $ct $+ - Meteor Falls... Andei estudando aquele lugar durante um bom tempo, e posso afirmar que a sua atmosfera � diferente.
          msg =$nick $chr(160) $cc $+ Prof Cozmo $ct $+ - N�o sei se foi um sonho, mas logo ap�s de eu ter encontrado o $cc $+ Meteorite $ct $+ acho que vi um pok�mon desconhecido naquela �rea. Foi muito r�pido, e aquilo desapareceu em quest�o de segundos. Ser� que vou v�-lo novamente?
        }
      }
      else {
        if ($rini(cadastros,$nick,Quests,Magma1)) {
          if ($item($nick,Meteorite).qnt) {
            msg =$nick $chr(160) $cc $+ Prof Cozmo $ct $+ - Oh! Meu $cc $+ Meteorite $+ $ct $+ ! Obrigado, $nick $+ , por recuper�-lo.
            item.add $nick TM26 | msg =$nick $ct $+ Voc� recebeu o item $cc $+ TM26 $+ $ct $+ . | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Cozmo Ok | item.rem $nick Meteorite
            msg =$nick $chr(160) $cc $+ Prof Cozmo $ct $+ - TM26 � Earthquake, espero que fa�a bom proveito!
          }
          else { msg =$nick $chr(160) $cc $+ Prof Cozmo $ct $+ - Mas onde foi parar meu $cc $+ Meteorite $+ $ct $+ ? Que estranho! Espero poder encontrar outro em Meteor Falls... | writeini pkp\cadastros\ $+ $nick $+ .ini Info Quests Cozmo Ok }
        }
        else { msg =$nick $chr(160) $cc $+ Prof Cozmo $ct $+ - $nick $+ ! Meu $cc $+ Meteorite $ct $+ precisa ser recuperado! Por favor! }
      }

    }
    else { msg =$nick $ct $+ Acho que $cc $+ Prof Cozmo $ct $+ n�o est� na cidade... }
    return
  }
  else { msg =$nick $ct $+ Nada foi encontrado. | return }
}
alias c.search.Desert_Underpass { msg =$nick $ct $+ Nada foi encontrado. | return }
alias c.search.Meteor_Falls {
  if ($1 == Magma) || ($1 == Meteorite) || ($1 == Cozmo) {
    if ($rini(cadastros,$nick,Quests,Cozmo)) || (!$start($nick)) { msg =$nick $ct $+ Nada foi encontrado. | return }
    else {
      msg =$nick $ct $+ Voc� encontra-se com membros da equipe $cc $+ Magma $+ $ct $+ .
      msg =$nick $chr(160) $cc $+ Maxie $ct $+ - Saiam do caminho, agora finalmente encontrei o $cc $+ Meteorite $+ $ct $+ . Nosso plano est� saindo como o planejado, felizmente! Obrigado, Cozmo.
      msg =$nick $chr(160) $cc $+ Maxie $ct $+ - Huh? Quem � voc� no meio? $nick $+ ? N�o entendo o que voc� faz aqui, mas espero que seja a ultima vez que vejo voc�.
      msg =$nick $ct $+ Alguns membros da equipe $cc $+ Aqua $ct $+ aparecem.
      msg =$nick $chr(160) $cc $+ Maxie $ct $+ - Nossa, ent�o a equipe Aqua apareceu tamb�m. N�o tem problema, estamos de sa�da. Vamos, equipe Magma, para o Mt Chimney.
      msg =$nick $chr(160) $cc $+ Archie $ct $+ - Foi voc� que atrapalhou os planos de minha equipe em Slateport, mas eu achei que voc� fosse um membro da equipe Magma. Agora vejo que � s� um treinador qualquer.
      msg =$nick $chr(160) $cc $+ Archie $ct $+ - A Equipe Magma � um grupo perigoso de fan�ticos, eles querem a destrui��o, visando expandir a massa terrestre. Eles s�o nossos rivais, dos amantes do oceano, a Equipe Aqua! Vamos, equipe, preciso saber o que a Equipe Magma pretende fazer no Mt Chimney! E, $nick $+ , � bom voc� ficar de olho neles tamb�m.
      msg =$nick $chr(160) $cc $+ Prof Cozmo $ct $+ - $nick $+ ! Voc� precisa recuperar o $cc $+ Meteorite $+ $ct $+ ! N�o tenho id�ia do que pode acontecer se aquilo cair em m�os erradas... Eu vou voltar para Fallarbor. | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Cozmo No
      return
    }
  }
  elseif ($1 == Steven) {
    if ($start($nick)) { if ($dados($nick,Quests,League)) { var %x = 1 } } | elseif ($dados($nick,$dados($nick,Info,Region),League)) && ($dados($nick,Quests,Steven1)) { var %x = 1 }
    if (%x) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Steven $+ $ct $+ .
      var %x = $rini(cadastros,$nick,Clock,Steven), %o = $rini(cadastros,$nick,Info,Online)
      if ($calc(%o - %x) >= 86400) {
        msg =$nick $chr(160) $cc $+ Steven $ct $+ - $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , estava mesmo precisando me exercitar um pouco. O que acha de uma batalha? Ficar procurando por pedras raras pode ser um pouco cansativo... O que me diz?
        msg =$nick $ct $+ Digite $cc $+ .sim $ct $+ para aceitar ou $cc $+ .nao $ct $+ para rejeitar. | set %confirm. [ $+ [ $nick ] ] CLK:Steven | return
      }
      else {
        if ($item($nick,Devon Scope)) {
          if ($item($nick,Star Sign)) {
            msg =$nick $chr(160) $cc $+ Steven $ct $+ - Encontrou um $cc $+ Star Sign $ct $+ por aqui? De onde raios isso saiu? Ser� que h� algum pok�mon escondido por a�?
          }
          else {
            msg =$nick $chr(160) $cc $+ Steven $ct $+ - Se eu vi algum pok�mon raro aqui? Claro que sim, voc� tamb�m deve ter visto um $cc $+ Bagon $ct $+ andando por ai. Outro pok�mon raro? N�o... Voc� viu algum?
          }
        }
        else { msg =$nick $chr(160) $cc $+ Steven $ct $+ - Ei, talvez voc� consiga ver um pok�mon raro por a� usando o $cc $+ Devon Scope $+ $ct $+ ! | item.add $nick Devon Scope | msg =$nick $ct $+ Voc� recebeu o item $cc $+ Devon Scope $+ $ct $+ ! | msg =$nick $chr(160) $cc $+ Steven $ct $+ - Para ver pok�mon selvagens escondidos, use o item antes de batalhas com pok�mon selvagem. Quem sabe voc� n�o encontre exatamente o que tanto procurou? }
        return
      }
    }
    else { msg =$nick $ct $+ Nada foi encontrado. | return }
  }
  elseif ($1 == Helen) {
    if ($rini(cadastros,$nick,Quests,Helen)) { msg =$nick $ct $+ Nada foi encontrado. | return }
    else {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Helen $+ $ct $+ , uma treinadora expert.
      msg =$nick $chr(160) $cc $+ Helen $ct $+ - Hmm, como sabia que estava aqui? Bem, isto n�o � importante, se voc� me encontrou, � porque � um treinador muito experiente em batalhas. Quer testar suas habilidades comigo? Eu vou te dar apenas uma chance, est�o, esteja preparado.
      msg =$nick $ct $+ Digite $cc $+ .sim $ct $+ para aceitar ou $cc $+ .nao $ct $+ para rejeitar. | set %confirm. [ $+ [ $nick ] ] HLN | return
    }
  }
  elseif ($findtok(Symbol:Simbolo:S�mbolo,$1,0,58)) {
    if (!$dados($nick,Quests,Symbol)) { var %x = 0:0:0:0 | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Symbol %x }
    else { var %x = $dados($nick,Quests,Symbol) }
    var %n = 2
    if ($gettok(%x,%n,58)) { msg =$nick $ct $+ Este s�mbolo j� foi adquirido anteriormente. }
    else {
      if ($team.hm($nick,Waterfall) == Ok!) { writeini pkp\cadastros\ $+ $nick $+ .ini Quests Symbol $puttok(%x,1,%n,58) | msg =$nick $cc $+ Water Symbol $ct $+ foi encontrado com sucesso. }
      else { msg =$nick $ct $+ Nada p�de ser encontrado. }
    }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. | return }
}
alias c.search.Mt_Chimney {
  if ($rini(cadastros,$nick,Quests,Cozmo)) && (!$rini(cadastros,$nick,Quests,Magma1)) && ($start($nick)) {
    if ($1 == Magma) || ($1 == Meteorite) || ($1 == Maxie) {
      msg =$nick $ct $+ Os membros da equipe $cc $+ Magma $ct $+ est�o tentando usar o $cc $+ Meteorite $ct $+ para fazer o vulc�o entrar em erup��o!
      msg =$nick $ct $+ Se quiser batalhar contra eles, digite ' $+ $cc $+ .Sim $+ $ct $+ '. Ou ent�o digite ' $+ $cc $+ .nao $+ $ct $+ ' para cancelar. | set %confirm. [ $+ [ $nick ] ] MGM:1 | return
    }
    elseif ($1 == Aqua) || ($1 == Archie) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Archie $+ $ct $+ , l�der da equipe Aqua.
      msg =$nick $chr(160) $cc $+ Archie $ct $+ - Oh, $nick $+ ! Como pode ver, eu estou ocupado aqui cuidando destes membros, por favor, se puder avan�ar procure por Maxie e o detenha!
      if (!$rini(cadastros,$nick,Quests,Aqua1)) { msg =$nick $chr(160) $cc $+ Archie $ct $+ - Receba este TM como gratifica��o pela ajuda. | item.add $nick TM46 | msg =$nick $ct $+ Voc� ganhou o item $cc $+ TM46 $+ $ct $+ . | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Aqua1 Ok }
    }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. | return }
}
alias c.search.Fortree_City {
  var %y = $readini(pkp\status.ini,Hoenn,Legendary), %x1 = $findtok(%y,Groudon,0,58), %x2 = $findtok(%y,Kyogre,0,58)
  if (($dados($nick,Info,Start) == Johto) && ($dados($nick,Quests,League))) || ($dados($nick,Johto,League)) { var %x = 1 }
  if (%x) { if (%x1) || (%x2) { var %w = 1 } }
  if ($1 == Will) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Will $+ $ct $+ , um cientista.
    if (%w) { msg =$nick $chr(160) $cc $+ Will $ct $+ - Que estranho, h� pouco tempo registramos mudan�as de clima em diferentes ambientes de $cc $+ Hoenn $+ $ct $+ . Isso certamente n�o � normal... | return }
    if ($rini(cadastros,$nick,Quests,Magma1)) && ($start($nick)) {
      if ($rini(cadastros,$nick,Quests,Aqua2)) {
        if ($rini(cadastros,$nick,Quests,Will)) { msg =$nick $chr(160) $cc $+ Prof Will $ct $+ - Eu pesquiso as chuvas h� anos, e acho rid�culo o ser humano pensar que poder� controlar o clima. | return }
        else {
          if ($teampos($nick,Egg)) { msg =$nick $chr(160) $cc $+ Prof Will $ct $+ - Ent�o voc� j� tem um Egg? Quando ele se chocar, eu ficarei feliz de te dar este aqui. | return }
          else {
            msg =$nick $chr(160) $cc $+ Prof Will $ct $+ - Ent�o eu descobri sobre o Castform, e como ele muda sua forma de acordo o clima! Quer experimentar? Tenho muitos aqui no instituto, ficarei feliz de dar este ovo.
            if ($totalpokes($nick) == 6) { msg =$nick $ct $+ Voc� j� tem $cc $+ seis $ct $+ pok�mon. Libere espa�o no seu time para recebe-lo. | return }
            echo $addpoke($nick,Egg,Castform,Recebido de Prof Will no Weather Institute,$rand(0,31) $+ : $+ $rand(0,31) $+ : $+ $rand(0,31) $+ : $+ $rand(0,31) $+ : $+ $rand(0,31) $+ : $+ $rand(0,31),0,0)
            msg =$nick $ct $+ Parab�ns! Voc� recebeu um $cc $+ Egg $+ $ct $+ ! | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Will Ok | return
          }
          return
        }
      }
      else { msg =$nick $chr(160) $cc $+ Prof Will $ct $+ - Ah! Esses membros da Equipe Aqua querem roubar o meu pok�mon! Por favor me ajude! | msg =$nick $ct $+ Digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para recusar. | set %confirm. [ $+ [ $nick ] ] AQU:2 | return }
    }
    else { msg =$nick $chr(160) $cc $+ Prof Will $ct $+ - Hm, este pok�mon muda de forma de acordo com o clima! Que descoberta! | return }
  }
  elseif ($1 == Sandra) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Sandra $+ $ct $+ , uma cientista.
    if (%w) {
      if (%x1) && (%x2) { msg =$nick $chr(160) $cc $+ Sandra $ct $+ - H� duas massas de ar, uma seca e outra �mida, vagando por diferentes lugares. N�o sei como posso explicar isso, mas basicamente elas se movem aleatoriamente em $cc $+ Hoenn $+ $ct $+ , �s vezes desaparecem, mas reaparecem em seguida... }
      elseif (%x1) { msg =$nick $chr(160) $cc $+ Sandra $ct $+ - H� apenas uma massa de ar agora, uma seca, e continua movendo-se aleatoriamente em $cc $+ Hoenn $+ $ct $+ . �s vezes ela desaparece, mas reaparece em seguida. � muito estranho... }
      elseif (%x2) { msg =$nick $chr(160) $cc $+ Sandra $ct $+ - H� apenas uma massa de ar agora, uma �mida, e continua movendo-se aleatoriamente em $cc $+ Hoenn $+ $ct $+ . �s vezes ela desaparece, mas reaparece em seguida. � muito estranho... }
      return
    }
    if ($rini(cadastros,$nick,Quests,Magma1)) && ($start($nick)) {
      if ($rini(cadastros,$nick,Quests,Aqua2)) { msg =$nick $chr(160) $cc $+ Sandra $ct $+ - O professor adora as chuvas, isto � um fato. Mas o problema � quando chove demais, e acaba causando problemas. | return }
      else { msg =$nick $chr(160) $cc $+ Sandra $ct $+ - Nossa, precisamos de ajuda, esses membros da Equipe Aqua querem roubar o pok�mon do Prof Will! Por favor, fa�a alguma coisa! | msg =$nick $ct $+ Digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para recusar. | set %confirm. [ $+ [ $nick ] ] AQU:2 | return }
    }
    else { msg =$nick $chr(160) $cc $+ Sandra $ct $+ - Aqui no Weather Institute fazemos as previs�es do tempo de toda Hoenn. Acho que vai chover hoje... | return }
  }
  elseif ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do centro pok�mon.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Esta � Fortree City. Como pode ver, grande parte da cidade est� constru�da emcima de grandes �rvores, a vista � incr�vel! | if (!$rini(cadastros,$nick,Quests,May3)) { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Ah, antes de voc� chegar, passou uma garota atr�s de voc�, $nick $+ . Eu n�o consigo me lembrar o nome, mas acho que voc� deve conhec�-la. } | return
  }
  elseif ($1 == Tob) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Tob $+ $ct $+ , um treinador pok�mon.
    msg =$nick $chr(160) $cc $+ Tob $ct $+ - Estes meus $cc $+ Running Shoes $ct $+ s�o incr�veis, eu realmente estou andando mais r�pido com eles. Onde comprei os meus? Acho que vi em algum lugar em $cc $+ Rustboro City $+ $ct $+ , ainda bem que comprei o meu antes de esgotar o estoque! | return
  }
  elseif ($1 == Lao) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Lao $+ $ct $+ , um treinador pok�mon.
    msg =$nick $chr(160) $cc $+ Lao $ct $+ - Acho que tive sorte! Eu fui evoluir meu $cc $+ Nincada $ct $+ para $cc $+ Ninjask $+ $ct $+ , e ao faz�-lo percebi que um pok�mon apareceu na minha $cc $+ Ultra Ball $+ $ct $+ ! S� n�o entendo "como" isso aconteceu... | return
  }
  elseif ($1 == Steven) && ($start($nick)) {
    if ($rini(cadastros,$nick,Quests,Steven2)) { msg =$nick $ct $+ Acho que $cc $+ Steven $ct $+ n�o est� mais na cidade. | return }
    else {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Steven $+ $ct $+ .
      if ($rini(cadastros,$nick,Quests,Aqua2)) {
        msg =$nick $chr(160) $cc $+ Steven $ct $+ - $nick $+ , veja isto! � um pok�mon! Huh? N�o est� vendo? Ah, tem raz�o, voc� precisa usar isto.
        msg =$nick $ct $+ Parab�ns, voc� recebeu o item $cc $+ Devon Scope $+ $ct $+ ! | item.add $nick Devon Scope
        msg =$nick $chr(160) $cc $+ Steven $ct $+ - Se voc� usar este item antes de uma batalha com pok�mon selvagem, talvez um pok�mon invis�vel apare�a no seu caminho. Tente us�-la aqui em $cc $+ Fortree City $ct $+ e voc� ver�, tenho certeza!
        msg =$nick $chr(160) $cc $+ Steven $ct $+ - Eu vou indo ent�o, at� depois $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Steven2 Ok | return
      }
      else { msg =$nick $chr(160) $cc $+ Steven $ct $+ - $nick $+ ! H� quanto tempo hein. Agora estou analisando um fen�meno incomum dos pok�mon, poderia voltar outra hora? | return }
    }
  }
  elseif ($1 == May) && ($start($nick)) {
    if ($rini(cadastros,$nick,Quests,May3)) { msg =$nick $ct $+ Acho que $cc $+ May $ct $+ n�o est� mais na cidade. | return }
    else {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ May $+ $ct $+ .
      msg =$nick $chr(160) $cc $+ May $ct $+ - $nick $+ ! Estava te procurando agora a pouco, at� perceber uns estranhos pok�mon invis�veis no caminho.
      msg =$nick $chr(160) $cc $+ May $ct $+ - Agora que treinei bastante meus pok�mon, imagino que n�o perder�o para os seus!
      msg =$nick $chr(160) $cc $+ May $ct $+ - Ei, que tal uma batalha? Eu usarei apenas tr�s pok�mon, os melhores! Organize seu time e manda ver!
      msg =$nick $ct $+ Digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar. | set %confirm. [ $+ [ $nick ] ] MAY:2 | return
    }
  }
  elseif ($1 == Winona) {
    if ($badge($nick,Feather Badge)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Winona $+ $ct $+ , l�der do gin�sio de $cc $+ Fortree City $+ $ct $+ .
      if ($rini(cadastros,$nick,Quests,Aqua2)) { msg =$nick $chr(160) $cc $+ Winona $ct $+ - O $cc $+ Weather Institute $ct $+ estuda o clima de $cc $+ Hoenn $+ $ct $+ , e parece que criaram um pok�mon que muda conforme o clima. Eu admiro o trabalho desenvolvido, mas n�o acho que deva ser feito. Eu vejo pok�mon como criaturas naturais, e n�o artificiais. }
      else { msg =$nick $chr(160) $cc $+ Winona $ct $+ - Eu gosto de usar meus pok�mon voadores para voar junto com eles. � muito relaxante. }
      if (!$dados($nick,Quests,Tomb)) && ($dados($nick,Quests,League)) {
        msg =$nick $chr(160) $cc $+ Winona $ct $+ - Est� falando da lenda de $cc $+ Pacifidlog Town $+ $ct $+ ?
        msg =$nick $chr(160) $cc $+ Winona $ct $+ - Sim, a porta est� $cc $+ realmente $ct $+ nos c�us. Digo com certeza pois j� estive de frente a ela, com a ajuda de meu pok�mon voador, embora n�o consegui abri-la. � preciso ser r�pido e preciso, pois, ao entrar em $cc $+ Pacifidlog Town $+ $ct $+ , a porta aparecer� e desaparecer� em alguns segundos. Voe, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Voe!
      }
      return
    }
    else { msg =$nick $cc $+ Winona $ct $+ est� no gin�sio, aguardando seu desafio. | return }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. | return }
}
alias c.search.Lilycove_City {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do centro pok�mon.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Ol�, $nick $+ ! Bem vindo a Lilycove! Se voc� n�o conhece esta cidade, voc� vai adorar a zona do safari! � um �timo lugar para quem quer completar a PokeDex, pois aparecem esp�cies variadas em seus habitats naturais. | return
  }
  elseif ($1 == Bernie) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Bernie $+ $ct $+ , um treinador pok�mon.
    if ($rini(cadastros,$nick,Quests,Weather)) { msg =$nick $chr(160) $cc $+ Bernie $ct $+ - N�o entendo como esta chuva come�ou, o dia estava t�o ensolarado. Assim eu n�o vou poder fazer meus safaris, n�o com esta chuva! | return }
    else { msg =$nick $chr(160) $cc $+ Bernie $ct $+ - Nossa, consegui capturar um pok�mon na zona do safari hoje, e ele � muito raro! Mal posso esperar para ir novamente amanh�. | return }
  }
  elseif ($1 == Robert) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Robert $+ $ct $+ , um habitante da cidade.
    msg =$nick $chr(160) $cc $+ Robert $ct $+ - Ahn... Acho que estou com problemas de sono.
    if ($rini(cadastros,$nick,Quests,Robert)) { msg =$nick $chr(160) $cc $+ Robert $ct $+ - Yawn... Dormir � essencial... | return }
    else { writeini pkp\cadastros\ $+ $nick $+ .ini Quests Robert Ok | item.add $nick TM44 | msg =$nick $ct $+ Voc� ganhou o item $cc $+ TM44 $+ $ct $+ ! | msg =$nick $chr(160) $cc $+ Robert $ct $+ - Dormir � essencial para uma boa sa�de... Durma e recupere suas energias... | return }
  }
  elseif ($1 == Serena) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Serena $+ $ct $+ , a respons�vel pelo porto.
    if ($dados($nick,$dados($nick,Info,Start),Badges).n == 8) {
      var %x = $dados($nick,Clock,Ship), %y = 0
      if (%x) { if ($calc($dados($nick,Info,Online) - %x) >= 21600) { var %y = 1 } } | else { var %y = 1 }
      if (%y) {
        if ($item($nick,Gold Ticket).qnt) && ($item($nick,Silver Ticket).qnt) {
          msg =$nick $chr(160) $cc $+ Serena $ct $+ - Oh, este � o $cc $+ Silver Ticket $ct $+ e o $cc $+ Gold Ticket $+ $ct $+ . Deseja embarcar no $cc $+ SS Anne $ct $+ ( $+ $cc $+ $travel.ship($nick,SS Anne) $+ $ct $+ ) ou no $cc $+ SS Tidal $ct $+ ( $+ $cc $+ $travel.ship($nick,SS Tidal) $+ $ct $+ ) $+ ?
          msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim <barco> $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar. | set %confirm. [ $+ [ $nick ] ] SHP:SS Anne;SS Tidal
        }
        elseif ($item($nick,Gold Ticket).qnt) {
          msg =$nick $chr(160) $cc $+ Serena $ct $+ - Oh, este � o $cc $+ Gold Ticket $+ $ct $+ . Deseja embarcar no $cc $+ SS Tidal $+ $ct $+ ?
          msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar. | set %confirm. [ $+ [ $nick ] ] SHP:SS Tidal
        }
        elseif ($item($nick,Silver Ticket).qnt) {
          msg =$nick $chr(160) $cc $+ Serena $ct $+ - Oh, este � o $cc $+ Silver Ticket $+ $ct $+ . Deseja embarcar no $cc $+ SS Anne $+ $ct $+ ?
          msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar. | set %confirm. [ $+ [ $nick ] ] SHP:SS Anne
        }
        else { msg =$nick $chr(160) $cc $+ Serena $ct $+ - Voc� n�o pode embarcar se n�o tiver uma passagem de navio. }
      }
      else { msg =$nick $chr(160) $cc $+ Serena $ct $+ - N�o h� barco ainda, voc� deve aguardar seis horas $cc $+ online $ct $+ para tentar novamente. Neste momento, faltam aproximadamente $dur($calc(21600 - ($dados($nick,Info,Online) - %x)),$ct,$cc) $+ . }
      return
    }
    else { msg =$nick $chr(160) $cc $+ Serena $ct $+ - Infelizmente estamos sem servi�o, mas em breve funcionar�. | return }
  }
  elseif ($1 == Lyo) && (!$rini(cadastros,$nick,Quests,Aqua4)) && ($start($nick)) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Lyo $+ $ct $+ , membro da equipe $cc $+ Aqua $+ $ct $+ .
    msg =$nick $chr(160) $cc $+ Lyo $ct $+ (AQUA) - Algo muito importante est� perto de acontecer, eu sinto isso. � por isso que estou de guarda aqui em Lilycove, enquanto os outros membros voltam do Mt Py... Droga! Eu e minha boca grande! | return
  }
  elseif ($1 == Karn) && (!$rini(cadastros,$nick,Quests,Aqua4)) && ($start($nick)) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Lyo $+ $ct $+ , membro da equipe $cc $+ Aqua $+ $ct $+ .
    msg =$nick $chr(160) $cc $+ Karn $ct $+ (AQUA) - Se os objetivos de nossa fac��o se realizassem, humanos e pok�mon seriam mais felizes. N�o entendo como as pessoas julgam nosso time como vil�es! | if (!$rini(cadastros,$nick,Quests,Aqua1)) { item.add $nick TM46 | msg =$nick $ct $+ Voc� ganhou o item $cc $+ TM46 $+ $ct $+ . | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Aqua1 Ok } | return
  }
  elseif ($1 == Ralf) && (!$rini(cadastros,$nick,Quests,Aqua4)) && ($start($nick)) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Ralf $+ $ct $+ , membro da equipe $cc $+ Aqua $+ $ct $+ .
    msg =$nick $chr(160) $cc $+ Ralf $ct $+ (AQUA) - Ah, eu n�o sei onde fica o $cc $+ Magma Hideout $+ $ct $+ ! Hm, est� muito calmo ultimamente... Acho que eles est�o tramando algo!! | return
  }
  elseif ($1 == Aqua) || ($1 == Archie) {
    if ($rini(cadastros,$nick,Quests,Aqua3)) && ($start($nick)) {
      if ($rini(cadastros,$nick,Quests,Aqua4)) { msg =$nick $ct $+ Nada foi encontrado. | return }
      else {
        if ($rini(cadastros,$nick,Quests,Magma2) == Ok) {
          msg =$nick $ct $+ Voc� conseguiu entrar no $cc $+ Aqua Hideout $+ $ct $+ , em $cc $+ $rini(cadastros,$nick,Info,Locate) $+ $ct $+ ! Alguns membros est�o tentando expuls�-lo, o que voc� deseja fazer?
          msg =$nick $ct $+ Digite $cc $+ .Sim $ct $+ para batalhar contra eles e $cc $+ .nao $ct $+ para sair do $cc $+ Aqua Hideout $+ $ct $+ . | set %confirm. [ $+ [ $nick ] ] AQU:3 | return
        }
        else {
          msg =$nick $ct $+ Voc� encontra-se com um guarda da Equipe $cc $+ Aqua $+ $ct $+ .
          msg =$nick $chr(160) $cc $+ Rick $ct $+ (AQUA) $ct $+ - Voc� deve ser algum membro da Equipe $cc $+ Magma $ct $+ usando esse emblema! Saia daqui! Estamos ocupados demais para perder tempo com voc�s! | return
        }
      }
    }
    else { msg =$nick $ct $+ Voc� pode ver alguns membros da $cc $+ Equipe Aqua $+ $ct $+ : Lyo $+ $ct $+ , $cc $+ Karn $ct $+ e $cc $+ Ralf $+ $ct $+ . | return }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. | return }
}
alias c.search.Mt_Pyre {
  if ($1 == Aqua) || ($1 == Archie) {
    if ($rini(cadastros,$nick,Quests,Aqua3)) && ($start($nick)) {
      if (!$rini(cadastros,$nick,Quests,Weather)) && ($rini(cadastros,$nick,Quests,Sky2)) {
        if ($rini(cadastros,$nick,Quests,Magma4)) { msg =$nick $ct $+ Nada foi encontrado. }
        else {
          msg =$nick $ct $+ Voc� encontra-se com $cc $+ Maxie $ct $+ e $cc $+ Archie $+ $ct $+ . Eles recolocaram as $cc $+ Orbs $ct $+ em seus lugares.
          msg =$nick $chr(160) $cc $+ Maxie $ct $+ - $nick $+ ... | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Magma4 Ok
        } | return
      }
      else { msg =$nick $ct $+ Nada foi encontrado. | return }
    }
    else {
      if ($rini(cadastros,$nick,Quests,Magma2)) || (!$start($nick)) { msg =$nick $ct $+ Nada foi encontrado. | return }
      else {
        msg =$nick $ct $+ Voc� encontra-se com alguns membros da Equipe $cc $+ Aqua $+ $ct $+ .
        msg =$nick $chr(160) $cc $+ Archie $ct $+ - Quando chegamos aqui, a equipe Magma j� tinha sa�do, mas n�o levou o pr�mio principal... $cc $+ Red Orb $ct $+ nos far� completar o nosso objetivo! Este dia ser� lembrado...
        msg =$nick $chr(160) $cc $+ Shelly $ct $+ - Archie, precisamos ir, todos j� est�o a postos em Lilycove.
        msg =$nick $chr(160) $cc $+ Archie $ct $+ - Est� certo. $nick $+ , n�o quero problemas com voc�, mas se voltar a aparecer, voc� ter� problemas.
        writeini pkp\cadastros\ $+ $nick $+ .ini Quests Magma2 No | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Aqua3 Ok | return
      }
    }
  }
  elseif ($1 == Magma) || ($1 == Maxie) || ($1 == Item) || ($1 == Emblem) {
    if ($rini(cadastros,$nick,Quests,Magma2) == No) || (!$rini(cadastros,$nick,Quests,Magma2)) {
      if ($start($nick)) {
        if ($item($nick,Magma Emblem).qnt) { msg =$nick $ct $+ Nada foi encontrado. | return }
        else { msg =$nick $ct $+ Voc� pode ver um item deixado no ch�o por algu�m, talvez por acidente. | msg =$nick $ct $+ Voc� achou o item $cc $+ Magma Emblem $+ $ct $+ ! | item.add $nick Magma Emblem }
      }
      else { msg =$nick $ct $+ Nada foi encontrado. | return }
    }
    else {
      if (!$rini(cadastros,$nick,Quests,Weather)) && ($rini(cadastros,$nick,Quests,Sky2)) {
        if ($rini(cadastros,$nick,Quests,Magma4)) { msg =$nick $ct $+ Nada foi encontrado. }
        else {
          msg =$nick $ct $+ Voc� encontra-se com $cc $+ Maxie $ct $+ e $cc $+ Archie $+ $ct $+ . Eles recolocaram as $cc $+ Orbs $ct $+ em seus lugares.
          msg =$nick $chr(160) $cc $+ Maxie $ct $+ - $nick $+ ... | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Magma4 Ok
        } | return
      }
      else { msg =$nick $ct $+ Nada foi encontrado. | return }
    }
  }
  elseif ($1 == Orb) || ($1 == Orbs) || ($1- == Red Orb) || ($1- == Blue Orb) {
    if ($rini(cadastros,$nick,Quests,Magma4)) {
      var %x = $dados($nick,Quests,Orb)
      if (%x == 5) || (!%x) { msg =$nick $ct $+ Voc� pode ver a $cc $+ Red Orb $ct $+ e a $cc $+ Blue Orb $+ $ct $+ , em seus lugares. }
      else { msg =$nick $ct $+ Parece-me que a $cc $+ Red Orb $ct $+ e a $cc $+ Blue Orb $ct $+ foram roubadas... } | return
    }
    else { msg =$Nick $ct $+ Nada foi encontrado. } | return
  }
  else { msg =$nick $ct $+ Nada foi encontrado. | return }
}
alias c.search.Silver_Bay { msg =$nick $ct $+ Nada foi encontrado. }
alias c.search.Mossdeep_City {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do centro pok�mon.
    if ($rini(cadastros,$nick,Quests,Weather)) { $chr(160) $cc $+ Joy $ct $+ - O clima mudou drasticamente h� um tempo atr�s, e isso n�o � nada normal! Nunca vi tanta chuva aqui em Mossdeep, ser� que estamos em risco? | return }
    else { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Ol�, $nick $+ ! Bem vindo a Mossdeep, esta ilha tem o clima ideal para o desenvolvimento do centro espacial. E no gin�sio, voc� poder� encontrar duas l�deres, g�meas, que batalham juntas. � estranho, mas elas sabem exatamente o que a outra est� pensando... | return }
  }
  elseif ($1 == Vivian) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Vivian $+ $ct $+ , uma treinadora pok�mon.
    if ($rini(cadastros,$nick,Quests,Weather)) { msg =$nick $chr(160) $cc $+ Vivian $ct $+ - Meu deus! O que est� acontecendo l� fora? Que clima louco � esse? N�o d� pra nadar agora, a mar� est� muito agitada! � perigoso... | return }
    else { msg =$nick $chr(160) $cc $+ Vivian $ct $+ - Adoro nadar com meus pok�mon! Acho que vou nadar daqui a pouco, o clima est� �timo! | return }
  }
  elseif ($1 == George) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ George $+ $ct $+ , um pescador.
    if ($item($nick,Super Rod).qnt) || (!$start($nick)) { msg =$nick $chr(160) $cc $+ George $ct $+ - V� atras de pok�mon no fundo dos mares usando sua $cc $+ Super Rod $+ $ct $+ ! | return }
    else {
      if ($item($nick,Good Rod).qnt) {
        msg =$nick $chr(160) $cc $+ George $ct $+ - Diga o que quiser, mas a $cc $+ Super Rod $ct $+ � realmente 'super'! Ela consegue alcan�ar pok�mon que est�o bem no fundo!
        item.add $nick Super Rod | msg =$nick $ct $+ Voc� ganhou o item $cc $+ Super Rod $+ $ct $+ ! | return
      }
      else { msg =$nick $chr(160) $cc $+ George $ct $+ - Voc� n�o me parece ter muito interesse pela pesca... N�o, voc� n�o pode ser bom se n�o tiver nem ao menos uma $cc $+ Good Rod $+ $ct $+ ! | return }
    }
  }
  elseif ($1 == Dalton) {
    var %b = $dados($nick,$dados($nick,Info,Region),Badges) | msg =$nick $ct $+ Voc� encontra-se com $cc $+ Dalton $+ $ct $+ , cientista do $cc $+ Space Center $+ $ct $+ .
    if ($start($nick)) {
      if ($findtok(%b,Mind Badge,0,58)) {
        if ($rini(cadastros,$nick,Quests,Magma3)) { msg =$nick $chr(160) $cc $+ Dalton $ct $+ - A regi�o de Hoenn era famosa por suas chuvas de meteoros durante muito tempo. }
        else { msg =$nick $chr(160) $cc $+ Dalton $ct $+ - Equipe Magma! Eles realmente apareceram! Olhe, Steven est� em desvantagem! }
      }
      else { msg =$nick $chr(160) $cc $+ Dalton $ct $+ - Estamos sofrendo amea�as da Equipe Magma, mas felizmente Steven est� aqui para nos ajudar. }
    }
    else { msg =$nick $chr(160) $cc $+ Dalton $ct $+ - Nossa, nosso combust�vel espacial quase foi roubado pela Equipe Magma. Felizmente, bons treinadores como $cc $+ Steven $ct $+ estavam aqui para ajudar. }
    return
  }
  elseif ($1 == Wilton) {
    var %b = $dados($nick,$dados($nick,Info,Region),Badges) | msg =$nick $ct $+ Voc� encontra-se com $cc $+ Wilton $+ $ct $+ , cientista do $cc $+ Space Center $+ $ct $+ .
    if ($start($nick)) {
      if ($findtok(%b,Mind Badge,0,58)) {
        if ($rini(cadastros,$nick,Quests,Magma3)) { msg =$nick $chr(160) $cc $+ Wilton $ct $+ - Mesmo se fizermos um foguete com 99% de chance de sucesso, n�o estaremos satisfeitos. Enquanto houve 1% de margem de erro, continuaremos trabalhando! }
        else { msg =$nick $chr(160) $cc $+ Wilton $ct $+ - Equipe Magma! Eles n�o podem levar nosso combust�vel! Precisamos dele! }
      }
      else { msg =$nick $chr(160) $cc $+ Wilton $ct $+ - Estou ficando preocupado com essas amea�as da Equipe Magma. }
    }
    else { msg =$nick $chr(160) $cc $+ Wilton $ct $+ - Eu n�o consigo entender a verdadeira raz�o de usar um combust�vel espacial para explodir um vulc�o... Como isso poderia ajudar os pok�mon? Equipe Magma � insana... }
    return
  }
  elseif ($1 == Magma) || ($1 == Maxie) {
    if ($rini(cadastros,$nick,Quests,Magma3)) || (!$start($nick)) { msg =$nick $ct $+ Nada foi encontrado. | return }
    else {
      var %b = $dados($nick,$dados($nick,Info,Region),Badges)
      if ($findtok(%b,Mind Badge,0,58)) {
        msg =$nick $ct $+ Voc� encontra-se com alguns membros da Equipe $cc $+ Magma $ct $+ e $cc $+ Steven $+ $ct $+ .
        msg =$nick $chr(160) $cc $+ Steven $ct $+ - Equipe Magma, o que h� de importante em roubar o combust�vel dos foguetes?
        msg =$nick $chr(160) $cc $+ Maxie $ct $+ - Hahaha... Como voc� � curioso... merece uma explica��o. N�s vamos colocar todo o combust�vel no Mt Chimney! Com o desaparecimento de Groudon, n�o h� mais necessidade daquela montanha. Ent�o vamos usar o poder dos combust�veis para faz�-lo entrar em erup��o!
        msg =$nick $ct $+ Ajudar $cc $+ Steven $ct $+ a derrot�-los? Digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar. | set %confirm. [ $+ [ $nick ] ] MGM:3 | return
      }
      else { msg =$nick $ct $+ Nada foi encontrado. }
      return
    }
  }
  elseif ($1 == Steven) {
    if ($rini(cadastros,$nick,Quests,Steven3)) { msg =$nick $cc $+ Steven $ct $+ n�o est� em casa. }
    else {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Steven $+ $ct $+ .
      if ($start($nick)) {
        if ($rini(cadastros,$nick,Quests,Magma3)) {
          if ($item($nick,HM08).qnt) { msg =$nick $chr(160) $cc $+ Steven $ct $+ - Parece que h� uma caverna submersa em Silver Bay, aquela que o Capit�o Stern descobriu com seu submarino. }
          else {
            msg =$nick $chr(160) $cc $+ Steven $ct $+ - Ah, $nick $+ , obrigado pela ajuda. Como recompensa, aqui est�, este Hidden Machine Dive. Vamos, n�o seja t�mido!
            item.add $nick HM08 | msg =$nick $ct $+ Voc� ganhou o item $cc $+ HM08 $+ $ct $+ . | msg =$nick $chr(160) $cc $+ Steven $ct $+ - Em alguns lugares, como em Silver Bay, voc� poder� mergulhar com seus pok�mon. Eu ficarei por aqui. Ah sim, eu n�o moro em Rustboro City. Moro aqui mesmo, em Mossdeep.
          }
        }
        else {
          var %b = $dados($nick,$dados($nick,Info,Region),Badges)
          if ($findtok(%b,Mind Badge,0,58)) { msg =$nick $chr(160) $cc $+ Steven $ct $+ - $nick $+ , pode me ajudar a deter esta Equipe Magma? Fique com o Maxie, que eu cuido do Tabitha. }
          else { msg =$nick $chr(160) $cc $+ Steven $ct $+ - Ah, ol� $nick $+ ! Estou aqui no centro espacial porque soube de uma amea�a da Equipe Magma de roubar o combust�vel dos foguetes daqui. Vou ficar de olho, at� eles aparecerem. Por que n�o vai dar uma olhada no resto da cidade? }
        }
      }
      else {
        if ($item($nick,HM08).qnt) { msg =$nick $chr(160) $cc $+ Steven $ct $+ - Tenho o h�bito de colecionar pedras raras. Voc� tem alguma para me oferecer? }
        else { msg =$nick $chr(160) $cc $+ Steven $ct $+ - Voc� n�o � daqui, certo? Meu nome � $cc $+ Steven $+ $ct $+ . Deve estar ent�o se perguntando como vai chegar � $cc $+ Sootopolis City $+ $ct $+ ... Tudo bem, � s� ensinar ao pok�mon a t�cnica $cc $+ Dive $+ $ct $+ ! | item.add $nick HM08 | msg =$nick $ct $+ Parab�ns, voc� ganhou o item $cc $+ HM08 $+ $ct $+ ! }
      }
    }
    return
  }
  elseif ($findtok(Presente:Presente secreto:Gift:Hidden Gift,$1-,0,58)) && ($start($nick)) && ($dados($nick,Quests,Gift)) {
    if ($dados($nick,Quests,Gift) == Ok) { msg =$nick $ct $+ N�o h� mais presentes aqui... }
    else {
      var %x = Beldum
      msg =$nick $ct $+ Voc� encontrou um $cc $+ presente $+ $ct $+ ! Oh, � um pok�mon!
      if ($dados($nick,%x,Name)) { msg =$nick $ct $+ Voc� n�o p�de receb�-lo porque j� tem um pok�mon com o mesmo $cc $+ nome $ct $+ no time... | return }
      if ($dados($nick,Team,6)) { msg =$nick $ct $+ Voc� n�o p�de receb�-lo porque n�o h� espa�o em seu time! | return }
      msg =$nick $ct $+ Parab�ns! $cc $+ $dados($nick,Info,Nick) $ct $+ ganhou o pok�mon $cc $+ %x $+ $ct $+ !
      if (!$pokedex($nick,%x)) { .echo $pokedex($nick,%x).add } | addpoke $nick %x 20 20: $+ $dados($nick,Info,Locate) $+ :Poke  Ball
      writeini pkp\cadastros\ $+ $nick $+ .ini Quests Gift Ok
    }
    return
  }
  elseif ($1 == Tate) || ($1 == Liza) || ($1 == Tate&Liza) {
    if ($findtok($dados($nick,$dados($nick,Info,Region),Badges),Mind Badge,0,58)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Tate $ct $+ e $cc $+ Liza $+ $ct $+ , l�deres do gin�sio de Mossdeep.
      if ($rini(cadastros,$nick,Quests,Weather)) {
        msg =$nick $chr(160) $cc $+ Tate $ct $+ - Essa chuva ...
        msg =$nick $chr(160) $cc $+ Liza $ct $+ - ... n�o acaba nunca?
        msg =$nick $chr(160) $cc $+ Tate $ct $+ - O que estar� ...
        msg =$nick $chr(160) $cc $+ Liza $ct $+ - ... por tr�s disso?
        msg =$nick $chr(160) $cc $+ Tate&Liza $ct $+ - Voc� sabe de alguma coisa, $nick $+ ?
      }
      else {
        msg =$nick $chr(160) $cc $+ Tate $ct $+ - Eu simplesmente sei o que a Liza est� pensando.
        msg =$nick $chr(160) $cc $+ Liza $ct $+ - Eu tamb�m sei o que a Tate est� pensando.
        msg =$nick $chr(160) $cc $+ Tate $ct $+ - Alguns podem achar entranho ...
        msg =$nick $chr(160) $cc $+ Liza $ct $+ - ... mas veja, somos g�meas!
        msg =$nick $chr(160) $cc $+ Tate&Liza $ct $+ - Isso � telepatia! Pok�mon ps�quicos normalmente s�o portadores de habilidades semelhantes.
      }
      return
    }
    else { msg =$nick $cc $+ Tate $ct $+ e $cc $+ Liza $ct $+ est�o no gin�sio, aguardando seu desafio. | return }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. | return }
}
alias c.search.Shoal_Cave { msg =$nick $ct $+ Nada foi encontrado. }
alias c.search.Seafloor_Cavern {
  if ($1 == Aqua) || ($1 == Archie) {
    if ($start($nick)) {
      if (!$rini(cadastros,$nick,Quests,Weather)) && (!$rini(cadastros,$nick,Quests,Sky2)) && ($rini(cadastros,$nick,Quests,Magma3)) { msg =$nick $ct $+ Voc� encontrou alguns membros da Equipe $cc $+ Aqua $+ $ct $+ . | msg =$nick $ct $+ Deseja batalhar com eles? $cc $+ .sim $ct $+ para aceitar ou $cc $+ .nao $ct $+ para cancelar. | set %confirm. [ $+ [ $nick ] ] AQU:4 | return }
      else { msg =$nick $ct $+ Nada foi encontrado. | return }
    }
    else { msg =$nick $ct $+ Nada foi encontrado. | return }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. | return }
}
alias c.search.Sootopolis_City {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do centro pok�mon.
    if ($rini(cadastros,$nick,Quests,Weather)) { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Aqueles pok�mon batalhando... Aqueles s�o pok�mon lend�rios, certo? Se eles n�o pararem, a cidade vai ficar completamente submersa! | return }
    else { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Bem vindo a Sootopolis, $nick $+ ! Nossa cidade � localizada no meio de montanhas, com Silver Bay nos arredores. � sem d�vida uma paisagem e tanto! Ah, o l�der desta cidade usa pok�mon aqu�ticos. Juan deve ser o l�der mais elegante de todos! | return }
  }
  elseif ($1 == Brooke) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Brooke $+ $ct $+ , um treinador pok�mon.
    if ($rini(cadastros,$nick,Quests,Weather)) { msg =$nick $chr(160) $cc $+ Brooke $ct $+ - Aqueles pok�mon lend�rios, s�o realmente muito poderosos! S�o t�o poderosos que eu prefiro n�o entrar no meio daquela batalha. | return }
    else {
      if ($start($nick)) {
        if ($findtok($dados($nick,$dados($nick,Info,Region),Badges),Rain Badge,0,58)) { msg =$nick $chr(160) $cc $+ Brooke $ct $+ - Acho que vou treinar meus pok�mon para que sejam fortes como os seus, afinal, voc� � o meu her�i! Hehehe... }
        elseif ($rini(cadastros,$nick,Quests,Sky2)) { msg =$nick $chr(160) $cc $+ Brooke $ct $+ - Nossa! Aquele pok�mon verde que desceu dos c�us, � incr�vel! Ele conseguiu acalmar os outros dois... Hahahaha... Que boas not�cias! }
        else { msg =$nick $chr(160) $cc $+ Brooke $ct $+ - Adoro esta cidade, tudo � t�o bonito e paradis�aco, � bom para relaxar... Vou precisar me preparar para a liga, mas antes vou ter que pegar a Rain Badge. Hmm, estou esperando o gin�sio abrir tamb�m! }
      }
      else { msg =$nick $chr(160) $cc $+ Brooke $ct $+ - Nossa cidade j� foi palco de uma batalha colossal! Hahaha, tive sorte, eu estava presente! Aqueles pok�mon $cc $+ Groudon $ct $+ e $cc $+ Kyogre $+ $ct $+ ... Pra onde eles podem ter ido? }
      return
    }
  }
  elseif ($1 == Helena) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Helena $+ $ct $+ , uma habitante da cidade.
    if ($rini(cadastros,$nick,Quests,Weather)) { msg =$nick $chr(160) $cc $+ Helena $ct $+ - Ouch! O que vai acontecer se isto n�o parar?! N�o, n�o quero nem imaginar... | return }
    else {
      if ($start($nick)) {
        if ($findtok($dados($nick,$dados($nick,Info,Region),Badges),Rain Badge,0,58)) { msg =$nick $chr(160) $cc $+ Helena $ct $+ - Sou eternamente grata pelo que voc� fez, jamais vou esquecer! Acho que tenho um novo �dolo a partir de agora... }
        elseif ($rini(cadastros,$nick,Quests,Sky2)) { msg =$nick $chr(160) $cc $+ Helena $ct $+ - Gra�as � aquele pok�mon dos c�us! Gra�as a ele, e a voc�, estamos salvos! Obrigada! }
        else { msg =$nick $chr(160) $cc $+ Helena $ct $+ - Nossa! O l�der Juan � t�o, t�o, mas t�o elegante, que eu me derreto toda s� de pensar nele... Um dia vou ser treinadora e batalhar ao lado dele! Hahaha... }
      }
      else { msg =$nick $chr(160) $cc $+ Helena $ct $+ - Sootopolis � aben�oada pela beleza, com certeza! Nunca vi cidade t�o bela em minha vida! E, pode parecer estranho, mas � comum que apare�am Zubats $cc $+ verdes $ct $+ por esta �rea. Vejo todo dia alguns passando em dire��o � caverna. }
      return
    }
  }
  elseif ($1 == Diogo) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Diogo $+ $ct $+ , um pintor.
    if ($rini(cadastros,$nick,Quests,Weather)) { msg =$nick $chr(160) $cc $+ Diogo $ct $+ - Isso � tr�gico e exuberantemente lindo... Mas tr�gico acima de tudo! | return }
    else {
      if ($start($nick)) {
        if ($findtok($dados($nick,$dados($nick,Info,Region),Badges),Rain Badge,0,58)) { msg =$nick $chr(160) $cc $+ Diogo $ct $+ - Estou emocionado, consegui fazer um desenho daquele pok�mon verde! � o meu melhor trabalho! }
        elseif ($rini(cadastros,$nick,Quests,Sky2)) { msg =$nick $chr(160) $cc $+ Diogo $ct $+ - Brilhante! Incr�vel! Art�stico! N�o tenho mais palavras para descrever, mas isso me deixou inspirado! }
        else { msg =$nick $chr(160) $cc $+ Diogo $ct $+ - Minhas pinturas retratam pok�mon em seus habitats ou em batalhas. Eu queria encontrar um pok�mon lend�rio para desenh�-lo! }
      }
      else { msg =$nick $chr(160) $cc $+ Diogo $ct $+ - Fiz diversas pinturas, mas minha �ltima � uma obra de arte, sem d�vida! Gra�as a aqueles pok�mon legend�rios que apare�am nessa �rea... }
      if (!$dados($nick,Quests,Tomb)) && ($dados($nick,Quests,League)) { msg =$nick $chr(160) $cc $+ Diogo $ct $+ - " $+ $cc $+ Anci�o dos mares $+ $ct $+ " � o t�tulo de uma das minhas pinturas! Veja... | msg =$nick $ct $+ Voc� pode ver apenas uma imagem manchada e com predomin�ncia de marrom. | msg =$nick $chr(160) $cc $+ Diogo $ct $+ - Esqueci de mencionar: minhas pinturas s�o abstratas! Bem, eu tamb�m n�o pude ver com clareza porque ele nadou at� as profundezas de $cc $+ Underwater $+ $ct $+ . }
      return
    }
  }
  elseif ($1 == Magma) || ($1 == Maxie) {
    if ($rini(cadastros,$nick,Quests,Weather) == Ok) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Maxie $+ $ct $+ .
      msg =$nick $chr(160) $cc $+ Maxie $ct $+ - G... Groudon... Por favor! Pare com isso! Eu sei agora a extens�o de seu poder, se voc� continuar, toda Hoenn, n�o s� Sootopolis, ficar� submersa! | return
    }
    else { msg =$nick $ct $+ Nada foi encontrado. | return }
  }
  elseif ($1 == Aqua) || ($1 == Archie) {
    if ($rini(cadastros,$nick,Quests,Weather) == Ok) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Archie $+ $ct $+ .
      msg =$nick $chr(160) $cc $+ Archie $ct $+ - Kyogre! O que h� de errado?! Olhe, aqui � a $cc $+ Red Orb $+ $ct $+ ! Acalme-se, Kyogre! Isto n�o est� ajudando, ele n�o est� respondendo... | return
    }
    else { msg =$nick $ct $+ Nada foi encontrado. | return }
  }
  elseif ($1 == Steven) {
    if ($rini(cadastros,$nick,Quests,Weather) == Ok) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Steven $+ $ct $+ .
      if (!$rini(cadastros,$nick,Quests,Steven4)) {
        msg =$nick $chr(160) $cc $+ Steven $ct $+ - Aqueles pok�mon lutando... Groudon e Kyogre... Estes dois pok�mon lend�rios foram acordados de um longo sono, e agora eles est�o atacando um ao outro com suas incontrol�veis energias...
        msg =$nick $chr(160) $cc $+ Steven $ct $+ - $nick $+ , ver voc� aqui me faz pensar que est� preparado para se envolver nesta crise. Bem, ent�o tem uma pessoa que eu gostaria que voc� conhecesse. Venha comigo. | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Steven4 Ok
      }
      if ($rini(cadastros,$nick,Quests,Wallace)) {
        msg =$nick $chr(160) $cc $+ Steven $ct $+ - Sky Pillar... Nunca estive l�, me pergunto onde fica esse lugar. | return
      }
      else {
        msg =$nick $chr(160) $cc $+ Steven $ct $+ - Escute, $nick $+ . Dentro da $cc $+ Cave Of Origin $ct $+ voc� encontrar� algu�m chamado $cc $+ Wallace $+ $ct $+ . Acho que voc� tem o que ele precisa para ajud�-lo.
        writeini pkp\cadastros\ $+ $nick $+ .ini Info Locate Cave Of Origin | remini pkp\cadastros\ $+ $nick $+ .ini Time Goto | msg =$nick $ct $+ Voc� entrou na $cc $+ Cave Of Origin $+ $ct $+ . | return
      }
    }
    else {
      if ($rini(cadastros,$nick,Quests,Steven3)) && ($start($nick)) {
        if ($rini(cadastros,$nick,Quests,Magma4)) { msg =$nick $ct $+ Nada foi encontrado. | return }
        else {
          var %b = $dados($nick,$dados($nick,Info,Region),Badges)
          if ($findtok(%b,Rain Badge,0,58)) { msg =$nick $ct $+ Nada foi encontrado. | return }
          msg =$nick $ct $+ Voc� encontra-se com $cc $+ Steven $+ $ct $+ .
          msg =$nick $chr(160) $cc $+ Steven $ct $+ - Parece que Maxie e Archie sairam para algum lugar. Eles devem ter ido ao Mt Pyre colocar as $cc $+ Orbs $ct $+ de volta em seus devidos lugares. | return
        }
      }
      else { msg =$nick $ct $+ Nada foi encontrado. | return }
    }
  }
  elseif ($1 == Wallace) {
    if ($rini(cadastros,$nick,Quests,Sky)) {
      var %b = $dados($nick,$dados($nick,Info,Region),Badges)
      if ($findtok(%b,Rain Badge,0,58)) { msg =$nick $ct $+ Nada foi encontrado. }
      else {
        msg =$nick $ct $+ Voc� encontra-se com $cc $+ Wallace $+ $ct $+ .
        if ($rini(cadastros,$nick,Quests,Weather)) { msg =$nick $chr(160) $cc $+ Wallace $ct $+ - Vamos, $nick $+ , procure Rayquaza no topo do Sky Pillar! Estamos contando com voc�! }
        else {
          if ($item($nick,HM07).qnt) { msg =$nick $chr(160) $cc $+ Wallace $ct $+ - Estou certo de que voc� vai achar o estilo elegante de batalha do meu mentor muito interessante! }
          else {
            msg =$nick $chr(160) $cc $+ Wallace $ct $+ - $nick $+ , meus olhos n�o conseguem acreditar no que viram. Gra�as a sua ajuda, Sootopolis... n�o, toda Hoenn foi salva. Em nome da popula��o, eu o agrade�o. Este � um presente meu, por favor aceite.
            item.add $nick HM07 | msg =$nick $ct $+ Voc� ganhou o item $cc $+ HM07 $+ $ct $+ ! | msg =$nick $chr(160) $cc $+ Wallace $ct $+ - Este Hidden Machine cont�m Waterfall. Com a Rain Badge, um pok�mon que tiver aprendido esta t�cnica ser� capaz de subir cachoeiras. E onde pegar esta ins�gnea? Voc� sabe, certo? � isso ai, voc� tem que derrotar o l�der desta cidade! Ok, v� em frente, $nick $+ . Boa sorte!
          }
        }
      }
    }
    else { msg =$nick $ct $+ Nada foi encontrado. }
    return
  }
  elseif ($1 == Juan) {
    if ($findtok($dados($nick,$dados($nick,Info,Region),Badges),Rain Badge,0,58)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Juan $+ $ct $+ , l�der do gin�sio de Sootopolis.
      if ($start($nick)) {
        if ($rini(cadastros,$nick,Quests,Magma4)) { msg =$nick $chr(160) $cc $+ Juan $ct $+ - No final das contas, aqueles lun�ticos colocaram a cabe�a no lugar e devolveram as $cc $+ Orbs $ct $+ aos seus lugares. Acho que n�o teremos nenhum outro evento clim�tico por mais alguns s�culos! Hahaha... J� te disseram que sua roupa est� fora de moda? }
        else { msg =$nick $chr(160) $cc $+ Juan $ct $+ - Depois da confus�o, imagino que Maxie e Archie foram devolver as $cc $+ Orbs $ct $+ roubadas ao Mt Pyre. Voc� deve ter conhecido Wallace, saiba que tudo o que ele sabe sobre pok�mon deve-se aos meus ensinamentos! Hahaha... Que orgulho ser mentor de algu�m t�o talentoso! }
      }
      else { msg =$nick $chr(160) $cc $+ Juan $ct $+ - E pensar que esta cidade j� foi palco de uma batalha de pok�mon legend�rios... Aquele pok�mon aqu�tico, gostaria de t�-lo no meu time. Eu seria definitivamente o mais elegante de todos! }
      if (!$dados($nick,Quests,Tomb)) && ($dados($nick,Quests,League)) { msg =$nick $chr(160) $cc $+ Juan $ct $+ - " $+ $cc $+ Anci�o dos mares $+ $ct $+ "? Hm, sou especialista em pok�mon aqu�tico, mas n�o procuro os anci�es. Prefiro os pok�mon magn�ficamente iguais a mim! }
      return
    }
    else { msg =$nick $cc $+ Juan $ct $+ est� no gin�sio, aguardando seu desafio. | return }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
  return
}
alias c.search.Cave_Of_Origin {
  if ($1 == Wallace) {
    if ($rini(cadastros,$nick,Quests,Wallace)) { msg =$nick $ct $+ Nada foi encontrado. }
    elseif ($start($nick)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Wallace $+ $ct $+ .
      msg =$nick $chr(160) $cc $+ Wallace $ct $+ - Ent�o voc� � $nick $+ ? Eu ouvi hist�rias a seu respeito. Meu nome � Wallace. Eu ja fui l�der do gin�sio de Sootopolis, mas algo aconteceu. Eu passei o controle do gin�sio para meu mentor Juan.
      msg =$nick $chr(160) $cc $+ Wallace $ct $+ - Groudon e Kyogre, os dois pok�mon que est�o travando batalha neste momento, s�o considerados pok�mon lend�rios. Mas n�o h� apenas dois pok�mon lend�rios. Existe mais algum... Em algum lugar, existe um pok�mon lend�rio chamado Rayquaza. Lendas dizem que Rayquaza acalmou esses dois pok�mon num passado distante. Mas eu n�o fa�o id�ia de onde ele possa estar...
      msg =$nick $chr(160) $cc $+ Wallace $ct $+ - Ah, lembro que ouvi falar de um pok�mon verde ter sido visto nas proximidades de Pacifidlog, ele deve estar no $cc $+ Sky Pillar $+ $ct $+ ! N�o h� tempo a se perder, precisamos ir ao $cc $+ Sky Pillar $ct $+ agora mesmo!
      writeini pkp\cadastros\ $+ $nick $+ .ini Quests Wallace Ok
    }
    else { msg =$nick $ct $+ Nada foi encontrado. }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
  return
}
alias c.search.Pacifidlog_Town {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do centro pok�mon.
    if ($rini(cadastros,$nick,Quests,Weather)) { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Pacifidlog est� em risco! Se esta chuva n�o parar, logo a cidade afundar�! Parece que as nuvens v�m de Sootopolis, o que pode estar havendo l�?! }
    else {
      msg =$nick $chr(160) $cc $+ Joy $ct $+ - Bem vindo a Pacifidlog, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Como pode ver, esta cidade � muito isolada. Ela foi constru�da em cima de corais formados por v�rios $cc $+ Corsola $+ $ct $+ . � como uma b�ia gigante.
      if (!$dados($nick,Quests,Tomb)) && ($dados($nick,Quests,League)) { msg =$nick $chr(160) $cc $+ Joy $ct $+ - N�o conhe�o nada a respeito desta lenda local. Pra falar a verdade, n�o acredito nessas coisas... }
    } | return
  }
  elseif ($1 == Sarah) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Sarah $+ $ct $+ , uma treinadora pok�mon.
    if ($rini(cadastros,$nick,Quests,Weather)) { msg =$nick $chr(160) $cc $+ Sarah $ct $+ - Recebi uma mensagem de uma amiga em Sootopolis, ela me disse que h� pok�mon lend�rios batalhando l�. Se a mar� estivesse favor�vel eu iria at� l� dar uma olhada, mas com este temporal... | return }
    else {
      if ($findtok($dados($nick,$dados($nick,Info,Region),Badges),Rain Badge,0,58)) { msg =$nick $chr(160) $cc $+ Sarah $ct $+ - Esta Rain Badge diz muita coisa, n�o? E ent�o, est� pronto para ir para a Liga Pok�mon? Se estiver, ensine Waterfall para seu pok�mon e suba a cascata em Silver Bay. }
      elseif ($rini(cadastros,$nick,Quests,Sky2)) { msg =$nick $chr(160) $cc $+ Sarah $ct $+ - Voc� viu tamb�m?! Acabou de voar um pok�mon esverdeado enorme! Ele saiu do topo da Sky Pillar! Anh? Foi voc�?! Nossa, voc� � realmente muito talentoso. Conhe�o uma treinadora muito forte e talentosa, assim como voc�, mas n�o sei onde ela possa estar. Seu nome � $cc $+ Helen $ct $+ e ela adora mist�rio! Conhece algum lugar misterioso? Talvez ela possa estar l�! }
      else { msg =$nick $chr(160) $cc $+ Sarah $ct $+ - Sim, se voc� usar Surf para voltar a Slateport City, n�o poder� voltar para aqui usando Surf. � que h� uma mar� muito forte que empurra os treinadores em dire��o a Slateport. }
      if (!$dados($nick,Quests,Tomb)) && ($dados($nick,Quests,League)) { msg =$nick $chr(160) $cc $+ Sarah $ct $+ - N�o sei qual o pok�mon que a lenda se refere, mas acredito que seja um $cc $+ Wailmer $ct $+ o primeiro pok�mon. N�o sei se h� outro mais pesado que este. E o �ltimo eu realmente n�o sei, vai ser dif�cil encontrar um pok�mon t�o velho assim. }
    }
    return
  }
  elseif ($1 == Nicolas) && ($start($nick)) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Nicolas $+ $ct $+ , um expert em pok�mon.
    msg =$nick $chr(160) $cc $+ Nicolas $ct $+ - Ol�, $nick $+ ! Sou conhecido como 'Pok�mon Move Deleter'! Voc� gostaria de fazer seu pok�mon $cc $+ $rini(cadastros,$nick,Team,1) $ct $+ desaprender algum golpe?
    msg =$nick $ct $+ Digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar. | set %confirm. [ $+ [ $nick ] ] NCL: $+ $rini(cadastros,$nick,Team,1) | return
  }
  elseif ($1 == Tucker) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Tucker $+ $ct $+ , um velho habitante da cidade.
    if ($dados($nick,Quests,Tomb)) {
      msg =$nick $chr(160) $cc $+ Tucker $ct $+ - Agora entendo. Tratava-se de $cc $+ Wailord $ct $+ e $cc $+ Relicanth $+ $ct $+ ...
      if ($dados($nick,Quests,Regice)) && ($dados($nick,Quests,Regirock)) && ($dados($nick,Quests,Registeel)) {
        msg =$nick $chr(160) $cc $+ Tucker $ct $+ - Est� tudo muito claro para mim agora, gra�as a voc�. Obrigado.
        if (!$dados($nick,Quests,Tucker)) { item.add $nick Unknown Gene | msg =$Nick $chr(160) $cc $+ Tucker $ct $+ - N�o me pergunte onde eu consegui este $cc $+ Unknown Gene $+ $ct $+ ... Desconhe�o totalmente a sua funcionalidade. Pode levar, como agradecimento pelo esclarecimento. | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Tucker Ok }
      }
      else { msg =$nick $chr(160) $cc $+ Tucker $ct $+ - Certamente, a entrada est� aberta agora. Suas localiza��es est�o espalhadas por $cc $+ Hoenn $+ $ct $+ . Em cada uma delas, haver� uma entidade, ou n�o. }
    }
    else {
      msg =$nick $chr(160) $cc $+ Tucker $ct $+ - Moro aqui em $cc $+ $dados($nick,Info,Locate) $ct $+ h� muito tempo, e meus av�s tamb�m j� moraram. Havia, no entanto, uma lenda local que envolvia dois pok�mon...
      if ($dados($nick,Quests,League)) {
        msg =$nick $chr(160) $cc $+ Tucker $ct $+ - Primeiramente, o pok�mon que representa o " $+ $cc $+ gigante das �guas $+ $ct $+ ". Finalmente, o pok�mon conhecido como " $+ $cc $+ anci�o dos mares $+ $ct $+ ", certamente muito antigo ou at� extinto.
        msg =$nick $chr(160) $cc $+ Tucker $ct $+ - N�o conhe�o que entidade est� sendo protegida por esta porta, mas sei que ela est� nos c�us. Talvez ela se abra, em alguns segundos... � certamente uma lenda confusa, nunca consegui compreend�-la.
      }
      else { msg =$nick $chr(160) $cc $+ Tucker $ct $+ - Talvez poderemos ter uma maior conversa posteriormente. Concentre-se agora em derrotar a liga pok�mon. Boa sorte. }
    }
    return
  }
  elseif ($1 == Aaron) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Aaron $+ $ct $+ , um pescador.
    if ($item($nick,Good Rod).qnt) { msg =$nick $chr(160) $cc $+ Aaron $ct $+ - Adoro Pacifidlog, � perfeito para quem quer tranquilidade. Hmm, acho que algum pok�mon fisgou a minha isca! | return }
    else {
      if ($item($nick,Old Rod).qnt) {
        msg =$nick $chr(160) $cc $+ Aaron $ct $+ - Voc� ainda usa Old Rod? Nossa, eu prefiro a minha $cc $+ Good Rod $+ $ct $+ ! Com certeza tem uma performance melhor que a sua! Por que n�o come�a a usar uma agora?
        item.add $nick Good Rod | msg =$nick $ct $+ Voc� recebeu o item $cc $+ Good Rod $+ $ct $+ .
      }
      else { msg =$nick $chr(160) $cc $+ Aaron $ct $+ - N�o tem nenhuma esperi�ncia com peixes? Por que n�o fala com $cc $+ Edgar $+ $ct $+ , em $cc $+ Mauville $+ $ct $+ ? Todo pescador come�a usando as piores iscas! Acho que $cc $+ Edgar $ct $+ poder� ajud�-lo. }
    }
    return
  }
  else { msg =$nick $ct $+ Nada foi encontrado. | return }
}
alias c.search.Underwater { msg =$nick $ct $+ Nada foi encontrado. | return }
alias c.search.Evergrande_City {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do centro pok�mon.
    if ($rini(cadastros,$nick,Quests,League)) { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Sim, eu soube que voc� entrou para o Hall of Fame! Que bom! Mas e agora? O que vai fazer? N�o pense que seu trabalho como treinador est� acabado, porque definitivamente n�o est�. Boa sorte, $nick $+ ! | return }
    else { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Parab�ns! Estar aqui � um grande passo, $nick $+ ! Voc� poder� competir na liga pok�mon, sabia? Mas vou adiantando que n�o ser� f�cil! Os membros da Elite Four s�o muito experientes em batalhas, e t�m pok�mon raros! Ent�o, forme seu melhor time e boa sorte! | return }
  }
  elseif ($1 == Wally) && ($start($nick)) {
    if ($rini(cadastros,$nick,Quests,Wally)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Wally $+ $ct $+ .
      var %x = $rini(cadastros,$nick,Clock,Wally), %o = $rini(cadastros,$nick,Info,Online)
      if ($calc(%o - %x) >= 28800) {
        msg =$nick $chr(160) $cc $+ Wally $ct $+ - $nick $+ ! Quero testar minhas habilidades com voc� novamente! O que acha de uma batalha agora?
        msg =$nick $ct $+ Digite $cc $+ .sim $ct $+ para aceitar ou $cc $+ .nao $ct $+ para rejeitar. | set %confirm. [ $+ [ $nick ] ] CLK:Wally | return
      }
      else { msg =$nick $chr(160) $cc $+ Wally $ct $+ - Nossa, estou precisando treinar meus pok�mon. Vou pensar numa estrat�gia melhor para te derrotar, $nick $+ ! S� assim eu saberei se estou pronto ou n�o para a liga pok�mon! | return }
    }
    else { msg =$nick $ct $+ Nada foi encontrado. | return }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
}
alias c.search.Sky_Pillar { msg =$nick $ct $+ Nada foi encontrado. | return }
