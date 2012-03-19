alias c.search.Olivine_City {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    if ($start($nick)) { msg =$nick $cht(160) $cc $+ Joy $ct $+ - Bem vindo, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Exausto da longa viagem? N�o se incomode, pode se sentar e descansar. }
    else {
      if ($badge($nick,Mineral Badge)) { msg =$nick $cht(160) $cc $+ Joy $ct $+ - Parab�ns pela sua vit�ria contra $cc $+ Jasmine $+ $ct $+ . Sabia que ela cuida de v�rios pok�mon na $cc $+ Lighthouse $+ $ct $+ ? Ela � t�o doce... }
      else { msg =$nick $cht(160) $cc $+ Joy $ct $+ - Ol�, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Seja muito bem vindo. Sabe, voc� n�o � o �nico estrangeiro por aqui. Todos os dias, chegam v�rios treinadores de v�rios lugares do planeta em busca de novos desafios e claro, novos pok�mon. }
    }
  }
  elseif ($1 == Shane) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Shane $+ $ct $+ , uma treinadora pok�mon.
    if ($badge($nick,Mineral Badge)) { msg =$nick $chr(160) $cc $+ Shane $ct $+ - Bem, mas como qualquer pok�mon, cada tipo tem l� suas fraquezas, n�o � verdade? Parab�ns pela vit�ria, e boa sorte na liga de $cc $+ Johto $+ $ct $+ ! }
    else { msg =$nick $chr(160) $cc $+ Shane $ct $+ - Cuidado! A l�der desta cidade usa pok�mon met�lico! Isso significa que voc� n�o tem muitas possibilidades de efetividade... }
  }
  elseif ($1 == Franklin) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Franklin $+ $ct $+ , um treinador pok�mon.
    msg =$nick $chr(160) $cc $+ Franklin $ct $+ - Existe uma ilha localizada ao extremo sul, mas como o mar � muito agitado ela n�o pode ser alcan�ada. � muito perigoso para qualquer treinador avan�ar naqueles redemoinhos...
    msg =$nick $chr(160) $cc $+ Franklin $ct $+ - No entanto, existe uma rota segura que o levar� a $cc $+ Cianwood City $+ $ct $+ . Hahaha, cuidado em sua viagem!
  }
  elseif ($1 == Greg) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Greg $+ $ct $+ , um treinador pok�mon.
    msg =$nick $chr(160) $cc $+ Greg $ct $+ - Eu gosto de visitar a $cc $+ Lighthouse $+ $ct $+ , pois al�m de um ambiente incr�vel esta torre auxilia os navios a encontrarem um caminho seguro at� o porto. Afinal, nem todos os lugares do mar s�o realmente seguros!
  }
  elseif ($1 == Nelson) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Nelson $+ $ct $+ , um fazendeiro.
    if ($dados($nick,Quests,Milk) == Ok) {
      msg =$nick $chr(160) $cc $+ Nelson $ct $+ - Ol�, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Est� procurando por $cc $+ MooMoo Milk $+ $ct $+ ?
      var %x = $dados($nick,Clock,Milk), %o = $dados($nick,Info,Online) | if ($calc(%o - %x) < 10800) { msg =$nick $chr(160) $cc $+ Nelson $ct $+ - Sinto muito, minhas $cc $+ Miltanks $ct $+ ainda n�o produziram-no. Por que n�o volta aqui mais tarde? | return }
      if ($findtok(Monday,$day,0,58)) { var %price = 6000 } | else { var %price = 9000 }
      msg =$nick $chr(160) $cc $+ Nelson $ct $+ - Tudo bem, eu venderei uma garrafa por $cc $+ $chr(36) $+ $getmoney(%price) $+ $ct $+ . Deseja realmente comprar $cc $+ MooMoo Milk $+ $ct $+ ?
      msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar.
      set %confirm. [ $+ [ $nick ] ] MILK: $+ %price
    }
    elseif ($dados($nick,Quests,Milk) == No) {
      msg =$nick $chr(160) $cc $+ Nelson $ct $+ - Oh, ent�o � amigo de minha sobrinha $cc $+ Whitney $+ $ct $+ ? Parece que voc�s tiveram uma �tima batalha no gin�sio, que tal descansar um pouco? Seus pok�mon devem estar exaustos, ent�o bebam um pouco de $cc $+ MooMoo Milk $+ $ct $+ !
      msg =$nick $ct $+ Parab�ns, voc� ganhou o item $cc $+ MooMoo Milk $+ $ct $+ ! | item.add $nick MooMoo Milk | msg =$nick $chr(160) $cc $+ Nelson $ct $+ - Sabe, meus pok�mon produzem esse leite saboroso e os pok�mon adoram! Deixam-nos mais feliz e cheios de energia, porque essa bebida � rica em prote�nas. Essa � apenas uma amostra gr�tis, se quiser mais, volte aqui e eu venderei uma quando puder.
      writeini pkp\cadastros\ $+ $nick $+ .ini Quests Milk Ok | writeini pkp\cadastros\ $+ $nick $+ .ini Clock Milk $dados($nick,Info,Online)
    }
    else { msg =$nick $chr(160) $cc $+ Nelson $ct $+ - Hey, o que voc� pensa que est� fazendo na minha fazenda? N�o � assim n�o, entrando sem ser convidado... Acabar� assustando minhas preciosas $cc $+ Miltanks $+ $ct $+ ! }
  }
  elseif ($1 == Luna) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Luna $+ $ct $+ , uma maruja.
    if ($dados($nick,$dados($nick,Info,Start),Badges).n == 8) {
      var %x = $dados($nick,Clock,Ship), %y = 0
      if (%x) { if ($calc($dados($nick,Info,Online) - %x) >= 21600) { var %y = 1 } } | else { var %y = 1 }
      if (%y) {
        if ($item($nick,Gold Ticket).qnt) && ($item($nick,Silver Ticket).qnt) {
          msg =$nick $chr(160) $cc $+ Luna $ct $+ - Oh, este � o $cc $+ Silver Ticket $ct $+ e o $cc $+ Gold Ticket $+ $ct $+ . Deseja embarcar no $cc $+ SS Anne $ct $+ ( $+ $cc $+ $travel.ship($nick,SS Anne) $+ $ct $+ ) ou no $cc $+ SS Tidal $ct $+ ( $+ $cc $+ $travel.ship($nick,SS Tidal) $+ $ct $+ ) $+ ?
          msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim <barco> $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar. | set %confirm. [ $+ [ $nick ] ] SHP:SS Anne;SS Tidal
        }
        elseif ($item($nick,Gold Ticket).qnt) {
          msg =$nick $chr(160) $cc $+ Luna $ct $+ - Oh, este � o $cc $+ Gold Ticket $+ $ct $+ . Deseja embarcar no $cc $+ SS Tidal $+ $ct $+ ?
          msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar. | set %confirm. [ $+ [ $nick ] ] SHP:SS Tidal
        }
        elseif ($item($nick,Silver Ticket).qnt) {
          msg =$nick $chr(160) $cc $+ Luna $ct $+ - Oh, este � o $cc $+ Silver Ticket $+ $ct $+ . Deseja embarcar no $cc $+ SS Anne $+ $ct $+ ?
          msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar. | set %confirm. [ $+ [ $nick ] ] SHP:SS Anne
        }
        else { msg =$nick $chr(160) $cc $+ Luna $ct $+ - Voc� n�o pode embarcar se n�o tiver uma passagem de navio. }
      }
      else { msg =$nick $chr(160) $cc $+ Luna $ct $+ - N�o h� barcos nesse momento. Voc� deve aguardar seis horas $cc $+ online $ct $+ para tentar novamente. Neste momento, faltam aproximadamente $dur($calc(21600 - ($dados($nick,Info,Online) - %x)),$ct,$cc) $+ . }
      return
    }
    else { msg =$nick $chr(160) $cc $+ Luna $ct $+ - Ah, que pena. Infelizmente n�o h� nenhum barco neste momento. | return }
  }
  elseif ($1 == Jasmine) {
    if ($badge($nick,Mineral Badge)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Jasmine $+ $ct $+ , l�der do gin�sio de $cc $+ $dados($nick,Info,Locate) $+ $ct $+ .
      msg =$nick $chr(160) $cc $+ Jasmine $ct $+ - Oh, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , que bom rev�-lo! Posso ajud�-lo? Veja, meu pok�mon est� radiante! Deixe-me analisar como est� o seu pok�mon...
      var %p = $dados($nick,Team,1), %x = 0, %r = 0, %m = 0
      while (%x < 6) { inc %x | var %iv = $dados($nick,%p,IV $+ $nstat(%x)), %r = $calc(%r + %iv) | if (%iv > %m) { var %m = %iv, %biv = $nstat(%x) } | elseif (%iv == %m) { if (%biv) { var %biv = %biv $nstat(%x) } | else { var %biv = $nstat(%x) } } }
      if (%r isnum 0-60) { var %gstate = habilidades medianas }
      elseif (%r isnum 61-114) { var %gstate = habilidades melhores que a m�dia }
      elseif (%r isnum 115-174) { var %gstate = habilidades impressionantes }
      else { var %gstate = habilidades maravilhosamente formid�veis }
      if (%m isnum 0-11) { var %state = Este atributo � relativamente bom... } | elseif (%m isnum 12-21) { var %state = Este atributo est� interessante. } | elseif (%m isnum 22-30) { var %state = Este atributo est� incr�vel! } | else { var %state = � infal�vel! � digno de perfei��o! }
      if ($gettok(%biv,0,32) > 1) { var %biv = $gettok(%biv,$rand(1,$gettok(%biv,0,32)),32) }
      msg =$nick $chr(160) $cc $+ Jasmine $ct $+ - $cc $+ %p $+ $ct $+ , em geral, eu poderia dizer que tem %gstate $+ . Seu melhor atributo �, sem d�vida, $cc $+ $upper(%biv) $+ $ct $+ . %state
    }
    else {
      if ($dados($nick,Quests,Jasmine)) {
        if ($dados($nick,Quests,Jasmine) == Ok) { msg =$nick $cc $+ Jasmine $ct $+ est� no gin�sio, aguardando seu desafio. }
        else {
          msg =$nick $ct $+ Voc� encontra-se com $cc $+ Jasmine $+ $ct $+ .
          if ($dados($nick,Info,Start) == Hoenn) {
            if ($item($nick,MooMoo Milk).qnt) { msg =$nick $chr(160) $cc $+ Jasmine $ct $+ - Oh, ent�o $cc $+ MooMoo Milk $ct $+ alegra os pok�mon? Poderia me dar um desses, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ? Por favor... | msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para aceitar ou ' $+ $cc $+ .nao $+ $ct $+ ' para recusar. | set %confirm. [ $+ [ $nick ] ] JSM:1 }
            else { msg =$nick $chr(160) $cc $+ Jasmine $ct $+ - Quando descobrir algo, por favor, me procure... Meu pok�mon precisa realmente se animar... }
          }
          else {
            if ($item($nick,Rare Potion)) { msg =$nick $chr(160) $cc $+ Jasmine $ct $+ - Ent�o, $cc $+ Rare Potion $ct $+ � capaz de curar a doen�a do meu pok�mon? Ser� que voc� poderia me dar um desses? Por favor... | msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para aceitar ou ' $+ $cc $+ .nao $+ $ct $+ ' para recusar. | set %confirm. [ $+ [ $nick ] ] JSM:2 }
            else { msg =$nick $chr(160) $cc $+ Jasmine $ct $+ - Ouvi dizer que o pesquisador mora em $cc $+ Cianwood City $+ $ct $+ ... Ser� que ele tem algum rem�dio para o meu pok�mon? }
          }
        }
      }
      else {
        msg =$nick $ct $+ Voc� encontra-se com $cc $+ Jasmine $+ $ct $+ .
        if ($dados($nick,Info,Start) == Hoenn) { msg =$nick $chr(160) $cc $+ Jasmine $ct $+ - Uma batalha de gin�sio? Eu adoraria, mas meu pok�mon est� muito mal humorado hoje... Sabe, depois que ele se recuperou da doen�a, n�o parece mais o mesmo. Ser� que existe algum rem�dio ou alguma bebida que deixe meu pok�mon mais alegre? }
        else {
          msg =$nick $chr(160) $cc $+ Jasmine $ct $+ - Ah, voc� falou em uma batalha no gin�sio? Sinto muito, mas neste momento eu realmente n�o posso pensar nisso. Meu am�vel pok�mon est� muito doente, n�o sei o que ser� de mim se algo acontecer a ele...
          msg =$nick $chr(160) $cc $+ Jasmine $ct $+ - Ent�o, voc� acha que pode ajud�-lo? Nossa, eu ficaria muito feliz se voc� encontrasse um famoso pesquisador que desenvolve rem�dios a partir de subst�ncias produzidas por pok�mon! � fant�stico, ouvi falar que ele reside em $cc $+ Cianwood City $+ $ct $+ .
        }
        writeini pkp\cadastros\ $+ $nick $+ .ini Quests Jasmine No
      }
    }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
}
alias c.search.Cianwood_City {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    if ($badge($nick,Storm Badge)) { msg =$nick $cht(160) $cc $+ Joy $ct $+ - Parab�ns pela sua vit�ria, � mais um passo em dire��o ao hall da fama! Divirta-se em suas viagens e cuidado com as mar�s agitadas! }
    else { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Ol�, visitante! Como vai a sua jornada aqui em $cc $+ Johto $+ $ct $+ ? Nesta cidade voc� poder� desafiar o l�der $cc $+ Chuck $+ $ct $+ . Sua especialidade � pok�mon lutador! Muito cuidado, eles s�o muito bem treinados! }
  }
  elseif ($1 == Luis) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Luis $+ $ct $+ , um esportista.
    msg =$nick $chr(160) $cc $+ Luis $ct $+ - Uma dica! Fique longe das �guas agitadas da costa! Sabe, existem v�rios redemoinhos nas proximidades, � por isso que � mais seguro ficar longe. E mesmo se tentar atravessar, sugiro que passe por baixo da �gua, usando $cc $+ Dive $+ $ct $+ .
  }
  elseif ($1 == Diana) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Diana $+ $ct $+ , uma criadora de pok�mon.
    msg =$nick $cht(160) $cc $+ Diana $ct $+ - Eu nunca me dediquei a conquistar ins�gneas com meus pok�mon. Prefiro cuidar muito bem da sa�de deles e dar muito amor, assim eles ficam mais felizes e me deixam feliz tamb�m. Sabe, $cc $+ MooMoo Milk $ct $+ � uma bebida muito boa, os pok�mon adoram! Eles se sentem mais animados ap�s beber um pouco.
  }
  elseif ($1 == Hugo) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Hugo $+ $ct $+ , um pesquisador pok�mon.
    if ($dados($nick,Info,Start) == Hoenn) { msg =$nick $chr(160) $cc $+ Hugo $ct $+ - Meus �ltimos trabalhos me levaram a resultados magn�ficos! Desenvolvi rem�dio basicamente milagroso para pok�mon. Mas n�o se preocupe, os pok�mon n�o ficam doentes constantemente. Os seus parecem estar �timos! }
    else {
      if ($dados($nick,Quests,Jasmine)) {
        if ($dados($nick,Quests,Jasmine) == Ok) {
          if ($dados($nick,Quests,Hugo)) { msg =$nick $chr(160) $cc $+ Hugo $ct $+ - O segredo das minhas po��es � colocar uma mistura de ferom�nios dentro da casca de um $cc $+ Shuckle $ct $+ por meses! O resultado disso � uma mistura saborosa e revigorante! }
          else {
            msg =$nick $chr(160) $cc $+ Hugo $ct $+ - Ent�o minha $cc $+ Rare Potion $ct $+ realmente funciona?! � incr�vel, fico muito grato em saber disso! N�o se incomode por eu t�-lo usado apenas como cobaia, como recompensa pode ficar com este pok�mon.
            if ($dados($nick,Team,6)) { msg =$nick $chr(160) $cc $+ Hugo $ct $+ - Mas voc� n�o tem espa�o no time neste momento. Tudo bem, volte aqui quando puder! | return }
            if ($dados($nick,Shuckle,Name)) { msg =$nick $chr(160) $cc $+ Hugo $ct $+ - Hm, voc� j� tem o pok�mon que eu vou dar, ent�o n�o tem gra�a! Se quiser receb�-lo, tire $cc $+ Shuckle $ct $+ do seu time! | return }
            addpoke $nick Shuckle 20 20: $+ $dados($nick,Info,Locate) $+ :Poke  Ball | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Hugo Ok
            msg =$nick $ct $+ Parab�ns, voc� recebeu o pok�mon $cc $+ Shuckle $+ $ct $+ !
          }
        }
        else {
          if ($item($nick,Rare Potion).qnt) { msg =$nick $chr(160) $cc $+ Hugo $ct $+ - Sua amiga deve estar realmente precisando desta $cc $+ Rare Potion $+ $ct $+ . N�o se preocupe, eu tenho o bastante aqui! Pode ficar. }
          else { msg =$nick $chr(160) $cc $+ Hugo $ct $+ - O que? Um pok�mon doente? Que coincid�ncia, meu rem�dio provavelmente poder� ajud�-lo! $cc $+ Jasmine $ct $+ ficar� muito contente com esta $cc $+ Rare Potion $+ $ct $+ . | msg =$nick $ct $+ Parab�ns, voc� recebeu o item $cc $+ Rare Potion $+ $ct $+ . | item.add $nick Rare Potion }
        }
      }
      else { msg =$nick $chr(160) $cc $+ Hugo $ct $+ - Finalmente conclui meu rem�dio! � muito poderoso! Esta $cc $+ Rare Potion $ct $+ cura v�rias doen�as de pok�mon. }
    }
  }
  elseif ($1 == Morgan) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Morgan $+ $ct $+ , um pescador.
    if ($start($nick)) {
      if (!$item($nick,Good Rod).qnt) { msg =$nick $chr(160) $cc $+ Morgan $ct $+ - Eu n�o posso ajud�-lo ainda... Voc� precisa adquirir mais pr�tica em pescaria de pok�mon! | return }
      if ($item($nick,Super Rod).qnt) { msg =$nick $chr(160) $cc $+ Morgan $ct $+ - Agora sim! Considere-se finalmente um pescador profissional! Divirta-se pescando pok�mon! }
      else { msg =$nick $chr(160) $cc $+ Morgan $ct $+ - Depois de praticar bastante com sua $cc $+ Good Rod $+ $ct $+ , vejo que finalmente est� pronto para receber a melhor vara de pescar existente! Parab�ns, fique com esta $cc $+ Super Rod $+ $ct $+ . | item.add $nick Super Rod | msg =$nick $chr(160) $cc $+ Morgan $ct $+ - Se us�-la, a isca poder� chegar at� as profundezas das �guas, onde vivem pok�mon raros... }
    }
    else { msg =$nick $chr(160) $cc $+ Morgan $ct $+ - Imagino que voc� tenha encontrado muitos pok�mon diferentes em $cc $+ $dados($nick,Info,Region) $+ $ct $+ ... }
  }
  elseif ($1 == Chuck) {
    if ($badge($nick,Storm Badge)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Chuck $+ $ct $+ , l�der do gin�sio de $cc $+ $dados($nick,Info,Locate) $+ $ct $+ .
      if ($start($nick)) {
        if ($item($nick,HM04).qnt) { msg =$nick $chr(160) $cc $+ Chuck $ct $+ - Seus pok�mon precisam de mais for�a! Por que n�o os ensina a t�cnica $cc $+ Strength $+ $ct $+ ? | item.add $nick HM04 | msg =$nick $ct $+ Parab�ns, voc� ganhou o $cc $+ HM04 $+ $ct $+ ! | msg =$nick $chr(160) $cc $+ Chuck $ct $+ - Com este HM seu pok�mon poder� mover pedras pesadas que fixam em seu caminho! � for�a pura! }
        else { msg =$nick $chr(160) $cc $+ Chuck $ct $+ - Mantenha seus punhos firmes para defender-se de seus oponentes caso seja necess�rio. Antigamente pok�mon e treinadores lutavam juntos, por isso mantenho a tradi��o! }
      }
      else { msg =$nick $chr(160) $cc $+ Chuck $ct $+ - Hahaha, eu n�o podia esperar por isto! Sua batalha foi muito intensa, n�o duvido que conseguir�s chegar ainda mais longe! }
    }
    else { msg =$nick $cc $+ Chuck $ct $+ est� no gin�sio, aguardando seu desafio. }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
}
alias c.search.Ecruteak_City {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Bem vindo, treinador! $cc $+ $dados($nick,Info,Locate) $ct $+ � uma cidade marcada por muitas lentas. Por exemplo, h� uma torre que h� s�culos atr�s foi queimada, liberando um pok�mon lend�rio. Na tentativa de traz�-lo de volta, foi constru�da outra torre, mas o pok�mon n�o voltou... Ser� que ainda restam esperan�as?
  }
  elseif ($1 == Nancy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Nancy $+ $ct $+ , uma dan�arina.
    if ($dados($nick,Quests,Pail)) { remini pkp\cadastros\ $+ $Nick $+ .ini Quests Pail | item.add $nick Wailmer Pail | msg =$nick $chr(160) $cc $+ Nancy $ct $+ - Ei, voc� teve problemas com um arbusto estranho? Ah, deve ser um pok�mon! Fique com este $cc $+ Wailmer Pail $ct $+ e use naquele arbusto. Tenho certeza que ele sair� de seu caminho. | return }
    msg =$nick $chr(160) $cc $+ Nancy $ct $+ - Esta cidade possui muitas tradi��es e mant�m ainda sua arquitetura de s�culos atr�s.
    if (!$dados($nick,Quests,Dancing)) {
      var %x = $dados($nick,Clock,Dancing) | if (%x) { var %r = $calc($dados($nick,Info,Online) - %x) | if (%r < 14400) { msg =$nick $chr(160) $cc $+ Nancy $ct $+ - Por que n�o nos visita mais tarde? Precisamos de mais tempo para nos arrumar! Hahaha, vamos ter outra batalha emocionante! | return } }
      msg =$nick $chr(160) $cc $+ Nancy $ct $+ - Nosso espet�culo tamb�m � bastante apreciado, gostaria de experimentar?
      msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para aceitar o desafio ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeit�-lo. | set %confirm. [ $+ [ $nick ] ] DNC
    }
  }
  elseif ($1 == Stan) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Stan $+ $ct $+ , um religioso.
    if ($dados($nick,Quests,Rocket6) == 2) { msg =$nick $chr(160) $cc $+ Stan $ct $+ - N�o � poss�vel! A equipe $cc $+ Rocket $ct $+ se apoderou da pena do poderoso $cc $+ Ho-oh $+ $ct $+ ! Segundo a lenda, o treinador que carreg�-la consigo atrair� o pok�mon legend�rio para o seu caminho. Se eles conseguirem captur�-lo, ter�o todo o poder necess�rio para devastar o mundo inteiro! }
    elseif ($dados($nick,Quests,Rocket6) == 4) { msg =$nick $chr(160) $cc $+ Stan $ct $+ - Felizmente a amea�a da equipe $cc $+ Rocket $ct $+ se foi. Espero que a $cc $+ Rainbow Feather $ct $+ esteja sendo mantida agora por um treinador respons�vel e pac�fico, ou que jamais seja reencontrada, pelo bem da humanidade... }
    else {
      if ($start($nick)) { msg =$nick $chr(160) $cc $+ Stan $ct $+ - Nossas preces n�o foram suficientes para que pok�mon sagrado retornasse � nova torre... S� nos resta agora a lembran�a de dias felizes e de muita paz. }
      else { msg =$nick $chr(160) $cc $+ Stan $ct $+ - � verdade, a nova torre foi criada na espectativa de que o pok�mon sagrado voltasse, mas n�o o agradou pelo visto... Ele ficar� apenas na mem�ria dos moradores mais antigos da cidade... }
    }
  }
  elseif ($findtok(rocket:equipe:equipe rocket:team rocket:thief:thiefs:ladr�o:ladr�es,$1-,0,58)) && ($dados($nick,Quests,Rocket6) == 2) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Bunch $+ $ct $+ , chefe da atual equipe $cc $+ Rocket $+ $ct $+ .
    msg =$nick $chr(160) Bunch $ct $+ - N�o entendo, o que voc� est� procurando aqui? Esta $cc $+ Rainbow Feather $ct $+ � nossa! Com ela, poderemos finalmente despertar o t�o estimado $cc $+ Ho-oh $ct $+ e com ele dominaremos todo o mundo!
    msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para batalhar contra os membros da equipe ou ' $+ $cc $+ .nao $+ $ct $+ ' para fugir.
    set %confirm. [ $+ [ $nick ] ] RKT:8
  }
  elseif ($1 == Molly) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Molly $+ $ct $+ , uma habitante da cidade.
    msg =$nick $chr(160) $cc $+ Molly $ct $+ - Antigamente, bem depois do sumi�o dos pok�mon sagrados, tudo o que restara foram apenas uma recorda��o dos pok�mon: $cc $+ Rainbow Feather $ct $+ e $cc $+ Silver Feather $+ $ct $+ . Ningu�m mais ouviu falar sobre estes artefatos, nem o que aconteceu ou se ainda existem. Diziam tamb�m que funcionavam como verdadeiros amuletos.
  }
  elseif ($1 == Morty) {
    if ($badge($nick,Fog Badge)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Morty $+ $ct $+ , l�der do gin�sio de $cc $+ $dados($nick,Info,Locate) $+ $ct $+ .
      if ($start($nick)) { msg =$nick $chr(160) $cc $+ Morty $ct $+ - � verdade, esta cidade tem muitas hist�rias e poucas delas s�o verdadeiras. Esperamos que um dia o pok�mon volte � nova torre... }
      else {
        if ($dados($nick,Johto,League)) {
          if ($dados($nick,Quests,BTower)) { msg =$nick $chr(160) $cc $+ Morty $ct $+ - � incr�vel poder conhecer os pok�mon que at� ent�o eram apenas lendas... � revigorante para qualquer treinador! }
          else {
            msg =$nick $chr(160) $cc $+ Morty $ct $+ - Parab�ns pela sua vit�ria na liga de $cc $+ Johto $+ $ct $+ ! Enquanto voc� esteve batalhando, eu estive aqui pesquisando a respeito da $cc $+ Burned Tower $+ $ct $+ . N�o tenho certeza, mas acho que descobri algo.
            msg =$nick $cc $+ Morty $ct $+ aperta algo e um leve terremoto acontece. Voc�s caem no andar de baixo e encontram $cc $+ tr�s $ct $+ pok�mon.
            msg =$nick $chr(160) $cc $+ Morty $ct $+ - Funcionou! Olhe, s�o eles! $cc $+ Raikou $+ $ct $+ , $cc $+ Entei $ct $+ e $cc $+ Suicune $+ $ct $+ ! Ah n�o, eles fugiram! Que azar... Bem, pelo menos j� descobri a rela��o deles com esta torre. Espero poder encontr�-los outra vez.
            writeini pkp\cadastros\ $+ $nick $+ .ini Quests BTower Ok
          }
        }
        else { msg =$nick $chr(160) $cc $+ Morty $ct $+ - Nossa batalha foi muito empolgante, n�o esperava um desempenho t�o impressionante. No entanto, enquanto batalh�vamos, estava com a cabe�a em outro lugar, pensando nas lendas sobre as torres... }
      }
    }
    else {
      if ($start($nick)) {
        if ($dados($nick,Quests,BTower)) { msg =$nick $cc $+ Morty $ct $+ est� no gin�sio, aguardando seu desafio. }
        else {
          msg =$nick $ct $+ Voc� encontra-se com $cc $+ Morty $+ $ct $+ .
          msg =$nick $chr(160) $cc $+ Morty $ct $+ - Estou procurando alguma passagem secreta aqui na $cc $+ Burned Tower $+ $ct $+ . Meus sentidos apontam para este lugar, mas n�o entendo...
          msg =$nick $ct $+ De repente, acontece um leve terremoto e voc�s caem no andar de baixo e encontram $cc $+ tr�s $ct $+ pok�mon.
          msg =$nick $chr(160) $cc $+ Morty $ct $+ - Olhe, s�o eles! $cc $+ Raikou $+ $ct $+ , $cc $+ Entei $ct $+ e $cc $+ Suicune $+ $ct $+ ! Ah n�o, eles fugiram! Nossa, mas foi muito r�pido! Bem, voc� �... $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Voltarei ao gin�sio agora, para batalharmos se assim quiser, afinal voc� me ajudou a encontrar aqueles lend�rios. Estarei esperando!
          writeini pkp\cadastros\ $+ $nick $+ .ini Quests BTower Ok
        }
      }
      else { msg =$nick $cc $+ Morty $ct $+ est� no gin�sio, aguardando seu desafio. }
    }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
}
alias c.search.Goldenrod_City {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    if ($start($nick)) { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Bem vindo, treinador! Descanse, pois se pretende batalhar com a l�der local, seus pok�mon v�o precisar de muita energia! $cc $+ Whitney $ct $+ ser� um forte oponente, ent�o esteja preparado. }
    else { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Bem vindo, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ . $cc $+ $dados($nick,Info,Locate) $ct $+ � conhecida como a grande metr�pole de $cc $+ Johto $+ $ct $+ . Neste clima de muita agita��o, as pessoas podem ser um pouco mais estressadas, mas n�o se incomode. }
  }
  elseif ($1 == Rayna) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Rayna $+ $ct $+ , uma treinadora.
    if ($start($nick)) { msg =$nick $chr(160) $cc $+ Rayna $ct $+ - Acabei de chegar em $cc $+ $dados($nick,Info,Locate) $ct $+ e j� percebi que � bem diferente das outras cidades que eu j� havia visitado. Pelo contr�rio, a agita��o daqui � tanta que me deixa um pouco angustiada... Falaram-me muitas coisas sobre a l�der local. Dizem at� que sua $cc $+ Miltank $ct $+ � invenc�vel! Acredita? }
    else { msg =$nick $chr(160) $cc $+ Rayna $ct $+ - Ah, voc� j� visitou o $cc $+ DayCare Center $+ $ct $+ ? � o �nico de $cc $+ Johto $ct $+ e voc� pode efetuar cruzamentos usando seus pok�mon. Pe�a mais informa��es quando for visitar o centro de cria��o. }
  }
  elseif ($1 == Dawson) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Dawson $+ $ct $+ , um habitante da cidade.
    msg =$nick $chr(160) $cc $+ Dawson $ct $+ - Certa vez eu acabei me perdendo na cidade, para voc� ver como nem mesmo os habitantes conhecem-na bem. Fique atento para n�o acabar perdido, assim como eu fiquei...
  }
  elseif ($1 == Warren) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Warren $+ $ct $+ , um cabelereiro.
    var %x = $dados($nick,Clock,Haircut) | if (%x) { if ($calc($dados($nick,Info,Online) - %x) < 18000) { msg =$nick $chr(160) $cc $+ Warren $ct $+ - Que tal voc� voltar outra hora? Estou cheio de clientes neste momento. | return } }
    var %pk = $dados($nick,Team,1)
    if ($dados($nick,%pk,Level) == 100) { msg =$nick $chr(160) $cc $+ Warren $ct $+ - N�o adianta eu trabalhar com seu pok�mon $cc $+ %pk $+ $ct $+ , ele n�o poder� mais se animar com meus maravilhosos cortes de cabelo. | return }
    if ($gettok($dados($nick,%pk,Loyalty),1,58) == 255) { msg =$nick $chr(160) $cc $+ Warren $ct $+ - Hm, o visual do seu pok�mon $cc $+ %pk $ct $+ j� est� bem interessante! Que tal outro pok�mon? | return }
    var %price = 7000 | if ($findtok(Saturday:Wednesday,$day,0,58)) { var %price = $int($calc(%price * 0.5)) }
    msg =$nick $chr(160) $cc $+ Warren $ct $+ - Oh, deseja mudar o visual de seu pok�mon $cc $+ %pk $+ $ct $+ ? Cobrarei apenas $cc $+ $chr(36) $+ $getmoney(%price) $+ $ct $+ ! Hahaha, ele ficar� magn�fico!
    msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para aceitar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar.
    set %confirm. [ $+ [ $nick ] ] CUT $+ : $+ %price
  }
  elseif ($1 == Kaomi) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Kaomi $+ $ct $+ , uma criadora de pok�mon.
    if ($earl.count($nick) == 17) { msg =$nick $chr(160) $cc $+ Kaomi $ct $+ - A melhor maneira de desenvolver o relacionamento com seu pok�mon � trabalhando em equipe com o mesmo. Lembre-se tamb�m de evitar a fadiga! Pok�mon ficam intediados se vencerem sempre o mesmo advers�rio. }
    else { msg =$nick $chr(160) $cc $+ Kaomi $ct $+ - Adorei o trabalho de $cc $+ Warren $ct $+ na minha $cc $+ Clefairy $+ $ct $+ ! J� n�o posso dizer o mesmo de $cc $+ Snubbull $+ $ct $+ ... Bem, todos erram as vezes, ent�o tudo bem, n�o fiquei chateada. }
  }
  elseif ($1 == Nicole) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Nicole $+ $ct $+ , uma criadora de pok�mon.
    msg =$nick $chr(160) $cc $+ Nicole $ct $+ - Bem vindo ao centro de cria��o, ou $cc $+ Daycare Center $+ $ct $+ . Neste lugar voc� poder� efetuar o cruzamento de seus pok�mon e ganhar $cc $+ Eggs $+ $ct $+ , ou ovos de pok�mon. Digite ' $+ $cc $+ .Daycare $+ $ct $+ ' para mais informa��es de como fazer um cruzamento.
  }
  elseif ($1 == Mymo) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Mymo $+ $ct $+ , um treinador pok�mon.
    msg =$nick $chr(160) $cc $+ Mymo $ct $+ - Obtive um dia desses um beb� de $cc $+ Mr.mime $ct $+ com o golpe Mimic! Foi uma surpresa, n�o sabia que ele podia aprender isso, muito menos por cruzamentos! Hahaha, j� tenho uma �tima estrat�gia!
    if ($earl.count($nick) == 17) { msg =$nick $chr(160) $cc $+ Mymo $ct $+ - � verdade que existe um pok�mon pr�-evoluido do $cc $+ Mr.mime $+ $ct $+ ?! Definitivamente ser� meu! }
  }
  elseif ($1 == Hector) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Hector $+ $ct $+ , um treinador pok�mon.
    if ($start($nick)) {
      if (!$item($nick,Coin Case).qnt) {
        msg =$nick $chr(160) $cc $+ Hector $ct $+ - Droga! Fiquei sem moedas! Quer saber de uma coisa? Pode ficar com esta droga de $cc $+ Coin Case $+ $ct $+ !
        msg =$nick $ct $+ Parab�ns, voc� recebeu o item $cc $+ Coin Case $+ $ct $+ !
        item.add $nick Coin Case
      }
      else { msg =$nick $chr(160) $cc $+ Hector $ct $+ - N�o tem quem me fa�a jogar de novo nesses jogos de azar! N�o vou perder mais meu tempo... }
    }
    else { msg =$nick $chr(160) $cc $+ Hector $ct $+ - Passei aqui s� por curiosidade e acabei me viciando totalmente! Estou at� pensando em desistir da liga de $cc $+ Johto $+ $ct $+ ... Ouvi dizer que � o maior desafio existente em todo o mundo! }
  }
  elseif ($1 == Foster) {
    if ($dados($nick,Quests,Foster)) {
      msg =$nick $chr(160) $cc $+ Foster $ct $+ - Bem, acho que n�o vou mais jogar hoje. Felizmente eu sei a hora de parar, mas tem gente aqui simplesmente viciada!
    }
    else {
      msg =$nick $chr(160) $cc $+ Foster $ct $+ - Yahoo! Acho que estou com sorte! Estou cheio de moedas hoje, t� dificil carreg�-las...
      if ($item($nick,Coin Case).qnt) {
        var %c = $dados($nick,Info,Coin), %r = $calc(%c + 50) | if (%r > 9999) { var %r = 9999 } | writeini pkp\cadastros\ $+ $nick $+ .ini Info Coin %r
        msg =$nick $chr(160) $cc $+ Foster $ct $+ - Tome estas moedas! Espero que voc� tamb�m tenha sorte! | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Foster Ok
      }
      else { msg =$nick $chr(160) $cc $+ Foster $ct $+ - Hm, quando conseguir um $cc $+ Coin Case $ct $+ eu vou dar-te algumas moedas, ok? }
    }
  }
  elseif ($1 == Kenny) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Kenny $+ $ct $+ , o balconista do cassino.
    if ($item($nick,Coin Case).qnt) {
      msg =$nick $chr(160) $cc $+ Kenny $ct $+ - Ol�, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Cada moeda custa $cc $+ $chr(36) $+ $getmoney($readini(pkp\status.ini,Active,Coin)) $+ $ct $+ . Voc� deseja trocar seu dinheiro por moedas?
      msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar. | set %confirm. [ $+ [ $nick ] ] COIN:Kenny:1
    }
    else { msg =$nick $chr(160) $cc $+ Kenny $ct $+ - N�o posso ajud�-lo... Voc� n�o pode comprar moedas se n�o tiver um $cc $+ Coin Case $+ $ct $+ ... }
  }
  elseif ($1 == Lisa) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Lisa $+ $ct $+ , a dona da floricultura.
    if ($item($nick,Wailmer Pail).qnt) { msg =$nick $chr(160) $cc $+ Lisa $ct $+ - Nem tudo � o que parece. Por exemplo, o pok�mon $cc $+ Sudowoodo $ct $+ parece ser uma �rvore, mas na verdade � um pok�mon que odeia �gua... A natureza � realmente perfeita. }
    else {
      if ($dados($nick,Quests,Pail)) {
        if ($badge($nick,Plain Badge)) { remini pkp\cadastros\ $+ $Nick $+ .ini Quests Pail | item.add $nick Wailmer Pail | msg =$nick $chr(160) $cc $+ Nancy $ct $+ - Ei, voc� teve problemas com um arbusto estranho? Ah, fique com este $cc $+ Wailmer Pail $ct $+ e use nele. Tenho certeza que voc� ter� uma surpresa incr�vel. }
        else { .msg =$nick $chr(160) $cc $+ Lisa $ct $+ - Est� com problemas com uma �rvore no caminho? Hm, n�o me lembro de nenhuma... Eu darei uma olhada. Enquanto isso, por que n�o batalha com a l�der da cidade? }
      }
      else { .msg =$nick $chr(160) $cc $+ Lisa $ct $+ - Cuidar das plantas � uma atividade muito relaxante, principalmente nesta cidade, onde tudo � t�o movimentado e cheio de stress. Precisamos fazer algo pela natureza, sabia? Fa�a em sua casa tamb�m, plante uma semente para que uma nova �rvore tranquilize a vida de seus netos. }
    }
  }
  elseif ($1 == Grace) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Grace $+ $ct $+ , a radialista da $cc $+ Radio Tower $+ $ct $+ .
    if ($dados($nick,Quests,Rocket5) == No) { msg =$nick $chr(160) $cc $+ Grace $ct $+ - Ahh... O que estes trapaceiros querem aqui na torre de r�dio?! N�o se pode mais trabalhar em paz nesta cidade! }
    else {
      if ($dados($nick,Quests,Rocket5) == Ok) && (!$item($nick,Radio).qnt) { msg =$nick $chr(160) $cc $+ Grace $ct $+ - Muito obrigada por tudo, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ . N�o sei o que poderia acontecer se aqueles trapaceiros continuassem com o plano deles. Ei, voc� j� sintonizou a r�dio de Goldenrod City? Ent�o fique com este $cc $+ Radio $+ $ct $+ . | item.add $nick Radio | msg =$nick $ct $+ Parab�ns, voc� recebeu o item $cc $+ Radio $+ $ct $+ ! | return }
      if ($item($nick,Radio).qnt) {
        if ($calc($dados($nick,Info,Online) - $dados($nick,Clock,Radio)) < 21600) { msg =$nick $chr(160) $cc $+ Grace $ct $+ - N�o � poss�vel dar mais de uma entrevista em menos de $cc $+ seis $ct $+ horas online... | return }
        var %opt = News:Trainer:Tale
        var %x = 1 | while ($gettok(%opt,%x,58)) { var %n = $gettok(%opt,%x,58) | if ($calc($ctime($date) - $readini(pkp\radio.ini,Time,%n)) > 86400) { var %r = $addtok(%r,%n,58) } | inc %x }
        if (%r) {
          var %x = $randtok(%opt,58), %x = $gettok(%x,1,58)
          if (%x == Tale) { msg =$nick $chr(160) $cc $+ Grace $ct $+ - "E aqui estamos em mais um 'Dia de Treinador' com nosso amigo $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Certamente ele tem uma brilhante hist�ria para nos contar!" }
          elseif (%x == News) { msg =$nick $chr(160) $cc $+ Grace $ct $+ - "Nosso informante mais intrigante acaba de nos conceder uma entrevista: $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Vamos, n�o seja t�mido! Pode nos contar a novidade!" }
          else { msg =$nick $chr(160) $cc $+ Grace $ct $+ - "Nosso aspirante a mestre pok�mon, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , nos dar� uma entrevista! Diga-nos, qual o segredo do sucesso? D� alguma dica para os treinadores iniciantes de todas as partes do mundo e que o admiram!" }
          writeini pkp\cadastros\ $+ $nick $+ .ini Clock Radio $dados($nick,Info,Online)
          writeini pkp\radio.ini TIME %x $ctime($date) | writeini pkp\radio.ini RADIO %x $dados($nick,Info,Nick) $+ :...
          msg =$nick $ct $+ Digite o que voc� deseja comentar nesta entrevista. | set %radio. [ $+ [ $nick ] ] %x
        }
        else { msg =$nick $chr(160) $cc $+ Grace $ct $+ - N�o estou mais gravando nada agora, volte mais tarde se quiser me dar alguma entrevista, ok? }
      }
      else { msg =$nick $chr(160) $cc $+ Grace $ct $+ - Ol�, estou no meio de uma transmiss�o agora, n�o posso falar... Depois, ok? }
    }
  }
  elseif ($1 == Irene) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Irene $+ $ct $+ , a recepcionista da $cc $+ Radio Tower $+ $ct $+ .
    if ($dados($nick,Quests,Rocket5) == No) { msg =$nick $chr(160) $cc $+ Irene $ct $+ - Isto � terr�vel... O que a equipe $cc $+ Rocket $ct $+ est� querendo aqui?! }
    else { msg =$nick $chr(160) $cc $+ Irene $ct $+ - Bem vindo � $cc $+ Radio Tower $+ $ct $+ ! N�o fa�a muito barulho, $cc $+ Grace $+ $ct $+ , a radialista, pode estar gravando uma entrevista neste momento... }
  }
  elseif ($1 == Rocket) && ($dados($nick,Quests,Rocket5) == No) {
    msg =$nick $ct $+ Voc� encontrou membros da equipe $cc $+ Rocket $ct $+ na $cc $+ Radio Tower $+ $ct $+ !
    msg =$nick $ct $+ Se deseja batalhar contra eles, digite ' $+ $cc $+ .Sim $+ $ct $+ ' ou ' $+ $cc $+ .nao $+ $ct $+ ' para fugir. | set %confirm. [ $+ [ $nick ] ] RKT:6
  }
  elseif ($1 == Whitney) {
    if ($badge($nick,Plain Badge)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Whitney $+ $ct $+ , l�der do gin�sio de $cc $+ $dados($nick,Info,Locate) $+ $ct $+ .
      msg =$nick $chr(160) $cc $+ Whitney $ct $+ - Nossa batalha foi incr�vel! Voc� tem muito talento, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , e certamente chegar� muito longe em sua jornada. Enquanto isso, tentarei aprender um pouco mais e ficar mais forte ainda, para em caso de revanche, isto n�o voltar a acontecer!
      if (!$dados($nick,Quests,Milk)) { msg =$nick $chr(160) $cc $+ Whitney $ct $+ - Meu tio possui uma fazenda de $cc $+ Miltank $ct $+ em $cc $+ Olivine City $+ $ct $+ . Diga que me conhece, e ele ser� gentil com voc�. Sabe, ele n�o gosta de estranhos em sua fazenda... | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Milk No }
    }
    else { .msg =$nick $cc $+ Whitney $ct $+ est� no gin�sio, aguardando seu desafio. }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
}
alias c.search.Ilex_Forest {
  if ($1 == Alex) && ($start($nick)) && (!$item($nick,HM01).qnt) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Alex $+ $ct $+ , um treinador pok�mon.
    msg =$nick $chr(160) $cc $+ Alex $ct $+ - Nossa, acabei de encontrar meu $cc $+ Farfetch'd $+ $ct $+ . �s vezes ele sai sozinho para cortar lenha e me deixa muito preocupado. Voc� deseja atravessar a floresta? Talvez seja necess�rio cortar algum arbusto no caminho com $cc $+ Cut $+ $ct $+ .
    msg =$nick $ct $+ Parab�ns, voc� recebeu o item $cc $+ HM01 $+ $ct $+ .
    msg =$nick $chr(160) $cc $+ Alex $ct $+ - Tudo o que seu pok�mon precisa � aprender o ataque e ter a ins�gnea de $cc $+ Azalea Town $+ $ct $+ . A prop�sito, voltarei � minha casa agora. At�!
  }
  elseif ($findtok(templo:temple:santuario:santu�rio:oratorio:orat�rio,$1,0,58)) {
    msg =$nick $ct $+ Voc� est� vendo o $cc $+ santu�rio $ct $+ erguido em $cc $+ $dados($nick,Info,Locate) $+ $ct $+ .
    msg =$nick $ct $+ H� uma escritura nele: "Para o protetor das florestas: proteja-a ao longo das eras."
    if ($dados($nick,Quests,Kurt) == 5) && ($item($nick,GS Ball).qnt) {
      msg =$nick $cc $+ GS Ball $ct $+ est� reagindo ao santu�rio...
      var %pk = Celebi, %lv = 30
      if ($rini(cadastros,$nick,%pk,Name)) { msg =$nick $ct $+ Voc� pode ver o pok�mon $cc $+ %pk $+ $ct $+ . Voc� n�o pode batalhar agora, porque voc� j� tem um pok�mon com o mesmo nome no time. | return }
      if ($totalpokes($nick) == 6) { msg =$nick $ct $+ Voc� pode ver o pok�mon $cc $+ %pk $+ $ct $+ . Voc� n�o pode batalhar agora, porque voc� j� tem seis pok�mon no time. | return }
      writeini pkp\cadastros\ $+ $nick $+ .ini Quests %pk Ok | msg =$nick $ct $+ Pok�mon $cc $+ %pk $ct $+ foi libertado da $cc $+ GS Ball $+ $ct $+ ! | item.rem $nick GS Ball
      .echo $addpoke($nick,%pk,%lv,%lv $+ : $+ %l).wild | b.create.fila $nick $rini(cadastros,$nick,Team,1) | var %ID = $checknickid($nick).id | b.join %ID Wild | sset [ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ 1 ] $+ ] : ] $+ [ 2 ] ] $getteam($nick,%pk)
      sset [ [ B. ] $+ [ %ID ] $+ [ .Auto ] ] ON | sset [ [ B. ] $+ [ %ID ] $+ [ .Wild ] ] ON | sset [ [ B. ] $+ [ %ID ] $+ [ .Ball ] ] 5 | sset [ [ B. ] $+ [ %ID ] $+ [ .PPUp ] ] ON | b.start.fight %ID
    }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
}
alias c.search.Azalea_Town {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Bem vindo a $cc $+ $dados($nick,Info,Locate) $+ $ct $+ ! Por muito tempo, n�o tivemos mais gin�sio na cidade devido ao fracasso do �ltimo ao dominar pok�mon insetos. No entanto, um novo membro veio ocupar o lugar do antigo l�der e provou exatamente contr�rio: nunca subestime o poder de um pok�mon inseto!
  }
  elseif ($1 == Alex) && ($item($nick,HM01).qnt) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Alex $+ $ct $+ , um treinador pok�mon.
    msg =$nick $chr(160) $cc $+ Alex $ct $+ - Para atravessar a $cc $+ Ilex Forest $ct $+ fa�a como meus pais me ensinaram: use $cc $+ Cut $ct $+ nos arbustos. Basta ensinar a t�cnica ao seu pok�mon e ele poder� atravessar o novo caminho.
  }
  elseif ($1 == Jonathan) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Jonathan $+ $ct $+ , um habitante da cidade.
    if ($item($nick,HM01).qnt) { msg =$nick $chr(160) $cc $+ Jonathan $ct $+ - Meu filho $cc $+ Alex $ct $+ me ajuda a pegar lenha e produzir $cc $+ Charcoal $+ $ct $+ , que aumenta o poder de golpes do tipo Fire. | if (!$dados($nick,Quests,Charcoal)) { msg =$nick $chr(160) $cc $+ Jonathan $ct $+ - Experimente voc� mesmo, pode ficar com este $cc $+ Charcoal $+ $ct $+ . | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Charcoal Ok | item.add $nick Charcoal } }
    else { msg =$nick $chr(160) $cc $+ Alex $ct $+ - Huh? Pensei que fosse meu filho $cc $+ Alex $+ $ct $+ . Algo deve t�-lo acontecido em $cc $+ Ilex Forest $+ $ct $+ , ele est� demorando muito. }
  }
  elseif ($1 == Kurt) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Kurt $+ $ct $+ , um especialista.
    var %x = $dados($nick,Quests,Kurt)
    if (%x) {
      if (%x == 1) {
        if (($start($nick)) && ($dados($nick,Quests,League))) || ($dados($nick,Johto,League)) { .msg =$nick $chr(160) $cc $+ Kurt $ct $+ - Oh, ent�o voc� � o novo campe�o da liga de $cc $+ Johto $+ $ct $+ ! H� tempos eu n�o ouvia falar em treinadores que conseguiam derrot�-la. Parab�ns, parab�ns! | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Kurt 2 }
        else { msg =$nick $chr(160) $cc $+ Kurt $ct $+ - J� ouviu falar no sant�ario existente em $cc $+ Ilex Forest $+ $ct $+ ? � estranho, n�o consigo dizer quando ele foi constru�do, mas parece que est� l� h� bastante tempo. Dizem que � uma esp�cie de orat�rio para um pok�mon, protetor das florestas. }
      }
      elseif (%x == 2) {
        if ($findtok($dados($nick,Kanto,Visited),Heavy Den,0,58)) { writeini pkp\cadastros\ $+ $nick $+ .ini Quests Kurt 3 | msg =$nick $chr(160) $cc $+ Kurt $ct $+ - $cc $+ Heavy Den $+ $ct $+ ? Hm, agora que voc� mencionou este lugar, lembro-me que encontraram algo l�... }
        else { msg =$nick $chr(160) $cc $+ Kurt $ct $+ - Escava��es em $cc $+ Kanto $ct $+ descobriram um lugar onde habitavam pok�mon que j� s�o considerados extintos atualmente. Est� em algum lugar pr�ximo a $cc $+ Cerulean City $+ $ct $+ . | if (!$dados($nick,Quests,HD)) { writeini pkp\cadastros\ $+ $nick $+ .ini Quests HD Ok } }
      }
      elseif (%x == 3) {
        if ($item($nick,GS Ball).qnt) {
          msg =$nick $chr(160) $cc $+ Kurt $ct $+ - Oh, voc� trouxe-a at� mim! Que bom, finalmente poderei estudar a $cc $+ GS Ball $+ $ct $+ .
          msg =$nick $ct $+ Voc� entregou a $cc $+ GS Ball $ct $+ ao $cc $+ Kurt $+ $ct $+ .
          item.rem $nick GS Ball | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Kurt 4 | writeini pkp\cadastros\ $+ $nick $+ .ini Clock Kurt $dados($nick,Info,Online)
        }
        else { msg =$nick $chr(160) $cc $+ Kurt $ct $+ - Fui informado da descoberta de um tipo �nico de pok�bola chamada $cc $+ GS Ball $+ $ct $+ . Ela tem uma colora��o dourada e prateada, e as letras GS cravadas em seu exterior. Ningu�m conseguiu descobrir como ela funciona, pois nenhum meio de tentar abr�-la teve sucesso. Disseram-me que enviariam-na para eu poder examin�-la, mas at� agora nada. Espero que em $cc $+ Kanto $ct $+ j� estejam tomando provid�ncias. }
      }
      elseif (%x == 4) {
        var %r = $calc($dados($nick,Info,Online) - $dados($nick,Clock,Kurt)), %t = 604800
        if (%r < %t) {
          var %p = $calc(%r / %t * 100)
          if (%p < 50) { msg =$nick $chr(160) $cc $+ Kurt $ct $+ - Ainda estou trabalhando duro para tentar desvendar alguma coisa neste artefato. Paci�ncia, meu caro, paci�ncia... }
          elseif (%p < 80) { msg =$nick $chr(160) $cc $+ Kurt $ct $+ - Estou conseguindo bons progressos e j� estou sentindo que aproximo-me de descobrir alguma coisa. Deseje-me sorte! }
          elseif (%p < 95) { msg =$nick $chr(160) $cc $+ Kurt $ct $+ - Ah, o quebra cabe�a est� quase pronto, s� preciso ter certeza de algumas pe�as que est�o faltando. Em breve terei boas not�cias! }
          else { msg =$nick $chr(160) $cc $+ Kurt $ct $+ - Finalmente estou pr�ximo de terminar meu trabalho aqui. Aguarde pacientemente mais algum tempo at� que eu tenha certeza do que estou prestes a descobrir. Posso adiantar que o que esta $cc $+ GS Ball $ct $+ reserva � algo grandioso... Voc� entender� posteriormente. }
        }
        else {
          msg =$nick $chr(160) $cc $+ Kurt $ct $+ - Ah! $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Adivinhe, consegui finalmente entender como a $cc $+ GS Ball $ct $+ funciona! Lembra-se da exist�ncia de um santu�rio em $cc $+ Ilex Forest $+ $ct $+ ? Pois bem, este artefato parece ser a chave. Bem, fique com ela, e quando estiver pronto, procure o santu�rio.
          msg =$nick $ct $+ Voc� recebeu novamente o item $cc $+ GS Ball $+ $ct $+ ! | item.add $nick GS Ball | remini pkp\cadastros\ $+ $nick $+ .ini Clock Kurt | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Kurt 5
        }
      }
      else {
        if ($item($nick,GS Ball).qnt) { msg =$nick $chr(160) $cc $+ Kurt $ct $+ - Lembra-se da exist�ncia de um santu�rio em $cc $+ Ilex Forest $+ $ct $+ ? Pois bem, a $cc $+ GS Ball $ct $+ parece ser a chave. Quando estiver pronto, procure o santu�rio. }
        else { msg =$nick $chr(160) $cc $+ Kurt $ct $+ - Ent�o, o protetor das florestas apareceu diante de voc�, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ? � fant�stico a liga��o entre este artefato e um pok�mon t�o raro, talvez nunca aparecido para nenhum outro treinador. Boa sorte em sua jornada, vejo que carrega consigo uma sorte que o levar� at� o topo do mundo! }
      }
    }
    else {
      if ($start($nick)) { msg =$nick $chr(160) $cc $+ Kurt $ct $+ - Ol�, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ . Ent�o, voc� est� come�ando a sua jornada? J� tentou derrotar o l�der da cidade? Bem, desejo muito boa sorte. Eu estudo as pok� bolas e acabei me tornando um especialista nelas, muito famoso. � muito bom quando reconhecem seu trabalho internacionalmente, n�o � mesmo? }
      else { msg =$nick $chr(160) $cc $+ Kurt $ct $+ - Ol�, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ . Ouvi muito falar de sua terra natal, $cc $+ $dados($nick,Info,Start) $+ $ct $+ . Eu estudo as diferentes pok� bolas e acabei me tornando um especialista nelas, de renome internacional. � bom quando reconhecem o seu trabalho, n�o � mesmo? }
      writeini pkp\cadastros\ $+ $nick $+ .ini Quests Kurt 1
    }
  }
  elseif ($1 == Vance) { msg =$nick $ct $+ Voc� encontra-se com $cc $+ Vance $+ $ct $+ , um treinador pok�mon. | msg =$nick $chr(160) $cc $+ Vance $ct $+ - Droga! Eu pensei que meu pok�mon de fogo fosse suficientemente capaz de derrotar o l�der desta cidade, mas me arrependi amargamente agora. N�o esperava por isso! }
  elseif ($1 == Tylor) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Tylor $+ $ct $+ , um pescador.
    if ($start($nick)) {
      if (!$item($nick,Old Rod).qnt) { msg =$nick $chr(160) $cc $+ Tylor $ct $+ - Voc� disse que gosta de pescar? Mas como? N�o vejo nenhuma vara de pescar em sua mochila... | return }
      if ($item($nick,Good Rod).qnt) {
        if ($item($nick,Super Rod).qnt) { msg =$nick $chr(160) $cc $+ Tylor $ct $+ - J� encontrou quantos pok�mon diferentes usando sua vara de pescar? Eu j� encontrei doze... Verdade! }
        else { msg =$nick $chr(160) $cc $+ Tylor $ct $+ - Eu j� sei quem poder� ajud�-lo com uma $cc $+ Super Rod $+ $ct $+ . Em $cc $+ Cianwood City $+ $ct $+ , h� um pescador simp�tico chamado $cc $+ Morgan $+ $ct $+ . Voc� deveria falar com ele. }
      }
      else { msg =$nick $chr(160) $cc $+ Tylor $ct $+ - Ah, que pena! Voc� usa ainda uma $cc $+ Old Rod $+ $ct $+ ! Nossa, n�o fale mais nada, leve esta $cc $+ Good Rod $ct $+ e seja feliz! | item.add $nick Good Rod | msg =$nick $chr(160) $cc $+ Tylor $ct $+ - Diferentemente da sua antiga vara de pescar, esta nova poder� alcan�ar lugares ainda mais fundos e, portanto, mais pok�mon! }
    }
    else { msg =$nick $chr(160) $cc $+ Tylor $ct $+ - Mod�stia parte, eu pesco muito bem. Sabe, outro dia eu peguei um $cc $+ Remoraid $+ $ct $+ ! Hahaha, incr�vel! }
  }
  elseif ($1 == Bugsy) {
    if ($badge($nick,Hive Badge)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Bugsy $+ $ct $+ , l�der de $cc $+ $dados($nick,Info,Locate) $+ $ct $+ .
      if ($start($nick)) { msg =$nick $chr(160) $cc $+ Bugsy $ct $+ - Existe uma passagem em $cc $+ Ilex Forest $ct $+ que o levar� at� $cc $+ Goldenrod City $+ $ct $+ . Mas ser� preciso cortar os arbustos do caminho... }
      else { msg =$nick $chr(160) $cc $+ Bugsy $ct $+ - Eu ainda n�o acredito que voc� conseguiu me vencer. Ser� que foi um golpe de sorte? Heh, nunca saberemos. Boa sorte! }
    }
    else { msg =$nick $cc $+ Bugsy $ct $+ est� no gin�sio, aguardando seu desafio. }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
}
alias c.search.Violet_City {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Bem vindo a $cc $+ $dados($nick,Info,Locate) $+ $ct $+ . Se voc� ver um vulto nos c�us da cidade, n�o se assuste, � apenas o l�der rondando para proteger os habitantes de invasores mal-intensionados. Ah, outra coisa, n�o diga na frente dele que pok�mon voadores s�o fracos contra el�tricos...
  }
  elseif ($1 == Zac) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Zac $+ $ct $+ , um treinador pok�mon.
    msg =$nick $chr(160) $cc $+ Zac $ct $+ - Deuses! Para que raios eu inventei de falar que os pok�mon do l�der eram fracos contra golpes el�tricos...! Eu fui totalmente derrotado na batalha, isso me deixou incrivelmente decepcionado. Cuide-se, hein!
  }
  elseif ($1 == Anya) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Anya $+ $ct $+ , uma habitante da cidade.
    msg =$nick $chr(160) $cc $+ Anya $ct $+ - Aqui na cidade h� uma torre onde o mastro central que a sustenta balan�a constantemente, como um $cc $+ Bellsprout $+ $ct $+ . � estranho, e filos�fico at�, se voc� parar para pensar.
  }
  elseif ($1 == Beck) {
    if ($start($nick)) && (!$item($nick,HM05).qnt) { msg =$nick $cc $+ Beck $ct $+ est� agora na $cc $+ Sprout Tower $+ $ct $+ . }
    else {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Beck $+ $ct $+ , um monge.
      msg =$nick $chr(160) $cc $+ Beck $ct $+ - A $cc $+ Sprout Tower $ct $+ nos ensina algo muito importante, para as nossas vidas. Nos faz perceber que, quando o peso dos problemas parece ser mais forte e tudo parece estar prestes a desabar, � poss�vel reerguer-se e sustent�-la, mesmo quando n�o estamos totalmente firmes.
    }
  }
  elseif ($1 == Rocket) && ($start($nick)) && (!$item($nick,HM05).qnt) {
    msg =$nick $ct $+ Alguns membros da equipe $cc $+ Rocket $ct $+ est�o na $cc $+ Sprout Tower $+ $ct $+ , neste momento.
  }
  elseif ($1 == Mazon) && ($dados($nick,Quests,Mazon)) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Mazon $+ $ct $+ , um velho historiador.
    msg =$nick $chr(160) $cc $+ Mazon $ct $+ - $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Gra�as � sua colabora��o, estou conseguindo decifrar muitas mensagens dos $cc $+ Unown $+ $ct $+ . Estou muito contente, n�o tenho d�vidas de que meus trabalhos ser�o reconhecidos pela comunidade cient�fica!
  }
  elseif ($1 == Silver) && ($dados($nick,Quests,Silver) == 1) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Silver $+ $ct $+ .
    var %item = $iif($dados($nick,Quests,Rocket6) == 3,Silver,Rainbow) Feather, %oitem = $iif($dados($nick,Quests,Rocket6) == 3,Rainbow,Silver) Feather
    if ($item($nick,%item).qnt) {
      msg =$nick $chr(160) $cc $+ Silver $ct $+ - E a�? Pensou sobre nossa aposta? Batalharemos apenas uma vez, numa batalha de tr�s contra tr�s pok�mon. Se voc� perder, perder� tamb�m seu $cc $+ %item $+ $ct $+ . O mesmo vale para mim. O que voc� me diz?
      msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar.
      set %confirm. [ $+ [ $nick ] ] SVR: $+ %oitem
    }
    else {
      msg =$nick $chr(160) $cc $+ Silver $ct $+ - Estava pensando em apostar minha $cc $+ %oitem $ct $+ em troca de uma $cc $+ %item $+ $ct $+ ... Bem, j� que n�o � poss�vel, preciso capturar um pok�mon...
      if (%oitem == Silver Feather) { var %team = 1434 } | else { var %team = 1435 }
      writeini pkp\cadastros\ $+ $nick $+ .ini Quests Silver %team
    }
  }
  elseif ($1 == Falkner) {
    if ($badge($nick,Zephyr Badge)) {
      msg =$nick $chr(160) $cc $+ Falkner $ct $+ - Odeio quando treinadores julgam v�rios pok�mon pelo tipo deles, como acontece com os pok�mon voadores. Hahaha, mas para esses treinadores eu tenho uma surpresa! E que eles aprendam a n�o subestimar mais o poder de um voador!
    }
    else { msg =$nick $cc $+ Falkner $ct $+ est� no gin�sio, aguardando seu desafio. }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
}
alias c.search.Water_Path { .msg =$nick $ct $+ Nada foi encontrado. }
alias c.search.Whirl_Islands { .msg =$nick $ct $+ Nada foi encontrado. }
alias c.search.Mt_Mortar { .msg =$nick $ct $+ Nada foi encontrado. }
alias c.search.Cherrygrove_City {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Bem vindo, treinador! � uma parada para descansar? Sente-se e relaxe um pouco! H� um longo dia pela frente.
  }
  elseif ($1 == Thomas) && ($start($nick)) {
    if ($dados($nick,Clock,Thomas)) && ($calc($dados($nick,Info,Online) - $dados($nick,Clock,Thomas)) < 10800) { msg =$nick $chr(160) $cc $+ Thomas $ct $+ - � bom saber que poderemos negociar sempre, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Que tal outra hora? | return }
    if ($totalpokes($nick) > 1) {
      msg =$nick $chr(160) $cc $+ Thomas $ct $+ - Nossa! Seus pok�mon est�o incr�veis! Voc� gostaria de vender algum deles para mim? | msg =$nick $ct $+ Digite $cc $+ .sim $ct $+ para confirmar e $cc $+ .nao $ct $+ para rejeitar.
      set %confirm. [ $+ [ $nick ] ] THM | return
    }
    else { msg =$nick $chr(160) $cc $+ Thomas $ct $+ - Quando voc� tiver v�rios pok�mon e estiver disposto a vender algum, n�o hesite em me procurar! | return }
  }
  elseif ($1 == Clarice) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Clarice $+ $ct $+ , uma treinadora pok�mon.
    msg =$nick $chr(160) $cc $+ Clarice $ct $+ - Que chatisse! Come�ei minha jornada ontem e ao chegar aqui percebi que n�o havia loja na cidade. Pregui�a de ir at� $cc $+ Violet City $+ $ct $+ ... Ahn...
  }
  elseif ($1 == Luke) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Luke $+ $ct $+ , um habitante da cidade.
    msg =$nick $chr(160) $cc $+ Luke $ct $+ - Ontem eu vi um $cc $+ Ledyba $ct $+ voando entre as �rvores. Devem ser raros, eu nunca havia visto um desses por aqui.
  }
  else { msg =$nick Nada foi encontrado. }
}
alias c.search.New_Bark_Town {
  if ($findtok(Elm:Professor:Prof Elm,$1,0,58)) { msg =$nick $ct $+ Acho que $cc $+ Prof Elm $ct $+ est� no laborat�rio. | return }
  elseif ($findtok(Mom:M�e:Mam�e:Mae:Mamae:Mommy,$1,0,58)) && ($start($nick)) {
    msg =$nick $ct $+ Voc� encontra-se com sua m�e.
    var %r = $dados($nick,Info,Region) | if (!$dados($nick,%r,Badges).n) {
      var %x = $rini(cadastros,$nick,Quests,Mom) | if (!%x) { var %x = 1 }
      if (%x == 1) { msg =$nick $chr(160) $cc $+ Mom $ct $+ - Filho, tem alguma d�vida sobre como batalhar? Eu vou tentar te explicar, h� dois m�todos: voc� cria uma batalha e espera por outro treinador, ou ent�o voc� entra numa batalha criada. Para criar uma batalha, digite ' $+ $cc $+ .Criar <pok�mon> $+ $ct $+ ', substituindo $cc $+ <pok�mon> $ct $+ pelo nome do seu pok�mon. A seguir, aguarde pelo seu advers�rio. Agora, se quiser entrar numa batalha de outro treinador, digite ' $+ $cc $+ .Entrar <ID> <pok�mon> $+ $ct $+ ', onde $cc $+ <ID> $ct $+ � o ID da batalha respectiva e $cc $+ <pok�mon> $ct $+ o nome do pok�mon que voc� usar�. Ah, para listar as batalhas criadas e seus IDs, digite ' $+ $cc $+ .Listar $+ $ct $+ '. }
      elseif (%x == 2) { msg =$nick $chr(160) $cc $+ Mom $ct $+ - Para usar algum item, use sempre o comando ' $+ $cc $+ .Item Use <item> $+ $ct $+ ', onde $cc $+ <item> $ct $+ � o item selecionado. Para ver mais fun��es desse comando, digite ' $+ $cc $+ .Item $+ $ct $+ '. Para comprar novos itens, como $cc $+ Poke  Ball $+ $ct $+ , voc� precisar� visitar uma loja, usando o comando ' $+ $cc $+ .Loja $+ $ct $+ '. Aqui em $cc $+ Pallet $ct $+ n�o h� loja, mas voc� encontrar� alguma nas pr�ximas cidades. Alias, sabe como avan�ar entre cidades? Utilize o comando ' $+ $cc $+ .Cidade Goto $+ $ct $+ ' para saber quais cidades est�o dispon�veis e, a seguir, digite ' $+ $cc $+ .Cidade Goto <localiza��o> $+ $ct $+ ', substituindo-o pelo nome da cidade. }
      elseif (%x == 3) { msg =$nick $chr(160) $cc $+ Mom $ct $+ - Para ver seus dados gerais, digite ' $+ $cc $+ .Dados $+ $ct $+ '. Para ver dados de outros treinadores, use o comando ' $+ $cc $+ .Dados <nick> $+ $ct $+ '. Ah, voc� tamb�m pode ver informa��es detalhadas sobre seu pok�mon usando o comando ' $+ $cc $+ .Dados <pok�mon> $+ $ct $+ ', ou ainda de outros treinadores (se poss�vel), ' $+ $cc $+ .Dados <nick> <pok�mon> $+ $ct $+ '. }
      elseif (%x == 4) { msg =$nick $chr(160) $cc $+ Mom $ct $+ - Querido, voc� pode personalizar seu cadastro, sabia? Utilizando o comando ' $+ $cc $+ .Perfil $+ $ct $+ ' voc� edita seu cadastro, e usando o comando ' $+ $cc $+ .Skin $+ $ct $+ ' voc� muda as cores do $cc $+ $me $+ $ct $+ ! Muito interessante, n�o? }
      else { msg =$nick $chr(160) $cc $+ Mom $ct $+ - $cc $+ $nick $+ $ct $+ , por que n�o d� uma olhada no ' $+ $cc $+ .Ajuda $+ $ct $+ '? Utilizando esse comando, voc� ver� todos os comandos dispon�veis! Se tiver alguma d�vida de como us�-los, lembre-se: informa��es contidas entre $cc $+ < $ct $+ e $cc $+ > $ct $+ s�o campos obrigat�rios, substitua pelo termo correspondente; se tiverem contidas entre $cc $+ ( $ct $+ e $cc $+ ) $+ $ct $+ , ser�o campos opcionais, mas em alguns casos obrigat�rios. Outros treinadores poder�o ajud�-lo se ainda tiver d�vidas, filho. Boa sorte! | var %x = 0 }
      writeini pkp\cadastros\ $+ $nick $+ .ini Quests Mom $calc(%x + 1) | return
    }
    else {
      if ($dados($nick,Quests,League)) {
        if ($item($nick,Silver Ticket).qnt) {
          msg =$nick $chr(160) $cc $+ Mom $ct $+ - Divirta-se, filho!
          msg =$nick $chr(160) $cc $+ Mom $ct $+ - Mam�e sentir� saudades...
        }
        else {
          msg =$nick $chr(160) $cc $+ Mom $ct $+ - Meu filho voc� conseguiu derrotar a liga pok�mon! Estou muito feliz, voc� conseguiu realizar seu sonho!
          msg =$nick $chr(160) $cc $+ Mom $ct $+ - Eu tinha feito uma poupan�a, mas achei melhor gastar o dinheiro comprando essa passagem de navio para $cc $+ Hoenn $+ $ct $+ ! Parab�ns filho, receba este presente!
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


alias c.search.SS_Tidal {
  if (!$dados($nick,Quests,SSTidal)) { writeini pkp\cadastros\ $+ $nick $+ .ini Quests SSTidal 0:0:0:0:0:0:0:0:0:0 }
  if ($findtok(Prof Birch:Birch:Professor,$1-,0,58)) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Prof Birch $+ $ct $+ .
    if ($gettok($dados($nick,Quests,SSTidal),1,58)) { msg =$nick $chr(160) $cc $+ Prof Birch $ct $+ - S� estou mesmo � passeio, n�o posso sair de $cc $+ Hoenn $ct $+ por muito tempo. Estou muito atarefado observando o habitat dos pok�mon, mas estarei tor�endo por voc�! }
    else {
      if ($dados($nick,Info,Start) == Johto) { msg =$nick $chr(160) $cc $+ Prof Birch $ct $+ - Ent�o, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , est� indo para $dados($nick,Info,Dest) $+ ? Sabe, eu n�o esperava que a liga de Johto fosse t�o dura... Precisar de 24 ins�gneas para ingress�-la � uma tarefa muito dif�cil mesmo, mas estou certo que voc� conseguir�. Nos veremos em $cc $+ Hoenn $+ $ct $+ ! }
      elseif ($dados($nick,Info,Start) == Kanto) {
        msg =$nick $chr(160) $cc $+ Prof Birch $ct $+ - Nossa, $cc $+ Prof Oak $ct $+ que se cuide! Afinal, seu disc�pulo est� se saindo melhor do que todos esperavam! Hahahaha, voc� tem muito talento, garoto. Estou tor�endo por voc�!
        item.add $nick Leftovers | msg =$nick $ct $+ Parab�ns, voc� recebeu o item $cc $+ Leftovers $+ $ct $+ !
      }
      else { msg =$nick $chr(160) $cc $+ Prof Birch $ct $+ - Que orgulho poder prestigi�-lo! � muito bom saber que voc� chegou t�o longe, certamente far� um enorme sucesso! Parab�ns, mas lembre-se de n�o subestimar seus advers�rios... Ouvi rumores de que a liga de $cc $+ Johto $ct $+ � muito dif�cil de ser alcan�ada. Ent�o, mais uma vez, boa sorte! }
      writeini pkp\cadastros\ $+ $nick $+ .ini Quests SSTidal $puttok($dados($nick,Quests,SSTidal),1,1,58)
    }
  }
  elseif ($1 == Wallace) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Wallace $+ $ct $+ , membro de Elite Four de $cc $+ Hoenn $+ $ct $+ .
    if ($gettok($dados($nick,Quests,SSTidal),2,58)) { msg =$nick $chr(160) $cc $+ Wallace $ct $+ - Eu n�o pretendo ir a $cc $+ $dados($nick,Info,Dest) $ct $+ realmente, estou apenas marcando presen�a no passeio de inaugura��o. }
    else {
      if ($dados($nick,Info,Start) == Johto) { msg =$nick $chr(160) $cc $+ Wallace $ct $+ - Hahaha, ainda n�o nos conhecemos, suponho. Sou $cc $+ Wallace $+ $ct $+ , e teremos uma batalha futuramente na liga pok�mon de $cc $+ Hoenn $+ $ct $+ . Estou ancioso para ver suas habilidades, ouvi dizer que conseguiu pegar todas as ins�gneas de $cc $+ Johto $+ $ct $+ ! Parab�ns, mas, at� l�, n�o batalharemos. Hahaha, cuide-se! }
      elseif ($dados($nick,Info,Start) == Kanto) { msg =$nick $chr(160) $cc $+ Wallace $ct $+ - Nossa, voc� j� est� partindo para mais uma competi��o em outro continente? Hahaha, isso � que � energia! Voc� realmente me impressiona, que tal uma nova batalha, ser� r�pida, s� para n�o perder o ritmo... | battle.npc $nick 1136 }
      else { msg =$nick $chr(160) $cc $+ Wallace $ct $+ - Ah, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , bom v�-lo de novo! E ent�o, pretende fazer grandiosas realiza��es em $cc $+ $dados($nick,Info,Dest) $ct $+ assim como fez em Hoenn? Hahaha, isso vai deixar muitos de queixo ca�do! Que tal uma r�pida batalha, s� para n�o perder o ritmo... | battle.npc $nick 1136 }
      writeini pkp\cadastros\ $+ $nick $+ .ini Quests SSTidal $puttok($dados($nick,Quests,SSTidal),1,2,58)
    }
  }
  elseif ($1 == Sidney) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Sidney $+ $ct $+ , membro de Elite Four de $cc $+ Hoenn $+ $ct $+ .
    if ($gettok($dados($nick,Quests,SSTidal),3,58)) { msg =$nick $chr(160) $cc $+ Sidney $ct $+ - Quem dera eu poder passar uns dias em $cc $+ $dados($nick,Info,Dest) $+ $ct $+ ... Mas ser membro da liga pok�mon exige muito do nosso tempo! }
    else {
      if ($dados($nick,Info,Start) == Johto) { msg =$nick $chr(160) $cc $+ Sidney $ct $+ - J� ouviu falar de mim, garoto? Sou $cc $+ Sidney $+ $ct $+ , e nos encontraremos depois na liga pok�mon de $cc $+ Hoenn $+ $ct $+ . Posso te contar um segredo? H� uma montanha em $cc $+ Johto $ct $+ protegida por autoridades e cheio de esp�cies diferentes de pok�mon. Quando finalmente derrotar a liga de $cc $+ Johto $+ $ct $+ , voc� finalmente poder� visit�-la. }
      elseif ($dados($nick,Info,Start) == Kanto) { msg =$nick $chr(160) $cc $+ Sidney $ct $+ - Quanta celebridade aqui presente! Olha s� como voc� ficou famoso em t�o pouco tempo, tem mesmo muito talento! Hahaha, fiquei com vontade de batalhar uma outra vez, que acha disso? | battle.npc $nick 1137 }
      else { msg =$nick $chr(160) $cc $+ Sidney $ct $+ - $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Estava mesmo falando de voc�! N�o creio que esteja tentando participar de mais um campeonato... Chega, precisamos de uma nova batalha! | battle.npc $nick 1137 }
      writeini pkp\cadastros\ $+ $nick $+ .ini Quests SSTidal $puttok($dados($nick,Quests,SSTidal),1,3,58)
    }
  }
  elseif ($1 == Phoebe) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Phoebe $+ $ct $+ , membro de Elite Four de $cc $+ Hoenn $+ $ct $+ .
    if ($gettok($dados($nick,Quests,SSTidal),4,58)) { msg =$nick $chr(160) $cc $+ Phoebe $ct $+ - Estou adorando a viagem de inaugura��o, e voc�? }
    else {
      if ($dados($nick,Info,Start) == Johto) { msg =$nick $chr(160) $cc $+ Phoebe $ct $+ - Muito prazer em conhec�-lo. Sei que est� indo para $cc $+ $dados($nick,Info,Dest) $+ $ct $+ , certo? Quando chegar em Hoenn, nos encontraremos na liga pok�mon. Ent�o se prepare para a batalha! }
      else { msg =$nick $chr(160) $cc $+ Phoebe $ct $+ - Bom rev�-lo, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ . Soube que est� partindo para uma nova competi��o... Bem, estarei tor�endo pelo seu sucesso! | item.add $nick Spell Tag | msg =$nick $ct $+ Parab�ns, voc� recebeu o item $cc $+ Spell Tag $+ $ct $+ ! }
      writeini pkp\cadastros\ $+ $nick $+ .ini Quests SSTidal $puttok($dados($nick,Quests,SSTidal),1,4,58)
    }
  }
  elseif ($1 == Roxanne) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Roxanne $+ $ct $+ , l�der do gin�sio de $cc $+ Rustboro City $+ $ct $+ .
    if ($gettok($dados($nick,Quests,SSTidal),5,58)) { msg =$nick $chr(160) $cc $+ Roxanne $ct $+ - Muitos de n�s que estamos aqui n�o viemos realmente para viajar. Sair de nossas obriga��es di�rias n�o � t�o f�cil, eu n�o posso demorar muito tamb�m. }
    else {
      if ($dados($nick,Info,Start) == Johto) { msg =$nick $chr(160) $cc $+ Roxanne $ct $+ - Lembre-se de passar em $cc $+ Rustboro $ct $+ quando for a Hoenn, ok? Poderemos batalhar, e espero que seja divertida! }
      else { msg =$nick $chr(160) $cc $+ Roxanne $ct $+ - Estou muito anciosa para voltar a $cc $+ Hoenn $+ $ct $+ , preciso cuidar do gin�sio e esperar novos desafiantes, assim como voc� j� esteve l� e batalhou comigo. Bem, que tal uma nova batalha? Prometo n�o perder desta vez! | battle.npc $nick 1138 }
      writeini pkp\cadastros\ $+ $nick $+ .ini Quests SSTidal $puttok($dados($nick,Quests,SSTidal),1,5,58)
    }
  }
  elseif ($1 == Tate&Liza) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Tate&Liza $+ $ct $+ , l�deres do gin�sio de $cc $+  City $+ $ct $+ .
    if ($gettok($dados($nick,Quests,SSTidal),10,58)) { msg =$nick $chr(160) $cc $+ Tate&Liza $ct $+ - Telecinesia � um dom que n�s desenvolvemos aos quatro anos de idade. � por isso que sentimos facilidade em treinar pok�mon ps�quicos... }
    else {
      if ($dados($nick,Info,Start) == Johto) { msg =$nick $chr(160) $cc $+ Tate $ct $+ - Ol�, eu sou... $cc $+ Tate $+ $ct $+ . | msg =$nick $chr(160) $cc $+ Liza $ct $+ - E eu sou... $cc $+ Liza $+ $ct $+ . | msg =$nick $chr(160) $cc $+ Tate&Liza $ct $+ - Somos irm�s g�meas e temos a capacidade de saber o que o outro est� pensando. Hahaha, acha que pode nos derrotar? Ent�o venha nos visitar em $cc $+ Mossdeep $+ $ct $+ ! }
      else { msg =$nick $chr(160) $cc $+ Tate $ct $+ - Eu tive uma id�ia... | msg =$nick $chr(160) $cc $+ Liza $ct $+ - $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Que tal... | msg =$nick $chr(160) $cc $+ Tate&Liza $ct $+ - Uma batalha em dupla? | battle.npc $nick 1139 }
      writeini pkp\cadastros\ $+ $nick $+ .ini Quests SSTidal $puttok($dados($nick,Quests,SSTidal),1,10,58)
    }
  }
  elseif ($1 == Lore) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Lore $+ $ct $+ , um marujo.
    if ($gettok($dados($nick,Quests,SSTidal),6,58)) {
      if ($dados($nick,Quests,Tidal)) {
        msg =$nick $chr(160) $cc $+ Lore $ct $+ - Chegamos! Pode desembarcar agora, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ .
        var %d = $dados($nick,Info,Dest)
        if (%d == Hoenn) { if ($dados($nick,Info,Region) == Johto) { var %l = Lilycove City } | else { var %l = Slateport City } }
        elseif (%d == Kanto) { var %l = Vermilion City }
        elseif (%d == Johto) { var %l = Olivine City }
        writeini pkp\cadastros\ $+ $nick $+ .ini Info Region %d | writeini pkp\cadastros\ $+ $nick $+ .ini Info Locate %l | remini pkp\cadastros\ $+ $nick $+ .ini Info Dest
        msg =$nick $ct $+ Voc� est� agora em $cc $+ $dados($nick,Info,Locate) $ct $+ ( $+ $cc $+ $dados($nick,Info,Region) $+ $ct $+ ).
        wlog user $nick Traveled on the ship and arrived at $dados($nick,Info,Region) $+ .
        var %v = $dados($nick,$dados($nick,Info,Region),Visited) | writeini pkp\cadastros\ $+ $nick $+ .ini $dados($nick,Info,Region) Visited $addtok(%v,$dados($nick,Info,Locate),58)
        writeini pkp\cadastros\ $+ $nick $+ .ini Clock Ship $dados($nick,Info,Online)
      }
      else { msg =$nick $chr(160) $cc $+ Lore $ct $+ - Calma, ainda n�o pode desembarcar. Estamos perto de chegar ao nosso destino. }
    }
    else { msg =$nick $chr(160) $cc $+ Lore $ct $+ - SS Tidal � talvez o mais luxuoso navio do mundo! $cc $+ Mr Stone $ct $+ que prop�s a sua constru��o, mas quem realmente o fez foi $cc $+ Stern $+ $ct $+ . Salve! }
    writeini pkp\cadastros\ $+ $nick $+ .ini Quests SSTidal $puttok($dados($nick,Quests,SSTidal),1,6,58)
  }
  elseif ($1 == Norman) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Norman $+ $ct $+ , l�der do gin�sio de $cc $+ Petalburg City $+ $ct $+ .
    if ($gettok($dados($nick,Quests,SSTidal),7,58)) { msg =$nick $chr(160) $cc $+ Norman $ct $+ - Hahaha, aguente firme os futuros desafios e n�o desista! O mais importante agora � concentrar-se para atingir seu objetivo maior: tornar-se um mestre pok�mon. }
    else {
      if ($dados($nick,Info,Start) == Johto) { msg =$nick $chr(160) $cc $+ Norman $ct $+ - Muito prazer. Minha especialidade � em pok�mon do tipo Normal. A grande variedade de esp�cies existentes me deixa mais confiante em minhas estrat�gias, e nenhum pok�mon lutador ser� capaz de derrub�-los! Quando visitar $cc $+ Hoenn $+ $ct $+ , lembre-se de passar em Petalburg para batalharmos! }
      elseif ($dados($nick,Info,Start) == Kanto) { msg =$nick $chr(160) $cc $+ Norman $ct $+ - Hahaha, e aqui estamos! Quem poderia esperar disso hein? Seu sucesso veio muito cedo, garoto! Olhe, j� � at� uma celebridade. Continue assim e voc� se sair� muito bem em $cc $+ $dados($nick,Info,Dest) $+ $ct $+ . }
      else { msg =$nick $chr(160) $cc $+ Norman $ct $+ - Nossa, hahahaha! Que surpresa agrad�vel, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Eu n�o poderia esperar rev�-lo, e muito menos aqui! Eu imagino que $cc $+ Wally $ct $+ ainda esteja em $cc $+ Hoenn $+ $ct $+ ... Deve estar com inveja, certamente! Parab�ns. }
      writeini pkp\cadastros\ $+ $nick $+ .ini Quests SSTidal $puttok($dados($nick,Quests,SSTidal),1,7,58)
    }
  }
  elseif ($1 == Lance) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Lance $+ $ct $+ , membro de Elite Four de $cc $+ Kanto $+ $ct $+ .
    if ($gettok($dados($nick,Quests,SSTidal),8,58)) { msg =$nick $chr(160) $cc $+ Lance $ct $+ - Meu futuro � incerto. Mas estou tor�endo pelo seu sucesso, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ . }
    else {
      if ($dados($nick,Info,Start) == Johto) { msg =$nick $chr(160) $cc $+ Lance $ct $+ - Oh, ent�o n�o sabia que eu era membro da Elite Four? Bem, n�o falei nada para n�o deix�-lo constrangido ou algo parecido. Obrigado mais uma vez pela ajuda fornecida em $cc $+ Johto $+ $ct $+ . At�! }
      else { msg =$nick $chr(160) $cc $+ Lance $ct $+ - Meus informantes de $cc $+ Johto $ct $+ alertaram-me sobre a presen�a de membros da equipe $cc $+ Rocket $+ $ct $+ . Estou indo agora tentar resolver a situa��o, n�o gosto nem um pouco daqueles lun�ticos. | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Lance No }
      writeini pkp\cadastros\ $+ $nick $+ .ini Quests SSTidal $puttok($dados($nick,Quests,SSTidal),1,8,58)
    }
  }
  elseif ($1 == Steven) && ($gettok($dados($nick,Quests,SSTidal),9,58)) && ($dados($nick,Info,Start) != Johto) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Steven $+ $ct $+ .
    msg =$nick $chr(160) $cc $+ Steven $ct $+ - Ah, esqueci de desejar boa sorte em $cc $+ $dados($nick,Info,Dest) $+ $ct $+ ! Continue persistente em dire��o ao seu objetivo e derrote todos os seus advers�rios!
    if (!$dados($nick,Quests,Herb)) { item.add $nick White Herb | msg =$nick $chr(160) $cc $+ Steven $ct $+ - Fique com esta $cc $+ White Herb $+ $ct $+ . Se voc� fizer seu pok�mon segur�-la, durante uma batalha, quando houver uma perda de ataque, defesa, ou qualquer outro atributo, ele ser� recuperado! | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Herb Ok }
  }
  elseif ($findtok(Captain:Capit�o:Capitao:Writney,$1,0,58)) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Writney $+ $ct $+ , o capit�o do SS Tidal.
    if ($gettok($dados($nick,Quests,SSTidal),9,58)) {
      if ($findtok($dados($nick,Quests,SSTidal),1,0,58) == 10) { msg =$nick $chr(160) $cc $+ Writney $ct $+ - Finalmente! Chegamos em $cc $+ $dados($nick,Info,Dest) $+ $ct $+ . N�o fique nervoso, sei que tudo dar� certo para voc� nesta nova etapa. Fale com $cc $+ Lore $ct $+ para desembarcar. | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Tidal Ok }
      else { msg =$nick $chr(160) $cc $+ Writney $ct $+ - Hahaha, j� conhece toda a tripula��o? Distraia-se um pouco e tente relaxar, ainda n�o chegamos em $cc $+ $dados($nick,Info,Dest) $+ $ct $+ ... }
    }
    else {
      if ($dados($nick,Info,Start) == Johto) { msg =$nick $chr(160) $cc $+ Writney $ct $+ - Bem vindo ao meu navio, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Parab�ns pelo seu desempenho em $cc $+ $dados($nick,Info,Region) $+ $ct $+ . N�o se desespere, a viagem ser� segura e voc� n�o tardar� a chegar ao seu destino. }
      elseif ($dados($nick,Info,Start) == Kanto) { msg =$nick $chr(160) $cc $+ Writney $ct $+ - Ol�, bem vindo � viagem de inaugura��o do $cc $+ SS Tidal $+ $ct $+ . Espero que esteja confort�vel e n�o se preocupe, a viagem � segura e tranq�ila! }
      else { msg =$nick $chr(160) $cc $+ Writney $ct $+ - Ah, h� quanto tempo! Nossa, como voc� est�? Vejo que se tornou um dos melhores treinadores do mundo! � muito bom saber disso. Eu tive que me ausentar porque estava sendo recrutado a ser o capit�o deste navio, mesmo j� estando aposentado. Eu nunca me canso disso, para falar a verdade! � um prazer que sinto em conduzir as pessoas aos seus destinos, achando sempre um caminho seguro pelos mares! }
      if ($dados($nick,Info,Start) != Johto) {
        msg =$nick $cc $+ Steven $ct $+ aparece subitamente. | msg =$nick $chr(160) $cc $+ Steven $ct $+ - Nossa, eu realmente o assustei?! Hehehe, desculpe! N�o esperava encontr�-lo aqui, podia jurar que n�o tinha comparecido... Mas j� que nos encontramos, o que diria ent�o de uma batalha? | battle.npc $nick 1140
      }
      writeini pkp\cadastros\ $+ $nick $+ .ini Quests SSTidal $puttok($dados($nick,Quests,SSTidal),1,9,58)
    }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
}
alias c.search.Mahogany_Town {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Bem vindo! $cc $+ $dados($nick,Info,Locate) $ct $+ � uma das mais antigas cidades deste continente e o l�der da cidade est� no seu posto desde o in�cio... Hah, ningu�m consegue derrot�-lo! � incr�vel!
    if ($dados($nick,Quests,Lance) != Ok) && (!$dados($nick,Quests,Rocket4)) { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Um treinador muito suspeito dirigiu-se ao $cc $+ Lake Of Rage $+ $ct $+ . Seu nome � $cc $+ Lance $+ $ct $+ , e tenho a impress�o de j� t�-lo visto antes. }
  }
  elseif ($1 == Dean) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Dean $+ $ct $+ , um treinador pok�mon.
    msg =$nick $chr(160) $cc $+ Dean $ct $+ - Que estranho! Um dias desses eu estava procurando pok�mon em $cc $+ Lake Of Rage $ct $+ e percebi algo estranho no lugar... N�o sei dizer exatamente o que, mas meus pok�mon perceberam e n�o gostaram nem um pouco. Da� eu os trouxe ao centro pok�mon e eles finalmente melhoraram...
  }
  elseif ($findtok(Rocket:Esconderijo:Hideout:Rocket Hideout,$1-,0,58)) && ($dados($nick,Quests,Rocket4)) {
    msg =$nick $ct $+ Voc� entrou no $cc $+ Rocket Hideout $+ $ct $+ .
    if ($dados($nick,Quests,Rocket4) == Ok) { msg =$nick $ct $+ Parece n�o haver mais ningu�m aqui... }
    else { msg =$nick $ct $+ Olhe! H� membros da equipe $cc $+ Rocket $ct $+ aqui! O que deseja fazer? | msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para desafi�-los ou ' $+ $cc $+ .nao $+ $ct $+ ' para fugir. | set %confirm. [ $+ [ $nick ] ] RKT:5 }
  }
  elseif ($1 == Pryce) {
    if ($badge($nick,Glacier Badge)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Pryce $+ $ct $+ , l�der do gin�sio de $cc $+ $dados($nick,Info,Locate) $+ $ct $+ .
      msg =$nick $chr(160) $cc $+ Pryce $ct $+ - Apenas o admiro ainda mais, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ... Obrigado por nossa batalha t�o revigorante!
    }
    else { .msg =$nick $cc $+ Pryce $ct $+ est� no gin�sio, aguardando seu desafio. }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
}
alias c.search.Lake_Of_Rage {
  if ($1 == Lance) && ($dados($nick,Quests,Lance) != Ok) && (!$dados($nick,Quests,Rocket4)) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Lance $+ $ct $+ .
    if ($start($nick)) { msg =$nick $chr(160) $cc $+ Lance $ct $+ - E voc�, quem �? Ah, desculpe $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , pela minha grosseria. � que estou no meio de uma investiga��o. Parece-me que a equipe $cc $+ Rocket $+ $ct $+ , um grupo de fan�ticos, est�o tentando evoluir pok�mon usando algum m�todo n�o conhecido... Preciso encontrar o esconderijo deles agora, sei que � pr�ximo daqui. Por favor, n�o se envolva nisso, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ . � muito perigoso... Adeus! }
    else { msg =$nick $chr(160) $cc $+ Lance $ct $+ - Ah, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , tomei um enorme susto com a sua chegada. � que estou no meio de uma investiga��o. Parece-me que a equipe $cc $+ Rocket $+ $ct $+ , um grupo de fan�ticos que talvez voc� j� tenha ouvido falar, est�o tentando evoluir pok�mon usando algum m�todo desconhecido... Preciso encontrar o esconderijo deles agora, sei que � pr�ximo daqui. N�o pretendo envolv�-lo nisso, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ . � muito perigoso... At�! }
    writeini pkp\cadastros\ $+ $nick $+ .ini Quests Lance No | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Rocket4 No
  }
  else { .msg =$nick $ct $+ Nada foi encontrado. }
}
alias c.search.Mt_Mortar { msg =$nick $ct $+ Nada foi encontrado. }
alias c.search.Ice_Path { msg =$nick $ct $+ Nada foi encontrado. }
alias c.search.Blackthorn_City {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Bem vindo, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ . Esta cidade � conhecida como o ber�o dos drag�es. Pessoas famosas que treinam pok�mon do tipo $cc $+ Dragon $ct $+ j� treinaram nesta cidade e hoje s�o excepcionais treinadores.
  }
  elseif ($1 == Flint) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Flint $+ $ct $+ , um pescador.
    if ($start($nick)) {
      if ($item($nick,Old Rod).qnt) {
        if ($item($nick,Good Rod).qnt) { msg =$nick $chr(160) $cc $+ Flint $ct $+ - E a�? Praticando muito suas habilidades na pescaria? Olha, achei um $cc $+ Goldeen $+ $ct $+ ! }
        else { msg =$nick $chr(160) $cc $+ Flint $ct $+ - Quem sabe voc� n�o encontra uma $cc $+ Good Rod $ct $+ em $cc $+ Azalea Town $+ $ct $+ ... Ah, lembrei, $cc $+ Tylor $ct $+ poder� ajud�-lo. }
      }
      else { msg =$nick $chr(160) $cc $+ Flint $ct $+ - Ent�o voc� quer pescar? Certamente vai precisar de um instrumento para faz�-lo, portanto fique com esta $cc $+ Old Rod $+ $ct $+ . | item.add $nick Old Rod | msg =$nick $chr(160) $cc $+ Flint $ct $+ - Para us�-la, digite ' $+ $cc $+ .item use Old Rod $+ $ct $+ ' antes de iniciar uma batalha com pok�mon selvagem. Lembre-se que n�o h� muitas esp�cies na �gua, ou seja, � perfeitamente normal que apare�am muitos pok�mon que voc� j� tenha... }
    }
    else { msg =$nick $chr(160) $cc $+ Flint $ct $+ - N�o faz muito tempo que come�ei a pescar, mas j� estou me sentindo muito profissional. Olhe s�, eu mesmo peguei esse $cc $+ Magikarp $+ $ct $+ ! }
  }
  elseif ($1 == Bryce) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Bryce $+ $ct $+ , um treinador pok�mon.
    if ($start($nick)) { msg =$nick $chr(160) $cc $+ Bryce $ct $+ - Apesar de $cc $+ Clair $+ $ct $+ , a l�der da cidade, ser especialista em pok�mon drag�es, n�o creio que seu talento se limite apenas a estes tipos de pok�mon. � o que se pode ver ao batalhar com os treinadores antes dela, eles n�o parecem estar preocupados em usar pok�mon do tipo $cc $+ Dragon $+ $ct $+ . }
    else { msg =$nick $chr(160) $cc $+ Bryce $ct $+ - $cc $+ Clair $ct $+ � especialista em pok�mon do tipo $cc $+ Dragon $+ $ct $+ , assim como $cc $+ Lance $+ $ct $+ . Ouvi falar que os dois treinaram juntos nesta cidade e batalharam entre si para decidir quem seria o l�der. $cc $+ Clair $ct $+ venceu, mas n�o tenho certeza se $cc $+ Lance $ct $+ batalhou para valer... }
  }
  elseif ($1 == Clair) {
    if ($badge($nick,Rising Badge)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Clair $+ $ct $+ , l�der do gin�sio de $cc $+ $dados($nick,Info,Locate) $+ $ct $+ .
      msg =$nick $chr(160) $cc $+ Clair $ct $+ - Alguns pok�mon precisam estar felizes para evoluir. H� v�rias formas de alegr�-lo. Por exemplo, se voc� batalhar usando o mesmo pok�mon durante batalhas com treinadores diferentes, ele ficar� mais feliz, assim como usar pok�mon diferentes contra o mesmo treinador, alternadamente em ambos os casos.
    }
    else { .msg =$nick $cc $+ Clair $ct $+ est� no gin�sio, aguardando seu desafio. }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
}
alias c.search.White_City {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Esta � a "cidade p�lida", como muitos a conhecem. O motivo disso � a aus�ncia de cores nas constru��es dela, � proibido usar qualquer outra cor que n�o for branco em casas, edif�cios, e at� mesmo no centro pok�mon. Pode parecer estranho para quem � visitante, mas os habitantes adoram e j� se acostumaram com a id�ia.
  }
  elseif ($1 == Derek) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Derek $+ $ct $+ , um habitante da cidade.
    msg =$nick $chr(160) $cc $+ Derek $ct $+ - N�o acredito que pintaram a parede da minha casa ontem... Aquela tinta usada na pintura n�o me engana n�o, certamente foi meu vizinho! Se eu peg�-lo fazendo isso, ele vai ver s�!
  }
  elseif ($1 == Mark) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Mark $+ $ct $+ , um treinador pok�mon.
    if ($dados($nick,Smeargle,Name)) { msg =$nick $chr(160) $cc $+ Derek $ct $+ - Sim, foi esse pok�mon que eu vi mesmo! $cc $+ Smeargle $ct $+ huh? Deve ser um pok�mon raro... Mas que sorte a sua! }
    else { msg =$nick $chr(160) $cc $+ Derek $ct $+ - N�o creio que seja uma 'pessoa' que esteja realmente dando cores a esta cidade... N�o vou dizer nada sem ter provas, mas guarde as minhas palavras! }
  }
  elseif ($1 == Ariana) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Ariana $+ $ct $+ , uma treinadora pok�mon.
    msg =$nick $chr(160) $cc $+ Ariana $ct $+ - Parece at� contraditoriedade, mas este lugar j� trouxe inspira��o para muitos artistas famosos. N�o sei o que h� por tr�s disso, mas eu tamb�m gosto dela... At� os pok�mon s�o brancos, que lindo!
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
}
alias c.search.Dark_Cave { msg =$nick $ct $+ Nada foi encontrado. }
alias c.search.Peak_Town {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Bem vindo � cidade, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Se estiver passando mal por causa da altitude, respire um pouco mais e beba alguma coisa. Como a cidade foi erguida exatamente em cima de um pico, � comum que treinadores visitantes n�o se sintam bem. Bem, qualquer coisa avise!
  }
  elseif ($1 == Oliver) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Oliver $+ $ct $+ , um treinador pok�mon.
    if ($start($nick)) { if ($dados($nick,Quests,League)) { var %x = 1 } } | elseif ($dados($nick,Johto,League)) { var %x = 1 }
    if (%x) { msg =$nick $chr(160) $cc $+ Oliver $ct $+ - Ol�, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Tudo bem, n�o mentirei para voc�: sou o $cc $+ Move Relearner $+ $ct $+ , conhecido por fazer pok�mon reaprenderem t�cnicas que por alguma raz�o n�o podem mais aprender. Deseja que eu d� uma olhada em seu $cc $+ $dados($nick,Team,1) $+ $ct $+ ? | msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar. | set %confirm. [ $+ [ $nick ] ] RLN:Oliver }
    else { msg =$nick $chr(160) $cc $+ Oliver $ct $+ - Meus pok�mon voadores j� est�o acostumados com o ar um tanto rarefeito daqui. Como �? $cc $+ Move Relearner $+ $ct $+ ? Nunca ouvi falar... Voc� deve estar confundindo-me com outra pessoa. }
  }
  elseif ($1 == Brent) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Brent $+ $ct $+ , um habitante da cidade.
    msg =$nick $chr(160) $cc $+ Brent $ct $+ - Se estiver pensando em ir � liga pok�mon de $cc $+ $dados($nick,Info,Region) $ct $+ sugiro ent�o que siga para $cc $+ Sunrise City $+ $ct $+ ... Eu vim aqui � procura do $cc $+ Move Relearner $+ $ct $+ , mas vejo que cometi um engano terr�vel!
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
}
alias c.search.Sunrise_City {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - � triste inform�-lo que esta cidade j� foi habitat de v�rios pok�mon, mas hoje quase n�o vemos pok�mon por aqui... Por isso � preciso proteger a natureza. Quando eu passar em $cc $+ Goldenrod City $ct $+ novamente, lembrarei de comprar alguma planta na floricultura, assim pelo menos eu farei a minha parte!
  }
  elseif ($1 == Clarice) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Clarice $+ $ct $+ , uma habitante da cidade.
    msg =$nick $chr(160) $cc $+ Clarice $ct $+ - A cidade devastou muito das belezas naturais desta ilha, o que acabou causando o afastamento de v�rios pok�mon. Hoje, no entanto, pok�mon polinizadores visitam a ilha todas as manh�s, na tentativa de reflorest�-la. Na verdade, tor�o para que eles consigam...
  }
  elseif ($1 == Marty) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Marty $+ $ct $+ , um treinador pok�mon.
    if ($start($nick)) { if ($dados($nick,Quests,League)) { var %l = 1 } } | elseif ($dados($nick,$dados($nick,Info,Region),League)) { var %l = 1 }
    if (%l) {
      var %t = $asctime(HH)
      if (%t < 5) { msg =$nick $chr(160) $cc $+ Marty $ct $+ - Sabe de uma coisa? Vou ficar e esperar pelos pok�mon. Falta cerca de $cc $+ $numero2($calc(5 - %t)) $ct $+ horas para os primeiros raios solares aparecerem... }
      elseif (%t == 5) { msg =$nick $chr(160) $cc $+ Marty $ct $+ - Ah! Achei um pok�mon em $cc $+ Sunrise City $+ $ct $+ ! Pena que eles s� aparecem neste hor�rio aqui na cidade... }
      else { msg =$nick $chr(160) $cc $+ Marty $ct $+ - Se quiser encontrar pok�mon selvagens, ter� que esperar at� amanh�, quando o sol estiver nascendo... }
    }
    else { msg =$nick $chr(160) $cc $+ Marty $ct $+ - N�o creio que deixaram isto acontecer... � uma pena, mas esta cidade n�o tem pok�mon mesmo! Eu ouvi boatos de apari��o de algumas esp�cies durante o amanhecer, mas n�o tenho tempo para vir aqui cedo e checar por mim mesmo. }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
}
alias c.search.Fog_Cave { msg =$nick $ct $+ Nada foi encontrado. }
alias earl.count {
  var %r = $dados($1-,Johto,Battle), %t = WTR
  var %n = 1508 | if ($findtok(%r,%n,0,58)) { var %r = $remtok(%r,%n,1,58), %r = $addtok(%r,%t,58) }
  var %n = 1509 | if ($findtok(%r,%n,0,58)) { var %r = $remtok(%r,%n,1,58), %r = $addtok(%r,%t,58) }
  var %t = FLY, %n = 1515 | if ($findtok(%r,%n,0,58)) { var %r = $remtok(%r,%n,1,58), %r = $addtok(%r,%t,58) }
  var %n = 1516 | if ($findtok(%r,%n,0,58)) { var %r = $remtok(%r,%n,1,58), %r = $addtok(%r,%t,58) }
  var %t = PSY, %n = 1517 | if ($findtok(%r,%n,0,58)) { var %r = $remtok(%r,%n,1,58), %r = $addtok(%r,%t,58) }
  var %n = 1518 | if ($findtok(%r,%n,0,58)) { var %r = $remtok(%r,%n,1,58), %r = $addtok(%r,%t,58) }
  var %n = 1519 | if ($findtok(%r,%n,0,58)) { var %r = $remtok(%r,%n,1,58), %r = $addtok(%r,%t,58) }
  return $iif(%r,$gettok(%r,0,58),0)
}
alias c.search.Silverst_City {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Parab�ns por ter chegado at� aqui, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ . Esta � a famosa ilha prateada, e voc� est� agora em $cc $+ $dados($nick,Info,Locate) $+ $ct $+ , lugar onde voc� encontrar� seu maior desafio! N�o fique muito tenso, e confie em seu time! Voc�s j� chegaram at� aqui, e provavelmente enfrentaram muitos desafios tortuosos no caminho. Tudo o que posso fazer agora � desejar boa sorte...
  }
  elseif ($1 == Earl) && (!$dados($nick,Quests,Mew)) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Earl $+ $ct $+ , um habitante da cidade.
    if ($start($nick)) { if ($dados($nick,Quests,League)) { var %x = 1 } } | elseif ($dados($nick,Johto,League)) { var %x = 1 }
    if (%x) {
      if ($dados($nick,Johto,Battle)) && (!$dados($nick,Quests,Mew)) {
        var %b = $dados($nick,Johto,Battle)
        if ($gettok(%b,0,58) > 21) {
          var %x = 1
          while ($gettok(%b,%x,58)) {
            var %p = $gettok(%b,%x,58)
            while ($findtok(%b,%p,0,58) > 1) { var %b = $deltok(%b,$findtok(%b,%p,$findtok(%b,%p,0,58),58),58) }
            inc %x
          }
          writeini pkp\cadastros\ $+ $nick $+ .ini Johto Battle %b
        }
        var %n = $earl.count($nick)
        if (%n == 17) {
          msg =$nick $chr(160) $cc $+ Earl $ct $+ - Voc� realmente conseguiu... Derrotou todos os times aleat�rios da $cc $+ Elite Four $ct $+ de $cc $+ Johto $+ $ct $+ ! Para treinadores como voc�, este desafio foi mais que revigorante. Imagino que esteja inspirado neste exato momento na forma��o de times ainda mais articulados. N�o h� d�vidas que seu desenvolvimento estrat�gico progrediu bastante, e sei que continuar� progredindo, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ !
          if ($teampos($nick,Egg)) { msg =$nick $chr(160) $cc $+ Earl $ct $+ - Sinto muito, mas voc� j� tem um $cc $+ Egg $ct $+ em seu time... Quando finalmente chocar-se, volte a falar comigo. | return }
          if ($dados($nick,Team,6)) { msg =$nick $chr(160) $cc $+ Earl $ct $+ - Que pena, voc� j� tem seis pok�mon no time... Libere espa�o para receber este $cc $+ Egg $+ $ct $+ . | return }
          echo $addpoke($nick,Egg,Mew,Sua origem � desconhecida...,$rand(0,31) $+ : $+ $rand(0,31) $+ : $+ $rand(0,31) $+ : $+ $rand(0,31) $+ : $+ $rand(0,31) $+ : $+ $rand(0,31),0,0)
          msg =$nick $chr(160) $cc $+ Earl $ct $+ - Por favor, cuide deste $cc $+ Egg $+ $ct $+ , adquirido num local onde nenhuma embarca��o nem pok�mon podem alcan�ar. Bem distante, onde os sonhos terminam... | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Mew $dados($nick,Info,Online)
          msg =$nick $chr(160) $cc $+ Earl $ct $+ - Adeus!
        }
        else { msg =$nick $chr(160) $cc $+ Earl $ct $+ - Como voc� j� deve ter reparado, a $cc $+ Elite Four $ct $+ usa diversos times, aleat�rios, de tipos variados. Eu adoraria ver um treinador derrotando todos os diferentes times... Se voc� conseguir cumprir esta not�vel tarefa, volte a falar comigo. Terei algo para voc�. }
      }
      else { msg =$nick $chr(160) $cc $+ Earl $ct $+ - Encontrei-o numa ilha deserta h� muito tempo, uma que hoje n�o � acess�vel atualmente, talvez ele estivesse ali abandonado. N�o sei se este ovo � realmente de um pok�mon, pois n�o aparentava que o mesmo desejava nascer. }
    }
    else { msg =$nick $chr(160) $cc $+ Earl $ct $+ - Voc� parece estar preparado para o maior desafio, que � a $cc $+ Elite Four $+ $ct $+ . Avisarei previamente que n�o ser� f�cil. Ao longo da minha vida, vi muitos treinadores confiantes avan�arem at� tr�s membros da elite, mas jamais derrotarem-nos. Sera que voc� � experiente o bastante para vencer mais esta etapa? }
  }
  elseif ($1 == Fred) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Fred $+ $ct $+ , um treinador pok�mon.
    msg =$nick $chr(160) $cc $+ Fred $ct $+ - Prata � o que n�o falta nesta ilha, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Sabe, h� um lugar conhecido como 'montanha prateada' onde poucos podem acess�-la, pois � uma �rea protegida por autoridades. Ouvi apenas rumores de pok�mon raros habitando aquela montanha.
  }
  elseif ($1 == Brendan) && ($dados($nick,Info,Start) == Hoenn) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Brendan $+ $ct $+ .
    msg =$nick $chr(160) $cc $+ Brendan $ct $+ - Ah, n�o se espante, s� estou aqui para v�-lo batalhar... N�o sei se estou pronto para esta poderosa $cc $+ Elite Four $+ $ct $+ ...
    var %x = $rini(cadastros,$nick,Clock,Brendan), %o = $rini(cadastros,$nick,Info,Online)
    if ($calc(%o - %x) >= 28800) {
      msg =$nick $chr(160) $cc $+ Brendan $ct $+ - Estou com vontade de batalhar agora, o que me diz?
      msg =$nick $ct $+ Digite $cc $+ .sim $ct $+ para aceitar ou $cc $+ .nao $ct $+ para rejeitar. | set %confirm. [ $+ [ $nick ] ] CLK:1324 | return
    }
    else {
      msg =$nick $chr(160) $cc $+ Brendan $ct $+ - Tudo bem, continuarei treinando para ser, algum dia, um treinador ainda mais brilhante que voc�!
      var %x = $readini(pkp\status.ini,$dados($nick,Info,Region),Legendary), %x1 = $findtok(%x,Raikou,0,58), %x2 = $findtok(%x,Suicune,0,58), %x3 = $findtok(%x,Entei,0,58), %x4 = $findtok(%x,Ho-oh,0,58), %x5 = $findtok(%x,Lugia,Ho-oh)
      if (%x1) || (%x2) || (%x3) { msg =$nick $chr(160) $cc $+ Brendan $ct $+ - Sabe o que me deixa impressionado? $cc $+ Ecruteak City $+ $ct $+ . H� muitas lendas sobre aquela cidade, acho realmente que h� algo escondido nela... N�o consigo descrever o qu�, estou apenas com um pressentimento. }
      elseif (%x4) || (%x5) { msg =$nick $chr(160) $cc $+ Brendan $ct $+ - Ouvi falar que tr�s pok�mon lend�rios foram capturados nos territ�rios de $cc $+ Johto $+ $ct $+ . Ser� que h� ainda algum restando? Se eu descobrir algo, aviso... }
      elseif ($dados($nick,Quests,Rocket6) isnum 1-2) { msg =$nick $chr(160) $cc $+ Brendan $ct $+ - Equipe $cc $+ Rocket $ct $+ aqui em $cc $+ Johto $+ $ct $+ ? S� pode estar brincando! Eles de novo? Talvez, dessa vez, eles aprender�o de vez a li��o. Ah, voc� vai ensin�-los, n�o �? }
    }
  }
  elseif ($1 == May) && ($dados($nick,Info,Start) == Kanto) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ May $+ $ct $+ .
    msg =$nick $chr(160) $cc $+ May $ct $+ - Oh, sabia que eu poderia encontr�-lo aqui! Sabe, foi muito dif�cil chegar em $cc $+ $dados($nick,Info,Locate) $ct $+ mas eu sabia que valeria a pena... N�o sei se estou pronta para esta poderosa $cc $+ Elite Four $+ $ct $+ ...
    var %x = $rini(cadastros,$nick,Clock,May), %o = $rini(cadastros,$nick,Info,Online)
    if ($calc(%o - %x) >= 28800) {
      msg =$nick $chr(160) $cc $+ May $ct $+ - Estou com vontade de batalhar agora, o que me diz?
      msg =$nick $ct $+ Digite $cc $+ .sim $ct $+ para aceitar ou $cc $+ .nao $ct $+ para rejeitar. | set %confirm. [ $+ [ $nick ] ] CLK:1325 | return
    }
    else {
      var %x = $readini(pkp\status.ini,$dados($nick,Info,Region),Legendary), %x1 = $findtok(%x,Raikou,0,58), %x2 = $findtok(%x,Suicune,0,58), %x3 = $findtok(%x,Entei,0,58), %x4 = $findtok(%x,Ho-oh,0,58), %x5 = $findtok(%x,Lugia,Ho-oh)
      if (%x1) || (%x2) || (%x3) { msg =$nick $chr(160) $cc $+ May $ct $+ - Sabe o que me deixa realmente impressionada? $cc $+ Ecruteak City $+ $ct $+ . H� muitas lendas sobre aquela cidade, acho realmente que h� algo escondido nela... N�o consigo descrever o qu�, estou apenas com um pressentimento. }
      elseif (%x4) || (%x5) { msg =$nick $chr(160) $cc $+ May $ct $+ - Ouvi falar que tr�s pok�mon lend�rios foram capturados nos territ�rios de $cc $+ Johto $+ $ct $+ . Ser� que h� ainda algum restando? Se eu descobrir algo, aviso... }
      elseif ($dados($nick,Quests,Rocket6) isnum 1-2) { msg =$nick $chr(160) $cc $+ May $ct $+ - Equipe $cc $+ Rocket $ct $+ aqui em $cc $+ Johto $+ $ct $+ ?! Como isso pode ser poss�vel? Acho melhor voc� det�-los agora, antes que se transforme em mais uma cat�strofe! }
      else { msg =$nick $chr(160) $cc $+ May $ct $+ - Ficarei treinando por aqui, ent�o voc� poder� me visitar sempre que quiser! }
    }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
}
alias c.search.Mt_Silver {
  if ($findtok(Symbol:Simbolo:S�mbolo,$1,0,58)) {
    if (!$dados($nick,Quests,Symbol)) { var %x = 0:0:0:0 | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Symbol %x }
    else { var %x = $dados($nick,Quests,Symbol) }
    var %n = 3
    if ($gettok(%x,%n,58)) { msg =$nick $ct $+ Este s�mbolo j� foi adquirido anteriormente. }
    else {
      if ($team.hm($nick,Whirlwind) == Ok!) { writeini pkp\cadastros\ $+ $nick $+ .ini Quests Symbol $puttok(%x,1,%n,58) | msg =$nick $cc $+ Air Symbol $ct $+ foi encontrado com sucesso. }
      else { msg =$nick $ct $+ Nada p�de ser encontrado. }
    }
  }
  elseif ($1 == Silver) && ($dados($nick,Quests,Silver) > 1) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Silver $+ $ct $+ .
    var %x = $rini(cadastros,$nick,Clock,Silver), %o = $rini(cadastros,$nick,Info,Online)
    if ($calc(%o - %x) >= 43200) {
      msg =$nick $chr(160) $cc $+ Silver $ct $+ - $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , chegou a tempo de ver toda a for�a do meu time! Vamos batalhar um pouco! Nada de apostas desta vez...
      msg =$nick $ct $+ Digite $cc $+ .sim $ct $+ para aceitar ou $cc $+ .nao $ct $+ para rejeitar. | set %confirm. [ $+ [ $nick ] ] CLK: $+ $dados($nick,Quests,Silver)
    }
    else {
      if ($count($unown.code($nick),*) < 6) {
        msg =$nick $chr(160) $cc $+ Silver $ct $+ - Isso � um $cc $+ Unown $+ $ct $+ ? Hah, confesso que s�o pok�mon realmente misteriosos! As palavras formadas que eles formam s�o carregadas de muito poder, n�o duvide disso.
        if ($earl.count($nick) == 17) {
          msg =$nick $chr(160) $cc $+ Silver $ct $+ - Contarei um segredo agora, ent�o, por favor, n�o espalhe! Certa vez, tive a $cc $+ brilhante $ct $+ id�ia de escrever com os $cc $+ Unown $ct $+ a palavra $cc $+ SHINY $ct $+ em meu time.
          msg =$nick $chr(160) $cc $+ Silver $ct $+ - Quer mesmo saber o que aconteceu? At� agora nada. Hahaha, te peguei! Acha mesmo que eu me preocupo para essas lendas de $cc $+ Johto $+ $ct $+ ?!
        }
        else { msg =$nick $chr(160) $cc $+ Silver $ct $+ - N�o creio que voc� tenha habilidade suficiente para compreender o que eu sei sobre esses pok�mon... E que tal voc� se concentrar na liga de $cc $+ Johto $+ $ct $+ ? Ser� bom, para variar... }
      }
      else { msg =$nick $chr(160) $cc $+ Silver $ct $+ - Se estiver cansado da $cc $+ Elite Four $ct $+ de $cc $+ Johto $+ $ct $+ , avise-me e voc� ter� uma batalha de verdade! Mod�stia parte, claro... }
    }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
}
alias c.search.Whirl_Island {
  if ($findtok(rocket:equipe:equipe rocket:team rocket:thief:thiefs:ladr�o:ladr�es,$1-,0,58)) && ($dados($nick,Quests,Rocket6) == 1) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Bunch $+ $ct $+ , chefe da atual equipe $cc $+ Rocket $+ $ct $+ .
    msg =$nick $chr(160) Bunch $ct $+ - N�o entendo, o que voc� est� procurando aqui? Esta $cc $+ Silver Feather $ct $+ � nossa! Com ela, poderemos finalmente despertar o t�o estimado $cc $+ Lugia $ct $+ e com ele dominaremos todo o mundo!
    msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para batalhar contra os membros da equipe ou ' $+ $cc $+ .nao $+ $ct $+ ' para fugir.
    set %confirm. [ $+ [ $nick ] ] RKT:7
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
}
alias c.search.Ruins_Of_Alph { .msg =$nick $ct $+ Nada foi encontrado. }
alias c.search.Tin_Tower { msg =$nick $ct $+ Nada foi encontrado. }
alias c.search.Whirl_Edge { msg =$nick $ct $+ Nada foi encontrado. }
