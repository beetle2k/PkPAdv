alias cmd.PC {
  var %region = $dados($nick,Info,Region)
  if ($2 == help) || ($2 == ajuda) || (!$2) {
    msg $+(=,$nick) $ct $+ Iniciada conex�o no $cc $+ Pok�mon Center $ct $+ de $cc $+ $rini(cadastros,$nick,Info,Locate) $+ $ct $+ . A seguir, os comandos ser�o listados:
    msg $+(=,$nick) $chr(160) $+ $cc $+ .PC Stats [<N�mero> (<Pok�mon>)] $ct $+ - Detalhes gerais sobre seu pc ou de uma caixa espec�fica;
    msg $+(=,$nick) $chr(160) $+ $cc $+ $arrange(.PC Box <N�mero>,160,32) $ct $+ - Seleciona a caixa para fazer transa��es;
    msg $+(=,$nick) $chr(160) $+ $cc $+ $arrange(.PC Deposit <Pok�mon>,160,32) $ct $+ - Deposita um pok�mon na caixa selecionada;
    msg $+(=,$nick) $chr(160) $+ $cc $+ $arrange(.PC Withdraw <Pok�mon>,160,32) $ct $+ - Retira da caixa selecionada um pok�mon;
    msg $+(=,$nick) $chr(160) $+ $cc $+ $arrange(.PC Release <Pok�mon>,160,32) $ct $+ - Apaga um pok�mon da caixa selecionada;
    msg $+(=,$nick) $chr(160) $+ $cc $+ $arrange(.PC Search <Pok�mon>,160,32) $ct $+ - Procura por um pok�mon em seu PC;
    msg $+(=,$nick) $chr(160) $+ $cc $+ $arrange(.PC Rename (<Nome>),160,32) $ct $+ - Nomeia uma box se o nome for especificado;
    msg $+(=,$nick) $chr(160) $+ $cc $+ $arrange(.PC Firewall,160,32) $ct $+ - Habilita ou desabilita o firewall da caixa selecionada;
    msg $+(=,$nick) $chr(160) $+ $cc $+ $arrange(.PC Loja,160,32) $ct $+ - Compra novas caixas para armazenamento;
    msg $+(=,$nick) $chr(160) $+ $cc $+ $arrange(.PC Config,160,32) $ct $+ - Exibe suas configura��es;
    msg $+(=,$nick) $chr(160) $+ $cc $+ .PC Transfer <N�mero> (<Pok�mon>) $ct $+ - Transfere conte�do da caixa atual para a caixa selecionada;
    msg $+(=,$nick) $chr(160) $+ $cc $+ .PC Research <Nick> [<N�mero> (<Pok�mon>)] $ct $+ - Pesquisa na internet informa��es de outros PC.
    msg $+(=,$nick) $ct $+ Fim da rela��o de comandos.
  }
  elseif ($2 == stats) { view.pc 1 $nick $3 $4 }
  elseif ($2 == box) {
    if ($3 !isnum) { .msg $+(=,$nick) $ct $+ Houve um erro em sua sintaxe. Para mais ajuda, digite $cc $+ .PC $+ $ct $+ . | return }
    var %n = $base($3,10,10,1)
    if ($rini(cadastros,$nick,PC,Box) == %n) { .msg $+(=,$nick) $ct $+ Esta caixa j� est� selecionada. | return }
    if (!$readini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Info,Size)) { .msg $+(=,$nick) $ct $+ Voc� n�o possui a caixa selecionada. | return }
    writeini pkp\cadastros\ $+ $nick $+ .ini PC Box %n | .msg $+(=,$nick) $ct $+ A caixa $chr(35) $+ $cc $+ $base(%n,10,10,2) $ct $+ foi selecionada com sucesso. | return
  }
  elseif ($2 == firewall) {
    if (!$rini(cadastros,$nick,PC,Box)) { .msg $+(=,$nick) $ct $+ Voc� precisa selecionar uma caixa antes. | return }
    var %n = $rini(cadastros,$nick,PC,Box)
    var %x = $readini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Info,Firewall)
    if (%x) { remini pkp\box\ $+ $nick $+ \ $+ %n $+ .ini Info Firewall | msg $+(=,$nick) $ct $+ Firewall habilitado para a caixa $chr(35) $+ $cc $+ $base(%n,10,10,2) $+ $ct $+ . }
    else { writeini pkp\box\ $+ $nick $+ \ $+ %n $+ .ini Info Firewall ON | msg $+(=,$nick) $ct $+ Firewall desabilitado para a caixa $chr(35) $+ $cc $+ $base(%n,10,10,2) $+ $ct $+ . }
    return
  }
  elseif ($2 == research) {
    view.pc 0 $3 $4 $5 | return
  }
  elseif ($2 == transfer) {
    if (!$rini(cadastros,$nick,PC,Box)) { .msg $+(=,$nick) $ct $+ � necess�rio selecionar uma caixa antes de efetuar a transfer�ncia. | return }
    var %n = $dados($nick,PC,Box) | if ($3 isnum) { var %d = $base($3,10,10,1) } | else { .msg $+(=,$nick) $ct $+ Voc� precisa especificar uma caixa v�lida como destino. | return }
    if (!$findtok($readini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Info,Link),%region,0,58)) { .msg $+(=,$nick) $ct $+ Sua conex�o com a caixa $chr(35) $+ $cc $+ $base(%n,10,10,2) $ct $+ n�o p�de ser estabelecida. | return }
    if (!$findtok($readini(pkp\box\ $+ $nick $+ \ $+ %d $+ .ini,Info,Link),%region,0,58)) { .msg $+(=,$nick) $ct $+ Sua conex�o com a caixa $chr(35) $+ $cc $+ $base(%d,10,10,2) $ct $+ n�o p�de ser estabelecida. | return }
    if (%n == %d) { .msg $+(=,$nick) $ct $+ Para realizar uma transfer�ncia, especifique uma caixa diferente para o destino. | return }
    if ($4) {
      if (!$basestat($4,etype)) { .msg $+(=,$nick) $ct $+ Verifique novamente o nome do seu pok�mon para realizar a transfer�ncia. | return }
      var %pk = $basestat($4,Name), %size = $readini(pkp\box\ $+ $nick $+ \ $+ %d $+ .ini,Info,Size), %used = $ini(pkp\box\ $+ $nick $+ \ $+ %d $+ .ini,Box,0)
      if (!$readini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Box,%pk)) { .msg $+(=,$nick) $ct $+ N�o h� o pok�mon $cc $+ %pk $ct $+ na caixa atual. | return }
      if (%used >= %size) { .msg $+(=,$nick) $ct $+ N�o h� espa�o suficiente na caixa destinat�ria. | return }
      if ($readini(pkp\box\ $+ $nick $+ \ $+ %d $+ .ini,Box,%pk)) { .msg $+(=,$nick) $ct $+ J� existe o pok�mon $cc $+ %pk $ct $+ na caixa destinat�ria. | return }
      var %t = $readini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Box,%pk), %t1 = $gettok(%t,1,59), %t2 = $gettok(%t,5,59), %t3 = $gettok(%t,3,59), %t4 = $gettok(%t,7,59)
      remini pkp\box\ $+ $nick $+ \ $+ %n $+ .ini Box %pk | writeini pkp\box\ $+ $nick $+ \ $+ %d $+ .ini Box %pk %t | msg $+(=,$nick) $rtypename(%t1,%t2,%t3,%t4) foi enviado para a caixa $chr(35) $+ $cc $+ $base(%d,10,10,2) $+ $ct $+ .
      wlog user $nick %t1 was transfered from box $chr(35) $+ %n to $chr(35) $+ %d $+ .
    }
    else {
      var %config = $dados($nick,PC,Config), %n.size = $readini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Info,Size), %d.size = $readini(pkp\box\ $+ $nick $+ \ $+ %d $+ .ini,Info,Size), %n.used = $ini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Box,0), %d.used = $ini(pkp\box\ $+ $nick $+ \ $+ %d $+ .ini,Box,0), %d.left = $calc(%d.size - %d.used), %n.tran = %n.used
      if (!%d.left) { msg $+(=,$nick) $ct $+ N�o � poss�vel transferir o conte�do, pois a caixa destinat�ria est� cheia. | return }
      var %x = 1 | while ($ini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Box,%x)) { var %pk = $ini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Box,%x) | if ($readini(pkp\box\ $+ $nick $+ \ $+ %d $+ .ini,Box,%pk)) { if ($gettok(%config,1,58)) { msg =$nick $ct $+ Sua transfer�ncia foi cancelada, pois h� pok�mon igual na caixa destinat�ria. | return } | dec %n.tran } | inc %x }
      if (%n.tran > %d.left) {
        if ($gettok(%config,2,58)) { msg $+(=,$nick) $ct $+ Sua transfer�ncia foi interrompida, pois n�o � poss�vel enviar todos os pok�mon para a caixa destinat�ria. | return }
        var %n.tran = %d.left
      }
      if (!%n.tran) { msg $+(=,$nick) $ct $+ N�o h� pok�mon v�lidos para finalizar a transfer�ncia. | return }
      var %x = 1
      while ($ini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Box,%x)) && (%d.left) { 
        var %pk = $ini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Box,%x)
        if (!$readini(pkp\box\ $+ $nick $+ \ $+ %d $+ .ini,Box,%pk)) {
          var %t = $readini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Box,%pk)
          remini pkp\box\ $+ $nick $+ \ $+ %n $+ .ini Box %pk | writeini pkp\box\ $+ $nick $+ \ $+ %d $+ .ini Box %pk %t
          if (%n.tran > 1) && ($gettok(%config,3,58)) {
            if (!%log) { var %log = 1 | msg $+(=,$nick) $ct $+ Exibindo log da transfer�ncia... }
            var %t1 = $gettok(%t,1,59), %t2 = $gettok(%t,5,59), %t3 = $gettok(%t,3,59), %t4 = $gettok(%t,7,59) | .msg $+(=,$nick) $chr(160) $arrange($rtypename.str(%t1,%t2,%t3,%t4),160,20,$rtypename(%t1,%t2,%t3,%t4)).right transferido para a caixa $chr(35) $+ $cc $+ $base(%d,10,10,2) $+ $ct $+ .
          }
          dec %d.left
        }
        else { inc %x }
      }
      if (%n.tran == %n.used) {
        if (%n.tran == 1) {
          var %t1 = $gettok(%t,1,59), %t2 = $gettok(%t,5,59), %t3 = $gettok(%t,3,59), %t4 = $gettok(%t,7,59)
          .msg $+(=,$nick) $rtypename(%t1,%t2,%t3,%t4) da caixa $chr(35) $+ $cc $+ $base(%n,10,10,2) $ct $+ foi transferido para a caixa $chr(35) $+ $cc $+ $base(%d,10,10,2) $+ $ct $+ .
        }
        else { .msg $+(=,$nick) $ct $+ Pok�mon da caixa $chr(35) $+ $cc $+ $base(%n,10,10,2) $ct $+ foram transferidos para a caixa $chr(35) $+ $cc $+ $base(%d,10,10,2) $+ $ct $+ . }
      }
      else {
        if (%n.tran == 1) {
          var %t1 = $gettok(%t,1,59), %t2 = $gettok(%t,5,59), %t3 = $gettok(%t,3,59), %t4 = $gettok(%t,7,59)
          .msg $+(=,$nick) Apenas $rtypename(%t1,%t2,%t3,%t4) da caixa $chr(35) $+ $cc $+ $base(%n,10,10,2) $ct $+ foi transferido para a caixa $chr(35) $+ $cc $+ $base(%d,10,10,2) $+ $ct $+ .
        }
        else { .msg $+(=,$nick) $ct $+ Apenas $cc $+ $iif(%n.tran < 14,$numero(%n.tran),%n.tran) $ct $+ pok�mon da caixa $chr(35) $+ $cc $+ $base(%n,10,10,2) $ct $+ foram transferidos para a caixa $chr(35) $+ $cc $+ $base(%d,10,10,2) $+ $ct $+ . }
      }
      if (%n.tran == 1) { .wlog user $nick $gettok(%t,1,59) was transfered from box $chr(35) $+ %n to $chr(35) $+ %d $+ . }
      else { .wlog user $nick %n.tran were transfered from box $chr(35) $+ %n to $chr(35) $+ %d successfully. }
    }
  }
  elseif ($2 == config) {
    if (!$dados($nick,PC,Config)) { writeini pkp\cadastros\ $+ $nick $+ .ini PC Config $str(0:,9) $+ 0 }
    var %n = $lines(pkp\pc.txt), %config = $dados($nick,PC,Config)
    if ($3 == set) {
      if (!$4) { .msg $+(=,$nick) $ct $+ � preciso especificar a op��o para modific�-la. | return }
      if ($4 !isnum 1- $+ %n) { msg $+(=,$nick) $ct $+ A op��o selecionada n�o existe ou est� indispon�vel. | return }
      if ($gettok(%config,$4,58)) { var %config = $puttok(%config,0,$4,58), %state = desativada } | else { var %config = $puttok(%config,1,$4,58), %state = ativada }
      writeini pkp\cadastros\ $+ $nick $+ .ini PC Config %config | .msg $+(=,$nick) $ct $+ A op��o $chr(35) $+ $cc $+ $base($4,10,10,2) $ct $+ foi %state com sucesso.
    }
    elseif ($3 == list) {
      msg $+(=,$nick) $ct $+ Listando os par�metros de configura��o dispon�veis para edi��o:
      var %x = 0 | while (%x < %n) {
        inc %x | msg =$nick $chr(160) $ct $+ $chr(35) $+ $cc $+ $base(%x,10,10,2) $iif($gettok(%config,%x,58),$ct $+ $chr(40) $+ $cc $+ $chr(215) $+ $ct $+ $chr(41),$ct $+ $chr(40) $+ $chr(32) $+ $ct $+ $chr(41)) $ct $+ $read(pkp\pc.txt,%x)
      }
      msg $+(=,$nick) $ct $+ Fim da exibi��o.
    }
    elseif (!$3) {
      msg $+(=,$nick) $ct $+ Utilizando o comando ' $+ $cc $+ .PC Config $+ $ct $+ ' � poss�vel editar configura��es do PC para melhor desempenho do mesmo.
      msg $+(=,$nick) $chr(160) $ct $+ Digite ' $+ $cc $+ .PC Config List $+ $ct $+ ' para listar as op��es edit�veis;
      msg $+(=,$nick) $chr(160) $ct $+ Digite ' $+ $cc $+ .PC Config Set <n�mero> $+ $ct $+ ' para modificar uma op��o listada no comando anterior;
      msg $+(=,$nick) $ct $+ Fim da exibi��o de comandos.
    }
    else { msg =$nick $ct $+ Voc� utilizou este comando incorretamente. Digite ' $+ $cc $+ .PC Config $+ $ct $+ ' para saber como editar suas configura��es. }
    return
  }
  elseif ($2 == deposit) {
    if (!$rini(cadastros,$nick,PC,Box)) { .msg $+(=,$nick) $ct $+ Antes de efetuar um $cc $+ dep�sito $+ $ct $+ , � necess�rio $cc $+ selecionar $ct $+ uma caixa antes. | return }
    if (!$rini(cadastros,$nick,$3,Name)) { .msg $+(=,$nick) $ct $+ Voc� n�o tem o pok�mon selecionado. | return }
    if ($3 == Egg) { .msg $+(=,$nick) $ct $+ Voc� n�o pode depositar $cc $+ Eggs $ct $+ no PC. | return }
    if ($totalpokes($nick) == 1) || ($rini(cadastros,$nick,Team,2) == Egg) { .msg $+(=,$nick) $ct $+ � necess�rio carregar no m�nimo $cc $+ um $ct $+ pok�mon no $cc $+ time $+ $ct $+ . | return }
    var %n = $rini(cadastros,$nick,PC,Box)
    if (!$findtok($readini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Info,Link),%region,0,58)) { .msg $+(=,$nick) $ct $+ Sua conex�o com a caixa $chr(35) $+ $cc $+ %n $ct $+ n�o p�de ser estabelecida. | return }
    if ($readini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Info,Size) == $ini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Box,0)) { .msg $+(=,$nick) $ct $+ N�o h� mais espa�o dispon�vel na caixa selecionada. | return }
    if ($readini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Box,$3)) { .msg $+(=,$nick) $ct $+ Na caixa selecionada, j� existe um pok�mon de mesmo nome. | return }
    var %t1 = $rini(cadastros,$nick,$3,Name), %t2 = $rini(cadastros,$nick,$3,Sex), %t3 = $rini(cadastros,$nick,$3,Level), %t4 = $rini(cadastros,$nick,$3,Shiny) | recalc $nick %t1
    var %p = $rini(cadastros,$nick,PC,Points), %p = $iif(%p,%p,0) | writeini pkp\cadastros\ $+ $nick $+ .ini PC Points $calc(%p + $pontos($nick,%t1)) | deposit $nick %t1 %n
    wlog user $nick %t1 was deposited successfully at box %n $+ .
    .msg $+(=,$nick) $ct $+ Tranfer�ncia concluida. Pok�mon $rtypename(%t1,%t2,%t3,%t4) depositado com sucesso. | return
  }
  elseif ($2 == withdraw) {
    if (!$rini(cadastros,$nick,PC,Box)) { .msg $+(=,$nick) $ct $+ Voc� precisa selecionar uma caixa antes. | return }
    if ($totalpokes($nick) == 6) { .msg $+(=,$nick) $ct $+ Voc� n�o pode ficar com mais de 6 pok�mon no seu time! | return }
    var %n = $rini(cadastros,$nick,PC,Box)
    if (!$findtok($readini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Info,Link),%region,0,58)) { .msg $+(=,$nick) $ct $+ Sua conex�o com a caixa $chr(35) $+ $cc $+ %n $ct $+ n�o p�de ser estabelecida. | return }
    if (!$readini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Box,$3)) { .msg $+(=,$nick) $ct $+ N�o existe o pok�mon selecionado na caixa selecionada. | return }
    if ($rini(cadastros,$nick,$3,Name)) { .msg $+(=,$nick) $ct $+ Voc� j� possui o pok�mon selecionado no seu time. | return }
    withdraw $nick $3 %n | writeini pkp\cadastros\ $+ $nick $+ .ini PC Points $calc($rini(cadastros,$nick,PC,Points) - $pontos($nick,$3))
    wlog user $nick Withdrew $rini(cadastros,$nick,$3,Name) successfully of box %n $+ .
    .msg $+(=,$nick) $ct $+ Tranfer�ncia concluida. Pok�mon $rtypename($rini(cadastros,$nick,$3,Name),$rini(cadastros,$nick,$3,Sex),$rini(cadastros,$nick,$3,Level),$rini(cadastros,$nick,$3,Shiny)) $ct $+ retirado da caixa. | return
  }
  elseif ($2 == release) {
    if (!$rini(cadastros,$nick,PC,Box)) { .msg $+(=,$nick) $ct $+ Voc� precisa selecionar uma caixa antes. | return }
    var %n = $rini(cadastros,$nick,PC,Box)
    if (!$findtok($readini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Info,Link),%region,0,58)) { .msg $+(=,$nick) $ct $+ Sua conex�o com a caixa $chr(35) $+ $cc $+ %n $ct $+ n�o p�de ser estabelecida. | return }
    if (!$readini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Box,$3)) { .msg $+(=,$nick) $ct $+ N�o existe o pok�mon selecionado na caixa selecionada. | return }
    var %t1 = $gettok($readini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Box,$3),1,59), %t2 = $gettok($readini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Box,$3),5,59), %t3 = $gettok($readini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Box,$3),3,59), %t4 = $gettok($readini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Box,$3),7,59)
    wlog user $nick Trying to release %t1 from box %n $+ ...
    .msg $+(=,$nick) $ct $+ Deseja realmente apagar $rtypename(%t1,%t2,%t3,%t4) $ct $+ de seu time para sempre? Voc� n�o poder� recuper�-lo.
    .msg $+(=,$nick) $ct $+ Para confirmar, digite $cc $+ .sim $+ $ct $+ . Para cancelar, $cc $+ .nao $+ $ct $+ .
    .msg $+(=,$nick) $ct $+ Se n�o decidir em 1 minuto, seu pedido ser� $cc $+ confirmado $+ $ct $+ . | set %confirm. [ $+ [ $nick ] ] RLS: $+ %n $+ : $+ %t1 | .timerRLS [ $+ [ $nick ] ] 1 60 /rlstimeout $nick %t1 %n | return
  }
  elseif ($2 == search) {
    if (!$basestat($3,etype)) { .msg $+(=,$nick) $ct $+ O pok�mon selecionado � inexistente ou ainda n�o foi catalogado. | return }
    var %x = $findfile(pkp\box\ $+ $nick $+ \,*.ini,0), %y = 0
    while (%y < %x) {
      inc %y
      if ($readini(pkp\box\ $+ $nick $+ \ $+ %y $+ .ini,Box,$3)) {
        if (!%n) { .msg $+(=,$nick) $ct $+ Resultado(s) da pesquisa por ' $+ $cc $+ $basestat($3) $+ $ct $+ ': | var %n = 1 }
        var %t = $readini(pkp\box\ $+ $nick $+ \ $+ %y $+ .ini,Box,$3), %t1 = $gettok(%t,1,59), %t2 = $gettok(%t,5,59), %t3 = $gettok(%t,3,59), %t4 = $gettok(%t,7,59), %h = $gettok(%t,14,59)
        .msg $+(=,$nick) $chr(160) $ct $+ $chr(35) $+ $cc $+ $arrange(%n,160,2) $ct $+ - $arrange($upper($iif($readini(pkp\box\ $+ $nick $+ \ $+ %y $+ .ini,Info,Name),$readini(pkp\box\ $+ $nick $+ \ $+ %y $+ .ini,Info,Name),Box)),160,7).center $+ ( $+ $chr(35) $+ $cc $+ $base(%y,10,10,2) $+ $ct $+ ) - $arrange($rtypename.str(%t1,%t2,%t3,%t4),160,20,$rtypename(%t1,%t2,%t3,%t4)) $iif(%h,$ct $+ - $cc $+ %h) | inc %n
      }
    }
    if (%n) { .msg $+(=,$nick) $ct $+ $iif(%n > 2,Foram,Foi) $iif(%n > 2,obtidos,obtido) $numero($calc(%n - 1)) $iif(%n > 2,resultados,resultado) $+ . | return }
    else { .msg $+(=,$nick) $ct $+ Nenhum resultado foi encontrado. | return }
  }
  elseif ($2 == rename) {
    if (!$rini(cadastros,$nick,PC,Box)) { msg $+(=,$nick) $ct $+ Para renomear uma caixa do $cc $+ PC $+ $ct $+ , selecione-a anteriormente. | return }
    if (!$findtok($readini(pkp\box\ $+ $nick $+ \ $+ $rini(cadastros,$nick,PC,Box) $+ .ini,Info,Link),%region,0,58)) { .msg $+(=,$nick) $ct $+ Sua conex�o com a caixa $chr(35) $+ $cc $+ $rini(cadastros,$nick,PC,Box) $ct $+ n�o p�de ser estabelecida. | return }
    if (!$3) { var %box = $rini(cadastros,$nick,PC,Box) | if (!$readini(pkp\box\ $+ $nick $+ \ $+ %box $+ .ini,Info,Name)) { msg $+(=,$nick) $ct $+ N�o h� registro de nome na caixa selecionada. | return } | remini pkp\box\ $+ $nick $+ \ $+ %box $+ .ini Info Name | msg $+(=,$nick) $ct $+ Foi apagado o registro de nome da caixa $chr(35) $+ $cc $+ %box $+ $ct $+ . | return }
    if ($nickscan($strip($3)) == No!) { msg $+(=,$nick) $ct $+ Este nome cont�m caracteres inv�lidos. Por favor, escolha outro. | return }
    var %box = $rini(cadastros,$nick,PC,Box), %name = $strip($3) | if (%name == $readini(pkp\box\ $+ $nick $+ \ $+ %box $+ .ini,Info,Name)) { msg $+(=,$nick) $ct $+ A caixa $chr(35) $+ $cc $+ %box $ct $+ j� possui o nome ' $+ $cc $+ $upper(%name) $+ $ct $+ '. | return }
    if ($len(%name) !isnum 3-7) { msg $+(=,$nick) $ct $+ � necess�rio que contenha no nome de $cc $+ tr�s $ct $+ a $cc $+ sete $ct $+ caracteres v�lidos. | return }
    wlog user $nick Renamed box %box to ' $+ $upper(%name) $+ '.
    writeini pkp\box\ $+ $nick $+ \ $+ %box $+ .ini Info Name %name | msg $+(=,$nick) $ct $+ Caixa $chr(35) $+ $cc $+ %box $ct $+ renomeada para ' $+ $cc $+ $upper(%name) $+ $ct $+ '. | return
  }
  elseif ($2 == loja) {
    if ($3) {
      if ($3 == Comprar) {
        if ($findtok($shop(PC),$4-,0,58)) {
          var %i = $item.data($4-,name), %p = $item.data(%i,price), %m = $rini(cadastros,$nick,Info,Money)
          if (%m < %p) { msg $+(=,$nick) $ct $+ Voc� n�o tem $cc $+ dinheiro $ct $+ suficiente para $cc $+ comprar $+ $ct $+ . | return }
          wlog user $nick %i was bought for $chr(36) $+ $getmoney(%p) at %region $+ .
          writeini pkp\cadastros\ $+ $nick $+ .ini Info Money $calc(%m - %p) | box.add $nick $iif(%i == Small Box,30,$iif(%i == Normal Box,45,$iif(%i == Great Box,60,100))) | msg $+(=,$nick) $ct $+ Item $cc $+ %i $ct $+ comprado com sucesso. Seu dinheiro atual � $cc $+ $chr(36) $+ $getmoney($calc(%m - %p)) $+ $ct $+ .
        }
        else { msg $+(=,$nick) $ct $+ O item selecionado n�o foi encontrado. | return }
      }
      else { msg $+(=,$nick) $ct $+ Erro de sintaxe do comando. Digite $cc $+ .PC $ct $+ para mais informa��es. | return }
    }
    else {
      msg $+(=,$nick) $ct $+ Bem vindo a loja de $cc $+ computadores $+ $ct $+ , $cc $+ $nick $+ $ct $+ !
      msg $+(=,$nick) $ct $+ Exibindo lista de artigos:
      var %i = $shop(PC), %x = 0, %t = $gettok(%i,0,58)
      while (%x < %t) {
        inc %x | var %ti = $gettok(%i,%x,58)
        msg $+(=,$nick) $chr(160) $cc $+ $arrange($item.data(%ti,name),160,15) $ct $+ Pre�o: $cc $+ $chr(36) $+ $arrange($getmoney($item.data(%ti,price)),160,7) $ct $+ Descri��o: $cc $+ $item.data(%ti,desc)
      }
      msg $+(=,$nick) $ct $+ Fim da lista de artigos.
      msg $+(=,$nick) $ct $+ Para comprar uma nova caixa para seu PC, digite " $+ $cc $+ .pc loja comprar <box> $+ $ct $+ ".
    }
    return
  }
  else { .msg $+(=,$nick) $ct $+ Voc� digitou o comando de forma incorreta. Veja as diferentes formas de utiliza��o digitando ' $+ $cc $+ .PC $+ $ct $+ '. | return }
}

alias view.dados {
  var %a = $1, %p = $2, %c = $3
  if (!%p) { msg =$nick $ct $+ Voc� errou a sintaxe deste comando. Especifique o $cc $+ nick $ct $+ do usu�rio para a exibi��o de dados. | return }
  if (!$dados(%p,Info,Nick)) { msg =$nick $ct $+ Este usu�rio $cc $+ %p $ct $+ n�o est� cadastrado no sistema. | return }
  if (%c) {
    if (!$dados(%p,Info,Perfil,14)) && (!%a) { msg =$nick $ct $+ N�o � permitido visualizar pok�mon de $cc $+ $dados(%p,Info,Nick) $+ $ct $+ . | return }
    if (!$dados(%p,%c,Name)) || (!$checkteam(%p,%c)) { msg =$nick $iif(%a == 1,$ct $+ Voc�,$cc $+ $dados(%p,Info,Nick)) $iif(%a == 1,n�o,$ct $+ n�o) possui o pok�mon selecionado. | return }
    if ($basestat(%c,etype)) {
      tevent Dados $nick
      msg =$nick $ct $+ Exibindo informa��es de $cc $+ $dados(%p,%c,Name) $+ $iif(%a == 1,$ct $+ :,$chr(32) $+ $ct $+ de $cc $+ $dados(%p,Info,Nick) $+ $ct $+ :)
      var %rib = $dados(%p,%c,Ribbon)
      msg =$nick $chr(160) $ct $+ ID: $cc $+ $dados(%p,%c,ID) $ct $+ / Ribbons: $cc $+ $iif(%rib,$gettok(%rib,0,58),Nenhum) $ct $+ / Item: $cc $+ $iif($dados(%p,%c,Hold),$dados(%p,%c,Hold),Nenhum)
      msg =$nick $chr(160) $ct $+ Stats: HP $cc $+ $dados(%p,%c,HP) $ct $+ ATK $cc $+ $dados(%p,%c,ATK) $ct $+ DEF $cc $+ $dados(%p,%c,DEF) $ct $+ SPD $cc $+ $dados(%p,%c,SPD) $ct $+ SATK $cc $+ $dados(%p,%c,SATK) $ct $+ SDEF $cc $+ $dados(%p,%c,SDEF)
      msg =$nick $chr(160) $ct $+ Level: $cc $+ $dados(%p,%c,Level) $ct $+ / Exp Points: $cc $+ $dados(%p,%c,Exp) $iif($dados(%p,%c,Level) < 100,$ct $+ / Faltam $cc $+ $calc($dados(%p,%c,Next) - $dados(%p,%c,Exp)) $ct $+ Exp Points)
      msg =$nick $chr(160) $ct $+ Nature: $cc $+ $dados(%p,%c,Nature) $ct $+ / Shiny: $cc $+ $iif($dados(%p,%c,Shiny) == ON,Sim,N�o) $ct $+ / Sexo: $cc $+ $iif($dados(%p,%c,Sex) == Male,12Macho,$iif($dados(%p,%c,Sex) == Female,13F�mea,14N/A)) $ct $+ / Trait: $cc $+ $dados(%p,%c,Trait)
      if (%a) {
        var %l = $gettok($dados(%p,%c,Loyalty),1,58)
        msg =$nick $chr(160) $ct $+ Loyalty: $loyalty(%l)
        var %m.lv = $dados(%p,%c,Memory), %m.pl = $gettok(%m.lv,2,58), %m.bl = $gettok(%m.lv,3,58), %m.lv = $gettok(%m.lv,1,58)
        msg =$nick $chr(160) $ct $+ Memory: Lv. $+ $cc $+ %m.lv $+ $ct $+ , $cc $+ %m.pl $ct $+ ( $+ $iif(%m.bl,%m.bl,$+($cc,???,$ct)) $+ ).
      }
      var %x = 1
      while (%x <= 4) {
        var %m = Move [ $+ [ %x ] ], %move = $dados(%p,%c,%m), %power = $read(pkp\moveslist.txt, s, %move), %type = $gettok(%power,1,58), %acc = $gettok(%power,3,58), %power = $gettok(%power,2,58)
        if (%move == Hidden Power) && (%a == 2) {
          var %hidden = $hp($dados(%p,%c,IVHp),$dados(%p,%c,IVAtk),$dados(%p,%c,IVDef),$dados(%p,%c,IVSpd),$dados(%p,%c,IVSAtk),$dados(%p,%c,IVSDef)), %type = $gettok(%hidden,1,59), %power = $gettok(%hidden,2,59)
        }
        msg =$nick $chr(160) $ct $+ Move $chr(35) $+ %x $+ : $+ $cc $iif(!%move,-,$arrange(%move,160,12) $ct $+ $chr(91) $+ Power: $+ $cc $iif(!%power,$arrange(-,160,3).center,$arrange(%power,160,3).right) $ct $+ Acc: $+ $cc $iif(!%acc,$arrange(-,160,4).center,$iif(%acc isnum,$arrange(%acc,160,3).right $+ $chr(37),$arrange(%acc,160,4).right)) $ct $+ Type: $+ $cc $iif(!%type,$arrange(-,160,8).center,$arrange(%type,160,8).center) $+ $ct $+ $chr(93))
        inc %x
      }
      msg =$nick $ct $+ Fim da exibi��o.
    }
    elseif (%c == Egg) {
      if (!%a) { msg =$nick $ct $+ N�o � permitido visualizar $cc $+ Egg $ct $+ de $cc $+ $dados(%p,Info,Nick) $+ $ct $+ . | return }
      tevent Dados $nick
      msg =$nick $ct $+ Exibindo dados do $cc $+ Egg $ct $+ de $cc $+ $dados(%p,Info,Nick) $+ $ct $+ :
      msg =$nick $chr(160) $ct $+ Stats: HP $cc $+ ??? $ct $+ ATK $cc $+ ??? $ct $+ DEF $cc $+ ??? $ct $+ SPD $cc $+ ??? $ct $+ SATK $cc $+ ??? $ct $+ SDEF $cc $+ ???
      msg =$nick $chr(160) $ct $+ Nature: $cc $+ ??? $ct $+ / Shiny: $cc $+ ??? $ct $+ / Sexo: $cc $+ ??? $ct $+ / Trait: $cc $+ ???
      msg =$nick $chr(160) $ct $+ Memory: $dados(%p,Egg,Memory)
      var %m = $dados(%p,Egg,Milhagem), %h = $dados(%p,Egg,Hatch)
      if (%m > $calc(%h / 2)) { if (%m >= %h) { var %s = Este ovo quer se chocar! Para realiza-lo, voc� deve sair e entrar no bot. } | elseif (%m >= $calc(%h * 13 / 16)) { var %s = Ele est� fazendo ru�dos! Est� prestes a nascer! } | else { var %s = Ele se move ocasionalmente, dever� nascer em breve. } } | else { var %s = O que vai nascer disto? Vai levar um tempo... }
      msg =$nick $chr(160) $ct $+ State: %s
      msg =$nick $ct $+ Fim da exibi��o de dados.
    }
    else { msg =$nick $ct $+ Voc� cometeu um erro na utiliza��o deste comando. Procure informa��es utilizando o comando ' $+ $cc $+ .Ajuda $+ $ct $+ '. | return }
  }
  else {
    tevent Dados $nick
    if (%a) || ((!%a) && ($dados(%p,Info,Perfil,6))) { var %r = $chr(40) $+ $cc $+ $iif($top.pos(%p),$top.pos(%p),?) $+ $ct $+ � no ' $+ $cc $+ .Top $+ $ct $+ ' $+ $chr(41) } | else { var %r = 0 }
    msg =$nick $ct $+ Dados de $cc $+ $dados(%p,Info,Nick) $+ $iif(%r,$chr(32) $+ $ct $+ %r,$+ $ct $+) $+ :
    if (%a) || ((!%a) && ($dados(%p,Info,Perfil,1))) { var %r = $iif($returnpokes(%p),$returnpokes(%p),$cc $+ Nenhum) } | else { var %r = 0 }
    msg =$nick $ct $+ Pok�mon: $iif(%r,%r,$cc $+ Indispon�vel)
    if (%a) || ((!%a) && ($dados(%p,Info,Perfil,2))) { var %r = $chr(36) $+ $getmoney($dados(%p,Info,Money)) } | else { var %r = 0 }
    msg =$nick $ct $+ Dinheiro: $cc $+ $iif(%r,%r,Indispon�vel)
    if (%a) || ((!%a) && ($dados(%p,Info,Perfil,3))) { var %r = $getitem(%p) | if (%r == Nenhum) { var %r = $cc $+ %r } } | else { var %r = 0 }
    msg =$nick $ct $+ Itens: $iif(%r,%r,$cc $+ Indispon�vel)
    if (%a) || ((!%a) && ($dados(%p,Info,Perfil,4))) { var %r = $dados(%p,Info,Email) } | else { var %r = 0 }
    msg =$nick $ct $+ E-Mail: $cc $+ $iif(%r,%r,Indispon�vel)
    if (%a) || ((!%a) && ($dados(%p,Info,Perfil,12))) { var %r = $dados(%p,Info,StoreMarket), %r = $iif(%r,$cc $+ %r,$ct $+ Nenhuma) $ct $+ oferta $+ $iif(%r > 1,s) } | else { var %r = 0 }
    msg =$nick $ct $+ Market: $iif(%r,%r,$cc $+ Indispon�vel)
    if (%a) || ((!%a) && ($dados(%p,Info,Perfil,7))) { var %r = $dados(%p,Info,Access) $+ $iif($gettok($readini(pkp\status.ini,Active,Brain),1,58) == %p,$+($chr(32),$ct,$chr(40),$cc,Brain,$ct,$chr(41))) } | else { var %r = 0 }
    msg =$nick $ct $+ Status: $cc $+ $iif(%r,%r,Indispon�vel)
    if (%a) || ((!%a) && ($dados(%p,Info,Perfil,10))) { var %r = $dados(%p,Info,Pokedex) $ct $+ Pok�mon } | else { var %r = 0 }
    if ($item(%p,PokeDex).qnt) { msg =$nick $ct $+ Pok�Dex: $cc $+ $iif(%r,%r,Indispon�vel) }
    if (%a) || ((!%a) && ($dados(%p,Info,Perfil,13))) { var %r = $iif($dados(%p,Info,Skin),$org($dados(%p,Info,Skin)),Padr�o) } | else { var %r = 0 }
    msg =$nick $ct $+ Skin: $cc $+ $iif(%r,%r,Indispon�vel)
    if (%a) || ((!%a) && ($dados(%p,Info,Perfil,11))) { var %r = $dur($gettok($fulldur($dados(%p,Info,Online)),1-2,32),$ct,$cc).e } | else { var %r = 0 }
    if ($dados(%p,Info,Online)) { msg =$nick $ct $+ Online: $iif(%r,%r,$cc $+ Indispon�vel) }
    if (%a) || ((!%a) && ($dados(%p,Info,Perfil,5))) { var %r = $dados(%p,Info,Milhagem) $ct $+ Pok�Milhas } | else { var %r = 0 }
    msg =$nick $ct $+ Milhagem: $cc $+ $iif(%r,%r,Indispon�vel)
    if (%a) || ((!%a) && ($dados(%p,Info,Perfil,9))) { var %badge = $dados(%p,$dados(%p,Info,Region),Badges).n, %r = $iif(%badge,%badge,Nenhuma) $ct $+ ( $+ $cc $+ $dados(%p,Info,Region) $+ $ct $+ ) } | else { var %r = 0 }
    msg =$nick $ct $+ Ins�gneas: $cc $+ $iif(%r,%r,Indispon�vel)
    if (%a) || ((!%a) && ($dados(%p,Info,Perfil,8))) { var %r = $dados(%p,Info,Locate) } | else { var %r = 0 }
    msg =$nick $ct $+ Localiza��o: $cc $+ $iif(%r,%r,Indispon�vel)
    var %r = $getmoney($dados(%p,Info,BP))
    msg =$nick $ct $+ Battle Points ( $+ $cc $+ BP $+ $ct $+ ): $cc $+ $iif(%r,%r,Nenhum)
    if ($dados(%p,Info,Perfil,18)) && (($dados(%p,Historico,Battle)) || ($dados(%p,Historico,Caught))) {
      var %d = 0, %r = 0
      if ($dados(%p,Historico,Battle)) { var %r = Batalha $+ $ct $+ : $cc $+ $dados(%p,Historico,Win) $ct $+ vit�ria(s) e $cc $+ $dados(%p,Historico,Lose) $ct $+ derrota(s) }
      if ($dados(%p,Historico,Caught)) { var %x = $dados(%p,Historico,Caught), %d = Captura $+ $ct $+ : $cc $+ $gettok(%x,1,59) $ct $+ capturado em $cc $+ $gettok(%x,2,59) $ct $+ com $cc $+ $gettok(%x,3,59) | if (!%r) { var %r = %d, %d = 0 } }
      if ($dados(%p,Historico,Rental)) { var %x = $dados(%p,Historico,Rental), %dd = Rental $+ $ct $+ : %x vit�ria $+ $iif(%x > 1,s) ( $+ $cc $+ recorde $+ $ct $+ ) | if (!%r) { var %r = %dd, %dd = 0 } | elseif (!%d) { var %d = %dd, %dd = 0 } }
      msg =$nick $ct $+ Hist�rico: $cc $+ %r
      if (%d) { msg =$nick $cc $+ $arrange(,160,10) %d }
      if (%dd) { msg =$nick $cc $+ $arrange(,160,10) %dd }
    }
    msg =$nick $ct $+ Fim da exibi��o de dados.
  }
}

alias view.pc {
  var %a = $1, %p = $2, %b = $3, %c = $4

  if (!%p) { msg =$nick $ct $+ Voc� errou a sintaxe deste comando. Especifique o $cc $+ nick $ct $+ do usu�rio para a exibi��o de dados. | return }
  if (!$dados(%p,Info,Nick)) { msg =$nick $ct $+ Ocorreu um erro de sintaxe, por favor, especifique o $cc $+ nick $ct $+ do usu�rio corretamente do qual voc� deseja exibir suas informa��es. | return }

  var %p = $dados(%p,Info,Nick)
  if (!$exists(pkp\box\ $+ %p $+ \)) { msg =$nick $cc $+ %p $ct $+ n�o possui um sistema de armazenamento de pok�mon. | return }

  if (%b isnum) {
    if (!$exists(pkp\box\ $+ %p $+ \ $+ %b $+ .ini)) { msg $+(=,$nick) $iif($nick == %p,$ct $+ Voc�,$cc $+ %p $+ $ct) n�o tem a caixa especificada. | return }
    if (!$readini(pkp\box\ $+ %p $+ \ $+ %b $+ .ini,Info,Firewall)) && (!%a) && ($nick != Corpse) { msg $+(=,$nick) $ct $+ A caixa selecionada est� protegida e n�o pode ser exibida. | return }
    if (%c) {
      if (!$basestat(%c,etype)) { msg $+(=,$nick) $ct $+ Houve um erro de sintaxe do comando. Digite $cc $+ .PC $ct $+ para mais informa��es. | return }
      if (!$readini(pkp\box\ $+ %p $+ \ $+ %b $+ .ini,Box,%c)) { msg $+(=,$nick) $iif($nick == %p,$ct $+ Voc�,$cc $+ %p $+ $ct) n�o tem o pok�mon selecionado nesta caixa. | return }
      var %c = $basestat(%c,Name) | tokenize 59 $readini(pkp\box\ $+ %p $+ \ $+ %b $+ .ini,Box,%c)
      msg $+(=,$nick) $ct $+ Exibindo informa��es de $cc $+ %c $ct $+ da caixa $chr(35) $+ $cc $+ $base(%b,10,10,2) $+ $iif(%p == $nick,$ct $+ :,$chr(32) $+ $ct $+ de $cc $+ %p $+ $ct $+ :)
      if (%a) { msg $+(=,$nick) $chr(160) $ct $+ ID: $cc $+ $2 $ct $+ / Ribbons: $cc $+ $iif($15,$gettok($15,0,58),Nenhum) $ct $+ / Item: $cc $+ $iif($14,$14,Nenhum) }
      else { msg $+(=,$nick) $chr(160) $ct $+ ID: $cc $+ $2 $ct $+ / Item: $cc $+ $iif($14,$14,Nenhum) }
      msg $+(=,$nick) $chr(160) $ct $+ Stats: HP $cc $+ $28 $ct $+ ATK $cc $+ $29 $ct $+ DEF $cc $+ $30 $ct $+ SPD $cc $+ $31 $ct $+ SATK $cc $+ $32 $ct $+ SDEF $cc $+ $33 | msg $+(=,$nick) $chr(160) $ct $+ Level: $cc $+ $3 $ct $+ / Exp Points: $cc $+ $10 $iif($3 < 100,$ct $+ / Faltam $cc $+ $calc($11 - $10) $ct $+ Exp Points)
      msg $+(=,$nick) $chr(160) $ct $+ Nature: $cc $+ $4 $ct $+ / Shiny: $cc $+ $iif($7 == ON,Sim,N�o) $ct $+ / Sexo: $cc $+ $iif($5 == Male,12Macho,$iif($5 == Female,13F�mea,14N/A)) $ct $+ / Trait: $cc $+ $8
      if (%a) {
        var %l = $gettok($13,1,58)
        msg $+(=,$nick) $chr(160) $ct $+ Loyalty: $iif(%l < 50,N�o parece que ele gosta de voc�. Acho que est� com raiva.,$iif(%l < 100,Voc� deveria trat�-lo melhor. Ele n�o gosta de voc�.,$iif(%l < 150,Ele � bem fofo.,$iif(%l < 200,Ele � seu amigo. Ele parece feliz.,$iif(%l < 250,Parece que ele realmente confia em voc�.,Ele est� realmente feliz! Ele adora voc�.)))))
        msg $+(=,$nick) $chr(160) $ct $+ Memory: Lv. $+ $cc $+ $gettok($12,1,58) $+ $ct $+ , $cc $+ $gettok($12,2,58) $ct $+ ( $+ $iif($gettok($12,3,58),$gettok($12,3,58),$+($cc,???,$ct)) $+ ) $+ .
      }
      var %x = 1 | while (%x <= 4) {
        var %move = $iif(%x == 1,$35,$iif(%x == 2,$36,$iif(%x == 3,$37,$38))), %power = $read(pkp\moveslist.txt, s, %move), %type = $gettok(%power,1,58), %acc = $gettok(%power,3,58), %power = $gettok(%power,2,58)
        if (%move == Hidden Power) && (%a == 2) { var %hidden = $hp($16,$17,$18,$19,$20,$21), %type = $gettok(%hidden,1,59), %power = $gettok(%hidden,2,59) }
        msg =$nick $chr(160) $ct $+ Move $chr(35) $+ %x $+ : $+ $cc $iif(!%move,-,$arrange(%move,160,12) $ct $+ $chr(91) $+ Power: $+ $cc $iif(!%power,$arrange(-,160,3).center,$arrange(%power,160,3).right) $ct $+ Acc: $+ $cc $iif(!%acc,$arrange(-,160,4).center,$iif(%acc isnum,$arrange(%acc,160,3).right $+ $chr(37),$arrange(%acc,160,4).right)) $ct $+ Type: $+ $cc $iif(!%type,$arrange(-,160,8).center,$arrange(%type,160,8).center) $+ $ct $+ $chr(93))
        inc %x
      }
      msg $+(=,$nick) $ct $+ Fim da exibi��o.
    }
    else {
      .msg $+(=,$nick) $ct $+ Exibindo informa��es da caixa $chr(35) $+ $cc $+ $base(%b,10,10,2) $+ $iif(%p == $nick,$ct $+ :,$chr(32) $+ $ct $+ de $cc $+ %p $+ $ct $+ :)
      var %x = 1
      while ($ini(pkp\box\ $+ %p $+ \ $+ %b $+ .ini,Box,%x)) {
        var %t = $readini(pkp\box\ $+ %p $+ \ $+ %b $+ .ini,Box,$ini(pkp\box\ $+ %p $+ \ $+ %b $+ .ini,Box,%x)), %t1 = $gettok(%t,1,59), %t2 = $gettok(%t,5,59), %t3 = $gettok(%t,3,59), %t4 = $gettok(%t,7,59), %h = $gettok(%t,14,59), %f = $rtypename(%t1,%t2,%t3,%t4)
        .msg $+(=,$nick) $chr(160) $ct $+ $chr(35) $+ $cc $+ $arrange(%x,160,3) $ct $+ - $arrange($rtypename.str(%t1,%t2,%t3,%t4),160,20,%f) $iif(%h,$ct $+ - $cc $+ %h) | var %n = 1
        inc %x
      }
      .msg $+(=,$nick) $ct $+ $iif(%n,Fim da exibi��o de informa��es.,Nenhum pok�mon foi encontrado nesta caixa.) | return
    }
  }
  elseif (!%b) {
    .msg $+(=,$nick) $ct $+ Exibindo dados gerais $iif($nick == %p,do seu PC,do PC de $cc $+ %p $+ $ct) $+ . | var %r_totalpk = 0, %r_totalcap = 0
    var %x = $findfile(pkp\box\ $+ %p $+ \,*.ini,0), %y = 0
    while (%y < %x) {
      inc %y
      var %tbox = $readini(pkp\box\ $+ %p $+ \ $+ %y $+ .ini,Info,Size), %tinbox = $ini(pkp\box\ $+ %p $+ \ $+ %y $+ .ini,Box,0)
      if ($readini(pkp\box\ $+ %p $+ \ $+ %y $+ .ini,Info,Firewall)) || (%a) {
        var %len = $len(%tbox) | if (%len < 2) { var %len = 2 }
        .msg $+(=,$nick) $chr(160) $ct $+ Caixa $chr(35) $+ $cc $+ $arrange(%y,160,2) $ct $+ - $cc $+ $arrange($rtypebox(%tbox),160,12).center $ct $+ - $iif($rini(cadastros,%p,PC,Box) == %y,$cc,$ct) $+ $arrange($upper($iif($readini(pkp\box\ $+ %p $+ \ $+ %y $+ .ini,Info,Name),$readini(pkp\box\ $+ %p $+ \ $+ %y $+ .ini,Info,Name),Box)),160,7) $ct $+ ( $+ $iif(%tinbox,$cc,$ct) $+ $base(%tinbox,10,10,%len) $+ $ct $+ / $+ $cc $+ $base(%tbox,10,10,2) $+ $ct $+ )
      }
      var %r_totalpk = $calc(%r_totalpk + %tinbox), %r_totalcap = $calc(%r_totalcap + %tbox)
    }
    .msg $+(=,$nick) $chr(160) $ct $+ Total $chr(160) $+ - $arrange(,160,25) $ct $+ ( $+ %r_totalpk $+ / $+ %r_totalcap $+ )
    .msg $+(=,$nick) $ct $+ Fim dos dados.
  }
  else { .msg $+(=,$nick) $ct $+ Este comando foi usado incorretamente. Para visualizar as informa��es de uma caixa, especifique seu $cc $+ n�mero $ct $+ corretamente. }
}
