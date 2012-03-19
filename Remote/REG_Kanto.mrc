alias c.search.Pallet_Town {
  if ($1 == Oak) || ($1 == Professor) || ($1 == Prof Oak) { msg =$nick $ct $+ Acho que $cc $+ Prof Oak $ct $+ est� no laborat�rio. | return }
  elseif ($1 == Mom) || ($1 == Mam�e) || ($1 == Mae) || ($1 == M�e) {
    if ($start($nick)) {
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
            if ($dados($nick,Hoenn,League)) {
              if ($item($nick,Gold Ticket).qnt) {
                msg =$nick $chr(160) $cc $+ Mom $ct $+ - Ent�o vai viajar novamente? Divirta-se e mande sempre not�cias!
              }
              else { msg =$nick $chr(160) $cc $+ Mom $ct $+ - � bom ver que voc� est� desenvolvendo bastante suas habilidades, filho. Mam�e fica sempre preocupada, mas sei tamb�m que voc� se sair� bem em qualquer desafio. Ah, parece que desenvolveram um navio muito resistente em $cc $+ Hoenn $+ $ct $+ . Eu me pergunto quem conseguiria ter dinheiro o suficiente para investir nesse enorme navio... }
            }
            else {
              msg =$nick $chr(160) $cc $+ Mom $ct $+ - Divirta-se, filho!
              msg =$nick $chr(160) $cc $+ Mom $ct $+ - Mam�e sentir� saudades...
            }
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
  else { msg =$nick $ct $+ Nada foi encontrado. | return }
}
alias c.search.Viridian_City {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    if ($start($nick)) {
      if (!$dados($nick,$dados($nick,Info,Start),Badges).n) { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Ol�! Est� procurando um desafio de gin�sio em $cc $+ Viridian $+ $ct $+ ? Sinto muito, mas o gin�sio daqui est� fechado. O l�der desta cidade � um homem muito ocupado, voc� ter� sorte se um dia encontr�-lo para desafiar... Mas n�o se preocupe, tente outro desafio em $cc $+ Pewter City $+ $ct $+ . Com certeza ele estar� dispon�vel para voc� desafi�-lo! | return }
    }
    var %pk = $dados($nick,Team,1), %nat = $dados($nick,%pk,Nature), %x = 1
    while ($nstat(%x)) {
      var %stat = $nstat(%x)
      if ($getp(%nat,%stat) > 1) { var %plus = %stat }
      elseif ($getp(%nat,%stat) < 1) { var %minus = %stat }
      inc %x
    }
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Os pok�mon possuem tra�os de personalidade, sabia? � o que as $cc $+ natures $ct $+ significam. Por exemplo, deixe-me ver seu pok�mon...
    if (%plus) { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Seu pok�mon $cc $+ $dados($nick,%pk,Name) $ct $+ tem a nature $cc $+ %nat $+ $ct $+ , dando-lhe vantagem em $cc $+ $upper(%plus) $ct $+ e desvantagem em $cc $+ $upper(%minus) $+ $ct $+ . }
    else { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Seu pok�mon $cc $+ $dados($nick,%pk,Name) $ct $+ tem a nature $cc $+ %nat $+ $ct $+ , mas n�o provoca diferencia��o alguma em seus atributos. }
    return
  }
  elseif ($1 == Max) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Max $+ $ct $+ , um treinador.
    msg =$nick $chr(160) $cc $+ Max $ct $+ - Eu estava treinando meu Rattata bastante, at� ele poder aprender um golpe novo. Mas eu n�o sabia como ensin�-lo, e acho que voc� tamb�m n�o sabe. Bem, um pok�mon n�o aprende automaticamente um golpe quando seus $cc $+ quatro $ct $+ golpes est�o definidos. A partir da�, os novos golpes ficam em modo de espera e voc� pode ensin�-los quando quiser, apenas uma vez.
    msg =$nick $chr(160) $cc $+ Max $ct $+ - Para ensinar, digite, sem as aspas, " $+ $cc $+ .MoveSet <Pok�mon> <Slot> <Novo Golpe> $+ $ct $+ ". $cc $+ <pok�mon> $ct $+ � o seu pok�mon, $cc $+ <slot> $ct $+ � o slot do golpe, digite " $+ $cc $+ .Dados <pok�mon> $+ $ct $+ " para saber o slot do golpe que deseja substituir, e finalmente $cc $+ <novo golpe> $ct $+ � o golpe que voc� vai ensinar ao pok�mon.
  }
  elseif ($1 == Penny) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Penny $+ $ct $+ , uma treinadora.
    if ($start($nick)) {
      if ($dados($nick,Kanto,Badges).n) {
        if ($dados($nick,Quests,Penny)) { .msg =$nick $chr(160) $cc $+ Penny $ct $+ - Lembro-me ainda hoje que treinar meu Caterpie foi dif�cil, mesmo utilizando o item $cc $+ Macho Brace $+ $ct $+ . Ah, mas quando eu o evolui, n�o teve para ningu�m! }
        else { .msg =$nick $chr(160) $cc $+ Penny $ct $+ - Finalmente, meu Metapod evoluiu para Butterfree! N�o preciso mais usar este $cc $+ Macho Brace $+ $ct $+ , pois o mesmo deixa meu pok�mon bem mais lento. Voc� gostaria de ter este item? Ent�o pode ficar. | item.add $nick Macho Brace | msg =$nick $cc $+ $dados($nick,Info,Nick) $ct $+ ganhou o item $cc $+ Macho Brace $+ $ct $+ ! | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Penny 1 }
      }
      else { msg =$nick $chr(160) $cc $+ Penny $ct $+ - Meu Caterpie passou tantos leveis que j� pode evoluir para Metapod. Ali�s, voc� sabe como evoluir seu pok�mon? Se n�o souber o nome da sua evolu��o, digite apenas " $+ $cc $+ .Evoluir <pok�mon> $+ $ct $+ ", sem as aspas, � claro. Sabendo o nome da evolu��o, digite finalmente " $+ $cc $+ .Evoluir <pok�mon> <evolu��o> $+ $ct $+ ". No meu caso, para evoluir meu Caterpie, eu digito " $+ $cc $+ .Evoluir Caterpie Metapod $+ $ct $+ ". }
    }
    else { msg =$nick $chr(160) $cc $+ Penny $ct $+ - A cidade vizinha, em $cc $+ Pallet $+ $ct $+ , � onde novos treinadores come�am suas jornadas aqui em $cc $+ Kanto $+ $ct $+ . }
  }
  elseif ($1 == Giovanni) {
    if ($start($nick)) {
      if ($badge($nick,Earth Badge)) {
        if ($dados($nick,Quests,Giovanni) == No) { msg =$nick $cc $+ Giovanni $ct $+ n�o est� na cidade... }
        else {
          msg =$nick $ct $+ Voc� encontra-se com $cc $+ Giovanni $+ $ct $+ , l�der do gin�sio de Viridian.
          if ($dados($nick,Quests,Giovanni) == Ok) { msg =$nick $chr(160) $cc $+ Giovanni $ct $+ - Finalmente entendo que errei. Todo o dinheiro que ganhei de trabalhar junto � equipe $cc $+ Rocket $ct $+ foi entregue �s autoridades. Agora estou livre, tenho agora uma nova expectativa para o futuro. }
          else {
            msg =$nick $chr(160) $cc $+ Giovanni $ct $+ - N�o pode ser verdade, eu n�o posso estar errado...
            if ($dados($nick,Quests,League)) { msg =$nick $chr(160) $cc $+ Giovanni $ct $+ - Preciso... Preciso ter o melhor pok�mon do mundo! | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Giovanni No }
          }
        }
      }
      else {
        if ($dados($nick,Quests,Rocket3)) { msg =$nick $cc $+ Giovanni $ct $+ est� no gin�sio, aguardando seu desafio. }
        else { msg =$nick $ct $+ Nada foi encontrado. }
      }
    }
    else {
      if ($badge($nick,Earth Badge)) {
        msg =$nick $ct $+ Voc� encontra-se com $cc $+ Giovanni $+ $ct $+ , l�der do gin�sio de Viridian.
        msg =$nick $chr(160) $cc $+ Giovanni $ct $+ - Pok�mon n�o s�o como eu imaginava. Sinto muito por ter causado tantos problemas junto a equipe $cc $+ Rocket $+ $ct $+ . Hoje n�o trabalho mais com eles.
      }
      else { msg =$nick $cc $+ Giovanni $ct $+ est� no gin�sio, aguardando seu desafio. }
    }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
  return
}
alias c.search.Pewter_City {
  if ($1 == Joy) { msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center. | msg =$nick $chr(160) $cc $+ Joy $ct $+ - Aqui em Pewter, o l�der Brock usa pok�mon de pedra. Quer uma dica? Tente usar golpes do tipo $cc $+ Water $ct $+ ou $cc $+ Grass $ct $+ e voc� ter� uma vantagem contra ele. }
  elseif ($1 == Josh) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Josh $+ $ct $+ , um habitante da cidade.
    if ($badge($nick,Boulder Badge)) { msg =$nick $chr(160) $cc $+ Josh $ct $+ - Ei, parab�ns pela vit�ria contra $cc $+ Brock $+ $ct $+ ! Boa sorte! }
    else { msg =$nick $chr(160) $cc $+ Josh $ct $+ - Ei, voc� j� foi dar uma olhada no gin�sio da cidade? Cuidado, v� preparado. Afinal, voc� ter� que pagar para desafiar o l�der. }
  }
  elseif ($1 == Clara) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Clara $+ $ct $+ , uma habitante da cidade.
    if ($dados($nick,Quests,League)) { .msg =$nick $chr(160) $cc $+ Clara $ct $+ - Estou anciosa para saber se realmente existem s�mbolos antigos espalhados pelo mundo. Gostaria eu puder viajar por a�, em busca desses mist�rios... }
    else { msg =$nick $chr(160) $cc $+ Clara $ct $+ - Adoro visitar o museu de ci�ncia. Olhe s� todos esses f�sseis! Eu quero ser cientista quando crescer! }
  }
  elseif ($1 == Ben) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Ben $+ $ct $+ , um treinador.
    msg =$nick $chr(160) $cc $+ Ben $ct $+ - $cc $+ Moon Stone $+ $ct $+ ... Aqui diz que � um meteorito encontrado no $cc $+ Mt Moon $+ $ct $+ ... Para mim, � uma pedra como outra qualquer!
  }
  elseif ($1 == Brock) {
    if ($badge($nick,Boulder Badge)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Brock $+ $ct $+ , l�der do gin�sio de Pewter.
      if ($start($nick)) { msg =$nick $chr(160) $cc $+ Brock $ct $+ - Existem diversos tipos de treinadores no mundo. Voc� me parece um treinador nato. Quer uma sugest�o? V� para $cc $+ Cerulean City $ct $+ e teste suas habilidades. }
      else { msg =$nick $chr(160) $cc $+ Brock $ct $+ - Foi uma boa batalha, considerando que minha estrat�gia falhara muitas vezes. Boa sorte na liga de $cc $+ Kanto $+ $ct $+ . }
    }
    else { msg =$nick $cc $+ Brock $ct $+ est� no gin�sio, aguardando seu desafio. }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
  return
}
alias c.search.Mt_Moon {
  if ($1 == Rocket) && ($dados($nick,Quests,Rocket1)) && ($start($nick)) {
    if ($dados($nick,Quests,Rocket1) == Ok) { msg =$nick $ct $+ Aqueles ladr�es n�o est�o mais aqui... }
    else {
      msg =$nick $ct $+ Voc� encontra-se com membros da equipe $cc $+ Rocket $+ $ct $+ .
      msg =$nick $chr(160) $cc $+ Track $ct $+ (ROCKET) - Ei voc�! Est� querendo levar a $cc $+ Moon Stone $+ $ct $+ , �? Hahaha, � melhor voc� sair daqui ou eu vou ensin�-lo uma li��o!
      msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para batalhar ou ' $+ $cc $+ .nao $+ $ct $+ ' para sair do $cc $+ Mt Moon $+ $ct $+ . | set %confirm. [ $+ [ $nick ] ] RKT:1
    }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
  return
}
alias c.search.Cerulean_City {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    if ($dados($nick,Cascade Badge)) { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Dificil mesmo � encontrar fraquezas entre tantos pok�mon aqu�ticos diferentes. H� tantos, mas tantos deles neste mundo que � imposs�vel prever que estrat�gia o advers�rio vai utilizar. }
    else { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Ol�, � sua primeira vez aqui em Cerulean? Se for, lembre-se de passar no gin�sio da cidade. $cc $+ Misty $ct $+ usa pok�mon do tipo $cc $+ Water $+ $ct $+ , ser� que voc� consegue vencer a habilidade dela? }
  }
  elseif ($1 == Ronny) { msg =$nick $ct $+ Voc� encontra-se com $cc $+ Ronny $+ $ct $+ , um treinador. | msg =$nick $chr(160) $cc $+ Ronny $ct $+ - A Equipe Rocket causa muitos problemas aqui em $cc $+ Kanto $+ $ct $+ , � bom voc� ter cuidado. Eles costumam roubar dinheiro de treinadores, mas j� ouvi casos de furto de pok�mon. Que ladr�es! Algu�m devia fazer alguma coisa! }
  elseif ($1 == Giovanni) && ($dados($nick,Quests,Giovanni) == No) {
    if ($dados($nick,Quests,UD)) { msg =$nick $cc $+ Giovanni $ct $+ n�o est� mais na cidade... }
    else {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Giovanni $+ $ct $+ .
      msg =$nick $chr(160) $cc $+ Giovanni $ct $+ - Preciso capturar o melhor pok�mon do mundo! Com ele todos ter�o que se curvar diante da equipe $cc $+ Rocket $+ $ct $+ !
      msg =$nick $chr(160) $cc $+ Giovanni $ct $+ - $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , n�o se intrometa! Isso ser� perigoso, mesmo n�o gostando de voc� prefiro avis�-lo do perigo.
      msg =$nick $ct $+ Voc� v� $cc $+ Giovanni $ct $+ entrando na $cc $+ Unknown Dungeon $+ $ct $+ . | writeini pkp\cadastros\ $+ $nick $+ .ini Quests UD Ok
    }
  }
  elseif ($1 == Elliot) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Elliot $+ $ct $+ , um pescador.
    if ($start($nick)) {
      if ($item($nick,Good Rod).qnt) {
        if ($item($nick,Super Rod).qnt) { msg =$nick $chr(160) $cc $+ Elliot $ct $+ - Hahahaha... $cc $+ Super Rod $ct $+ � imbat�vel! }
        else {
          msg =$nick $chr(160) $cc $+ Elliot $ct $+ - Tem raz�o, nada pode superar a $cc $+ Super Rod $+ $ct $+ ! Fique com esta, gostei de voc�, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ !
          item.add $nick Super Rod | msg =$nick $chr(160) $cc $+ Elliot $ct $+ - Sua isca agora pode alcan�ar qualquer pok�mon aqu�tico! Prepare-se para encontrar alguns raros, hein!
        }
      }
      else { msg =$nick $chr(160) $cc $+ Elliot $ct $+ - N�o me pertube enquanto eu estiver pescando, por favor! }
    }
    else { msg =$nick $chr(160) $cc $+ Elliot $ct $+ - Gosto da maneira como pesco, n�o sou impaciente. Sei que mais cedo ou mais tarde, eu pegarei um pok�mon interessante! }
  }
  elseif ($1 == Bill) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Bill $+ $ct $+ , um pok�maniaco.
    if ($start($nick)) {
      if ($dados($nick,Quests,Bill1)) {
        if ($dados($nick,Quests,Anne)) {
          if ($dados($nick,Quests,Bill2)) {
            msg =$nick $chr(160) $cc $+ Bill $ct $+ - E como est� indo sua jornada? Ser� que voc� consegue derrotar a liga pok�mon?
            msg =$nick $chr(160) $cc $+ Bill $ct $+ - Se n�o sabe onde ela se localiza, digite ' $+ $cc $+ .Map $+ $ct $+ '. Veja, existe um caminho � esquerda de $cc $+ Viridian City $+ $ct $+ , que vai � $cc $+ Victory Road $+ $ct $+ . � s� seguir adiante e voc� chegar� ao $cc $+ Indigo Plateau $+ $ct $+ . | return
          }
          else {
            msg =$nick $chr(160) $cc $+ Bill $ct $+ - Gostou do $cc $+ SS Anne $+ $ct $+ ? Bem, quem sabe voc� ainda n�o viaje nele futuramente...
            msg =$nick $chr(160) $cc $+ Bill $ct $+ - Ah, $cc $+ Lanette $ct $+ e eu desenvolvemos o PC. A nova tecnologia � dela, mas eu iniciei o projeto. Voc� j� tem um $cc $+ PC $+ $ct $+ ?
            if ($item($nick,PC).qnt) {
              msg =$nick $chr(160) $cc $+ Bill $ct $+ - Ah, ent�o que tal um upgrade? Pode ficar com esta $cc $+ Great Box $+ $ct $+ . | box.add $nick 60
              msg =$nick $ct $+ Parab�ns, voc� ganhou uma $cc $+ Great Box $+ $ct $+ !
            }
            else {
              msg =$nick $chr(160) $cc $+ Bill $ct $+ - Oh, n�o?! Desculpe, eu deveria ter oferecido antes. Aqui est�. | item.add $nick PC | box.add $nick 30 | box.add $nick 30 | box.add $nick 30
              msg =$nick $ct $+ Parab�ns, voc� ganhou um $cc $+ PC $+ $ct $+ !
            }
            writeini pkp\cadastros\ $+ $nick $+ .ini Quests Bill2 Ok | return
          }
        }
        else { msg =$nick $chr(160) $cc $+ Bill $ct $+ - Pegue o $cc $+ SS Anne $ct $+ em $cc $+ Vermilion City $+ $ct $+ , e divirta-se! | return }
      }
      else {
        msg =$nick $chr(160) $cc $+ Bill $ct $+ - Ei, eu n�o sou um pok�mon! Isto � uma fantasia... Infelizmente acabei ficando preso a ela... Pode me ajudar?
        msg =$nick $chr(160) $cc $+ Bill $ct $+ - Obrigado! Ah, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , eu fui convidado para a inaugura��o de um cruzeiro que sair� de $cc $+ Vermilion City $+ $ct $+ , mas estou muito ocupado. Voc� pode ir no meu lugar?
        msg =$nick $cc $+ $dados($nick,Info,Nick) $ct $+ recebeu o $cc $+ convite $+ $ct $+ ! | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Bill1 Ok | return
      }
    }
    else {
      if ($dados($nick,Quests,Bill1)) {
        if ($earl.count($nick) == 17) {
          if ($dados($nick,Quests,Global)) { msg =$nick $chr(160) $cc $+ Bill $ct $+ - Hahaha, n�o achou que eu realmente apagaria todo o conte�do do PC, n�o � mesmo? Aproveite. A rede pode ser acessada de qualquer regi�o do mundo! }
          else {
            msg =$nick $chr(160) $cc $+ Bill $ct $+ - Inacredit�vel! Voc� conseguiu derrotar toda a liga de $cc $+ Johto $+ $ct $+ ! Orgulhe-se bastante disso, n�o � qualquer um...
            msg =$nick $chr(160) $cc $+ Bill $ct $+ - Tamb�m tenho uma novidade. $cc $+ Lanette $ct $+ e eu finalmente trabalhamos juntos e conseguimos interligar nossas redes atrav�s da moderna conex�o sem fio! Que tal se voc� experimentar tamb�m?
            var %x = 1 | while ($exists(pkp\box\ $+ $nick $+ \ $+ %x $+ .ini)) { writeini pkp\box\ $+ $nick $+ \ $+ %x $+ .ini Info Link Hoenn:Kanto:Johto | inc %x }
            msg =$nick $chr(160) $cc $+ Bill $ct $+ - Pronto. Acabei de formatar todo o conte�do das suas caixas. At� mais!
            writeini pkp\cadastros\ $+ $nick $+ .ini Quests Global $dados($nick,Info,Online)
          }
        }
        else {
          msg =$nick $chr(160) $cc $+ Bill $ct $+ - Por se tratar de apenas um prot�tipo, a $cc $+ $rtypebox(5) $ct $+ armazena poucos pok�mon... Bem, � dif�cil manter uma rede poderosa como essa se seus usu�rios sobrecarregam as caixas, certo? Err, esque�a...
          msg =$nick $chr(160) $cc $+ Bill $ct $+ - Mudando de assunto, como est� indo na liga de $cc $+ $dados($nick,Info,Region) $+ $ct $+ ?
        }
        return
      }
      else {
        msg =$nick $chr(160) $cc $+ Bill $ct $+ - Ol�, eu sou o $cc $+ Bill $+ $ct $+ . As pessoas me conhecem como pok�man�aco, mas tudo o que fa�o � colecionar pok�mon raros. Ora, quem n�o tem suas manias, afinal?
        msg =$nick $chr(160) $cc $+ Bill $ct $+ - Ah, voc� veio de $cc $+ $dados($nick,Info,Start) $+ $ct $+ ? J� fui convidado para um cruzeiro, mas n�o pude ir, estava muito ocupado...
        msg =$nick $chr(160) $cc $+ Bill $ct $+ - Hm, quer dizer ent�o que n�o consegue acessar as boxes de $cc $+ $dados($nick,Info,Start) $+ $ct $+ ... Espere, devo ter um prot�tipo de uma box por aqui, com uma cobertura bem maior... Achei!
        msg =$nick $ct $+ Parab�ns, voc� ganhou uma $cc $+ $rtypebox(5) $+ $ct $+ ! | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Bill1 Ok | box.add $nick 5 | return
      }
    }
  }
  elseif ($1 == Misty) {
    if ($badge($nick,Cascade Badge)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Misty $+ $ct $+ , l�der do gin�sio de Cerulean.
      if ($start($nick)) { msg =$nick $chr(160) $cc $+ Misty $ct $+ - Eu sempre gostei de pok�mon aqu�ticos desde o in�cio, e fiz o poss�vel para me especializar neles. Agora sei que ainda tenho muito o que aprender... }
      else { msg =$nick $chr(160) $cc $+ Misty $ct $+ - Ah! Eu sei que ainda tenho muito que aprender, mas algumas pessoas simplesmente j� possuem uma habilidade nata de treinar pok�mon... Estou falando de voc�, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! }
    }
    else { msg =$nick $cc $+ Misty $ct $+ est� no gin�sio, aguardando seu desafio. }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
  return
}
alias c.search.Underground_Path {
  var %region = $dados($nick,Info,Region)
  if ($findtok(Old Amber:f�ssil:fossil:Amber,$1-,0,58)) && ($dados($nick,Info,Path) == 1) {
    var %x = $readini(pkp\status.ini,%region,Item), %i = Old Amber
    if ($findtok(%x,%i,0,58)) {
      msg =$nick $ct $+ Voc� encontrou um f�ssil! Parab�ns, voc� ganhou o item $cc $+ %i $+ $ct $+ !
      item.add $nick %i | var %x = $remtok(%x,%i,1,58) | if (%x) { writeini pkp\status.ini %region Item %x } | else { remini pkp\status.ini %region Item }
    }
    else { msg =$nick $ct $+ Nada foi encontrado. | return }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
  return
}
alias c.search.Power_Plant { msg =$nick $ct $+ Nada foi encontrado. }
alias c.search.Vermilion_City {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , enfermeira do Pok�mon Center.
    if ($start($nick)) {
      if ($badge($nick,Thunder Badge)) { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Para entrar no gin�sio da cidade, � necess�rio cortar os arbustos. Seu pok�mon n�o consegue cortar? Bem, acho que o capit�o do $cc $+ SS Anne $ct $+ poder� ajud�-lo. }
      else { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Com a ins�gnea $cc $+ Thunder Badge $ct $+ voc� poder� usar a t�cnica $cc $+ Fly $ct $+ com seu pok�mon. }
    }
    else { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Bem vindo a Vermilion City! � seu primeiro dia em $cc $+ Kanto $+ $ct $+ ? Divirta-se! }
  }
  elseif ($1 == Thomas) && ($start($nick)) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Thomas $+ $ct $+ , o criador de pok�mon.
    if ($dados($nick,Clock,Thomas)) && ($calc($dados($nick,Info,Online) - $dados($nick,Clock,Thomas)) < 10800) { msg =$nick $chr(160) $cc $+ Thomas $ct $+ - � bom saber que poderemos negociar sempre, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Que tal outra hora? | return }
    if ($totalpokes($nick) > 1) {
      msg =$nick $chr(160) $cc $+ Thomas $ct $+ - Nossa! Seus pok�mon est�o incr�veis! Voc� gostaria de vender algum deles para mim? | msg =$nick $ct $+ Digite $cc $+ .sim $ct $+ para confirmar e $cc $+ .nao $ct $+ para rejeitar.
      set %confirm. [ $+ [ $nick ] ] THM | return
    }
    else { msg =$nick $chr(160) $cc $+ Thomas $ct $+ - Quando tiver mais pok�mon, venha e vamos fazer neg�cio. | return }
  }
  elseif ($1 == Lena) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Lena $+ $ct $+ , uma treinadora.
    msg =$nick $chr(160) $cc $+ Lena $ct $+ - Aqui em Vermilion h� um porto, e muitos treinadores de outros continentes come�am a liga de $cc $+ Kanto $ct $+ aqui.
    if ($start($nick)) { if ($dados($nick,Quests,League)) { var %l = 1 } } | elseif ($dados($nick,Kanto,League)) { var %l = 1 }
    if (%l) { msg =$nick $chr(160) $cc $+ Lena $ct $+ - Ei, n�o conte meu segredo a ningu�m! Outro dia estava caminhando em $cc $+ Diglett Cave $ct $+ e achei ter visto um objeto esquisito l�. Tentei pegar mas n�o consegui. Ser� que se trata de um dos s�mbolos? }
  }
  elseif ($1 == Cory) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Cory $+ $ct $+ , o marujo.
    if ($start($nick)) && (!$dados($nick,Quests,Anne)) {
      if ($dados($nick,Quests,Bill1)) {
        msg =$nick $chr(160) $cc $+ Cory $ct $+ - Voc� tem o $cc $+ convite $+ $ct $+ . Quer dizer que pode visitar o navio. Mas seja breve, porque est� prestes a partir. Deseja entrar no navio?
        msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar. | set %confirm. [ $+ [ $nick ] ] SHP:SS Anne
      }
      else {
        msg =$nick $chr(160) $cc $+ Cory $ct $+ - Ei, s� podem visitar o $cc $+ SS Anne $ct $+ quem for convidado!
        msg =$nick $chr(160) $cc $+ Cory $ct $+ - Hmm, $cc $+ Bill $ct $+ est� atrasado? Voc� o viu em $cc $+ Cerulean City $+ $ct $+ ?
      }
    }
    else {
      if ($dados($nick,$dados($nick,Info,Start),Badges).n == 8) {
        var %x = $dados($nick,Clock,Ship), %y = 0
        if (%x) { if ($calc($dados($nick,Info,Online) - %x) >= 21600) { var %y = 1 } } | else { var %y = 1 }
        if (%y) {
          if ($item($nick,Gold Ticket).qnt) && ($item($nick,Silver Ticket).qnt) {
            msg =$nick $chr(160) $cc $+ Cory $ct $+ - Oh, este � o $cc $+ Silver Ticket $ct $+ e o $cc $+ Gold Ticket $+ $ct $+ . Deseja embarcar no $cc $+ SS Anne $ct $+ ( $+ $cc $+ $travel.ship($nick,SS Anne) $+ $ct $+ ) ou no $cc $+ SS Tidal $ct $+ ( $+ $cc $+ $travel.ship($nick,SS Tidal) $+ $ct $+ ) $+ ?
            msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim <barco> $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar. | set %confirm. [ $+ [ $nick ] ] SHP:SS Anne;SS Tidal
          }
          elseif ($item($nick,Gold Ticket).qnt) {
            msg =$nick $chr(160) $cc $+ Cory $ct $+ - Oh, este � o $cc $+ Gold Ticket $+ $ct $+ . Deseja embarcar no $cc $+ SS Tidal $+ $ct $+ ?
            msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar. | set %confirm. [ $+ [ $nick ] ] SHP:SS Tidal
          }
          elseif ($item($nick,Silver Ticket).qnt) {
            msg =$nick $chr(160) $cc $+ Cory $ct $+ - Oh, este � o $cc $+ Silver Ticket $+ $ct $+ . Deseja embarcar no $cc $+ SS Anne $+ $ct $+ ?
            msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar. | set %confirm. [ $+ [ $nick ] ] SHP:SS Anne
          }
          else { msg =$nick $chr(160) $cc $+ Cory $ct $+ - Voc� n�o pode embarcar se n�o tiver uma passagem de navio. }
        }
        else { msg =$nick $chr(160) $cc $+ Cory $ct $+ - Argh! N�o h� barcos agora... Lembre-se que � preciso aguardar seis horas $cc $+ online $ct $+ para pegar um barco novamente... Neste momento, faltam aproximadamente $dur($calc(21600 - ($dados($nick,Info,Online) - %x)),$ct,$cc) $+ . }
      }
      else { msg =$nick $chr(160) $cc $+ Cory $ct $+ - N�o h� nenhum barco neste momento em $cc $+ Vermilion $+ $ct $+ . }
    }
    return
  }
  elseif ($1 == Surge) || ($1- == Lt.Surge) {
    if ($badge($nick,Thunder Badge)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Lt.Surge $+ $ct $+ , l�der do gin�sio de Vermilion.
      if ($start($nick)) {
        if ($badge($nick,Soul Badge)) && (!$item($nick,HM03).qnt) { msg =$nick $chr(160) $cc $+ Lt.Surge $ct $+ - Quer ensinar seus pok�mon a surfar, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ? Tudo bem, basta ensin�-los a t�cnica $cc $+ Surf $+ $ct $+ ! | msg =$nick $ct $+ Parab�ns, voc� ganhou o item $cc $+ HM03 $+ $ct $+ ! | item.add $nick HM03 }
        else { msg =$nick $chr(160) $cc $+ Lt.Surge $ct $+ - Durante a segunda guerra mundial, pok�mon el�tricos salvaram a minha vida. Desde ent�o, especializo-me no treinamento desse tipo de pok�mon, e hoje estou certo de que fiz a escolha certa! }
      }
      else { msg =$nick $chr(160) $cc $+ Lt.Surge $ct $+ - O que seria da vida humana sem a eletricidade? Hahaha, mon�tona? }
    }
    else { msg =$nick $cc $+ Lt.Surge $ct $+ est� no gin�sio, aguardando seu desafio. }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
  return
}
alias c.search.Diglett_Cave {
  if ($findtok(Symbol:Simbolo:S�mbolo,$1,0,58)) {
    if (!$dados($nick,Quests,Symbol)) { var %x = 0:0:0:0 | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Symbol %x }
    else { var %x = $dados($nick,Quests,Symbol) }
    var %n = 1
    if ($gettok(%x,%n,58)) { msg =$nick $ct $+ Este s�mbolo j� foi adquirido anteriormente. }
    else {
      if ($team.hm($nick,Earthquake) == Ok!) { writeini pkp\cadastros\ $+ $nick $+ .ini Quests Symbol $puttok(%x,1,%n,58) | msg =$nick $cc $+ Earth Symbol $ct $+ foi encontrado com sucesso. }
      else { msg =$nick $ct $+ Nada p�de ser encontrado. }
    }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
}
alias c.search.SS_Anne {
  if ($1 == Sammy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Sammy $+ $ct $+ , um treinador.
    if ($dados($nick,Info,Start) == Kanto) {
      msg =$nick $chr(160) $cc $+ Sammy $ct $+ - Estou ancioso para que este barco chegue ao seu destino. Mal posso esperar para ver esp�cies diferentes de pok�mon nessa nova regi�o!
      if (!$item($nick,HM01).qnt) { msg =$nick $chr(160) $cc $+ Sammy $ct $+ - Hm, este barco est� demorando... Ser� que h� algo de errado com o capit�o? }
    }
    else {
      if (!$dados($nick,Quests,SSAnne)) { writeini pkp\cadastros\ $+ $nick $+ .ini Quests SSAnne 0:0:0:0:0 }
      if ($gettok($dados($nick,Quests,SSAnne),1,58)) { msg =$nick $chr(160) $cc $+ Sammy $ct $+ - Este barco est� a caminho de $cc $+ $dados($nick,Info,Dest) $+ $ct $+ . J� visitou esse continente alguma vez? }
      else {
        msg =$nick $chr(160) $cc $+ Sammy $ct $+ - Ah! Treinador! Vamos por em pr�tica nossas habilidades!
        battle.npc $nick Trainer_Sammy | writeini pkp\cadastros\ $+ $nick $+ .ini Quests SSAnne $puttok($dados($nick,Quests,SSAnne),1,1,58)
      }
    }
  }
  elseif ($1 == Iris) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Iris $+ $ct $+ , uma treinadora.
    if ($dados($nick,Info,Start) == Kanto) {
      msg =$nick $chr(160) $cc $+ Iris $ct $+ - As vezes eu sinto n�uzeas ao viajar de barco... Espero ficar bem desta vez!
      if (!$item($nick,HM01).qnt) { msg =$nick $chr(160) $cc $+ Iris $ct $+ - Ah sim, se este barco desembarcar... }
    }
    else {
      if (!$dados($nick,Quests,SSAnne)) { writeini pkp\cadastros\ $+ $nick $+ .ini Quests SSAnne 0:0:0:0:0 }
      if ($gettok($dados($nick,Quests,SSAnne),2,58)) { msg =$nick $chr(160) $cc $+ Iris $ct $+ - � bom poder voltar a $cc $+ $dados($nick,Info,Dest) $+ $ct $+ ... Estava com saudades! }
      else {
        msg =$nick $chr(160) $cc $+ Iris $ct $+ - Voc� � um treinador pok�mon?
        battle.npc $nick Lady_Iris | writeini pkp\cadastros\ $+ $nick $+ .ini Quests SSAnne $puttok($dados($nick,Quests,SSAnne),1,2,58)
      }
    }
  }
  elseif ($1 == Evan) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Evan $+ $ct $+ , um treinador.
    if ($dados($nick,Info,Start) == Kanto) {
      msg =$nick $chr(160) $cc $+ Evan $ct $+ - Em meus livros, eu descubro muita coisa. Sabia que h� cavernas escondidas neste mundo? Eu queria encontrar todas elas!
      if (!$item($nick,HM01).qnt) { msg =$nick $chr(160) $cc $+ Evan $ct $+ - A mistura da minha ansiedade com o atraso deste navio n�o est� dando certo... }
    }
    else {
      if (!$dados($nick,Quests,SSAnne)) { writeini pkp\cadastros\ $+ $nick $+ .ini Quests SSAnne 0:0:0:0:0 }
      if ($gettok($dados($nick,Quests,SSAnne),3,58)) { msg =$nick $chr(160) $cc $+ Evan $ct $+ - Procurei bastante em $cc $+ Hoenn $ct $+ por cavernas secretas e n�o encontrei nada. Segundo meus livros, dois pok�mon s�o necess�rios. Estou voltando para pesquisar mais a respeito... }
      else {
        msg =$nick $chr(160) $cc $+ Evan $ct $+ - Est� atr�s de mist�rios tamb�m? Ent�o vamos batalhar!
        battle.npc $nick Trainer_Evan | writeini pkp\cadastros\ $+ $nick $+ .ini Quests SSAnne $puttok($dados($nick,Quests,SSAnne),1,3,58)
      }
    }
  }
  elseif ($1 == Norry) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Norry $+ $ct $+ , um marujo.
    if ($dados($nick,Info,Region) == Kanto) {
      if ($item($nick,HM01).qnt) { msg =$nick $chr(160) $cc $+ Norry $ct $+ - Adeus, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! | msg =$nick $ct $+ O navio $cc $+ SS Anne $ct $+ partiu... }
      else { msg =$nick $chr(160) $cc $+ Norry $ct $+ - Tudo bem, voc� pode desembarcar. Alias, n�o tenho certeza sobre que horas vamos partir... J� estamos atrasados. }
      writeini pkp\cadastros\ $+ $nick $+ .ini Info Locate Vermilion City | msg =$nick $ct $+ Voc� est� agora em $cc $+ $dados($nick,Info,Locate) $+ $ct $+ . | wlog user $nick Moved to $dados($nick,Info,Locate) $+ .
    }
    else {
      if (!$dados($nick,Quests,SSAnne)) { writeini pkp\cadastros\ $+ $nick $+ .ini Quests SSAnne 0:0:0:0:0 }
      if ($gettok($dados($nick,Quests,SSAnne),4,58)) {
        if ($dados($nick,Quests,Anne)) {
          msg =$nick $chr(160) $cc $+ Norry $ct $+ - Chegamos! Pode desembarcar agora, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ .
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
        else { msg =$nick $chr(160) $cc $+ Norry $ct $+ - Calma, ainda n�o pode desembarcar. Estamos perto de chegar ao nosso destino. }
      }
      else {
        msg =$nick $chr(160) $cc $+ Norry $ct $+ - Eu trabalho aqui no $cc $+ SS Anne $ct $+ como marujo. Encontrei muitos pok�mon diferentes em v�rias viagens, e um deles segurava isto...
        item.add $nick Leftovers | msg =$nick $ct $+ Parab�ns, voc� ganhou um $cc $+ Leftovers $+ $ct $+ ! | writeini pkp\cadastros\ $+ $nick $+ .ini Quests SSAnne $puttok($dados($nick,Quests,SSAnne),1,4,58)
      }
    }
  }
  elseif ($findtok(Captain:Capit�o:Capitao:Jay,$1,0,58)) {
    if ($dados($nick,Info,Region) == Kanto) {
      if ($dados($nick,Quests,Anne)) {
        msg =$nick $ct $+ Voc� encontra-se com $cc $+ Jay $+ $ct $+ , o capit�o do $cc $+ $dados($nick,Info,Locate) $+ $ct $+ .
        msg =$nick $chr(160) $cc $+ Jay $ct $+ - Ah, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Apresse-se! Estamos prestes a partir! Procure pelo marujo $cc $+ Norry $ct $+ para desembarcar.
      }
      else {
        if ($dados($nick,Quests,Gary2)) {
          msg =$nick $ct $+ Voc� encontra-se com $cc $+ Jay $+ $ct $+ , o capit�o do $cc $+ $dados($nick,Info,Locate) $+ $ct $+ .
          msg =$nick $chr(160) $cc $+ Jay $ct $+ - Coooffff... Coooffff... Arrrrrrrrghhh...
          msg =$nick $chr(160) $cc $+ Jay $ct $+ - Obrigado pela tapa nas costas, minha garganta realmente n�o anda muito bem...
          msg =$nick $chr(160) $cc $+ Jay $ct $+ - Ah sim, voc� precisa cortar arbustos? Ent�o � s� ensinar ao seu pok�mon o $cc $+ HM01 $+ $ct $+ !
          item.add $nick HM01 | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Anne Ok | msg =$nick $ct $+ Parab�ns, voc� ganhou o item $cc $+ HM01 $+ $ct $+ !
        }
        else {
          msg =$nick $chr(160) $cc $+ ??? $ct $+ - Espere!
          msg =$nick $chr(160) $cc $+ Gary $ct $+ - Sabia que era voc�, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Sabe quantos pok�mon eu j� capturei? Mais de 70 esp�cies diferentes! Hahahaha... Estou imbat�vel!
          battle.npc $nick Novice_Gary | sset [ [ B. ] $+ [ $checknickid($nick).ID ] $+ [ .Quest ] ] GARY2
        }
      }
    }
    else {
      if ($dados($nick,Quests,SSAnne) == 1:1:1:1:1) {
        msg =$nick $ct $+ Voc� encontra-se com $cc $+ Jay $+ $ct $+ , o capit�o do $cc $+ $dados($nick,Info,Locate) $+ $ct $+ .
        if ($dados($nick,Info,Dest) == Kanto) { var %l = Vermilion City } | elseif ($dados($nick,Info,Dest) == Hoenn) { var %l = Slateport City } | elseif ($dados($nick,Info,Dest) == Johto) { var %l = Olivine City }
        msg =$nick $chr(160) $cc $+ Jay $ct $+ - Hahaha, finalmente chegamos em $cc $+ %l $+ $ct $+ ! � sua primeira vez em $cc $+ $dados($nick,Info,Dest) $+ $ct $+ ? N�o fique nervoso, procure ajuda no centro pok�mon. Boa sorte!
        writeini pkp\cadastros\ $+ $nick $+ .ini Quests Anne Ok
      }
      else {
        if (!$dados($nick,Quests,SSAnne)) { writeini pkp\cadastros\ $+ $nick $+ .ini Quests SSAnne 0:0:0:0:0 }
        if ($gettok($dados($nick,Quests,SSAnne),5,58)) {
          msg =$nick $ct $+ Voc� encontra-se com $cc $+ Jay $+ $ct $+ , o capit�o do $cc $+ $dados($nick,Info,Locate) $+ $ct $+ .
          msg =$nick $chr(160) $cc $+ Jay $ct $+ - Ol�, est� gostando da viagem? Estamos perto de chegar, porque n�o d� uma explorada no navio enquanto isso?
        }
        else {
          msg =$nick $chr(160) $cc $+ ??? $ct $+ - Espere!
          msg =$nick $chr(160) $cc $+ Brendan $ct $+ - Sinto muito, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , mas n�o nos conhecemos ainda. Meu nome � Brendan, sou filho de Norman. Sim, l�der de Petalburg. Eu come�ei minha jornada h� pouco tempo e ja fiz bons progressos! Veja voc� mesmo!
          battle.npc $nick Brendan | sset [ [ B. ] $+ [ $checknickid($nick).ID ] $+ [ .Quest ] ] Brendan | writeini pkp\cadastros\ $+ $nick $+ .ini Quests SSAnne $puttok($dados($nick,Quests,SSAnne),1,5,58)
        }
      }
    }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
  return
}
alias c.search.Rock_Tunnel { msg =$nick $ct $+ Nada foi encontrado. }
alias c.search.Lavender_Town {
  if ($1 == Fuji) || ($1- == Mr Fuji) {
    if ($start($nick)) {
      if ($item($nick,Pok� Flute).qnt) { msg =$nick $ct $+ Voc� encontra-se com o senhor $cc $+ Fuji $+ $ct $+ , criador de pok�mon. | msg =$nick $chr(160) $cc $+ Fuji $ct $+ - Minha $cc $+ Pok� Flute $ct $+ ajudou-lhe em alguma coisa? }
      else { msg =$nick $ct $+ N�o consigo encontrar o senhor $cc $+ Fuji $+ $ct $+ ... }
    }
    else {
      msg =$nick $ct $+ Voc� encontra-se com o senhor $cc $+ Fuji $+ $ct $+ , criador de pok�mon.
      msg =$nick $chr(160) $cc $+ Fuji $ct $+ - Ol�, eu gosto de criar pok�mon que foram abandonados ou que est�o �rf�os. Eu sinto que estou fazendo o melhor por eles.
    }
  }
  elseif ($1 == Doug) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Doug $+ $ct $+ , um habitante da cidade.
    if ($start($nick)) { if ($dados($nick,Quests,League)) { var %l = 1 } } | elseif ($dados($nick,Kanto,League)) { var %l = 1 }
    if (%l) { msg =$nick $chr(160) $cc $+ Doug $ct $+ - Eu ouvi falar sobre a exist�ncia de quatro s�mbolos antigos, mas n�o pude encontrar nada. Acho que � preciso, al�m de muita sorte, fazer com que o pok�mon tenha um golpe... }
    else { msg =$nick $chr(160) $cc $+ Doug $ct $+ - Lavender � conhecida como p�lo de atra��o de almas de pok�mon. As almas dos pok�mon parecem se dirigir para a Pok�mon Tower. }
  }
  elseif ($1 == Anth) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Anth $+ $ct $+ , um habitante da cidade.
    if ($start($nick)) {
      if ($item($nick,Pok� Flute).qnt) { msg =$nick $chr(160) $cc $+ Anth $ct $+ - Ah, felizmente o senhor $cc $+ Fuji $ct $+ est� s�o e salvo agora. }
      else { msg =$nick $chr(160) $cc $+ Anth $ct $+ - Socorro! Eu vi aqueles ladr�es sequestrando o $cc $+ Fuji $ct $+ e levando-o � Pok�mon Tower! Algu�m precisa deter aqueles patifes! }
    }
    else { msg =$nick $chr(160) $cc $+ Anth $ct $+ - Eu gosto de visitar os pok�mon do senhor $cc $+ Fuji $+ $ct $+ , eles s�o t�o ador�veis... Ele sabe mesmo como criar um pok�mon! }
  }
  elseif ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Bem vindo a Lavender Town. Voc� deve estar sentindo algo estranho na atmosfera daqui, n�o � mesmo? Tudo bem, esta cidade � especial por atrair pok�mon fantasmas. N�o se assuste! S�o apenas pok�mon!
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
  return
}
alias c.search.Celadon_City {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Bem vindo a Celadon! Esta cidade � aben�oada por ter o gin�sio mais florido do mundo! Voc� poder� encontrar muitas garotas no gin�sio, todas s�o atra�das pelo incr�vel aroma emanado pelos pok�mon da l�der... Delicioso!
  }
  elseif ($1 == Julia) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Julia $+ $ct $+ , uma habitante da cidade.
    if ($start($nick)) { msg =$nick $chr(160) $cc $+ Julia $ct $+ - Voc� est� gostando da cidade? � impress�o minha ou o movimento daqui aumentou muito nos ultimos dias? N�o me refiro a voc�, mas sujeitos estranhos t�m transitado entre as cidades, vestidos com roupas pretas... Felizmente n�o houve nada de errado por aqui! }
    else { msg =$nick $chr(160) $cc $+ Julia $ct $+ - No passado, a equipe Rocket havia criado um esconderijo aqui no subsolo de Celadon. N�o consigo imaginar como eles fizeram isso sem que ningu�m percebesse... }
  }
  elseif ($1 == Rich) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Rich $+ $ct $+ , um treinador.
    if ($start($nick)) {
      if ($dados($nick,Quests,Rocket3)) { msg =$nick $chr(160) $cc $+ Rich $ct $+ - Ah! Bem que suspeitava que aquele guarda era um impostor! Maldita equipe Rocket, atrapalhando minha jornada... }
      else { msg =$nick $chr(160) $cc $+ Rich $ct $+ - Voc� foi barrado ao tentar passar para Saffron? Droga, eu tamb�m fui. Simplesmente n�o entendo e nem o guarda me deu explica��es. Hm, aquele sujeito parecia-me suspeito... Ser� que realmente era um guarda? }
    }
    else { msg =$nick $chr(160) $cc $+ Rich $ct $+ - Eu n�o confio em qualquer guarda que tenta me barrar. Desconfie tamb�m quando guardas n�o deixam voc� passar e nem sequer d�o uma explica��o! }
  }
  elseif ($1 == Andrea) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Andrea $+ $ct $+ , uma treinadora.
    if ($start($nick)) { msg =$nick $ct $+ Andrea $ct $+ - Eu comprei uma $cc $+ Thunderstone $ct $+ e evolui meu $cc $+ Pikachu $+ $ct $+ . Sim, h� pok�mon que s� evoluem usando pedras. N�o h� segredo, para evoluir um pok�mon com pedra, basta ter o item em sua mochila e utilizar o comando ' $+ $cc $+ .Evoluir $+ $ct $+ '... Simples assim! }
    else { msg =$nick $ct $+ Andrea $ct $+ - $cc $+ Lt.Surge $+ $ct $+ , l�der de Vermilion, tem um Raichu muito especial: ele sabe usar a t�cnica $cc $+ Surf $+ $ct $+ ! Quem dera o meu soubesse tamb�m... }
  }
  elseif ($1 == Lucas) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Lucas $+ $ct $+ , um treinador.
    if ($start($nick)) { msg =$nick $chr(160) $cc $+ Lucas $ct $+ - Eu comprei um pok�mon no market e ele est� mais forte que meus pok�mon! Sabe por qu�? � que pok�mon com $cc $+ ID $ct $+ diferente do treinador ganham mais $cc $+ EXP $ct $+ por batalha! Hahaha, acho que vou comprar mais pok�mon hoje! }
    else { msg =$nick $chr(160) $cc $+ Lucas $ct $+ - Esta � uma das melhores cidades de $cc $+ Kanto $+ $ct $+ , pois al�m de uma loja bem elaborada ainda h� um $cc $+ market $+ $ct $+ ! Voc� o conhece? }
  }
  elseif ($1 == Chad) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Chad $+ $ct $+ , um habitante.
    msg =$nick $chr(160) $cc $+ Chad $ct $+ - Ahhh... Estou viciado em apostar minhas moedas no cassino! Preciso de mais moedas, as minhas est�o acabando...
    if (!$dados($nick,Quests,Rocket2)) && ($start($nick)) { msg =$nick $chr(160) $cc $+ Chad $ct $+ - Ufa, finalmente aquele homem saiu. Seu olhar me intimidou... Alias, n�o o vi saindo pela porta. Pra onde ele foi afinal? }
  }
  elseif ($1 == Janice) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Janice $+ $ct $+ , uma treinadora.
    if ($dados($nick,Quests,Janice)) {
      msg =$nick $chr(160) $cc $+ Janice $ct $+ - Eu gostei desta cidade. Vou visit�-la mais vezes, e voc�?
    }
    else {
      msg =$nick $chr(160) $cc $+ Janice $ct $+ - Olha! Acho que estou com sorte! Ganhei mais moedas, hahahaha...
      if ($item($nick,Coin Case).qnt) {
        var %c = $dados($nick,Info,Coin), %r = $calc(%c + 50) | if (%r > 9999) { var %r = 9999 } | writeini pkp\cadastros\ $+ $nick $+ .ini Info Coin %r
        msg =$nick $chr(160) $cc $+ Janice $ct $+ - Tome estas moedas! Espero que voc� tamb�m tenha sorte! | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Janice Ok
      }
      else { msg =$nick $chr(160) $cc $+ Janice $ct $+ - Hm, quando conseguir um $cc $+ Coin Case $ct $+ eu vou dar-te algumas moedas, ok? }
      if (!$dados($nick,Quests,Rocket2)) && ($start($nick)) { msg =$nick $chr(160) $cc $+ Janice $ct $+ - Havia um homem muito estranho que contemplava aquele $cc $+ poster $ct $+ da parede. N�o sei onde ele foi parar. }
    }
  }
  elseif ($1 == Kay) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Kay $+ $ct $+ , a balconista do cassino.
    if ($item($nick,Coin Case).qnt) {
      msg =$nick $chr(160) $cc $+ Kay $ct $+ - Ol�, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Cada moeda custa $cc $+ $chr(36) $+ $getmoney($readini(pkp\status.ini,Active,Coin)) $+ $ct $+ . Voc� deseja trocar seu dinheiro por moedas?
      msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar. | set %confirm. [ $+ [ $nick ] ] COIN:Kay:1
    }
    else { msg =$nick $chr(160) $cc $+ Kay $ct $+ - N�o posso ajud�-lo... Voc� n�o pode comprar moedas se n�o tiver um $cc $+ Coin Case $+ $ct $+ ... }
  }
  elseif ($findtok(Poster:P�ster,$1,0,58)) && ($start($nick)) {
    if ($dados($nick,Quests,Poster)) { msg =$nick $ct $+ N�o h� mais nada al�m de um bot�o escondido neste p�ster. }
    else {
      msg =$nick $ct $+ Voc�, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , deu uma olhada no p�ster e achou um bot�o!
      msg =$nick $ct $+ Ao apert�-lo, uma passagem abriu no subsolo. Espere! Membros da equipe $cc $+ Rocket $ct $+ est�o ali! | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Poster Ok
    }
  }
  elseif ($1 == Rocket) && ($start($nick)) && ($dados($nick,Quests,Poster)) {
    if ($dados($nick,Quests,Rocket2)) { msg =$nick $ct $+ N�o h� mais nenhum membro da equipe $cc $+ Rocket $ct $+ nesta cidade. }
    else {
      msg =$nick $ct $+ Voc� entrou no $cc $+ Rocket Hideout $+ $ct $+ ! Membros da equipe $cc $+ Rocket $ct $+ est�o querendo batalhar com voc�.
      msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para batalhar ou ' $+ $cc $+ .nao $+ $ct $+ ' para fugir. | set %confirm. [ $+ [ $nick ] ] RKT:2
    }
  }
  elseif ($1 == Celena) {
    if ($start($nick)) {
      if ($item($nick,HM02).qnt) {
        if ($dados($nick,Quests,Celena)) { msg =$nick $cc $+ $dados($nick,Info,Nick) $ct $+ n�o conseguiu encontr�-la... }
        else {
          msg =$nick $ct $+ Voc� encontra-se com $cc $+ Celena $+ $ct $+ , escondida...
          msg =$nick $chr(160) $cc $+ Celena $ct $+ - Hey, depois que ensinar a t�cnica $cc $+ Fly $ct $+ ao seu pok�mon, digite " $+ $cc $+ .Fly $+ $ct $+ " para voar para localiza��es diversas, sem esperar tempo!
          msg =$nick $chr(160) $cc $+ Celena $ct $+ - Agora vou arrumar um novo esconderijo, espero que eu tenha sido �til! Hahaha, at�! | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Celena Ok
        }
      }
      else {
        msg =$nick $ct $+ Voc� finalmente encontrou $cc $+ Celena $+ $ct $+ !
        msg =$nick $chr(160) $cc $+ Celena $ct $+ - Nossa, como sabia que eu estava aqui?! Bem, n�o importa agora. Ensine a seus pok�mon a t�cnica $cc $+ Fly $+ $ct $+ .
        item.add $nick HM02 | msg =$nick $ct $+ Parab�ns, voc� ganhou o item $cc $+ HM02 $+ $ct $+ ! | msg =$nick $chr(160) $cc $+ Celena $ct $+ - Mas n�o conte a ningu�m sobre o meu esconderijo!
      }
    }
    else { msg =$nick $ct $+ Voc� encontra-se com $cc $+ Celena $+ $ct $+ , uma treinadora. | msg =$nick $chr(160) $cc $+ Celena $ct $+ - � divertido esconder-se de treinadores! Se pudesse, eu compraria uma casa bem isolada para morar. }
  }
  elseif ($findtok(Presente:Presente secreto:Gift:Hidden Gift,$1-,0,58)) && ($start($nick)) && ($dados($nick,Quests,Gift)) {
    if ($dados($nick,Quests,Gift) == Ok) { msg =$nick $ct $+ N�o h� mais presentes aqui... }
    else {
      var %x = Eevee
      msg =$nick $ct $+ Voc� encontrou um $cc $+ presente $+ $ct $+ ! Oh, � um pok�mon!
      if ($dados($nick,%x,Name)) { msg =$nick $ct $+ Voc� n�o p�de receb�-lo porque j� tem um pok�mon com o mesmo $cc $+ nome $ct $+ no time... | return }
      if ($dados($nick,Team,6)) { msg =$nick $ct $+ Voc� n�o p�de receb�-lo porque n�o h� espa�o em seu time! | return }
      msg =$nick $ct $+ Parab�ns! $cc $+ $dados($nick,Info,Nick) $ct $+ ganhou o pok�mon $cc $+ %x $+ $ct $+ !
      if (!$pokedex($nick,%x)) { .echo $pokedex($nick,%x).add } | addpoke $nick %x 30 30: $+ $dados($nick,Info,Locate) $+ :Poke  Ball
      writeini pkp\cadastros\ $+ $nick $+ .ini Quests Gift Ok
    }
    return
  }
  elseif ($1 == Erika) {
    if ($badge($nick,Rainbow Badge)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Erika $+ $ct $+ , l�der do gin�sio de Celadon.
      msg =$nick $chr(160) $cc $+ Erika $ct $+ - Eu adoro pok�mon do tipo planta. Al�m dos agrad�veis aromas, esses pok�mon possuem uma rela��o mais forte com a natureza. Sempre que algo est� errado, eles o demonstram com certa inquieta��o.
    }
    else { msg =$nick $cc $+ Erika $ct $+ est� no gin�sio, aguardando seu desafio. }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
  return
}
alias c.search.Saffron_City {
  if ($1 == Koji) && ($start($nick)) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Koji $+ $ct $+ , um lutador.
    if ($start($nick)) {
      if ($dados($nick,Quests,Rocket3)) {
        if ($badge($nick,Soul Badge)) {
          if ($item($nick,HM04).qnt) { msg =$nick $chr(160) $cc $+ Koji $ct $+ - Com $cc $+ Strength $+ $ct $+ , seu pok�mon poder� mover blocos de pedra livres no ch�o. }
          else { msg =$nick $chr(160) $cc $+ Koji $ct $+ - Hahaha, voc� conseguiu a ins�gnea! Parab�ns! Ent�o ensine $cc $+ Strength $ct $+ aos seus pok�mon tamb�m! | item.add $nick HM04 | msg =$nick $ct $+ Parab�ns, voc� ganhou o item $cc $+ HM04 $+ $ct $+ ! }
        }
        else { msg =$nick $chr(160) $cc $+ Koji $ct $+ - Nossa, n�o consegui derrotar a l�der com meus pok�mon, e eu achei que o golpe $cc $+ Strength $ct $+ daria conta dela... }
      }
      else { msg =$nick $chr(160) $cc $+ Koji $ct $+ - Quando esses ladr�es finalmente sairem da cidade, vou tentar ganhar a minha ins�gnea com $cc $+ Sabrina $+ $ct $+ . }
    }
    else { msg =$nick $chr(160) $cc $+ Koji $ct $+ - Finalmente consegui derrotar a $cc $+ Sabrina $+ $ct $+ ... Sabe qual foi a minha estrat�gia? $cc $+ Bulk Up $ct $+ $chr(43) $cc $+ Strength $+ $ct $+ ! }
  }
  elseif ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    if ($start($nick)) {
      if ($dados($nick,Quests,Rocket3)) { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Esta cidade finalmente est� livre da equipe $cc $+ Rocket $+ $ct $+ . Sabia que havia membros disfar�ados de guardas? }
      else { msg =$nick $chr(160) $cc $+ Joy $ct $+ - N�o entendo o que ocorre na cidade. Parece-me que foi tomada pela Equipe $cc $+ Rocket $+ $ct $+ ... Ningu�m pode entrar nem sair da cidade. Espero que algu�m fa�a algo para ajudar. }
    }
    else { msg =$nick $chr(160) $cc $+ Joy $ct $+ - Esta grande cidade possui uma das mais importantes empresas de produtos relacionados � pok�mon: a $cc $+ Silph Corporation $+ $ct $+ . Por�m, certa vez esta empresa foi v�tima da pr�pria fama: atraiu a Equipe $cc $+ Rocket $+ $ct $+ ... }
  }
  elseif ($findtok(President:Presidente:Silph,$1,0,58)) {
    if ($dados($nick,Info,Start) == Hoenn) { var %pf = Birch } | elseif ($dados($nick,Info,Start) == Kanto) { var %pf = Oak } | else { var %pf = Elm }
    var %dex = $dados($nick,Info,Pokedex), %n = $int($calc(%dex / 100))
    if ($start($nick)) {
      if ($dados($nick,Quests,Silph2)) {
        if (%n) {
          msg =$nick $ct $+ Voc� encontra-se com $cc $+ Silph $+ $ct $+ , o presidente da $cc $+ Silph Corp $+ $ct $+ .
          msg =$nick $chr(160) $cc $+ Silph $ct $+ - Hm, eu te dei uma $cc $+ Master Ball $ct $+ por ter derrotado a equipe $cc $+ Rocket $+ $ct $+ ? Nossa, fui muito generoso. N�o conte com isso de novo, a menos que fa�a por merecer! Hah!
          if (!$dados($nick,Quests,%pf $+ 1)) { writeini pkp\cadastros\ $+ $nick $+ .ini Quests $+(%pf,1) Ok }
          elseif (!$dados($nick,Quests,%pf $+ 2)) { writeini pkp\cadastros\ $+ $nick $+ .ini Quests $+(%pf,2) Ok }
          else { writeini pkp\cadastros\ $+ $nick $+ .ini Quests $+(%pf,3) Ok }
          remini pkp\cadastros\ $+ $nick $+ .ini Quests Silph2 | return
        }
      }
      if ($dados($nick,Quests,Rocket3)) {
        msg =$nick $ct $+ Voc� encontra-se com $cc $+ Silph $+ $ct $+ , o presidente da $cc $+ Silph Corp $+ $ct $+ .
        if ($dados($nick,Quests,Silph)) {
          if (!$dados($nick,Quests,League)) { msg =$nick $chr(160) $cc $+ Silph $ct $+ - N�o vou mentir para voc�, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ . H� sim outros itens que foram desenvolvidos pela $cc $+ Silph Corp $+ $ct $+ . Mas por quest�es �ticas, manterei-as em segredo. | return }
        }
        else {
          msg =$nick $chr(160) $cc $+ Silph $ct $+ - Estou impressionado... $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , como p�de derrot�-los simplesmente? N�o, n�o conte nada. Cada treinador deve manter suas estrat�gias em segredo at� a hora da batalha, certo?
          writeini pkp\cadastros\ $+ $nick $+ .ini Quests Silph Ok | item.add $nick Upgrade
          msg =$nick $chr(160) $cc $+ Silph $ct $+ - Fique, por favor, com este $cc $+ Upgrade $+ $ct $+ . N�o se engane, este item poder� evoluir um pok�mon inventado aqui mesmo na corpora��o: $cc $+ Porygon $+ $ct $+ . Boa sorte em sua jornada! | return
        }
      }
      else { msg =$nick $ct $+ N�o d� para entrar em $cc $+ Silph Corp $+ $ct $+ . H� membros da equipe $cc $+ Rocket $ct $+ na entrada... | return }
    }
    else {
      if (!$dados($nick,Quests,Silph)) {
        msg =$nick $chr(160) $cc $+ Silph $ct $+ - Ora ora, mas veja quem temos aqui em nossa corpora��o! Voc� � mesmo $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ...? Hah! Eu sabia. $cc $+ Prof %pf $ct $+ foi realmente muito fiel nos detalhes. | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Silph Ok | item.add $nick Upgrade
        msg =$nick $chr(160) $cc $+ Silph $ct $+ - Bem, soubemos de seu brilhante desempenho e decidimos assist�-lo quando poss�vel. Afinal de contas, tenho dinheiro o bastante para investir em quem eu quiser! Hah! Por favor, fique com este $cc $+ Upgrade $ct $+ e ser� poss�vel evoluir $cc $+ Porygon $+ $ct $+ . Aproveite! | return
      }
    }
    if (%n) && (!$dados($nick,Quests,%pf $+ %n)) {
      msg =$nick $chr(160) $cc $+ Silph $ct $+ - Acabo de falar com $cc $+ Prof %pf $ct $+ e fui comunicado de seu atual feito brilhante! Ora vamos, n�o seja modesto, diga-me...
      msg =$nick $chr(160) $cc $+ Silph $ct $+ - Exato! Voc� capturou no m�nimo $cc $+ $calc(%n * 100) $ct $+ pok�mon diferentes! � incr�vel! Sua coopera��o no estudo das esp�cies est� cada vez mais influente e grandiosa. Para esta ocasi�o, nada melhor que um item grandioso � altura de seu devido cr�dito.
      msg =$nick $ct $+ Parab�ns! Voc� ganhou uma $cc $+ Master Ball $+ $ct $+ ! | item.add $nick Master Ball | writeini pkp\cadastros\ $+ $nick $+ .ini Quests $+(%pf,%n) Ok
    }
    else {
      if ($item($nick,Master Ball).qnt) { msg =$nick $chr(160) $cc $+ Silph $ct $+ - Lembre-se que a $cc $+ Master Ball $ct $+ � a �nica capaz de capturar qualquer esp�cie de pok�mon sem dificuldades na batalha. Os materais usados para fabric�-la s�o t�o raros que praticamente esta pok�bola � desconhecida. De certa forma, � um al�vio. Os pok�mon n�o gostariam de saber que ter�amos uma ferramenta capaz de capturar at� o mais resistente deles! }
      else { msg =$nick $chr(160) $cc $+ Silph $ct $+ - Quer uma dica? Sempre que encontrar uma esp�cie de pok�mon que n�o estiver registrado em sua pok�dex, n�o se esque�a jamais de captur�-lo! Treinadores e pesquisadores pok�mon precisam trabalhar juntos para catalogar, se n�o todos, ao menos o m�ximo poss�vel de pok�mon existentes! }
    }
  }
  elseif ($1 == Koichi) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Koichi $+ $ct $+ , l�der do $cc $+ Fighting Dojo $+ $ct $+ .
    if ($start($nick)) {
      if ($dados($nick,Quests,Dojo)) {
        if ($dados($nick,Quests,Dojo) == Ok) {
          var %x = Hitmonchan:Hitmonlee | if ($dados($nick,$gettok(%x,1,58),Name)) { var %x = $remtok(%x,$gettok(%x,1,58),1,58) } | if ($dados($nick,$gettok(%x,2,58),Name)) { var %x = $remtok(%x,$gettok(%x,2,58),1,58) } | if ($dados($nick,Team,6)) { var %x = 0 }
          if (%x) {
            if ($gettok(%x,0,58) == 2) {
              msg =$nick $chr(160) $cc $+ Koichi $ct $+ - Parab�ns, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Como eu havia prometido, voc� ganhar� um pok�mon. Escolha qual destes vai querer: $cc $+ Hitmonchan $ct $+ ou $cc $+ Hitmonlee $+ $ct $+ .
              msg =$nick $ct $+ Digite o nome do pok�mon que voc� vai escolher. | set %getpk. [ $+ [ $nick ] ] %x
            }
            else {
              msg =$nick $chr(160) $cc $+ Koichi $ct $+ - Parab�ns, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Como eu havia prometido, este $cc $+ %x $ct $+ � seu.
              if (!$pokedex($nick,%x)) { .echo $pokedex($nick,%x).add } | addpoke $nick %x 30 30:Fighting Dojo:Poke  Ball | msg =$nick $ct $+ Parab�ns, $cc $+ $nick $ct $+ ganhou o pok�mon $cc $+ %x $+ $ct $+ ! | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Dojo Ok: $+ %x
            }
          }
          else { msg =$nick $chr(160) $cc $+ Koichi $ct $+ - Voc� tem muitos pok�mon em seu time, volte quando tiver espa�o dispon�vel para escolher meu pok�mon. }
        }
        elseif ($gettok($dados($nick,Quests,Dojo),1,58) == Ok) { var %x = $gettok($dados($nick,Quests,Dojo),2,58) | msg =$nick $chr(160) $cc $+ Koichi $ct $+ - Voc� escolheu $cc $+ %x $+ $ct $+ , um �timo pok�mon para se ter no time, sem d�vida. }
        else { msg =$nick $chr(160) $cc $+ Koichi $ct $+ - N�o haver� uma nova chance, treinador. Sinto muito, mas voc� tem potencial. Boa sorte! }
      }
      else {
        msg =$nick $chr(160) $cc $+ Koichi $ct $+ - Ent�o, visitante? Vai desafiar os lutadores do $cc $+ Fighting Dojo $+ $ct $+ ? Se vencer, ganhar� um pok�mon lutador.
        msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para aceitar ou ' $+ $cc $+ .nao $+ $ct $+ ' para recusar. | set %confirm. [ $+ [ $nick ] ] DOJ
      }
    }
    else { msg =$nick $chr(160) $cc $+ Koichi $ct $+ - $cc $+ Hitmonchan $ct $+ possui incr�veis habilidades com os punhos, enquanto que $cc $+ Hitmonlee $+ $ct $+ , nos p�s. S�o dois grandes lutadores e s�o membros do meu time, certamente! }
  }
  elseif ($1 == Rocket) && ($start($nick)) && (!$dados($nick,Quests,Rocket3)) {
    msg =$nick $ct $+ Membros da equipe $cc $+ Rocket $ct $+ perceberam sua presen�a na $cc $+ Silph Corp $+ $ct $+ !
    msg =$nick $ct $+ O que deseja fazer? Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para batalhar contra eles ou ' $+ $cc $+ .nao $+ $ct $+ ' para escapar. | set %confirm. [ $+ [ $nick ] ] RKT:3
  }
  elseif ($1 == Amanda) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Amanda $+ $ct $+ , uma habitante da cidade.
    if ($start($nick)) {
      if ($dados($nick,Quests,Rocket3)) {
        if ($item($nick,Coin Case).qnt) { msg =$nick $chr(160) $cc $+ Amanda $ct $+ - E pensar que j� perdi muito dinheiro para a equipe $cc $+ Rocket $+ $ct $+ ... Isso me deixa aborrecida. }
        else { msg =$nick $chr(160) $cc $+ Amanda $ct $+ - Nunca mais vou no cassino, est� decidido! N�o quero fazer nada que possa beneficar a equipe $cc $+ Rocket $+ $ct $+ . Pegue isto. | item.add $nick Coin Case | msg =$nick $ct $+ Parab�ns, $cc $+ $dados($nick,Info,Nick) $ct $+ ganhou um $cc $+ Coin Case $+ $ct $+ ! | msg =$nick $chr(160) $cc $+ Amanda $ct $+ - Naquele jogo de azar eu n�o jogarei mais! }
      }
      else { msg =$nick $chr(160) $cc $+ Amanda $ct $+ - O que? � verdade que havia um esconderijo secreto da equipe $cc $+ Rocket $ct $+ no subsolo do cassino de $cc $+ Celadon $+ $ct $+ ?! Estou pasma... }
    }
    else {
      if ($item($nick,Coin Case).qnt) { msg =$nick $chr(160) $cc $+ Amanda $ct $+ - E pensar que j� perdi muito dinheiro para a equipe $cc $+ Rocket $+ $ct $+ ... Isso me deixa aborrecida. }
      else { msg =$nick $chr(160) $cc $+ Amanda $ct $+ - Eu tenho um $cc $+ Coin Case $ct $+ e costumava jogar em $cc $+ Celadon City $+ $ct $+ , no cassino. Mas quando descobri que a equipe $cc $+ Rocket $ct $+ fica com os lucros daqueles jogos, eu decidi que preciso me livrar disto agora mesmo! Tome, pode ficar. | item.add $nick Coin Case | msg =$nick $ct $+ Parab�ns, $cc $+ $dados($nick,Info,Nick) $ct $+ ganhou um $cc $+ Coin Case $+ $ct $+ ! | msg =$nick $chr(160) $cc $+ Amanda $ct $+ - Lembre-se do que eu falei, e fa�a o que voc� quiser. N�o me meto mais em jogos de azar... }
    }
  }
  elseif ($1 == Sabrina) {
    if ($badge($nick,Marsh Badge)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Sabrina $+ $ct $+ , l�der do gin�sio de Saffron.
      if ($start($nick)) {
        if ($item($nick,HM02).qnt) { msg =$nick $chr(160) $cc $+ Sabrina $ct $+ - Eu sempre soube que a equipe $cc $+ Rocket $ct $+ estava atacando a $cc $+ Silph Corp $+ $ct $+ , mas previ tamb�m que voc� viria ajudar. }
        else { msg =$nick $chr(160) $cc $+ Sabrina $ct $+ - Consigo captar a presen�a de uma jovem em $cc $+ Celadon City $ct $+ que se esconde... Seu nome � $cc $+ Celena $+ $ct $+ . }
      }
      else { msg =$nick $chr(160) $cc $+ Sabrina $ct $+ - Tive problemas na inf�ncia em controlar meus poderes ps�quicos, mas hoje consigo control�-los perfeitamente. A telepatia e o teletransporte s�o habilidades ps�quicas que aprendi ao longo do meu desenvolvimento. }
    }
    else { msg =$nick $cc $+ Sabrina $ct $+ est� no gin�sio, aguardando seu desafio. }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
  return
}
alias c.search.Seafoam_Island { msg =$nick $ct $+ Nada foi encontrado. }
alias c.search.Fuchsia_City {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Bem vindo, treinador! Esta cidade � privilegiada por ter uma $cc $+ Safari Zone $+ $ct $+ ! Muitas esp�cies raras de pok�mon podem ser encontradas l�.
  }
  elseif ($1 == Lucas) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Lucas $+ $ct $+ , um treinador.
    if ($start($nick)) { msg =$nick $chr(160) $cc $+ Lucas $ct $+ - Nossa n�o sabia que havia limite de pok�bolas usadas na $cc $+ Safari Zone $+ $ct $+ , sen�o teria usado minhas $cc $+ Ultra Ball $+ $ct $+ ! }
    else { msg =$nick $chr(160) $cc $+ Lucas $ct $+ - Ahhh... Perdi um $cc $+ Chansey $+ $ct $+ ... Acho que nunca vou encontr�-lo de novo... }
  }
  elseif ($1 == Cooper) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Cooper $+ $ct $+ , um treinador.
    if ($start($nick)) { msg =$nick $chr(160) $cc $+ Cooper $ct $+ - Meus pok�mon agora podem usar a t�cnica $cc $+ Surf $+ $ct $+ , pois j� possuo a ins�gnea $cc $+ Soul Badge $+ $ct $+ . Queria que algum pok�mon meu fosse como o $cc $+ Raichu $ct $+ de $cc $+ Lt.Surge $+ $ct $+ ... }
    else { msg =$nick $chr(160) $cc $+ Cooper $ct $+ - Meus pok�mon j� conseguem usar a t�cnica $cc $+ Surf $+ $ct $+ ! Acho que vou visitar a $cc $+ Seafoam Island $+ $ct $+ . }
  }
  elseif ($1 == Ann) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Ann $+ $ct $+ , uma habitante.
    msg =$nick $chr(160) $cc $+ Ann $ct $+ - Droga, queria ter uma bicicleta! Ouvi falar que na $cc $+ Cycling Road $ct $+ h� um pok�mon dorminhoco. Queria captur�-lo.
  }
  elseif ($1 == Koga) {
    if ($badge($nick,Soul Badge)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Koga $+ $ct $+ , l�der do gin�sio de Fuchsia.
      if ($start($nick)) { msg =$nick $chr(160) $cc $+ Koga $ct $+ - A liga pok�mon localiza-se em $cc $+ Indigo Plateau $+ $ct $+ . S� os melhores comp�em a $cc $+ Elite Four $+ $ct $+ . }
      else { msg =$nick $chr(160) $cc $+ Koga $ct $+ - Ensino a meus disc�pulos como envenenar dolorosamente seus advers�rios e venc�-los sem dificuldades. }
    }
    else { msg =$nick $cc $+ Koga $ct $+ est� no gin�sio, aguardando seu desafio. }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
  return
}
alias c.search.Cinnabar_Island {
  var %region = $dados($nick,Info,Region)
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , enfermeira do Pok�mon Center.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - $cc $+ Cinnabar Island $ct $+ � banhada pelo vasto oceano e � muito conhecida pelo seu famoso laborat�rio. No passado, havia tamb�m uma mans�o que estudava os pok�mon, mas agora s� resta as suas cinzas.
  }
  elseif ($1 == Wade) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Wade $+ $ct $+ , um pescador.
    if ($start($nick)) && (!$item($nick,Old Rod).qnt) { msg =$nick $chr(160) $cc $+ Wade $ct $+ - Voc� nunca pescou na vida? Sinto que preciso ajud�-lo, pode ficar com esta $cc $+ Old Rod $+ $ct $+ ! | item.add $nick Old Rod | msg =$nick $ct $+ Parab�ns, voc� ganhou o item $cc $+ Old Rod $+ $ct $+ ! | msg =$nick $chr(160) $cc $+ Wade $ct $+ - Para pescar, digite ' $+ $cc $+ .Item USE Old Rod $+ $ct $+ ' e inicie uma batalha com pok�mon selvagem. }
    elseif ($start($nick)) { msg =$nick $chr(160) $cc $+ Wade $ct $+ - Admito que a $cc $+ Old Rod $ct $+ n�o � muito boa, mas eu n�o podia dar tamb�m a minha vara de pescar. | if (!$item($nick,Good Rod)) { msg =$nick $chr(160) $cc $+ Wade $ct $+ - Conhece o pescador $cc $+ Ronald $+ $ct $+ ? Ele costuma pescar em $cc $+ Coral Bridge $+ $ct $+ . Talvez ele tenha uma vara de pescar melhor. } }
    else { msg =$nick $chr(160) $cc $+ Wade $ct $+ - Eu n�o sei quem inventou que pescador tem fama de mentiroso! Posso jurar que vi um Gyarados vermelho outro dia, acredita em mim? Eu disse Gyarados, n�o Magikarp... }
  }
  elseif ($1 == Amara) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Amara $+ $ct $+ , uma treinadora.
    msg =$nick $chr(160) $cc $+ Amara $ct $+ - $cc $+ Pok�mon House $ct $+ era palco de in�meras pesquisas envolvendo pok�mon, mas uma delas destruiu o pr�prio laborat�rio. N�o consigo imaginar o que eles pesquisavam ali.
    msg =$nick $chr(160) $cc $+ Amara $ct $+ - Atualmente, h� outro laborat�rio na cidade e muitos pesquisadores frequentam este lugar. � que foi criado a $cc $+ Ressurection Machine $+ $ct $+ , ou simplesmente m�quina de ressurei��o, que traz f�sseis de volta a vida. � impressionante!
  }
  elseif ($1 == Claire) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Claire $+ $ct $+ , uma habitante.
    msg =$nick $chr(160) $cc $+ Claire $ct $+ - Alguns anos ap�s o incidente da $cc $+ Pok�mon House $ct $+ eu vim morar aqui. A casa virou habitat para diversos pok�mon. � estranho, mas a estrutura da casa continua firme, embora a maioria dela esteja em cinzas.
  }
  elseif ($1 == Blaine) {
    if ($badge($nick,Volcano Badge)) {
      msg =$nick $ct $+ Voc� encontra-se com $cc $+ Blaine $+ $ct $+ , l�der do gin�sio de Cinnabar.
      msg =$nick $chr(160) $cc $+ Blaine $ct $+ - Certa vez fiquei perdido nas montanhas, felizmente estava bem. Quando anoiteceu, um p�ssaro de fogo apareceu e com sua luz consegui encontrar meu caminho para descer.
      if ($dados($nick,Quests,League)) && (!$findtok($dados($nick,%region,Visited),Mt Ember,0,58)) {
        msg =$nick $chr(160) $cc $+ Blaine $ct $+ - Voc� deveria visitar o lugar, � uma pequena ilha pr�xima daqui. Chama-se $cc $+ Mt Ember $+ $ct $+ . A �nica forma de chegar at� l� � usando $cc $+ Fly $+ $ct $+ . A localiza��o j� est� marcada no mapa, boa sorte!
        if ($dados($nick,%region,Visited)) { writeini pkp\cadastros\ $+ $nick $+ .ini %region Visited $dados($nick,%region,Visited) $+ :Mt Ember }
        else { writeini pkp\cadastros\ $+ $nick $+ .ini %region Visited Mt Ember }
      }
    }
    else { msg =$nick $cc $+ Blaine $ct $+ est� no gin�sio, aguardando seu desafio. }
  }
  elseif ($1 == Phil) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Phil $+ $ct $+ , um cientista famoso.
    msg =$nick $chr(160) $cc $+ Phil $ct $+ - Voc� provavelmente j� deve ter me visto em alguma revista. Sou realmente muito famoso, e posso ressucitar qualquer f�ssil com a $cc $+ Ressurection Machine $+ $ct $+ !
    if ($item($nick,Old Amber).qnt) {
      if (!$dados($nick,Aerodactyl,Name)) && (!$dados($nick,Team,6)) { item.rem $nick Old Amber | if (!$pokedex($nick,Aerodactyl)) { .echo $pokedex($nick,Aerodactyl).add } | addpoke $nick Aerodactyl 30 30:Ressurection Machine:Poke  Ball | msg =$nick $ct $+ Parab�ns, $cc $+ $dados($nick,Info,Nick) $ct $+ ganhou o pok�mon $cc $+ Aerodactyl $+ $ct $+ ! }
      else { msg =$nick $chr(160) $cc $+ Phil $ct $+ - Voc� provavelmente deseja ressucitar seu $cc $+ Old Amber $+ $ct $+ . Ent�o libere espa�o no time para ganhar o pok�mon. }
    }
    elseif ($item($nick,Unknown Gene).qnt) {
      if (!$dados($nick,Team,6)) {
        var %pk.list = Deoxys:Deoxys.E:Deoxys.F:Deoxys.L, %x = 1
        while ($gettok(%pk.list,%x,58)) {
          var %pk = $gettok(%pk.list,%x,58)
          if ($dados($nick,%pk,Name)) || ($pokedex($nick,%pk)) { var %pk.list = $remtok(%pk.list,%pk,58) }
          else { inc %x }
        }
        if (%pk.list) {
          item.rem $nick Unknown Gene, %x = $rand(1,$gettok(%pk.list,0,58)), %pk = $gettok(%pk.list,%x,58)
          if (!$pokedex($nick,%pk)) { .echo $pokedex($nick,%pk).add } | addpoke $nick %pk 40 40:Ressurection Machine:Poke  Ball | msg =$nick $ct $+ Parab�ns, $cc $+ $dados($nick,Info,Nick) $ct $+ ganhou o pok�mon $cc $+ %pk $+ $ct $+ !
        }
        else {
          msg =$nick $chr(160) $cc $+ Phil $ct $+ - N�o consegui! Que incr�vel! Esta � a primeira vez que acontece!
        }
      }
      else { msg =$nick $chr(160) $cc $+ Phil $ct $+ - Voc� provavelmente deseja ressucitar seu $cc $+ Unknown Gene $+ $ct $+ . Ent�o libere espa�o no time para ganhar o pok�mon. }
    }
    else { msg =$nick $chr(160) $cc $+ Phil $ct $+ - F�sseis como $cc $+ Old Amber $ct $+ podem ser ressucitados pela minha m�quina. }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
  return
}
alias c.search.Mt_Ember {
  if ($findtok(Symbol:Simbolo:S�mbolo,$1,0,58)) {
    if (!$dados($nick,Quests,Symbol)) { var %x = 0:0:0:0 | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Symbol %x }
    else { var %x = $dados($nick,Quests,Symbol) }
    var %n = 4
    if ($gettok(%x,%n,58)) { msg =$nick $ct $+ Este s�mbolo j� foi adquirido anteriormente. }
    else {
      if ($team.hm($nick,Fire Spin) == Ok!) { writeini pkp\cadastros\ $+ $nick $+ .ini Quests Symbol $puttok(%x,1,%n,58) | msg =$nick $cc $+ Fiery Symbol $ct $+ foi encontrado com sucesso. }
      else { msg =$nick $ct $+ Nada p�de ser encontrado. }
    }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
}
alias c.search.Coral_Bridge {
  if ($1 == Ronald) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Ronald $+ $ct $+ , um pescador.
    if ($start($nick)) {
      if ($item($nick,Old Rod).qnt) {
        if ($item($nick,Good Rod).qnt) { msg =$nick $chr(160) $cc $+ Ronald $ct $+ - Bem, a $cc $+ Good Rod $ct $+ s� � superada mesmo pela $cc $+ Super Rod $+ $ct $+ ! Nada consegue ser mais eficaz que ela! Quando $cc $+ Elliot $ct $+ mostrou-me seu desempenho, admito que fiquei com inveja... }
        else {
          msg =$nick $chr(160) $cc $+ Ronald $ct $+ - Ahhh, ent�o voc� quer pescar de forma mais profissional, certo? Tudo bem, esta $cc $+ Good Rod $ct $+ resolver� seus problemas!
          item.add $nick Good Rod | msg =$nick $chr(160) $cc $+ Ronald $ct $+ - Sua isca pode alcan�ar pok�mon que ficam em �guas mais fundas do que pescando com uma $cc $+ Old Rod $+ $ct $+ ...
        }
      }
      else { msg =$nick $chr(160) $cc $+ Ronald $ct $+ - Espere, estou pescando agora! Alias, quem � voc� mesmo? }
    }
    else { msg =$nick $chr(160) $cc $+ Ronald $ct $+ - $cc $+ Coral Bridge $ct $+ � um �timo lugar para pescar! Minha $cc $+ Good Rod $ct $+ � suficientemente capaz de me deixar satisfeito! }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
  return
}
alias c.search.Cycling_Road {
  if ($findtok(Pok�mon:pokemon:dorminhoco:dormindo:sleep:dorme:snorlax,$1,0,58)) {
    var %x = $readini(pkp\status.ini,$dados($nick,Info,Region),Legendary)
    if ($findtok(%x,Snorlax,0,58)) {
      if ($dados($nick,Quests,Snorlax)) { msg =$nick $ct $+ N�o h� pok�mon dormindo nesta localiza��o. }
      else {
        msg =$nick $ct $+ Voc� encontrou o pok�mon $cc $+ Snorlax $ct $+ dormindo na estrada!
        if (!$item($nick,Pok� Flute).qnt) { msg =$nick $ct $+ Ele est� dormindo... N�o h� como acord�-lo! | return }
        if ($rini(cadastros,$nick,Snorlax,Name)) { msg =$nick $ct $+ Voc� n�o pode batalhar agora, porque voc� j� tem um pok�mon com o mesmo nome no time. | return }
        if ($totalpokes($nick) == 6) { msg =$nick $ct $+ Voc� n�o pode batalhar agora, porque voc� j� tem seis pok�mon no time. | return }
        if ($appeared(Snorlax)) { msg =$nick $ct $+ Parece que h� um treinador batalhando com $cc $+ Snorlax $ct $+ neste momento! | return }
        writeini pkp\cadastros\ $+ $nick $+ .ini Quests Snorlax Ok | msg =$nick $cc $+ $dados($nick,Info,Nick) $ct $+ est� tocando sua $cc $+ Pok� Flute $+ $ct $+ !
        .echo $addpoke($nick,Snorlax,40,40: $+ $dados($nick,Info,Locate)).wild | b.create.fila $nick $rini(cadastros,$nick,Team,1) | var %ID = $checknickid($nick).id | b.join %ID Wild | sset [ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ 1 ] $+ ] : ] $+ [ 2 ] ] $getteam($nick,Snorlax)
        sset [ [ B. ] $+ [ %ID ] $+ [ .Auto ] ] ON | sset [ [ B. ] $+ [ %ID ] $+ [ .Wild ] ] ON | sset [ [ B. ] $+ [ %ID ] $+ [ .Ball ] ] 10 | sset [ [ B. ] $+ [ %ID ] $+ [ .PPUp ] ] ON | b.start.fight %ID
      }
    }
    else { msg =$nick $ct $+ N�o h� pok�mon dormindo nesta localiza��o. }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
  return
}
alias c.search.Victory_Road { msg =$nick $ct $+ Nada foi encontrado. }
alias c.search.Indigo_Plateau {
  if ($1 == Joy) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Joy $+ $ct $+ , a enfermeira do Pok�mon Center.
    msg =$nick $chr(160) $cc $+ Joy $ct $+ - Bem vindo a $cc $+ $dados($nick,Info,Locate) $+ $ct $+ ! Apenas grandes treinadores conseguem chegar aqui. Ganhar todas as ins�gneas n�o � uma tarefa f�cil, mas infelizmente ganhar da $cc $+ Elite Four $ct $+ � pior ainda! Bem, boa sorte!
  }
  elseif ($1 == Mazon) && (!$dados($nick,Quests,Mazon)) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Mazon $+ $ct $+ , um velho historiador.
    var %s = $dados($nick,Quests,Symbol)
    if (%s) {
      if ($findtok(%s,1,0,58) == 4) {
        msg =$nick $chr(160) $cc $+ Mazon $ct $+ - Ah, ent�o voc� adquiriu os quatro s�mbolos! Devo admitir que eu jamais conseguiria ser t�o habilidoso neste aspecto. Parab�ns! Estes s�mbolos foram usados por civiliza��es muito antigas para descrever o equil�brio da natureza. Esta foi talvez a primeira demonstra��o da escrita humana. O conv�vio com pok�mon que se apresentavam em diferentes formas provavelmente despertou este interesse humano em rela��o � comunica��o. Por enquanto, trata-se apenas de hip�teses. As pessoas certamente acham muito dif�cil de acreditar que os pok�mon poderiam ter ensinado aos homens muito mais do que o conv�vio em harmonia com a natureza, mas atividades complexas como ler e escrever.
        msg =$nick $chr(160) $cc $+ Mazon $ct $+ - H� pouco tempo atr�s, uma regi�o conhecida como $cc $+ Ruins Of Alph $+ $ct $+ , ou ru�nas do alfabeto, foi localizada em $cc $+ Johto $+ $ct $+ . At� onde eu sei, fica nas proximidades de $cc $+ Violet City $ct $+ e provavelmente � o �nico lugar onde as palavras ocultas destes pok�mon simb�licos foram preservadas. Acredito agora que, juntamente com estes s�mbolos, encontrarei uma forma de entrar naquelas ru�nas. Preciso partir agora, nos encontraremos em $cc $+ Johto $+ $ct $+ !
        writeini pkp\cadastros\ $+ $nick $+ .ini Quests Mazon 1
      }
      else { msg =$nick $chr(160) $cc $+ Mazon $ct $+ - Parab�ns, parece que voc� est� indo na dire��o certa. Mas lembre-se, at� onde eu sei, apenas quatro s�mbolos foram feitos. Estou muito entusiasmado com estas novas descobertas, ent�o fa�a o favor de mostrar-me todos estes artefatos quando voc� encontr�-los. }
    }
    else { msg =$nick $chr(160) $cc $+ Mazon $ct $+ - Em meus �ltimos anos de estudo, descobri que existem quatro s�mbolos pr�-hist�ricos que representam os quatro elementos da natureza: $cc $+ �gua $+ $ct $+ , $cc $+ Fogo $+ $ct $+ , $cc $+ Terra $ct $+ e $cc $+ Ar $+ $ct $+ . Segundo as escrituras que descreviam estes s�mbolos, os mesmos t�m uma intr�seca rela��o entre seres humanos e pok�mon m�sticos. }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
  return
}
alias c.search.Unknown_Dungeon {
  if ($findtok(Giovanni:Mewtwo,$1,0,58)) && ($dados($nick,Quests,Giovanni) == No) {
    msg =$nick $ct $+ Voc� encontra-se com $cc $+ Giovanni $+ $ct $+ .
    var %x = $readini(pkp\status.ini,$dados($nick,Info,Region),Legendary)
    if ($findtok(%x,Mewtwo,0,58)) {
      if ($dados($nick,Quests,Mewtwo)) { msg =$nick $chr(160) $cc $+ Giovanni $ct $+ - Voc�... $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , tem raz�o. Tratei meus pok�mon de forma ignorante todo esse tempo e por isso perdi a oportunidade de capturar o melhor pok�mon. Agora entendo que os pok�mon s�o nossos amigos, que merecem receber aten��o e nosso carinho. Obrigado, agora entendo... | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Giovanni Ok }
      else {
        msg =$nick $chr(160) $cc $+ Giovanni $ct $+ - N�o consegui captur�-lo porque meus pok�mon se recusam a me obedecer...
        if ($rini(cadastros,$nick,Mewtwo,Name)) { msg =$nick $ct $+ Voc� pode ver o pok�mon $cc $+ Mewtwo $+ $ct $+ . Voc� n�o pode batalhar agora, porque voc� j� tem um pok�mon com o mesmo nome no time. | return }
        if ($totalpokes($nick) == 6) { msg =$nick $ct $+ Voc� pode ver o pok�mon $cc $+ Mewtwo $+ $ct $+ . Voc� n�o pode batalhar agora, porque voc� j� tem seis pok�mon no time. | return }
        if ($appeared(Mewtwo)) { msg =$nick $ct $+ Parece que h� um treinador batalhando com $cc $+ Mewtwo $ct $+ neste momento! | return }
        writeini pkp\cadastros\ $+ $nick $+ .ini Quests Mewtwo Ok | msg =$nick $ct $+ Pok�mon $cc $+ Mewtwo $ct $+ est� vindo em dire��o a $cc $+ $dados($nick,Info,Nick) $+ $ct $+ !
        .echo $addpoke($nick,Mewtwo,70,70: $+ $dados($nick,Info,Locate)).wild | b.create.fila $nick $rini(cadastros,$nick,Team,1) | var %ID = $checknickid($nick).id | b.join %ID Wild | sset [ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ 1 ] $+ ] : ] $+ [ 2 ] ] $getteam($nick,Mewtwo)
        sset [ [ B. ] $+ [ %ID ] $+ [ .Auto ] ] ON | sset [ [ B. ] $+ [ %ID ] $+ [ .Wild ] ] ON | sset [ [ B. ] $+ [ %ID ] $+ [ .Ball ] ] 10 | sset [ [ B. ] $+ [ %ID ] $+ [ .PPUp ] ] ON | b.start.fight %ID
      }
    }
    else {
      msg =$nick $chr(160) $cc $+ Giovanni $ct $+ - Capturei o melhor pok�mon! Eu financiei a pesquisa de desenvolvimento deste pok�mon a partir do gene de uma nova esp�cie de pok�mon descoberta na Am�rica do Sul. Embora tenha destr�ido o laborat�rio onde fora desenvolvido, sempre soube do seu esconderijo! Esperei para invadir a $cc $+ Silph Corp $ct $+ e pegar a $cc $+ Master Ball $ct $+ para finalmente t�-lo!
      msg =$nick $chr(160) $cc $+ Giovanni $ct $+ - Meu pok�mon ser� minha ferramenta para dominar o mundo! Voc� ser� o primeiro, prepare-se.
      battle.npc $nick Giovanni_Mewtwo | sset [ [ B. ] $+ [ $checknickid($nick).ID ] $+ [ .Quest ] ] GIOVANNI
    }
  }
  elseif ($1 == Mewtwo) {
    var %x = $readini(pkp\status.ini,%region,Legendary)
    if ($findtok(%x,Mewtwo,0,58)) && (!$dados($nick,Quests,Mewtwo)) {
      if ($rini(cadastros,$nick,Mewtwo,Name)) { msg =$nick $ct $+ Voc� pode ver o pok�mon $cc $+ Mewtwo $+ $ct $+ . Voc� n�o pode batalhar agora, porque voc� j� tem um pok�mon com o mesmo nome no time. | return }
      if ($totalpokes($nick) == 6) { msg =$nick $ct $+ Voc� pode ver o pok�mon $cc $+ Mewtwo $+ $ct $+ . Voc� n�o pode batalhar agora, porque voc� j� tem seis pok�mon no time. | return }
      if ($appeared(Mewtwo)) { msg =$nick $ct $+ Parece que h� um treinador batalhando com $cc $+ Mewtwo $ct $+ neste momento! | return }
      writeini pkp\cadastros\ $+ $nick $+ .ini Quests Mewtwo Ok | msg =$nick $ct $+ Pok�mon $cc $+ Mewtwo $ct $+ est� vindo em dire��o a $cc $+ $dados($nick,Info,Nick) $+ $ct $+ !
      .echo $addpoke($nick,Mewtwo,70,70: $+ $dados($nick,Info,Locate)).wild | b.create.fila $nick $rini(cadastros,$nick,Team,1) | var %ID = $checknickid($nick).id | b.join %ID Wild | sset [ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ 1 ] $+ ] : ] $+ [ 2 ] ] $getteam($nick,Mewtwo)
      sset [ [ B. ] $+ [ %ID ] $+ [ .Auto ] ] ON | sset [ [ B. ] $+ [ %ID ] $+ [ .Wild ] ] ON | sset [ [ B. ] $+ [ %ID ] $+ [ .Ball ] ] 10 | sset [ [ B. ] $+ [ %ID ] $+ [ .PPUp ] ] ON | b.start.fight %ID
    }
    else { msg =$nick $ct $+ Nada foi encontrado. }
  }
  else { msg =$nick $ct $+ Nada foi encontrado. }
  return
}
alias c.search.Heavy_Den { msg =$nick $ct $+ Nada foi encontrado. }
