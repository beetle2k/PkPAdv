alias calcstat {
  var %n1 = $1, %n2 = $2, %n3 = $3, %n4 = $4, %n5 = $5

  var %n3 = $int($calc(%n3 / 4))
  var %nt = %n4, %n4 = $calc(%n4 / 100)
  if (%n1 > 1) {
    if (!$prop) { var %r = $calc( (( ((%n1 * 2) + %n2 + %n3) * %n4) + 5) * %n5 ) }
    elseif ($prop == HP) { var %r = $calc( (( ((%n1 * 2) + %n2 + %n3) * %n4) + 10) + %nt) }
    var %r = $int(%r)
  }
  else { var %r = 1 }

  return %r
}

alias round.up {
  var %r = $gettok($1,1,46)
  if ($gettok($1,0,46) == 2) { var %n = $gettok($1,2,46) }
  if (%n > 0) { inc %r }
  return %r
}
alias round.down { return $gettok($1,1,46) }
alias returniv {
  var %n1 = $1, %n2 = $2, %n3 = $3, %n4 = $4, %n5 = $5
  if (!$prop) { return $calc((($round.up(%n2 / %n4) - 5) * (100 / %n3)) - (2 * %n1) - (%n5 / 4)) }
  elseif ($prop == HP) { return $calc(((%n2 - %n3 - 10) * (100 / %n3)) - (2 * %n1) - (%n5 / 4)) }
}

alias hp {
  if ($1 == 2) || ($1 == 3) || ($1 == 6) || ($1 == 7) || ($1 == 10) || ($1 == 11) || ($1 == 14) || ($1 == 15) || ($1 == 18) || ($1 == 19) || ($1 == 22) || ($1 == 23) || ($1 == 26) || ($1 == 27) || ($1 == 30) || ($1 == 31) { var %p1 = 1 } | else { var %p1 = 0 }
  if ($2 == 2) || ($2 == 3) || ($2 == 6) || ($2 == 7) || ($2 == 10) || ($2 == 11) || ($2 == 14) || ($2 == 15) || ($2 == 18) || ($2 == 19) || ($2 == 22) || ($2 == 23) || ($2 == 26) || ($2 == 27) || ($2 == 30) || ($2 == 31) { var %p2 = 2 } | else { var %p2 = 0 }
  if ($3 == 2) || ($3 == 3) || ($3 == 6) || ($3 == 7) || ($3 == 10) || ($3 == 11) || ($3 == 14) || ($3 == 15) || ($3 == 18) || ($3 == 19) || ($3 == 22) || ($3 == 23) || ($3 == 26) || ($3 == 27) || ($3 == 30) || ($3 == 31) { var %p3 = 4 } | else { var %p3 = 0 }
  if ($4 == 2) || ($4 == 3) || ($4 == 6) || ($4 == 7) || ($4 == 10) || ($4 == 11) || ($4 == 14) || ($4 == 15) || ($4 == 18) || ($4 == 19) || ($4 == 22) || ($4 == 23) || ($4 == 26) || ($4 == 27) || ($4 == 30) || ($4 == 31) { var %p4 = 8 } | else { var %p4 = 0 }
  if ($5 == 2) || ($5 == 3) || ($5 == 6) || ($5 == 7) || ($5 == 10) || ($5 == 11) || ($5 == 14) || ($5 == 15) || ($5 == 18) || ($5 == 19) || ($5 == 22) || ($5 == 23) || ($5 == 26) || ($5 == 27) || ($5 == 30) || ($5 == 31) { var %p5 = 16 } | else { var %p5 = 0 }
  if ($6 == 2) || ($6 == 3) || ($6 == 6) || ($6 == 7) || ($6 == 10) || ($6 == 11) || ($6 == 14) || ($6 == 15) || ($6 == 18) || ($6 == 19) || ($6 == 22) || ($6 == 23) || ($6 == 26) || ($6 == 27) || ($6 == 30) || ($6 == 31) { var %p6 = 32 } | else { var %p5 = 0 }
  if ($1 == 1) || ($1 == 3) || ($1 == 5) || ($1 == 7) || ($1 == 9) || ($1 == 11) || ($1 == 13) || ($1 == 15) || ($1 == 17) || ($1 == 19) || ($1 == 21) || ($1 == 23) || ($1 == 25) || ($1 == 27) || ($1 == 29) || ($1 == 31) { var %t1 = 1 } | else { var %t1 = 0 }
  if ($2 == 1) || ($2 == 3) || ($2 == 5) || ($2 == 7) || ($2 == 9) || ($2 == 11) || ($2 == 13) || ($2 == 15) || ($2 == 17) || ($2 == 19) || ($2 == 21) || ($2 == 23) || ($2 == 25) || ($2 == 27) || ($2 == 29) || ($2 == 31) { var %t2 = 2 } | else { var %t2 = 0 }
  if ($3 == 1) || ($3 == 3) || ($3 == 5) || ($3 == 7) || ($3 == 9) || ($3 == 11) || ($3 == 13) || ($3 == 15) || ($3 == 17) || ($3 == 19) || ($3 == 21) || ($3 == 23) || ($3 == 25) || ($3 == 27) || ($3 == 29) || ($3 == 31) { var %t3 = 4 } | else { var %t3 = 0 }
  if ($4 == 1) || ($4 == 3) || ($4 == 5) || ($4 == 7) || ($4 == 9) || ($4 == 11) || ($4 == 13) || ($4 == 15) || ($4 == 17) || ($4 == 19) || ($4 == 21) || ($4 == 23) || ($4 == 25) || ($4 == 27) || ($4 == 29) || ($4 == 31) { var %t4 = 8 } | else { var %t4 = 0 }
  if ($5 == 1) || ($5 == 3) || ($5 == 5) || ($5 == 7) || ($5 == 9) || ($5 == 11) || ($5 == 13) || ($5 == 15) || ($5 == 17) || ($5 == 19) || ($5 == 21) || ($5 == 23) || ($5 == 25) || ($5 == 27) || ($5 == 29) || ($5 == 31) { var %t5 = 16 } | else { var %t5 = 0 }
  if ($6 == 1) || ($6 == 3) || ($6 == 5) || ($6 == 7) || ($6 == 9) || ($6 == 11) || ($6 == 13) || ($6 == 15) || ($6 == 17) || ($6 == 19) || ($6 == 21) || ($6 == 23) || ($6 == 25) || ($6 == 27) || ($6 == 29) || ($6 == 31) { var %t6 = 32 } | else { var %t6 = 0 }
  var %power = $int($calc((((%p1 + %p2 + %p3 + %p4 + %p5 + %p6) * 40) / 63) + 30)), %type = $int($calc(((%t1 + %t2 + %t3 + %t4 + %t5 + %t6) * 15) / 63))
  if (%type == 0) { var %type1 = Fighting }
  elseif (%type == 1) { var %type1 = Flying }
  elseif (%type == 2) { var %type1 = Poison }
  elseif (%type == 3) { var %type1 = Ground }
  elseif (%type == 4) { var %type1 = Rock }
  elseif (%type == 5) { var %type1 = Bug }
  elseif (%type == 6) { var %type1 = Ghost }
  elseif (%type == 7) { var %type1 = Steel }
  elseif (%type == 8) { var %type1 = Fire }
  elseif (%type == 9) { var %type1 = Water }
  elseif (%type == 10) { var %type1 = Grass }
  elseif (%type == 11) { var %type1 = Electric }
  elseif (%type == 12) { var %type1 = Psychic }
  elseif (%type == 13) { var %type1 = Ice }
  elseif (%type == 14) { var %type1 = Dragon }
  elseif (%type == 15) { var %type1 = Dark }
  if ($prop == type) { return %type1 } | if ($prop == power) { return %power } | else { return %type1 $+ ; $+ %power }
}
alias separe {
  var %x = $1-, %y = $gettok(%x,0,58), %z = 1
  while (%z <= %y) { if (%r) { var %r = %r $+ , $gettok(%x,%z,58) } | else { var %r = $gettok(%x,%z,58) } | inc %z }
  return %r
}
alias numero {
  var %n = um dois tr�s quatro cinco seis sete oito nove dez onze doze treze q�atorze quinze dezesseis dezessete dezoito dezenove vinte
  if ($1 isnum 1-20) { return $gettok(%n,$1,32) }
  elseif ($1 == 0) { return nenhum }
  else { return v�rios }
}
alias numero2 {
  var %n = uma duas tr�s quatro cinco seis sete oito nove dez onze doze treze q�atorze quinze dezesseis dezessete dezoito dezenove vinte
  if ($1 isnum 1-20) { return $gettok(%n,$1,32) }
  elseif ($1 == 0) { return nenhuma }
  else { return v�rias }
}
alias deposit {
  var %nick = $1, %pokemon = $2, %box = $3 | recalc %nick %pokemon
  var %line = $getpkline(%nick,%pokemon)
  if (!$exists(pkp\box\ $+ $1 $+ \)) { .mkdir PkP\Box\ $+ $1 $+ \ }
  writeini pkp\box\ $+ $1 $+ \ $+ %box $+ .ini Box %pokemon %line
  remteam %nick %pokemon | remini pkp\cadastros\ $+ %nick $+ .ini %pokemon
}
alias withdraw {
  var %nick = $1, %pokemon = $2, %box = $3
  tokenize 59 $rini(box,%nick $+ \ $+ %box,Box,%pokemon)
  if ($teampos(%nick,Egg)) { remteam %nick Egg | addteam %nick $1 | addteam %nick Egg }
  else { addteam %nick $1 }
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 Name $1
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 ID $2
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 Level $3
  if ($4 == Timidy) { writeini pkp\cadastros\ $+ %nick $+ .ini $1 Nature Timid }
  else { writeini pkp\cadastros\ $+ %nick $+ .ini $1 Nature $4 }
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 Sex $5
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 GV $6
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 Shiny $7
  if ($8 == Stick Hold) { writeini pkp\cadastros\ $+ %nick $+ .ini $1 Trait Sticky Hold }
  else { writeini pkp\cadastros\ $+ %nick $+ .ini $1 Trait $8 }
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 ExpStat $9
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 Exp $10
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 Next $11
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 Memory $12
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 Loyalty $13
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 Hold $14
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 Ribbon $15
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 IVHp $16
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 IVAtk $17
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 IVDef $18
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 IVSpd $19
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 IVSAtk $20
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 IVSDef $21
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 EVHP $22
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 EVAtk $23
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 EVDef $24
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 EVSpd $25
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 EVSAtk $26
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 EVSDef $27
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 HP $28
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 Atk $29
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 Def $30
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 Spd $31
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 SAtk $32
  writeini pkp\cadastros\ $+ %nick $+ .ini $1 SDef $33
  if ($34) { writeini pkp\cadastros\ $+ %nick $+ .ini $1 Learn $34 }
  if ($35) { writeini pkp\cadastros\ $+ %nick $+ .ini $1 Move1 $35 }
  if ($36) { writeini pkp\cadastros\ $+ %nick $+ .ini $1 Move2 $36 }
  if ($37) { writeini pkp\cadastros\ $+ %nick $+ .ini $1 Move3 $37 }
  if ($38) { writeini pkp\cadastros\ $+ %nick $+ .ini $1 Move4 $38 }
  remini pkp\box\ $+ %nick $+ \ $+ %box $+ .ini Box %pokemon
}
alias release {
  var %nick = $1, %pokemon = $2, %box = $3
  remini pkp\box\ $+ %nick $+ \ $+ %box $+ .ini Box %pokemon
}
alias rtypename {
  if ($1 == Egg) { return $ct $+ $1 $+ ( $+ 15 $+ ? $+ $ct $+ / $+ $cc $+ ?? $+ $ct $+ ) }
  else { return $ct $+ $1 $+ $iif($4 == ON,4+ $+ $ct,$+) $+ ( $+ $iif($2 == Male,12M,$iif($2 == Female,13F,14N/A)) $+ $ct $+ / $+ $cc $+ $3 $+ $ct $+ ) }
}
alias rtypename.str {
  if ($1 == Egg) { var %r = $1 $+ (?/??) }
  else { var %r = $1 $+ $iif($4 == ON,+,$+) $+ ( $+ $iif($2 == Male,M,$iif($2 == Female,F,N/A)) $+ / $+ $3 $+ ) }
  return %r
}
alias rlstimeout {
  wlog user $1 Released $2 of box $3 $+ : $readini(pkp\box\ $+ $1 $+ \ $+ $3 $+ .ini,Box,$2)
  .release $1 $2 $3 | .msg = [ $+ [ $1 ] ] $ct $+ Seu pok�mon foi exclu�do. | unset %confirm. [ $+ [ $1 ] ]
}
alias chat_close {
  var %nick = $1, %n = 0, %t = $chat(0), %i = 0
  while (%i < %t) {
    inc %i | if ($chat(%i) == %nick) { inc %n }
  }
  .close $+(-c,%n) %nick
}
ON *:Start: { hmake var 500 | if (%milhagem) { sset Milhagem %milhagem | unset %milhagem } | .timerMilhagem 0 30 /milhagem.add | .window -hnls @top | .loadbuf @top pkp\top.txt }

ON *:Connect: {
  .timerCONNECT off
  if ($pass($me)) { .nickserv identify $pass($me) }
  .timerJoin 1 3 /autojoin
}
OFF *:Disconnect: {
  .timerCONNECT 0 60 /server eu.brasnet.org:6667
}
ON *:Nick: {
  if ($nick == $me) {
    if (guest isin $newnick) {
      .timer 1 12 /nick $me
      if ($pass($me)) { .timer 1 15 /nickserv identify $pass($me) }
      .timer 1 20 /autojoin
    }
    elseif ($pass($me)) { /nickserv identify $pass($me) }
  }
}
ON *:NOTICE:*:*: {
  if ($nick == NickServ) && ($v(Pass. $+ $me)) {
    var %ex1 = Senha aceita - voce esta reconhecido, %ex2 = Password accepted - you are now recognized
    if (%ex1 isin $1-) || (%ex2 isin $1-) { writeini pkp\status.ini Pass $me $v(Pass. $+ $me) | uset Pass. $+ $me | .timerPASS.CLEAR off }
    var %ex1 = Senha alterada, %ex2 = Password changed
    if (%ex1 isin $1-) || (%ex2 isin $1-) { writeini pkp\status.ini Pass $me $v(Pass. $+ $me) | uset Pass. $+ $me | .timerPASS.CLEAR off }
  }
}
CTCP *:PING:*: { halt }
ON *:OPEN:=: {
  if ($npc($nick) == Ok) || ($basestat($nick,etype)) { msg =$nick $ct $+ O nick $cc $+ $nick $ct $+ n�o � um nick v�lido. Para mudar de nick, digite $cc $+ /nick <novo nick> $+ $ct $+ . | .chat_close $nick | return }
  ; var %a = $rini(cadastros,$nick,Info,Access) | if (!$comchan($nick,0)) && ($iif(%a,%a,0) < 2) { msg =$nick $ct $+ Sua $cc $+ conex�o $ct $+ n�o p�de ser $cc $+ estabelecida $+ $ct $+ . � necess�rio estar, pelo menos, em $cc $+ um $ct $+ canal em $cc $+ comum $ct $+ com o bot. | .chat_close $nick | return }
  ; if ($rini(cadastros,$Nick,Info,Access) != 5) { msg =$nick $ct $+ Voc� n�o est� autorizado a entrar no bot neste momento. Aguarde. | .chat_close $nick | return }
  ; if ($clone($nick) == $true) { msg =$nick $ct $+ N�o � permitida a entrada de mais de um usu�rio usando o mesmo $cc $+ IP $+ $ct $+ . | .chat_close $nick | return }
  if ($clone($nick) == $true) && ($getip($nick) != 127.0.0.1) { wlog user $nick Someone unexpected tried to log in ( $+ $getip($nick) $+ ). | msg =$nick $ct $+ N�o � permitida a entrada de mais de um usu�rio usando o mesmo $cc $+ IP $+ $ct $+ . | .chat_close $nick | return }
  if ($rini(cadastros,$nick,Info,Nick)) {
    wlog user $nick Connection is now open ( $+ $getip($nick) $+ ).
    if ($rini(cadastros,$nick,Info,Banned)) {
      if ($gettok($rini(cadastros,$nick,Info,Banned),2,59)) {
        var %b = $dados($nick,Info,Banned), %x = $calc($ctime($date $time) - $ctime($gettok(%b,1,59))), %d = $calc($gettok(%b,2,59) * 3600)
        if (%x < %d) {
          msg =$nick $ct $+ Seu nick foi banido $cc $+ temporariamente $+ $ct $+ . Sua penalidade expirar� em $dur($gettok($fulldur($calc(%d - %x)),1,32),$ct,$cc).e $+ .
          .chat_close $nick
          return
        }
        else { remini pkp\cadastros\ $+ $nick $+ .ini Info Banned }
      }
      else { msg =$nick $ct $+ Seu nick foi banido por tempo $cc $+ indeterminado $+ $ct $+ . Se desconhece o motivo, procure um moderador. | .chat_close $nick | return }
    }
    active $nick rem
    var %x = Se n�o lembra de sua senha, digite ' $+ $cc $+ .Esqueci $+ $ct $+ ' para receb�-la via MemoServ.
    msg =$nick $ct $+ Seu nick j� est� cadastrado. Para acessa-lo, digite sua senha. Voc� tem $cc $+ 30 $ct $+ segundos antes que seu login seja cancelado. $iif($rini(cadastros,$nick,Info,Recover),%x)
    .timerACCESS $+ $nick 1 30 /cancellogin $nick | if (!$findtok(%accesslist,$nick,0,58)) { if (%accesslist) { set %accesslist %accesslist $+ : $+ $nick } | else { set %accesslist $nick } }
  }
  else {
    var %n = $nick | if ($left(%n,5) == guest) && ($remove(%n,guest) isnum) { msg =$nick $ct $+ Sinto muito, mas seu nick � um $cc $+ guest $+ $ct $+ . Por favor, mude-o para poder acessar o bot. | .chat_close $nick | return }
    if ($nickscan(%n) == No!) { msg =$nick $ct $+ Seu nickname ' $+ $cc $+ %n $+ $ct $+ ' cont�m $cc $+ caracteres inv�lidos $+ $ct $+ . Por favor, $cc $+ mude $ct $+ de nick se quiser continuar. | .chat_close $nick | return }
    msg =$nick $ct $+ Seja bem vindo(a) $cc $+ $nick $+ $ct $+ , para entrar no bot voc� precisa se cadastrar. Voc� tem $cc $+ 3 $ct $+ minutos, at� que seu cadastro seja cancelado.
    msg =$nick $ct $+ Para se cadastrar, digite uma $cc $+ senha $ct $+ (que voc� usar� para acessar o bot), seu $cc $+ email $ct $+ e o continente que voc� inicia sua jornada ( $+ $cc $+ Hoenn $ct $+ ou $cc $+ Kanto $+ $ct $+ ). Voc� pode digit�-los em uma �nica linha, consecutivamente, ou em linhas separadas. Sua senha deve ter no m�nimo 5 caracteres e seu email deve ser v�lido.
    .timerCAD $+ $nick 1 180 /cancelcad $nick | if (!$findtok(%cadlist,$nick,0,58)) { if (%cadlist) { set %cadlist %cadlist $+ : $+ $nick } | else { set %cadlist $nick } }
  }
}
ON *:CLOSE:=: { .chat_close $nick }
ON *:JOIN:#Pokemon,#Project,#Myutsu: { if ($nick == Corpse) { msg $chan $cc $+ $nick $+ $ct $+ , voc� � o $cc $+ 0 $+ $ct $+ � melhor treinador do bot! } | else if ($dados($nick,Info,Perfil,17)) { var %pos = $top.pos($nick) | if (%pos) { msg $chan $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , voc� � o $cc $+ %pos $+ $ct $+ � melhor treinador do bot! } } }
ON *:JOIN:#PkP: {
  if ($nick == $me) {
    return
  }
  if ($dados($nick,Info,Perfil,17)) { var %pos = $top.pos($nick) | if (%pos) { msg #PkP $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , voc� � o $cc $+ %pos $+ $ct $+ � melhor treinador do canal! } }
  if ($nick !isop $chan) && ($nick !isvoice $chan) {
    var %a = $rini(cadastros,$nick,Info,Access) | if (%a isnum 2-3) { .mode $chan +v $nick } | if (%a == 4) { .mode $chan +o $nick }
  }
}
ON *:CHAT:*: {
  if ($findtok(%memorylist,$nick,0,58)) {
    var %x = $rini(cadastros,$nick,Info,Recover), %x = $gettok(%x,2,172)
    if ($1 == %x) { wlog user $me sent a memoserv with your password. | .MemoServ send $nick  $+ $dados($nick,Info,Nick) $+  $+ ( $+ $getip($nick) $+ ) fez a solicita��o de sua senha de acesso ao  $+ $me $+ , bot de batalhas pok�mon online. Sua senha � ' $+ $rini(cadastros,$nick,Info,Password) $+ '. Memorize-a, voc� a utilizar� sempre que tentar acess�-lo. | .msg =$nick $ct $+ Sua senha foi enviada. Verifique em seu $cc $+ MemoServ $ct $+ por novas mensagens. | unset %choice. [ $+ [ $nick ] ] | .cancellogin $nick }
    else { wlog user $nick Wrong 'secret answer' made the connection close. | .msg =$nick $ct $+ Resposta incorreta. | unset %choice. [ $+ [ $nick ] ] | .chat_close $nick }
    return
  }
  if ($findtok(%accesslist,$nick,0,58)) {
    if ($1 == .Esqueci) {
      var %x = $rini(cadastros,$nick,Info,Recover), %x = $gettok(%x,1,172) | if (%x) {
        msg =$nick $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , bem-vindo ao assistente de recupera��o de senha. Para receber sua senha via $cc $+ MemoServ $+ $ct $+ , � necess�rio que responda � sua pergunta secreta corretamente. Voc� tem $cc $+ um $ct $+ minuto.
        msg =$nick $ct $+ Pergunta: $cc $+ %x
        wlog user $nick Trying to recover your own password...
        .timerACCESS $+ $nick 1 60 /cancellogin $nick | if (!$findtok(%memorylist,$nick,0,58)) { if (%memorylist) { set %memorylist %memorylist $+ : $+ $nick } | else { set %memorylist $nick } }
      }
      else { msg =$nick $cc $+ $nick $ct $+ ainda n�o definiu sua $cc $+ pergunta secreta $+ $ct $+ . }
    }
    if ($rini(cadastros,$nick,Info,Password) == $1) {
      msg =$nick $ct $+ Senha aceita. Voc� est� reconhecido. | unset %choice. [ $+ [ $nick ] ] | .timerACCESS $+ $nick off
      start.events
      wlog user $nick You're now connected, at $date $+ .
    }
    else {
      if (%choice. [ $+ [ $nick ] ]) { unset %choice. [ $+ [ $nick ] ] | msg =$nick $ct $+ Senha incorreta. Login cancelado. | .cancellogin $nick | wlog user $nick Wrong password at $time $+ , $date $+ . }
      else { set %choice. [ $+ [ $nick ] ] 1 | msg =$nick $ct $+ Senha incorreta. Voc� ainda tem uma chance. }
    }
    return
  }
  if ($findtok(%cadlist,$nick,0,58)) {
    if ($count($1-,)) || ($count($1-,)) || ($count($1-,)) { msg =$nick $ct $+ Para seu cadastro ser concretizado, n�o use cores. Digite $cc $+ /say $ct $+ antes de suas mensagens para remov�-las ou simplesmente desative o sistema de $cc $+ AutoColor $ct $+ do seu script. | return }
    if ($gettok($1-,0,32) > 1) && (!%cad. [ $+ [ $nick ] $+ ] .sep) {
      if ($len($1) < 5) { msg =$nick $ct $+ Sua senha deve conter no m�nimo $cc $+ cinco $ct $+ caracteres. | return } | if ($len($1) > 10) { msg =$nick $ct $+ Sua senha deve conter no m�ximo $cc $+ dez $ct $+ caracteres. | return } | if (!$1) || ($nickscan($1) == No!) { msg =$nick $ct $+ Sua senha cont�m caracteres inv�lidos. Utilize $cc $+ letras $ct $+ e $cc $+ n�meros $+ $ct $+ , de prefer�ncia. | return } | var %pass = $1
      if (!$count($2,@)) { msg =$nick $ct $+ Seu email n�o � valido. | return } | var %email = $2
      if ($3 != Hoenn) && ($3 != Kanto) { msg =$nick $ct $+ As regi�es dispon�veis para come�ar s�o: $cc $+ Hoenn $ct $+ ou $cc $+ Kanto $+ $ct $+ . | return } | var %region = $org($3)
      cadastro.add $nick %pass %email | msg =$nick $ct $+ Voc� foi cadastrado, sua senha � $cc $+ %pass $ct $+ e email $cc $+ %email $+ $ct $+ .
      if (%region == Kanto) { var %city = Pallet Town } | else { var %city = Littleroot Town } | writeini pkp\cadastros\ $+ $nick $+ .ini Info Start %region | writeini pkp\cadastros\ $+ $nick $+ .ini Info Region %region | writeini pkp\cadastros\ $+ $nick $+ .ini Info Locate %city
      .timerCAD $+ $nick off | unset %cad. [ $+ [ $nick ] $+ ] .*
      start.events
      msg =$nick $chr(160)
      msg =$nick $chr(160) $cc $+ Mom $ct $+ - Querido, espero que esteja gostando de morar aqui em $cc $+ %city $+ $ct $+ . A vizinhan�a � maravilhosa, voc� devia procurar pelo $cc $+ Prof $iif(%city == Pallet Town,Oak,Birch) $+ $ct $+ , � ele quem est� dando pok�mon para treinadores iniciarem a sua jornada! Finalmente voc� poder� realizar o seu sonho!
      msg =$nick $chr(160) $cc $+ Mom $ct $+ - Eu ficarei com saudades, certamente, mas estou certa de que voc� dar� o melhor de si e estar� bem! Boa sorte, $cc $+ $rini(cadastros,$nick,Info,Nick) $+ $ct $+ , estou torcendo por voc�!
      msg =$nick $chr(160) $cc $+ Mom $ct $+ - Eu ia me esquecendo... Voc� n�o deve saber como ir no laborat�rio. Bem, filho, para saber em que cidade est�, digite " $+ $cc $+ .Dados $+ $ct $+ ", sem as aspas. Para ver as localidades dispon�veis na cidade, digite " $+ $cc $+ .Cidade $+ $ct $+ ". Ao digitar, voc� saber� como visitar o laborat�rio. Sempre que quiser falar comigo, digite " $+ $cc $+ .Cidade Search Mom $+ $ct $+ ".
      wlog user $nick Choose %city as your beginning town, on $date $+ .
      return
    }
    else {
      set %cad. [ $+ [ $nick ] $+ ] .sep 1
      ; if (!%cad. [ $+ [ $nick ] $+ ] .poke) { if ($1 != Treecko) && ($1 != Torchic) && ($1 != Mudkip) { msg =$nick $ct $+ O pok�mon selecionado n�o � permitido. | return } | set %cad. [ $+ [ $nick ] $+ ] .poke $basestat($1,name) | msg =$nick $ct $+ Pok�mon selecionado: $cc $+ $basestat($1,name) $+ $ct $+ . Agora, digite sua senha. | return }
      if (!%cad. [ $+ [ $nick ] $+ ] .pass) { if ($len($1) < 5) { msg =$nick $ct $+ Sua senha deve conter no m�nimo $cc $+ cinco $ct $+ caracteres. | return } | if ($len($1) > 10) { msg =$nick $ct $+ Sua senha deve conter no m�ximo $cc $+ dez $ct $+ caracteres. | return } | if (!$1) || ($nickscan($1) == No!) { msg =$nick $ct $+ Sua senha cont�m caracteres inv�lidos. Utilize $cc $+ letras $ct $+ e $cc $+ n�meros $+ $ct $+ , de prefer�ncia. | return } | set %cad. [ $+ [ $nick ] $+ ] .pass $1 | msg =$nick $ct $+ Sua senha �: $cc $+ $1 $+ $ct $+ . Agora, digite seu email. | return }
      if (!%cad. [ $+ [ $nick ] $+ ] .email) { if (!$count($1,@)) { msg =$nick $ct $+ Seu email n�o � valido. | return } | set %cad. [ $+ [ $nick ] $+ ] .email $1
        msg =$nick $ct $+ Seu email �: $cc $+ $1 $+ $ct $+ . Para finalizar, digite em que continente voc� deseja iniciar sua jornada. Escolha entre $cc $+ Hoenn $ct $+ ou $cc $+ Kanto $+ $ct $+ . | return
        ; msg =$nick $ct $+ Seu email �: $cc $+ $1 $+ $ct $+ .
      }
      if (!%cad. [ $+ [ $nick ] $+ ] .region) { if ($1 != Kanto) && ($1 != Hoenn) { msg =$nick $ct $+ As regi�es dispon�veis para come�ar s�o: $cc $+ Hoenn $ct $+ ou $cc $+ Kanto $+ $ct $+ . | return | return } | set %cad. [ $+ [ $nick ] $+ ] .region $org($1) }
      ; var %region = Hoenn
      var %region = %cad. [ $+ [ $nick ] $+ ] .region
      var %y = %cad. [ $+ [ $nick ] $+ ] .pass, %z = %cad. [ $+ [ $nick ] $+ ] .email | .timerCAD $+ $nick off | cadastro.add $nick %y %z | msg =$nick $ct $+ Voc� foi cadastrado. Sua senha � $cc $+ %y $ct $+ e seu email, $cc $+ %z $+ $ct $+ .
      if (%region == Kanto) { var %city = Pallet Town } | else { var %city = Littleroot Town } | writeini pkp\cadastros\ $+ $nick $+ .ini Info Start %region | writeini pkp\cadastros\ $+ $nick $+ .ini Info Region %region | writeini pkp\cadastros\ $+ $nick $+ .ini Info Locate %city
      unset %cad. [ $+ [ $nick ] $+ ] .*
      start.events
      msg =$nick $chr(160)
      msg =$nick $chr(160) $cc $+ Mom $ct $+ - Querido, espero que esteja gostando de morar aqui em $cc $+ %city $+ $ct $+ . A vizinhan�a � maravilhosa, voc� devia procurar pelo $cc $+ Prof $iif(%city == Pallet Town,Oak,Birch) $+ $ct $+ , � ele quem est� dando pok�mon para treinadores iniciarem a sua jornada! Finalmente voc� poder� realizar o seu sonho!
      msg =$nick $chr(160) $cc $+ Mom $ct $+ - Eu ficarei com saudades, certamente, mas estou certa de que voc� dar� o melhor de si e estar� bem! Boa sorte, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , estou torcendo por voc�!
      msg =$nick $chr(160) $cc $+ Mom $ct $+ - Eu ia me esquecendo... Voc� n�o deve saber como ir no laborat�rio. Bem, filho, para saber em que cidade est�, digite " $+ $cc $+ .Dados $+ $ct $+ ", sem as aspas. Para ver as localidades dispon�veis na cidade, digite " $+ $cc $+ .Cidade $+ $ct $+ ". Ao digitar, voc� saber� como visitar o laborat�rio. Sempre que quiser falar comigo, digite " $+ $cc $+ .Cidade Search Mom $+ $ct $+ ".
      wlog user $nick Choose %city as your beginning town, on $date $+ .
      return
    }
  }
  active $nick
  if (%choose. [ $+ [ $nick ] ]) {
    var %c = %choose. [ $+ [ $nick ] ], %pf = $gettok(Oak Birch Elm,$findtok(Pallet Town:Littleroot Town:New Bark Town,$dados($nick,Info,Locate),1,58),32)
    if (!$findtok(%c,$1-,0,58)) {
      if ($basestat($1-,name)) { msg =$nick $chr(160) $cc $+ Prof %pf $ct $+ - Sinto muito, mas n�o tenho dispon�vel o pok�mon desejado. Voc� pode escolher apenas estes: $separecom(%c,ou,58,$cc,$ct) $+ . }
      else { msg =$nick $chr(160) $cc $+ Prof %pf $ct $+ - Isso � realmente um pok�mon? Por favor, digite o nome dele corretamente. }
      return
    }
    var %x = $basestat($1-,name) | addpoke $nick %x 5 5: $+ $dados($nick,Info,Locate) $+ :Poke  Ball
    wlog user $nick Choose %x as your first pok�mon.
    if ($findtok(Bulbasaur:Chikorita:Treecko,%x,0,58)) { var %n = 1 } | elseif ($findtok(Charmander:Cyndaquil:Torchic,%x,0,58)) { var %n = 2 } | else { var %n = 3 }
    if (%pf == Birch) { msg =$nick $chr(160) $cc $+ Prof Birch $ct $+ - Mas que �tima escolha! Cuide bem de $cc $+ %x $+ $ct $+ ! | msg =$nick $chr(160) $cc $+ Prof Birch $ct $+ - Ah, acho que minha sobrinha vai ajud�-lo. Procure na cidade por $cc $+ May $+ $ct $+ , ela tem algo para voc�. | writeini pkp\cadastros\ $+ $nick $+ .ini Quests May %n }
    else {
      msg =$nick $chr(160) $cc $+ Prof Oak $ct $+ - Ah, $cc $+ %x $+ $ct $+ ! Foi uma �tima escolha, sem d�vida!
      msg =$nick $chr(160) $cc $+ Gary $ct $+ - ... E quanto a mim?!
      msg =$nick $chr(160) $cc $+ Prof Oak $ct $+ - Calma, $cc $+ Gary $+ $ct $+ . Aqui est�, eu guardei este para voc�.
      msg =$nick $cc $+ Gary $ct $+ recebeu um pok�mon!
      writeini pkp\cadastros\ $+ $nick $+ .ini Quests Gary %n | battle.npc $nick Start_Gary | sset [ [ B. ] $+ [ $checknickid($nick).ID ] $+ [ .Quest ] ] GARY | var %n = $gettok($rmoves($checknickid($nick).ID,1),1,58)
      msg =$nick $chr(160) $cc $+ Prof Oak $ct $+ - Mas que teimosia! Batalhar em meu laborat�rio! Bem, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , voc� n�o deve saber como batalhar. Para atacar com seu pok�mon, digite " $+ $cc $+ .Golpe %n $+ $ct $+ ", sem as aspas, e $cc $+ %x $ct $+ usar� o golpe $cc $+ %n $ct $+ em seu advers�rio.
    }
    unset %choose. [ $+ [ $nick ] ] | .echo $pokedex($nick,%x).add | return
  }
  if (%set_prize == $nick) {
    var %s = %set_prize_step, %f = pkp\status.ini Prize
    if (%s == 1) {
      if ($findtok(Pokemon:Premium:Dinheiro:Milhagem,$1-,0,58)) {
        writeini %f Type $org($1-) | inc %set_prize_step | var %t = $prize(type)
        if (%t == Pokemon) { var %n = o nome do pok�mon para a premia��o }
        elseif (%t == Premium) { var %n = a dura��o, em dias, da conta premiada }
        elseif (%t == Dinheiro) { var %n = a quantia, em dinheiro, que ser� fornecida como premia��o }
        elseif (%t == Milhagem) { var %n = o n�mero de milhas que ser�o fornecidas }
        msg =$nick $ct $+ Voc� escolheu ' $+ $cc $+ %t $+ $ct $+ '. Agora, determine %n $+ .
      }
      else { msg =$nick $ct $+ Tipo inexistente. Releia o que foi dito. | return }
    }
    elseif (%s == 2) {
      var %t = $prize(type)
      if (%t == Pokemon) && (!$basestat($1-,Type)) { msg =$nick $ct $+ Digitou mesmo o nome de um pok�mon v�lido? Reveja o que foi dito. | return }
      if (%t == Premium) && ($1- !isnum) { msg =$nick $ct $+ Digitou mesmo um n�mero v�lido? Reveja o que foi dito. | return }
      if (%t == Dinheiro) && ($1- !isnum) { msg =$nick $ct $+ Digitou mesmo um n�mero v�lido? Reveja o que foi dito. | return }
      if (%t == Milhagem) && ($1- !isnum) { msg =$nick $ct $+ Digitou mesmo um n�mero v�lido? Reveja o que foi dito. | return }
      writeini %f Prize $iif(%t == Pokemon,$basestat($1-,name),$1-)
      if (%t == Pokemon) { msg =$nick $ct $+ Agora, vamos determinar par�metros de $cc $+ $prize $+ $ct $+ . Se deseja realmente acrescentar algum, digite a seguir. Caso contr�rio, digite ' $+ $cc $+ .nao $+ $ct $+ '. | inc %set_prize_step }
      else {
        msg =$nick $ct $+ Pronto! Seu pr�mio foi determinado com sucesso. Agora, antes de iniciar a premia��o, � recomend�vel verificar se tudo est� correto.
        unset %set_prize %set_prize_step
      }
    }
    else {
      if (!$findtok(.nao:.n�o,$1,0,58)) { writeini %f Prize $prize $+ � $+ $1- }
      msg =$nick $ct $+ Pronto! Seu pr�mio foi determinado com sucesso. Agora, antes de iniciar a premia��o, � recomend�vel verificar se tudo est� correto.
      unset %set_prize %set_prize_step
    }
    return
  }
  if (%set_game == $nick) {
    var %s = %set_game_step, %f = pkp\status.ini Prize, %t = $readini(pkp\status.ini,Prize,GameType), %times = $readini(pkp\status.ini,Prize,Times), %range = $readini(pkp\status.ini,Prize,Range), %answer = $readini(pkp\status.ini,Prize,Answer), %faces = $readini(pkp\status.ini,Prize,Faces)
    if (%s == 1) {
      if ($findtok(1:2:3:4,$1,0,58)) {
        var %t = $1 | writeini %f GameType %t
        if (%t == 1) {
          if ($2) { if ($2 isnum 3-7) { var %times = $int($2) } | else { msg =$nick $ct $+ Voc� digitou um valor inv�lido para o n�mero de d�gitos: $cc $+ $2 $+ $ct $+ . O valor deve ser um n�mero entre $cc $+ 3 $ct $+ e $cc $+ 7 $+ $ct $+ . | return } } | else { var %times = 3 }
          if ($3) { if ($3 isnum 2-5) { var %range = $int($3) } | else { msg =$nick $ct $+ Voc� digitou um valor inv�lido para a varia��o dos digitos: $cc $+ $2 $+ $ct $+ . O valor deve ser um n�mero entre $cc $+ 2 $ct $+ e $cc $+ 5 $+ $ct $+ . | return } } | else { var %range = 3 }
          if ($4) {
            if ($len($4) != %times) { msg =$nick $ct $+ Sua senha precisa ter $cc $+ $numero(%times) $ct $+ d�gitos! | return }
            var %x = 0 | while (%x < %times) { inc %x | if ($mid($4,%x,1) !isnum 1- $+ %range) { msg =$nick $ct $+ A senha que voc� determinou n�o est� v�lida de acordo com as suas pr�prias regras! | return } }
            var %answer = $4
          }
          else { var %x = 0, %answer | while (%x < %times) { inc %x | var %answer = %answer $+ $rand(1,%range) } }
          writeini %f Times %times | writeini %f Range %range | writeini %f Answer %answer | msg =$nick $ct $+ Determine, finalmente, o $cc $+ n�mero $ct $+ de segundos por rodada.
        }
        if (%t == 2) {
          if ($2) { if ($2 isnum 2-7) { var %times = $int($2) } | else { msg =$nick $ct $+ Voc� digitou um valor inv�lido para o n�mero de dados: $cc $+ $2 $+ $ct $+ . O valor deve ser um n�mero de $cc $+ 2 $ct $+ a $cc $+ 7 $+ $ct $+ . | return } } | else { var %times = 3 }
          if ($3) { if ($3 isnum 2-9) { var %range = $int($3) } | else { msg =$nick $ct $+ Voc� digitou um valor inv�lido para o n�mero de faces: $cc $+ $2 $+ $ct $+ . O valor deve ser um n�mero de $cc $+ 2 $ct $+ a $cc $+ 9 $+ $ct $+ . | return } } | else { var %range = 6 }
          var %faces, %x = 0, %answer = 0 | while (%x < %times) { inc %x | var %rand = $rand(1,%range), %faces = %faces %rand, %answer = $calc(%answer + %rand) }
          writeini %f Times %times | writeini %f Range %range | writeini %f Answer %answer | writeini %f Faces %faces | msg =$nick $ct $+ Determine, finalmente, o $cc $+ n�mero $ct $+ de segundos por rodada.
        }
        if (%t == 3) {
          if ($2) { if ($2 isnum 1-10) { var %times = $int($2) } | else { msg =$nick $ct $+ Voc� digitou um valor inv�lido para o n�mero de perguntas: $cc $+ $2 $+ $ct $+ . O valor deve ser um n�mero de $cc $+ 1 $ct $+ a $cc $+ 10 $+ $ct $+ . | return } } | else { var %times = 3 }
          writeini %f Times %times | set %set_game_step 2 1 | msg =$nick $ct $+ Agora, determine a $cc $+ $ordinal(1).f $ct $+ pergunta e sua resposta, separados com a seguinte sintaxe: $cc $+ PERGUNTA $+ $ct $+ � $+ $cc $+ RESPOSTA $+ $ct $+ . | return
        }
        if (%t == 4) {
          if ($2) { var %answer = $2- } | else { msg =$nick $ct $+ � preciso determinar a resposta nesta modalidade. | return }
          writeini %f Answer %answer | msg =$nick $ct $+ Determine, finalmente, o $cc $+ tempo-limite $+ $ct $+ , em segundos, para este evento.
        }
        set %set_game_step 3 | return
      }
      else { msg =$nick $ct $+ Modalidade inexistente. Escolha entre $separecom(1:2:3:4,ou,58,$cc,$ct) $+ $ct $+ . | return }
    }
    elseif ($gettok(%s,1,32) == 2) {
      var %q = $gettok(%s,2,32), %m = $1-
      if ($gettok(%m,0,172) != 2) { msg =$nick $ct $+ Sintaxe incorreta. Separe a pergunta da resposta com o caractere $cc $+ � $+ $ct $+ . Por exemplo, $cc $+ PERGUNTA�RESPOSTA $+ $ct $+ . | return }
      writeini %f $+(Q,%q) %m
      if (%q < %times) { inc %q | set %set_game_step $gettok(%s,1,32) %q | msg =$nick $ct $+ Agora, determine a $cc $+ $ordinal(%q).f $ct $+ pergunta e sua resposta, separados com a seguinte sintaxe: $cc $+ PERGUNTA $+ $ct $+ � $+ $cc $+ RESPOSTA $+ $ct $+ . | return }
      msg =$nick $ct $+ Finalmente, determine o $cc $+ n�mero $ct $+ de segundos por rodada (tempo para mudan�a de perguntas). | set %set_game_step 3 | return
    }
    else {
      if ($1 !isnum) { msg =$nick $ct $+ Especifique um valor n�merico para o que foi solicitado. | return } | var %sec = $int($1)
      .timerPREMIO 0 %sec /premio | msg =$nick $ct $+ Parab�ns! O evento foi iniciado com sucesso! | writeini %f Turn 1 | writeini %f Active 1 | unset %set_game %set_game_step | sendamsg $nick $ct $+ Aten��o! Uma $cc $+ premia��o $ct $+ foi iniciada! Para participar, leia as instru��es digitando ' $+ $cc $+ .Premio $+ $ct $+ '. Boa sorte!
      write pkp\log\admin.txt : $+ $date ( $+ $time $+ ): EVENT $readini(pkp\status.ini,Prize,GameType) STARTED BY $nick $+ .
      write pkp\log\admin.txt $chr(32)
    }
    return
  }
  if (%rental. [ $+ [ $nick ] ]) {
    var %r = %rental. [ $+ [ $nick ] ]
    if ($1 == .dados) { view.dados.rental $nick $2 | return }
    if (%r == BRAIN) { msg =$nick $ct $+ Por favor, aguarde. Sua batalha come�ar� em breve. | return }
    if ($dados($nick,Rental,Battle) == 1) {
      if (!$1) || (!$2) || (!$3) { msg =$nick $ct $+ Por favor, especifique os nomes dos pok�mon corretamente. Por exemplo, " $+ $cc $+ Pikachu Ditto Eevee $+ $ct $+ ". | return }
      if (!$findtok(%r,$1,0,32) && ($rini(cadastros,$nick,Info,Access) != 5)) { msg =$nick $ct $+ Pok�mon $cc $+ $1 $ct $+ n�o est� dispon�vel. Certifique-se que seu nome esteja correto ou que ele tenha sido disponibilizado. | return }
      if (!$findtok(%r,$2,0,32) && ($rini(cadastros,$nick,Info,Access) != 5)) { msg =$nick $ct $+ Pok�mon $cc $+ $2 $ct $+ n�o est� dispon�vel. Certifique-se que seu nome esteja correto ou que ele tenha sido disponibilizado. | return }
      if (!$findtok(%r,$3,0,32) && ($rini(cadastros,$nick,Info,Access) != 5)) { msg =$nick $ct $+ Pok�mon $cc $+ $3 $ct $+ n�o est� dispon�vel. Certifique-se que seu nome esteja correto ou que ele tenha sido disponibilizado. | return }
      if ($1 == $2) || ($2 == $3) || ($1 == $3) { msg =$nick $ct $+ Por favor, selecione pok�mon $cc $+ diferentes $ct $+ para seu time. | return }
      writeini pkp\cadastros\ $+ $nick $+ .ini Rental Team $basestat($1,name) $basestat($2,name) $basestat($3,name)
      b.rental.set.players $nick
      b.rental.fight $nick
    }
    else {
      var %team = $dados($nick,Rental,Team)
      if ($findtok(.n�o .nao .no .n,$1,0,32)) { b.rental.fight $nick }
      elseif ($findtok(.sim .s .yes .y,$1,0,32)) {
        var %x = 1, %num | while ($gettok(%team,%x,32)) { var %num = $addtok(%num,$basestat($gettok(%team,%x,32),num),32) | inc %x }
        if (!$2) || (!$3) { msg =$nick $ct $+ Por favor, especifique os nomes dos pok�mon corretamente. Por exemplo, " $+ $cc $+ Pikachu Venusaur $+ $ct $+ ", e trocar� seu $cc $+ Pikachu $ct $+ pelo $cc $+ Venusaur $ct $+ do oponente. | return }
        if (!$findtok(%team,$2,0,32)) { msg =$nick $ct $+ Voc� n�o tem o pok�mon $cc $+ $2 $+ $ct $+ . Para visualizar seus pok�mon, digite " $+ $cc $+ .rental dados $+ $ct $+ ". | return }
        if (!$findtok(%r,$3,0,32)) { msg =$nick $ct $+ Pok�mon $cc $+ $3 $ct $+ n�o est� dispon�vel. Certifique-se que seu nome esteja correto ou que ele tenha sido disponibilizado. | return }
        if ($findtok(%team,$3,0,32)) { msg =$nick $ct $+ Esse pok�mon n�o p�de ser trocado, porque j� existe um no seu time de mesmo nome! | return }
        if ($findtok($puttok(%num,$basestat($3,num),$findtok(%team,$2,1,32),32),$basestat($3,num),0,32) > 1) { msg =$nick $ct $+ Esse pok�mon n�o p�de ser trocado, porque j� existe um pok�mon semelhante no time! | return }
        writeini pkp\cadastros\ $+ $nick $+ .ini Rental Team $reptok(%team,$2,$basestat($3,name),1,32)
        msg =$nick $ct $+ Pok�mon $cc $+ $basestat($2,name) $ct $+ trocado por $cc $+ $basestat($3,name) $+ $ct $+ .
        b.rental.fight $nick
      }
      else { msg =$nick $ct $+ Por favor, se quiser trocar um de seus pok�mon por um do advers�rio, digite: " $+ $cc $+ .sim <seu pok�mon> <pok�mon dispon�vel> $+ $ct $+ ". Os pok�mon dispon�veis s�o: $separecom(%r,e,32,$cc,$ct) $+ $ct $+ . Se quiser continuar, sem fazer altera��es, digite " $+ $cc $+ .nao $+ $ct $+ ". }
    }
    return
  }
  if (%sell. [ $+ [ $nick ] ] == ON) {
    if ($rini(cadastros,$nick,$1,Name)) {
      unset %sell. [ $+ [ $nick ] ] | var %p = $pontos($nick,$1)
      if ($rini(cadastros,$nick,Team,1) == $1) && ($rini(cadastros,$nick,Team,2) == Egg) { msg =$nick $chr(160) $cc $+ Thomas $ct $+ - Oh! N�o posso comprar seu pok�mon. Voc� n�o pode ficar sem pok�mon no time, lembre-se disso. Volte quando tiver mais pok�mon! | return }
      if (%p < 500) { var %price = 150 }
      elseif (%p < 1000) { var %price = 250 }
      elseif (%p < 2000) { var %price = 750 }
      elseif (%p < 3000) { var %price = 1500 }
      elseif (%p < 4000) { var %price = 2000 }
      elseif (%p < 5000) { var %price = 3000 }
      elseif (%p < 6000) { var %price = 4000 }
      elseif (%p < 7000) { var %price = 5000 }
      elseif (%p < 8000) { var %price = 6000 }
      elseif (%p < 9000) { var %price = 7000 }
      elseif (%p < 10000) { var %price = 8000 }
      elseif (%p < 11000) { var %price = 9000 }
      elseif (%p >= 2500000) { var %price = 500000 }
      elseif (%p >= 2000000) { var %price = 250000 }
      elseif (%p >= 1200000) { var %price = 200000 }
      elseif (%p >= 600000) { var %price = 150000 }
      elseif (%p >= 300000) { var %price = 100000 }
      elseif (%p >= 150000) { var %price = 50000 }
      elseif (%p >= 120000) { var %price = 40000 }
      elseif (%p >= 90000) { var %price = 30000 }
      elseif (%p >= 60000) { var %price = 20000 }
      elseif (%p >= 45000) { var %price = 15000 }
      elseif (%p >= 30000) { var %price = 11000 }
      else { var %price = 10000 }
      msg =$nick $chr(160) $cc $+ Thomas $ct $+ - Eu ofere�o $cc $+ $chr(36) $+ $getmoney(%price) $ct $+ pelo $rini(cadastros,$nick,$1,Name) $+ $ct $+ . | set %confirm. [ $+ [ $nick ] ] THS: $+ %price $+ : $+ $rini(cadastros,$nick,$1,Name)
      msg =$nick $ct $+ Digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar. | return
    }
    else { msg =$nick $ct $+ Digite um nome v�lido de pok�mon. | return }
  }
  if (%mvdel. [ $+ [ $nick ] ]) {
    var %moves = $gettok(%mvdel. [ $+ [ $nick ] ],2,59) | if (!$findtok(%moves,$1-,0,58)) { msg =$nick $ct $+ Escolha um golpe apenas entre os que foram citados. | return }
    var %pk = $gettok(%mvdel. [ $+ [ $nick ] ],1,59) | var %x = 0 | while (%x < 4) { inc %x | if ($rini(cadastros,$nick,%pk,Move $+ %x) == $1-) { var %n = %x } }
    msg =$nick $chr(160) $cc $+ Nicolas $ct $+ - Deseja realmente apagar o golpe $cc $+ $rini(cadastros,$nick,%pk,Move $+ %n) $ct $+ de $cc $+ %pk $+ $ct $+ ?
    msg =$nick $ct $+ Digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para cancelar. | unset %mvdel. [ $+ [ $nick ] ] | set %confirm. [ $+ [ $nick ] ] NC2: $+ %pk $+ : $+ $rini(cadastros,$nick,%pk,Move $+ %n) | return
  }
  if (%relearn. [ $+ [ $nick ] ]) {
    var %npc = $gettok(%relearn. [ $+ [ $nick ] ],1,59), %r = $gettok(%relearn. [ $+ [ $nick ] ],2,59), %s = $strip($1-)
    if (!$findtok(%r,%s,0,58)) { msg =$nick $chr(160) $cc $+ %npc $ct $+ - Sinto muito, mas acho que voc� n�o entendeu o que eu falei. Eu disse que seu pok�mon s� pode reaprender $iif($gettok(%r,0,58) > 1,os seguintes golpes,o seguinte golpe) $+ : $separecom(%r,ou,58,$cc,$ct) $+ $ct $+ . | return }
    unset %relearn. [ $+ [ $nick ] ] | var %s = $move(%s), %price = $readini(pkp\status.ini,Active,Relearn)
    msg =$nick $chr(160) $cc $+ %npc $ct $+ - Ent�o... Deseja realmente fazer $cc $+ $dados($nick,Team,1) $ct $+ reaprender o golpe $cc $+ %s $ct $+ por um pre�o simb�lico de $cc $+ $chr(36) $+ $getmoney(%price) $+ $ct $+ ?
    msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar o pedido. | set %confirm. [ $+ [ $nick ] ] RL2: $+ %npc $+ : $+ %s
  }
  if (%esqueci. [ $+ [ $nick ] ]) {
    var %e = $gettok(%esqueci. [ $+ [ $nick ] ],1,172)
    if (!%e) {
      if ($chr(3) isin $1-) { msg =$nick $ct $+ N�o utilize cores em sua pergunta secreta. | return }
      if ($len($1-) > 45) { msg =$nick $ct $+ Sua pergunta n�o pode conter mais do que $cc $+ 45 $ct $+ caracteres. | return }
      if ($chr(172) isin $1-) { msg =$nick $ct $+ Sua pergunta cont�m caracteres inv�lidos. | return }
      if (!$1) { msg =$nick $ct $+ Por favor, digite sua pergunta secreta. | return }
      set %esqueci. [ $+ [ $nick ] ] $1- $+ � $+ 0
      msg =$nick $ct $+ Agora, digite a resposta para a pergunta selecionada. | return
    }
    var %e = $gettok(%esqueci. [ $+ [ $nick ] ],2,172)
    if (!%e) {
      if ($chr(3) isin $1-) { msg =$nick $ct $+ N�o utilize cores em sua resposta secreta. | return }
      if ($len($1-) > 10) { msg =$nick $ct $+ Sua resposta n�o pode conter mais do que $cc $+ 10 $ct $+ caracteres. | return }
      if ($chr(172) isin $1-) { msg =$nick $ct $+ Sua resposta cont�m caracteres inv�lidos. | return }
      if (!$1) { msg =$nick $ct $+ Por favor, digite a resposta. | return }
      writeini pkp\cadastros\ $+ $nick $+ .ini Info Recover $gettok(%esqueci. [ $+ [ $nick ] ],1,172) $+ � $+ $1-
      wlog user $nick A secret question and answer have been determinated.
      unset %esqueci. [ $+ [ $nick ] ] | msg =$nick $ct $+ Sua $cc $+ pergunta secreta $ct $+ foi definida com sucesso. | return
    }
  }
  if (%coin. [ $+ [ $nick ] ]) { 
    var %npc = %coin. [ $+ [ $nick ] ], %c = $readini(pkp\status.ini,Active,Coin), %coin = $int($1)
    if (%coin isnum 0-9999) {
      if (!%coin) { msg =$nick $chr(160) $cc $+ %npc $ct $+ - Nenhuma moeda? Tudo bem, volte sempre! | unset %coin. [ $+ [ $nick ] ] }
      else { msg =$nick $chr(160) $cc $+ %npc $ct $+ - Deseja realmente comprar $cc $+ %coin $ct $+ $iif(%coin > 1,moedas,moeda) por $cc $+ $chr(36) $+ $getmoney($calc(%c * %coin)) $+ $ct $+ ? | msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para cancelar. | unset %coin. [ $+ [ $nick ] ] | set %confirm. [ $+ [ $nick ] ] COIN: $+ %npc $+ :2: $+ %coin }
    }
    else { msg =$nick $chr(160) $cc $+ %npc $ct $+ - Por favor, digite o $cc $+ n�mero $ct $+ de moedas que voc� vai pretende comprar, entre $cc $+ 0 $ct $+ e $cc $+ 9999 $+ $ct $+ . }
    return
  }
  if (%getpk. [ $+ [ $nick ] ]) {
    var %x = %getpk. [ $+ [ $nick ] ]
    if (!$basestat($1,etype)) { msg =$nick $ct $+ Pok�mon selecionado n�o foi descoberto ainda ou n�o existe. | return }
    if (!$findtok(%x,$1,0,58)) { msg =$nick $ct $+ Este pok�mon selecionado n�o est� dispon�vel. | return }
    wlog user $nick Received $basestat($1) at Fighting Dojo.
    if (!$pokedex($nick,$1)) { .echo $pokedex($nick,$1).add } | addpoke $nick $1 30 30:Fighting Dojo:Poke  Ball | msg =$nick $ct $+ Parab�ns, $cc $+ $nick $ct $+ ganhou o pok�mon $cc $+ $org($1) $+ $ct $+ ! | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Dojo Ok: $+ $org($1) | unset %getpk. [ $+ [ $nick ] ] | return
  }
  if (%radio. [ $+ [ $nick ] ]) {
    var %x = %radio. [ $+ [ $nick ] ], %msg = $strip($1-)
    if ($len(%msg) > 250) { msg =$nick $ct $+ Sua mensagem deve ter, no m�ximo, $cc $+ 250 $ct $+ caracteres. | return }
    unset %radio. [ $+ [ $nick ] ] | writeini pkp\radio.ini RADIO %x $dados($nick,Info,Nick) $+ : $+ %msg | msg =$nick $ct $+ Sua entrevista foi conclu�da com sucesso. | return
  }
  if (%item. [ $+ [ $nick ] ]) {
    var %it = %item. [ $+ [ $nick ] ], %pk = $dados($nick,$1-,Name)
    unset %item. [ $+ [ $nick ] ]
    if (!%pk) { msg =$nick $ct $+ Voc� n�o possui o pok�mon selecionado. | return }
    if (%it == MooMoo Milk) {
      if ($dados($nick,%pk,Level) == 100) { msg =$nick $cc $+ %pk $ct $+ n�o pode usar $cc $+ %it $ct $+ no level 100. | return }
      if ($gettok($dados($nick,%pk,Loyalty),1,58) == 255) { msg =$nick $cc $+ %pk $ct $+ j� atingiu o limite da felicidade. | return }
      var %loyalty = $dados($nick,%pk,Loyalty), %qnt = $gettok(%loyalty,2,58), %loyalty = $gettok(%loyalty,1,58), %c = 8, %r = $calc(%qnt + %c), %loyalty = $calc(%loyalty + %r)
      if (%loyalty < 0) { var %loyalty = 0 } | elseif (%loyalty > 255) { var %loyalty = 255 }
      if (%r < 0) { var %state = Ainda est� mal humorado, talvez queira um pouco mais. }
      elseif (!%r) { var %state = N�o demonstrou aprova��o, talvez queira mais um drinque. }
      else { var %state = Parece mais animado agora! }
      writeini pkp\cadastros\ $+ $nick $+ .ini %pk Loyalty %loyalty | item.rem $nick %it
      msg =$nick $ct $+ Voc� usou o item $cc $+ %it $ct $+ em $cc $+ %pk $+ $ct $+ . %state
    }
    if (%it == Rare Candy) {
      if ($dados($nick,%pk,Level) == 100) { msg =$nick $cc $+ %pk $ct $+ n�o pode usar $cc $+ %it $ct $+ no level 100. | return }
      var %next = $exp($basestat(%pk,etype),$calc($dados($nick,%pk,Level) + 1)), %now = $dados($nick,%pk,Exp) | addexp $nick %pk $calc(%next - %now) | msg =$nick $ct $+ Parab�ns! $cc $+ %pk $ct $+ avan�ou para o level $cc $+ $dados($nick,%pk,Level) $+ $ct $+ ! | item.rem $nick %it
    }
    return
  }
  if ($timer(ACCESS $+ $nick)) { msg =$nick $ct $+ Para sua pr�pria seguran�a, suas mensagens $cc $+ n�o $ct $+ foram $cc $+ enviadas $+ $ct $+ . Ocorreu um $cc $+ erro $ct $+ no momento de sua identifica��o, onde n�o h� uma solicita��o de senha verdadeira. Para n�o comprometer seus dados, todas as suas mensagens est�o $cc $+ bloqueadas $+ $ct $+ . Se este erro for desconhecido, $cc $+ reporte $ct $+ ao moderador. | return }
  if ($left($1,1) == .) {
    if ($rini(cadastros,$nick,Info,Lock)) {
      if ($findtok($rini(cadastros,$nick,Info,Lock),$1,0,59)) { msg =$nick $ct $+ Modo $cc $+ LOCK $ct $+ ativado para este comando. Se desconhece o motivo, pergunte a um moderador. | return }
    }
    if ($1 == .Ajuda) {
      var %spc = 33
      var %x = 1 | while ($findfile(pkp\ajuda\,*.txt,%x)) { var %n = $nopath($findfile(pkp\ajuda\,*.txt,%x)), %n = $left(%n,-4), %t = $addtok(%t,%n,58) | inc %x } | var %t = $sorttok(%t,58)
      var %x = 1 | while ($gettok(%t,%x,58)) { var %n = $gettok(%t,%x,58) | if (%r) { if (%x == $gettok(%t,0,58)) { var %r = %r $ct $+ e $cc $+ %n } | else { var %r = %r $+ $ct $+ $chr(44) $cc $+ %n } } | else { var %r = $cc $+ %n } | inc %x }
      if ($2 == Geral) {
        msg =$nick $ct $+ Lista $cc $+ geral $ct $+ de comandos do bot $cc $+ $me $+ $ct $+ :
        var %x = 1
        while (%x <= $gettok(%t,0,58)) {
          var %n = $gettok(%t,%x,58), %l = $lines(pkp\ajuda\ $+ %n $+ .txt), %y = 0 | msg =$nick $ct $+ Relativos ao t�pico ' $+ $cc $+ %n $+ $ct $+ ': | while (%y < %l) { inc %y | msg =$nick $chr(160) $read(pkp\ajuda\ $+ %n $+ .txt,%y) } | inc %x
        }
        if ($rini(cadastros,$nick,Info,Access) >= 4) {
          msg =$nick $ct $+ Relativos � $cc $+ Administra��o $+ $ct $+ :
          msg =$nick $chr(160) $cc $+ $arrange(.Kick <Nick> (<Motivo>),160,%spc) $ct $+ - Para expulsar imediatamente algu�m do bot;
          msg =$nick $chr(160) $cc $+ $arrange(.Ban <Nick> (<Horas>),160,%spc) $ct $+ - Para banir algu�m temporariamente ou permanentemente;
        }
        if ($rini(cadastros,$nick,Info,Access) == 5) {
          msg =$nick $ct $+ Restritos aos $cc $+ Moderadores $+ $ct $+ :
          msg =$nick $chr(160) $cc $+ $arrange(.Atualizar,160,%spc) $ct $+ - Para a edi��o de dados de um treinador;
          msg =$nick $chr(160) $cc $+ $arrange(.Match,160,%spc) $ct $+ - Para iniciar uma batalha entre treinadores;
          msg =$nick $chr(160) $cc $+ $arrange(.Unban <nick>,160,%spc) $ct $+ - Desbane algu�m que foi banido;
          msg =$nick $chr(160) $cc $+ $arrange(.Ignore,160,%spc) $ct $+ - Acessa a lista de ignorados do bot;
          msg =$nick $chr(160) $cc $+ $arrange(.Nickname <nick>,160,%spc) $ct $+ - Altera o nick do bot;
          msg =$nick $chr(160) $cc $+ $arrange(.Server <server>,160,%spc) $ct $+ - Conecta o bot ao determinado servidor;
          msg =$nick $chr(160) $cc $+ $arrange(.IP,160,%spc) $ct $+ - Verifica o IP atual do bot;
        }
        msg =$nick $ct $+ Fim da lista de comandos.
        return
      }
      elseif ($findtok(%t,$2,0,58)) {
        msg =$nick $ct $+ Lista $cc $+ especializada $ct $+ de comandos do bot $cc $+ $me $+ $ct $+ : | var %n = $gettok(%t,$findtok(%t,$2,1,58),58), %l = $lines(pkp\ajuda\ $+ %n $+ .txt), %y = 0 | msg =$nick $ct $+ Relativos ao t�pico ' $+ $cc $+ %n $+ $ct $+ ': | while (%y < %l) { inc %y | msg =$nick $chr(160) $read(pkp\ajuda\ $+ %n $+ .txt,%y) } | msg =$nick $ct $+ Fim da lista de comandos.
        if (!$dados($nick,Info,Perfil,19)) {
          if ($2 == Batalha) {
            msg =$nick $chr(160) $ct $+ Para iniciar uma batalha, ser� preciso cri�-la inicialmente. Ent�o digite, por exemplo, ' $+ $cc $+ .Criar $iif($dados($nick,Team,1),$dados($nick,Team,1),<pok�mon>) $+ $ct $+ ' e crie uma batalha com seu pok�mon. Agora, aguarde por advers�rios e confirme se um pedido for solicitado. Quando sua batalha come�ar, voc� poder� atacar usando o comando ' $+ $cc $+ .Golpe $+ $ct $+ ', substituindo $cc $+ <ataque> $ct $+ pelo golpe selecionado.
            msg =$nick $chr(160) $ct $+ Outra forma de batalhar � entrando numa batalha criada. Primeiro, digite ' $+ $cc $+ .Listar $+ $ct $+ ' para listar as batalhas em andamento. Procure por um advers�rio que n�o tenha oponente e tente entrar na batalha com o comando ' $+ $cc $+ .Entrar <ID> $iif($dados($nick,Team,1),$dados($nick,Team,1),<pok�mon>) $+ $ct $+ ', por exemplo, onde $cc $+ <ID> $ct $+ � o ID da batalha respectiva. Ap�s a primeira entrada e conclus�o da batalha, se o mesmo oponente criar uma nova batalha e voc� pretende entrar com o mesmo pok�mon, digite apenas ' $+ $cc $+ .Entrar $+ $ct $+ ', pois � um atalho.
          }
          elseif ($2 == Cidades) { msg =$nick $chr(160) $ct $+ Para visualizar as diversas op��es de sua cidade, como batalhar pok�mon selvagens, procurar por pessoas ou visitar lugares, digite ' $+ $cc $+ .Cidade $+ $ct $+ ' e leia atentamente as instru��es. Neste caso, voc� visualizar� as op��es de $cc $+ $dados($nick,Info,Locate) $+ $ct $+ . Nos demais comandos, digite apenas o que foi exibido e novas informa��es estar�o dispon�veis. }
          elseif ($2 == Itens) { msg =$nick $chr(160) $ct $+ Para ver os comandos relacionados � utiliza��o de itens, digite ' $+ $cc $+ .Item $+ $ct $+ '. Lembre-se que compartimentos da mochila s�o os nomes exibidos em ' $+ $cc $+ Itens $+ $ct $+ ' ao digitar ' $+ $cc $+ .Dados $+ $ct $+ '. }
          elseif ($2 == Informa��es) { 
            msg =$nick $chr(160) $ct $+ Para visualizar suas informa��es, digite ' $+ $cc $+ .Dados $+ $ct $+ ' apenas. Agora, se pretende ver informa��es de um pok�mon do seu time, digite ' $+ $cc $+ .Dados $iif($dados($nick,Team,1),$dados($nick,Team,1),<pok�mon>) $+ $ct $+ ', por exemplo, especificando o seu pok�mon. No entanto, h� tamb�m a possibilidade de visualiza��o de informa��o de outros usu�rios. O procedimento � o mesmo, apenas com uma pequena diferen�a: digite ' $+ $cc $+ .Dados <Nick> $+ $ct $+ ' e especifique o nick. Para ver informa��es do pok�mon dele(a), acrescente o nome do pok�mon � sintaxe.
            msg =$nick $chr(160) $ct $+ Quando, na sintaxe, apresentar a seguinte representa��o: $cc $+ (<campo>) $ct $+ significa que o mesmo � opcional, mas tamb�m pode ser especificado. Apenas $cc $+ <campo> $ct $+ � obrigat�rio. Ent�o, analise as sintaxes dos comandos listados e interprete-os corretamente. Se tiver d�vidas, digite o comando apenas, sem especificar nada.
          }
          elseif ($2 == Prefer�ncias) { msg =$nick $chr(160) $ct $+ Quando, na sintaxe, apresentar a seguinte representa��o: $cc $+ (<campo>) $ct $+ significa que o mesmo � opcional: pode ser especificado ou $cc $+ n�o $+ $ct $+ . Apenas $cc $+ <campo> $ct $+ � obrigat�rio. Ent�o, analise as sintaxes dos comandos listados e interprete-os corretamente. Por exemplo, se tiver d�vidas de como usar o comando ' $+ $cc $+ .Skin $+ $ct $+ ', digite apenas ' $+ $cc $+ .Skin $+ $ct $+ ' e siga a nova orietan��o dada. Desta forma, voc� evita fazer perguntas totalmente desnecess�rias e j� explicadas anteriormente. }
          elseif ($2 == Pok�mon) {
            msg =$nick $chr(160) $ct $+ Para evoluir seu pok�mon, analise a sintaxe do comando exibida. Veja: ' $+ $cc $+ .Evoluir <Pok�mon> (<Evolu��o>) $+ $ct $+ '. Significa que voc� pode especificar o nome da evolu��o ou n�o. Se n�o especificar, os poss�veis nomes de evolu��o ser�o exibidos. Escolha um deles e finalmente use o comando, mas desta vez especificando o nome corretamente. Se seu pok�mon puder evoluir, ele o far� e se tornar� o pok�mon especificado.
            msg =$nick $chr(160) $ct $+ Para ensinar um novo golpe ao seu pok�mon, use o comando ' $+ $cc $+ .Moveset $+ $ct $+ '. $cc $+ <pok�mon> $ct $+ � o pok�mon que voc� pretende ensinar o golpe, $cc $+ <slot> $ct $+ � o Slot do golpe (veja digitando ' $+ $cc $+ .Dados <pok�mon> $+ $ct $+ ') e, a seguir, digite o nome do novo golpe. No entanto, se pretende ensinar um $cc $+ TM $+ $ct $+ , por exemplo, ao inv�s de especificar o golpe, especifique o item. Se n�o sabe os golpes que seu pok�mon pode aprender, saia e entre no bot para visualiz�-los.
            msg =$nick $chr(160) $ct $+ Para o comando ' $+ $cc $+ .Ordem $+ $ct $+ ', apenas uma observa��o: cada campo com o nome $cc $+ <Pok�mon> $ct $+ deve ser preenchido pelo nome do pok�mon e ambos devem ser diferentes. Dessa forma, voc� trocar� as posi��es dos dois no seu time. Digite ' $+ $cc $+ .Dados $+ $ct $+ ' para ver seu time atual.
          }
        }
      }
      elseif (!$2) {
        msg =$nick $ct $+ Bem vindo ao assistente de $cc $+ Ajuda $+ $ct $+ , fique a vontade para tirar suas d�vidas quanto ao sistema do bot $cc $+ $me $+ $ct $+ . Para listar $cc $+ todos $ct $+ os comandos do bot, digite ' $+ $cc $+ .Ajuda Geral $+ $ct $+ '.
        msg =$nick $ct $+ No entanto, para uma ajuda $cc $+ especializada $+ $ct $+ , especifique o t�pico dentre os seguintes, para mais informa��es, e digite ' $+ $cc $+ .Ajuda <t�pico> $+ $ct $+ '. Por exemplo, ' $+ $cc $+ .Ajuda $gettok(%t,1,58) $+ $ct $+ '.
        msg =$nick $chr(160) %r
      }
      else { msg =$nick $ct $+ T�pico especificado inexistente. Verifique o que foi digitado ou selecione um dos seguintes t�picos: %r $+ $ct $+ . }
      return
    }
    elseif ($1 == .Cidade) {
      if ($checknickid($nick) == Ok!) { msg =$nick $ct $+ Voc� n�o pode acessar as op��es da cidade enquanto batalha! | return }
      if ($v(Watch. [ $+ [ $nick ] ])) { msg =$nick $ct $+ Voc� n�o pode acessar as op��es da cidade enquanto assiste outras batalhas. Para parar de assisti-la, digite ' $+ $cc $+ .Assistir $+ $ct $+ '. | return }
      if (%confirm. [ $+ [ $nick ] ]) { msg =$nick $ct $+ Antes de ver as op��es da cidade, digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar o �ltimo pedido. | return }
      if (%stand. [ $+ [ $nick ] ]) { unset %stand. [ $+ [ $nick ] ] }
      cmd.cidade $1- | return
    }
    elseif ($1 == .Sair) {
      .chat_close $nick | return    
    }
    elseif ($1 == .Loja) {
      var %l = $rini(cadastros,$nick,Info,Locate), %ac = $rini(cadastros,$nick,Info,Access)
      if ($shop(%l)) {
        if ($checknickid($nick) == Ok!) { msg =$nick $ct $+ Voc� n�o pode entrar numa loja enquanto batalha. | return }
        if ($v(Watch. [ $+ [ $nick ] ])) { msg =$nick $ct $+ Voc� n�o pode entrar numa loja enquanto assiste outras batalhas. Para parar de assisti-la, digite ' $+ $cc $+ .Assistir $+ $ct $+ '. | return }
        if (%confirm. [ $+ [ $nick ] ]) { msg =$nick $ct $+ Antes de entrar na loja, digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar o �ltimo pedido. | return }
        if (%stand. [ $+ [ $nick ] ]) { unset %stand. [ $+ [ $nick ] ] }
        if ($2) {
          if ($2 == Comprar) {
            if ($3 isnum) { if ($3 isnum 1-99) { var %qnt = $int($3), %i = $item.data($4-,name) } | else { msg =$nick $ct $+ Determine um n�mero $cc $+ v�lido $ct $+ de itens para comprar. | return } } | else { var %qnt = 1, %i = $item.data($3-,name) }
            if ($findtok($shop(%l,%ac),%i,0,58)) {
              var %p = $item.data(%i,price), %m = $rini(cadastros,$nick,Info,Money)
              if (!%qnt) { msg =$nick $ct $+ Nenhum item foi comprado. | return }
              if ($calc($item($nick,%i).qnt + %qnt) > 99) { msg =$nick $ct $+ Voc� n�o pode carregar mais do que $cc $+ %i $ct $+ (� $+ $cc $+ 99 $+ $ct $+ )! | return }
              if (%m < $calc(%p * %qnt)) {
                if (%qnt > 1) { msg =$nick $ct $+ Voc� n�o tem $cc $+ $chr(36) $+ $cc $+ $getmoney($calc(%p * %qnt)) $ct $+ para comprar $cc $+ %i $ct $+ (� $+ $cc $+ $base(%qnt,10,10,2) $+ $ct $+ )! }
                else { msg =$nick $ct $+ Voc� n�o tem $cc $+ $chr(36) $+ $cc $+ $getmoney($calc(%p * %qnt)) $ct $+ para comprar $cc $+ %i $+ $ct $+ ! }
                return
              }
              var %u = $item.data(%i,use)
              if (%u == Special) || (%u == Mult) { if ($item($nick,%i).qnt) { msg =$nick $ct $+ Voc� j� possui o item $cc $+ %i $+ $ct $+ . | return } | if (%qnt > 1) { msg =$nick $ct $+ Voc� n�o pode carregar mais de um $cc $+ %i $ct $+ em sua mochila! | return } }
              wlog user $nick %i (� $+ $base(%qnt,10,10,2) $+ ) $iif(%qnt > 1,were,was) bought, on %l $+ 's shop.
              writeini pkp\cadastros\ $+ $nick $+ .ini Info Money $calc(%m - (%p * %qnt)) | item.add $nick %i $+ : $+ %qnt | msg =$nick $cc $+ %i $ct $+ (� $+ $cc $+ $base(%qnt,10,10,2) $+ $ct $+ ) $iif(%qnt > 1,foram comprados,foi comprado) com sucesso. Seu dinheiro atual � $cc $+ $chr(36) $+ $getmoney($dados($nick,Info,Money)) $+ $ct $+ .
            }
            else { msg =$nick $ct $+ O item selecionado n�o foi encontrado. | return }
          }
          elseif ($2 == Vender) {
            if ($3 isnum) { if ($3 isnum 1-99) { var %qnt = $int($3), %i = $item.data($4-,name) } | else { msg =$nick $ct $+ Determine um n�mero $cc $+ v�lido $ct $+ de itens para vender. | return } } | else { var %qnt = 1, %i = $item.data($3-,name) }
            if ($item($nick,%i).qnt) {
              var %p = $int($calc($item.data(%i,price) / 2)), %m = $rini(cadastros,$nick,Info,Money), %u = $item.data(%i,use)
              if (!%qnt) { msg =$nick $ct $+ Nenhum item foi vendido. | return }
              if (!%p) || ($findtok(Special:Mult,%u,0,58)) { msg =$nick $cc $+ %i $ct $+ n�o pode ser vendido. | return }
              if ($item($nick,%i).qnt < %qnt) { msg =$nick $ct $+ Voc� n�o possui $cc $+ %i $ct $+ (� $+ $cc $+ $base(%qnt,10,10,2) $+ $ct $+ ) para vender! | return }
              wlog user $nick %i (� $+ $base(%qnt,10,10,2) $+ ) $iif(%qnt > 1,were,was) sold, on %l $+ 's shop.
              writeini pkp\cadastros\ $+ $nick $+ .ini Info Money $calc(%m + (%p * %qnt)) | item.rem $nick %i $+ : $+ %qnt | msg =$nick $cc $+ %i $ct $+ (� $+ $cc $+ $base(%qnt,10,10,2) $+ $ct $+ ) $iif(%qnt > 1,foram vendidos,foi vendido) por $cc $+ $chr(36) $+ $getmoney($calc(%p * %qnt)) $+ $ct $+ . Seu dinheiro atual � $cc $+ $chr(36) $+ $getmoney($dados($nick,Info,Money)) $+ $ct $+ .
            }
            else { msg =$nick $ct $+ Voc� n�o tem o item selecionado. | return }
          }
          else { msg =$nick $ct $+ Voc� cometeu um erro ao tentar usar este comando. Para comprar itens, digite ' $+ $cc $+ .Loja Comprar <item> $+ $ct $+ ' e para ver os itens dispon�veis digite apenas ' $+ $cc $+ .Loja $+ $ct $+ '. }
        }
        else {
          msg =$nick $ct $+ Bem vindo � loja de $cc $+ %l $+ $ct $+ , $cc $+ $nick $+ $ct $+ !
          msg =$nick $ct $+ Exibindo lista de artigos:
          var %i = $shop(%l,%ac), %x = 0, %t = $gettok(%i,0,58)
          while (%x < %t) {
            inc %x | var %ti = $gettok(%i,%x,58)
            msg =$nick $chr(160) $cc $+ $arrange($item.data(%ti,name),160,15) $ct $+ Pre�o: $cc $+ $chr(36) $+ $arrange($getmoney($item.data(%ti,price)),160,7) $ct $+ Descri��o: $cc $+ $item.data(%ti,desc)
          }
          msg =$nick $ct $+ Fim da lista de artigos.
          msg =$nick $chr(160) $cc $+ Vendedor $ct $+ - Ol�! Para comprar alguma coisa, digite $cc $+ .loja comprar <item> $+ $ct $+ . Se quiser vender algum item, digite $cc $+ .loja vender <item> $+ $ct $+ .
        }
        return
      }
      else { msg =$nick $ct $+ N�o h� lojas em $cc $+ %l $+ $ct $+ . | return }
    }
    elseif ($1 == .PC) {
      if ($item($nick,PC).check == No!) { .msg =$nick $ct $+ Este comando est� restrito para treinadores que possuem o item ' $+ $cc $+ PC $+ $ct $+ '. | return }
      var %l = $dados($nick,Info,Locate), %region = $dados($nick,Info,Region) | if ($findtok($readini(pkp\status.ini,%region,NoPC),%l,0,58)) { var %did = No! }
      if (%did == No!) { msg =$nick $ct $+ N�o h� $cc $+ Pok�mon Center $ct $+  em sua localiza��o atual. | return }
      if ($checknickid($nick) == Ok!) { .msg =$nick $ct $+ Voc� n�o pode acessar seu PC enquanto estiver batalhando. | return }
      if ($v(Watch. [ $+ [ $nick ] ])) { msg =$nick $ct $+ Voc� n�o pode acessar seu PC enquanto assiste batalhas. Para parar de assisti-la, digite ' $+ $cc $+ .Assistir $+ $ct $+ '. | return }
      if (%stand. [ $+ [ $nick ] ]) { unset %stand. [ $+ [ $nick ] ] }
      if (!$exists(pkp\box\ $+ $nick $+ \)) { .mkdir pkp\box\ $+ $nick $+ \ | writeini pkp\box\ $+ $nick $+ \1.ini Info Size 30 | writeini pkp\box\ $+ $nick $+ \1.ini Info Link $dados($nick,Info,Region) }
      if (%confirm. [ $+ [ $nick ] ]) { .msg =$nick $ct $+ Para confirmar o pedido, digite $cc $+ .sim $+ $ct $+ . Para cancelar, $cc $+ .nao $+ $ct $+ . | return }
      cmd.PC $1- | return
    }
    elseif ($1 == .Item) {
      if ($2 == help) || (!$2) {
        msg =$nick $ct $+ Lista de comandos relacionados � utiliza��o dos $cc $+ Itens $+ $ct $+ :
        msg =$nick $chr(160) $ct $+ Digite " $+ $cc $+ .item check <bag> $+ $ct $+ " para exibir os $cc $+ itens $ct $+ contidos num $cc $+ compartimento $ct $+ da mochila;
        msg =$nick $chr(160) $ct $+ Digite " $+ $cc $+ .item info <item> $+ $ct $+ " para obter $cc $+ informa��es $ct $+ de um $cc $+ item $ct $+ que voc� tem;
        msg =$nick $chr(160) $ct $+ Digite " $+ $cc $+ .item use <item> $+ $ct $+ " para $cc $+ utilizar $ct $+ o $cc $+ item $ct $+ selecionado;
        msg =$nick $chr(160) $ct $+ Digite " $+ $cc $+ .item toss <item> $+ $ct $+ " para $cc $+ remover $ct $+ o $cc $+ item $ct $+ selecionado;
        msg =$nick $chr(160) $ct $+ Digite " $+ $cc $+ .item give <pok�mon> <item> $+ $ct $+ " para fazer o $cc $+ pok�mon $ct $+ selecionado $cc $+ segurar o item $ct $+ selecionado;
        msg =$nick $chr(160) $ct $+ Digite " $+ $cc $+ .item take <pok�mon> $+ $ct $+ " para $cc $+ retirar $ct $+  do $cc $+ pok�mon $ct $+ selecionado o $cc $+ item $ct $+ que ele estiver $cc $+ segurando $+ $ct $+ .
        msg =$nick $ct $+ Fim da lista de comandos. | return
      }
      elseif ($2 == check) {
        if (!$3) { .msg =$nick $ct $+ Para este comando, � necess�rio especificar o compartimento da mochila para ser analisado com o comando ' $+ $cc $+ .item check <compartimento> $+ $ct $+ '. Compartimentos s�o visualizados ao digitar ' $+ $cc $+ .Dados $+ $ct $+ ', em ' $+ $cc $+ Itens $+ $ct $+ '. | return }
        if (!$item.bag($3-).s) { msg =$nick $ct $+ Este compartimento n�o existe na sua mochila. Visualize-os digitando ' $+ $cc $+ .Dados $+ $ct $+ ', pois est�o sendo exibidos em ' $+ $cc $+ Itens $+ $ct $+ '. | return }
        var %n = $item.bag($3-).s
        msg =$nick $ct $+ Exibindo itens do compartimento $cc $+ $item.bag($gettok(%n,1,58)) $+ $ct $+ :
        var %x = 1 | while ($gettok(%n,%x,58)) {
          var %type = $gettok(%n,%x,58)
          if ($dados($nick,Item,%type)) { var %d = 1 | msg =$nick $chr(160) $cc $+ %type $+ $ct $+ : $iif($3- == TM Case,$getitem($nick,%type).sort,$getitem($nick,%type)) }
          inc %x
        }
        if (%d) { msg =$nick $ct $+ Fim da exibi��o de itens. } | else { msg =$nick $ct $+ Nenhum item foi encontrado em ' $+ $cc $+ $item.bag($gettok(%n,1,58)) $+ $ct $+ '. }
        return
      }
      elseif ($2 == info) {
        if (!$3-) { .msg =$nick $ct $+ � necess�rio especificar o item para obter suas informa��es, al�m de t�-lo na sua mochila. Digite ' $+ $cc $+ $lower($1 $2) <item> $+ $ct $+ '. | return }
        if ($item($nick,$3-).check == No!) {
          if ($item.bag($3-).s) { .msg =$nick $ct $+ Voc� n�o especificou item algum, apenas um compartimento da mochila. Digite ' $+ $cc $+ .item check $item.bag($gettok($item.bag($3-).s,1,58)) $+ $ct $+ ' para exibir os itens contidos nesse compartimento. }
          else { .msg =$nick $ct $+ Voc� n�o possui o item especificado. Examine sua mochila � procura do mesmo e veja se ele realmente est� l� e verifique o que foi digitado. A seguir, digite ' $+ $cc $+ $lower($1 $2) <item> $+ $ct $+ ' e tente novamente. }
          return
        }
        if ($item.data($3-,desc)) {
          msg =$nick $ct $+ Exibindo informa��es do item $cc $+ $item.data($3-,name) $ct $+ ( $+ $cc $+ $item.bag($item.data($3-,bag)) $+ $ct $+ ):
          msg =$nick $chr(160) $cc $+ Descri��o $+ $ct $+ : $item.data($3-,desc)
          var %use = $item.data($3-,use)
          if (%use == one) { var %use = Este item � descart�vel e, portanto, n�o pode ser reutilizado. }
          elseif (%use == hold) { var %use = Este item deve ser segurado por um pok�mon. Seu efeito permanecer� at� ser retirado. }
          elseif (%use == one/hold) { var %use = Este item deve ser segurado por um pok�mon. Seu efeito ser� v�lido apenas uma vez e o item ser� descartado. }
          elseif (%use == mult) { var %use = Este item n�o � descart�vel e, portanto, pode ser reutilizado. }
          elseif (%use == special) { var %use = Este item pode ter diversas formas de utiliza��o ou nenhuma. }
          else { var %use = A utiliza��o deste item � desconhecida. Informe ao moderador, se este bug for desconhecido. }
          msg =$nick $chr(160) $cc $+ Utiliza��o $+ $ct $+ : %use
          msg =$nick $ct $+ Fim da exibi��o de informa��es. | return
        }
        else { .msg =$nick $ct $+ Item $cc $+ $org($3-) $ct $+ ainda n�o tem utilidade no bot. Se o problema for desconhecido, utilize o $cc $+ .Report $ct $+ ou fale com um moderador. | return }
      }
      elseif ($2 == use) {
        if (!$3-) { .msg =$nick $ct $+ � necess�rio especificar o item para obter suas informa��es, al�m de t�-lo na sua mochila. Digite ' $+ $cc $+ $lower($1 $2) <item> $+ $ct $+ '. | return }
        if ($item($nick,$3-).check == No!) {
          if ($item.bag($3-).s) { .msg =$nick $ct $+ Voc� n�o especificou item algum, apenas um compartimento da mochila. Digite ' $+ $cc $+ .item check $item.bag($gettok($item.bag($3-).s,1,58)) $+ $ct $+ ' para exibir os itens contidos nesse compartimento. }
          else { .msg =$nick $ct $+ Voc� n�o possui o item especificado. Examine sua mochila � procura do mesmo e veja se ele realmente est� l� e verifique o que foi digitado. A seguir, digite ' $+ $cc $+ $lower($1 $2) <item> $+ $ct $+ ' e tente novamente. }
          return
        }
        var %it = $item.data($3-,name), %u = $item.data(%it,bag)
        if (%u == Ball) {
          if ($checknickid($nick) == No!) { .msg =$nick $ct $+ Voc� n�o est� participando de uma batalha. | return }
          var %ID = $checknickid($nick).id | if ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ 1 ] ]) == $nick) { var %n = 1 } | else { var %n = 2 } | if ($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %n ] ])) { .msg =$nick $ct $+ Voc� j� selecionou seu golpe. Aguarde o golpe do seu advers�rio. | return }
          if ($gettok(%it,2,32) == Ball) {
            if ($v([ [ B. ] $+ [ %ID ] $+ [ .Wild ] ])) { item.rem $nick %it | sset [ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %n ] ] Catch; $+ %it | fightturns %ID | return }
            else { msg =$nick $ct $+ A utiliza��o do item $cc $+ %item $ct $+ � permitido apenas em batalhas com pok�mon $cc $+ selvagem $+ $ct $+ ! | return }
          }
        }
        if ($right(%it,5) == Stone) { msg =$nick $ct $+ Para evoluir seu pok�mon utilizando uma $cc $+ Stone $+ $ct $+ , apenas digite $cc $+ .Evoluir <pok�mon> <evolu��o> $+ $ct $+ , e a pedra ser� usada quando ele evoluir. | return }
        if ($left(%it,2) == TM) { msg =$nick $ct $+ Para usar um $cc $+ Technical Machine $ct $+ (TM) utilize o comando " $+ $cc $+ .moveset <pok�mon> <slot> <item> $+ $ct $+ ". | return }
        if ($left(%it,2) == HM) { msg =$nick $ct $+ Para usar um $cc $+ Hidden Machine $ct $+ (HM) utilize o comando " $+ $cc $+ .moveset <pok�mon> <slot> <item> $+ $ct $+ ". | return }
        if ($left(%it,2) == MT) { msg =$nick $ct $+ Para usar um $cc $+ Move Tutor $ct $+ (MT) utilize o comando " $+ $cc $+ .moveset <pok�mon> <slot> <item> $+ $ct $+ ". | return }
        if (%it == Coin Case) { if ($dados($nick,Info,Coin)) { .msg =$nick $ct $+ Voc� possui $cc $+ � $+ $getmoney($dados($nick,Info,Coin)) $ct $+ em seu $cc $+ Coin Case $+ $ct $+ . } | else { msg =$nick $ct $+ Nenhuma moeda guardada no $cc $+ Coin Case $+ $ct $+ ... } | return }
        if (%it == Devon Scope) {
          if ($checknickid($nick) == Ok!) { .msg =$nick $ct $+ Voc� n�o pode usar o $cc $+ Devon Scope $ct $+ enquanto batalha! | return }
          if ($rini(cadastros,$nick,Info,Rod)) { msg =$nick $ct $+ Voc� n�o pode usar $cc $+ $rini(cadastros,$nick,Info,Rod) $ct $+ e o $cc $+ Devon Scope $ct $+ simultaneamente. | return }
          if ($rini(cadastros,$nick,Info,Scope) == ON) { remini pkp\cadastros\ $+ $nick $+ .ini Info Scope | msg =$nick $ct $+ Voc� desligou o $cc $+ Devon Scope $+ $ct $+ . }
          else { writeini pkp\cadastros\ $+ $nick $+ .ini Info Scope ON | msg =$nick $ct $+ Voc� ligou o $cc $+ Devon Scope $+ $ct $+ . Para deslig�-lo, use-o novamente. } | return
        }
        if (%it == MooMoo Milk) {
          if ($checknickid($nick) == Ok!) { .msg =$nick $ct $+ Voc� n�o pode usar o $cc $+ %it $ct $+ enquanto batalha! | return }
          msg =$nick $ct $+ Voc� est� tentando usar $cc $+ %it $+ $ct $+ . Digite o nome do $cc $+ pok�mon $ct $+ que voc� deseja us�-lo. | set %item. [ $+ [ $nick ] ] %it
          return
        }
        if (%it == Rare Candy) {
          if ($checknickid($nick) == Ok!) { .msg =$nick $ct $+ Voc� n�o pode usar o $cc $+ %it $ct $+ enquanto batalha! | return }
          msg =$nick $ct $+ Voc� est� tentando usar $cc $+ %it $+ $ct $+ . Digite o nome do $cc $+ pok�mon $ct $+ que voc� deseja us�-lo. | set %item. [ $+ [ $nick ] ] %it
          return
        }
        if (%it == Radio) {
          var %opt = News:Trainer:Tale
          var %x = 1 | while ($gettok(%opt,%x,58)) { var %n = $gettok(%opt,%x,58) | if ($calc($ctime($date) - $readini(pkp\radio.ini,Time,%n)) <= 86400) && ($readini(pkp\radio.ini,Radio,%n)) { var %r = $addtok(%r,%n,58) } | inc %x }
          msg =$nick $ct $+ Voc� usou o item $cc $+ %it $+ $ct $+ . Tentando sintonizar alguma transmiss�o...
          if (%r) {
            var %x = $randtok(%r,58), %x = $gettok(%x,1,58), %msg = $readini(pkp\radio.ini,RADIO,%x)
            if (%x == Tale) { msg =$nick $chr(160) $cc $+ Grace $ct $+ - "E aqui estamos em mais um 'Dia de Treinador' com nosso amigo $cc $+ $gettok(%msg,1,58) $+ $ct $+ ! Certamente ele tem uma brilhante hist�ria para nos contar!" }
            elseif (%x == News) { msg =$nick $chr(160) $cc $+ Grace $ct $+ - "Nosso informante mais intrigante acaba de nos conceder uma entrevista: $cc $+ $gettok(%msg,1,58) $+ $ct $+ ! Vamos, n�o seja t�mido! Pode nos contar a novidade!" }
            else { msg =$nick $chr(160) $cc $+ Grace $ct $+ - "Nosso aspirante a mestre pok�mon, $cc $+ $gettok(%msg,1,58) $+ $ct $+ , nos dar� uma entrevista! Diga-nos, qual o segredo do sucesso? D� alguma dica para os treinadores iniciantes de todas as partes do mundo e que o admiram!" }
            msg =$nick $chr(160) $cc $+ $gettok(%msg,1,58) $ct $+ - " $+ $deltok(%msg,1,58) $+ "
            msg =$nick $ct $+ Fim da transmiss�o.
          }
          else { msg =$nick $ct $+ Tudo que d� para escutar s�o m�sicas de pok�mon... }
          return
        }
        if ($gettok(%it,2,32) == Rod) {
          if ($checknickid($nick) == Ok!) { .msg =$nick $ct $+ Voc� n�o pode usar $cc $+ %it $ct $+ enquanto batalha! | return }
          var %rod = $rini(cadastros,$nick,Info,Rod) | if ($rini(cadastros,$nick,Info,Scope)) { msg =$nick $ct $+ Voc� n�o pode usar $cc $+ %rod $ct $+ e o $cc $+ Devon Scope $ct $+ simultaneamente. | return }
          if (%rod) {
            if (%rod == %it) { remini pkp\cadastros\ $+ $nick $+ .ini Info Rod | msg =$nick $ct $+ Voc� n�o est� mais utilizando sua $cc $+ %it $+ $ct $+ . | return }
            else { writeini pkp\cadastros\ $+ $nick $+ .ini Info Rod %it | msg =$nick $ct $+ Voc� preparou sua $cc $+ %it $ct $+ para pescar. | return }
          }
          else { writeini pkp\cadastros\ $+ $nick $+ .ini Info Rod %it | msg =$nick $ct $+ Voc� preparou sua $cc $+ %it $ct $+ para pescar. | return }
        }
      }
      elseif ($2 == toss) {
        if (!$3-) { .msg =$nick $ct $+ � necess�rio especificar o item para obter suas informa��es, al�m de t�-lo na sua mochila. Digite ' $+ $cc $+ $lower($1 $2) <item> $+ $ct $+ '. | return }
        if ($item($nick,$3-).check == No!) {
          if ($item.bag($3-).s) { .msg =$nick $ct $+ Voc� n�o especificou item algum, apenas um compartimento da mochila. Digite ' $+ $cc $+ .item check $item.bag($gettok($item.bag($3-).s,1,58)) $+ $ct $+ ' para exibir os itens contidos nesse compartimento. }
          else { .msg =$nick $ct $+ Voc� n�o possui o item especificado. Examine sua mochila � procura do mesmo e veja se ele realmente est� l� e verifique o que foi digitado. A seguir, digite ' $+ $cc $+ $lower($1 $2) <item> $+ $ct $+ ' e tente novamente. }
          return
        }
        var %use = $item.data($3-,use)
        if ($findtok(Special:Mult,%use,0,58)) { .msg =$nick $ct $+ Item $cc $+ $item.data($3-,name) $ct $+ n�o pode ser descartado. | return }
        wlog user $nick $item.data($3-,name) was dropped away from the bag.
        item.rem $nick $3- | .msg =$nick $ct $+ Item $cc $+ $item.data($3-,name) $ct $+ removido com sucesso. | return
      }
      elseif ($2 == give) {
        if (!$basestat($3,etype)) { .msg =$nick $ct $+ Voc� cometeu um erro quanto � utiliza��o deste comando. Para fazer seu pok�mon segurar um item, digite ' $+ $cc $+ .item give <pok�mon> <item> $+ $ct $+ ', especificando que pok�mon receber� o item e qual item voc� deseja que o mesmo segure. | return }
        if (!$checkteam($nick,$3)) { .msg =$nick $ct $+ Voc� n�o tem o pok�mon selecionado. Digite ' $+ $cc $+ .Dados $+ $ct $+ ' para visualizar seu time e finalmente digite ' $+ $cc $+ $lower($1 $2) <pok�mon> <item> $+ $ct $+ '. | return }
        if (!$4-) { .msg =$nick $ct $+ � necess�rio especificar o item para obter suas informa��es, al�m de t�-lo na sua mochila. Digite ' $+ $cc $+ $lower($1 $2 $3) <item> $+ $ct $+ '. | return }
        if ($item($nick,$4-).check == No!) {
          if ($item.bag($4-).s) { .msg =$nick $ct $+ Voc� n�o especificou item algum, apenas um compartimento da mochila. Digite ' $+ $cc $+ .item check $item.bag($gettok($item.bag($4-).s,1,58)) $+ $ct $+ ' para exibir os itens contidos nesse compartimento. }
          else { .msg =$nick $ct $+ Voc� n�o possui o item especificado. Examine sua mochila � procura do mesmo e veja se ele realmente est� l� e verifique o que foi digitado. A seguir, digite ' $+ $cc $+ $lower($1 $2 $3) <item> $+ $ct $+ ' e tente novamente. }
          return
        }
        var %use = $item.data($4-,use)
        if ($findtok(Special:Mult,%use,0,58)) { .msg =$nick $ct $+ Este item n�o pode ser segurado por nenhum pok�mon. | return }
        if ($rini(cadastros,$nick,$3,Hold)) { .msg =$nick $ct $+ O pok�mon selecionado j� est� segurando um item. | return }
        if ($checknickid($nick) == Ok!) { .msg =$nick $ct $+ N�o � poss�vel equipar itens enquanto estiver batalhando. | return }
        var %n = $item.data($4-,name)
        wlog user $nick $organize($3) is now holding the item %n $+ .
        item.rem $nick %n | writeini pkp\cadastros\ $+ $nick $+ .ini $3 Hold %n | .msg =$nick $ct $+ Pok�mon $cc $+ $rini(cadastros,$nick,$3,Name) $ct $+ est� segurando o item $cc $+ %n $+ $ct $+ . | return
      }
      elseif ($2 == take) {
        if (!$basestat($3,etype)) { .msg =$nick $ct $+ Voc� cometeu um erro quanto � utiliza��o deste comando. Para remover um item de um pok�mon, digite ' $+ $cc $+ .item take <pok�mon> $+ $ct $+ ', especificando o nome do pok�mon. | return }
        if (!$checkteam($nick,$3)) { .msg =$nick $ct $+ Voc� n�o tem o pok�mon selecionado. Digite ' $+ $cc $+ .Dados $+ $ct $+ ' para visualizar seu time e finalmente digite ' $+ $cc $+ $lower($1 $2) <pok�mon> $+ $ct $+ '. | return }
        if ($checknickid($nick) == Ok!) { .msg =$nick $ct $+ N�o � poss�vel pegar itens enquanto estiver batalhando. | return }
        if ($rini(cadastros,$nick,$3,Hold)) { var %n = $item.data($rini(cadastros,$nick,$3,Hold),name) | wlog user $nick Took $organize($3) $+ 's %n $+ . | item.add $nick %n | writeini pkp\cadastros\ $+ $nick $+ .ini $3 Hold 0 | .msg =$nick $ct $+ Voc� pegou o item $cc $+ %n $ct $+ de $cc $+ $rini(cadastros,$nick,$3,Name) $+ $ct $+ . | return }
        else { .msg =$nick $ct $+ O pok�mon selecionado n�o est� segurando nenhum item. | return }
      }
      else { .msg =$nick $ct $+ Este comando foi utilizado incorretamente. Para mais informa��es, use o $cc $+ .Item $+ $ct $+ . | return }
    }
    elseif ($1 == .Sim) {
      var %x = %confirm. [ $+ [ $nick ] ] | if (!%x) { msg =$nick $ct $+ N�o h� solicita��o de confirma��o em andamento. | return }
      if ($gettok(%x,1,58) == RLS) {
        var %n = $gettok(%x,2,58), %pk = $gettok(%x,3,58), %t = $readini(pkp\box\ $+ $nick $+ \ $+ %n $+ .ini,Box,%pk)
        tokenize 59 %t
        var %tbase = $basestat(%pk,totalbase), %lv = $3, %totaliv = $calc($16 + $17 + $18 + $19 + $20 + $21), %totalev = $calc($22 + $23 + $24 + $25 + $26 + $27)
        var %exp = $10, %l = $gettok($13,1,58), %l = $iif(%l < 50,1,$iif(%l < 100,1.1,$iif(%l < 150,1.2,$iif(%l < 200,1.3,$iif(%l < 250,1.4,1.5))))), %m = $gettok($12,3,58), %m = $iif(%m == Poke  Ball,1,$iif(%m == Great Ball,1.2,$iif(%m == Ultra Ball,1.3,$iif(%m == Master Ball,1.5,1.1)))), %rate = $basestat(%pk,catch), %s = $iif($7 == ON,1.5,1), %rib = $iif($15,$calc(1 + 0.05 * $gettok($15,0,58)),1)
        var %p1 = $int($calc((%tbase * %lv / %m) / 256 * ((256 - %rate) * 100 / 255 / 100))), %p2 = $int($calc( (%exp / (%lv ^ 2)) * ((%totaliv + %lv) / 1.5 + (%totalev * 2 / 64)) + (%tbase / 32))), %p3 = $int($calc(%p2 / 3 * $iif(!%p1,1,%p1) * %l / %m))
        var %r = %r + $int($calc(%p3 * %s * %rib)) | writeini pkp\cadastros\ $+ $nick $+ .ini PC Points $calc($rini(cadastros,$nick,PC,Points) - %r)
        wlog user $nick Released $1 of box %n $+ : %t
        .msg =$nick $ct $+ O pok�mon $rtypename($1,$5,$3,$7) foi apagado com sucesso. | release $nick $1 %n | unset %confirm. [ $+ [ $nick ] ] | .timerRLS [ $+ [ $nick ] ] off | return
      }
      elseif ($gettok(%x,1,58) == SHP) {
        var %d = $gettok(%x,2,58)
        if ($gettok(%d,0,59) > 1) {
          if (!$2) { msg =$nick $ct $+ Para confirmar, � necess�rio especificar qual barco pegar. | return }
          if (!$findtok(%d,$2-,0,59)) { msg =$nick $ct $+ Sua escolha n�o � v�lida. Reveja o que foi dito. | return }
          var %s = $gettok(%d,$findtok(%d,$2-,1,59),59)
        }
        else { var %s = %d }
        unset %confirm. [ $+ [ $nick ] ]
        var %d = $travel.ship($nick,%s)
        if ($dados($nick,Quests,$gettok(%s,2,32))) {
          if (%d == Hoenn) { if ($dados($nick,Info,Region) == Johto) { var %c = Lilycove City } | else { var %c = Slateport City } }
          elseif (%d == Kanto) { var %c = Vermilion City }
          elseif (%d == Johto) { var %c = Olivine City }
          if (%c) {
            writeini pkp\cadastros\ $+ $nick $+ .ini Info Locate %c | writeini pkp\cadastros\ $+ $nick $+ .ini Info Region %d
            if ($dados($nick,%d,Visited)) { if (!$findtok($dados($nick,%d,Visited),%c,0,58)) { writeini pkp\cadastros\ $+ $nick $+ .ini %d Visited $dados($nick,%d,Visited) $+ : $+ %c } } | else { writeini pkp\cadastros\ $+ $nick $+ .ini %d Visited %c }
            msg =$nick $ct $+ Voc� navegou no $cc $+ %s $ct $+ e chegou em $cc $+ %c $ct $+ ( $+ $cc $+ %d $+ $ct $+ ). | writeini pkp\cadastros\ $+ $nick $+ .ini Clock Ship $dados($nick,Info,Online)
            writeini pkp\cadastros\ $+ $nick $+ .ini Clock Ship $dados($nick,Info,Online)
            wlog user $nick Traveled on the ship and arrived at %d $+ .
          }
          else { msg =$nick $ct $+ N�o foi poss�vel navegar no $cc $+ %s $+ $ct $+ ... }
          return
        }
        else {
          writeini pkp\cadastros\ $+ $nick $+ .ini Info Locate %s | writeini pkp\cadastros\ $+ $nick $+ .ini Info Dest %d
          msg =$nick $ct $+ Bem vindo a bordo do $cc $+ %s $+ $ct $+ ! | return
        }
      }
      elseif ($gettok(%x,1,58) == COIN) {
        var %npc = $gettok(%x,2,58), %step = $gettok(%x,3,58), %coin = $gettok(%x,4,58) | unset %confirm. [ $+ [ $nick ] ]
        if (%step == 1) { msg =$nick $chr(160) $cc $+ %npc $ct $+ - Quantas moedas voc� deseja? | set %coin. [ $+ [ $nick ] ] %npc }
        else {
          var %c = $readini(pkp\status.ini,Active,Coin)
          if ($dados($nick,Info,Money) < $calc(%c * %coin)) { msg =$nick $ct $+ Voc� n�o possui dinheiro suficiente para trocar. | return }
          if ($calc(%coin + $dados($nick,Info,Coin)) > 9999) { msg =$nick $ct $+ Voc� n�o pode ter mais de $cc $+ 9999 $ct $+ moedas em seu $cc $+ Coin Case $+ $ct $+ . | return }
          writeini pkp\cadastros\ $+ $nick $+ .ini Info Money $calc($dados($nick,Info,Money) - %c * %coin)
          writeini pkp\cadastros\ $+ $nick $+ .ini Info Coin $calc($dados($nick,Info,Coin) + %coin)
          var %x = $dados($nick,Info,Coin)
          wlog user $nick Bought %coin coins at Game Corner. There's %x coins left.
          msg =$nick $ct $+ Voc� comprou $cc $+ %coin $ct $+ moedas por $cc $+ $chr(36) $+ $getmoney($calc(%c * %coin)) $+ $ct $+ . Voc� possui agora $cc $+ %x $ct $+ $iif(%x > 1,moedas,moeda) no seu $cc $+ Coin Case $+ $ct $+ .
          msg =$nick $chr(160) $cc $+ %npc $ct $+ - Volte sempre e boa sorte! | return
        }
      }
      elseif ($gettok(%x,1,58) == BAT) { msg =$nick $ct $+ Pedido de batalha aceito! Iniciando batalha... | msg = [ $+ [ $v([ [ B. ] $+ [ $gettok(%x,2,58) ] $+ [ .Player.2 ] ]) ] ] $cc $+ $nick $ct $+ aceitou o seu pedido. | b.start.fight $gettok(%x,2,58) | unset %confirm. [ $+ [ $nick ] ] | return }
      elseif ($gettok(%x,1,58) == THM) { set %sell. [ $+ [ $nick ] ] ON | msg =$nick $cc $+ Thomas $ct $+ - Magn�fico! Ent�o escolha seu pok�mon para vender. | unset %confirm. [ $+ [ $nick ] ] | return }
      elseif ($gettok(%x,1,58) == THS) { 
        var %price = $gettok(%x,2,58), %pokemon = $gettok(%x,3,58)
        write pkp\log\users.txt < $+ $date $+ $chr(91) $+ $time $+ $chr(93) $+ >
        write pkp\log\users.txt ( $+ $nick $+ ) Received $chr(36) $+ $getmoney(%price) from Thomas.
        write pkp\log\users.txt < $+ $chr(91) $+ DATA $+ $chr(93) $+ > $data(pkp\cadastros\ $+ $nick $+ .ini, %pokemon)
        wlog user $nick %pokemon was sold for $chr(36) $+ $getmoney(%price) to npc Thomas.
        writeini pkp\cadastros\ $+ $nick $+ .ini Clock Thomas $dados($nick,Info,Online)
        writeini pkp\cadastros\ $+ $nick $+ .ini Info Money $calc($rini(cadastros,$nick,Info,Money) + %price) | remteam $nick %pokemon | remini pkp\cadastros\ $+ $nick $+ .ini %pokemon | msg =$nick $cc $+ Thomas $ct $+ - Maravilha..! Obrigado por vender seu $cc $+ %pokemon $+ $ct $+ . At� mais. | unset %confirm. [ $+ [ $nick ] ] | return
      }
      elseif ($gettok(%x,1,58) == WRT) {
        unset %confirm. [ $+ [ $nick ] ] | var %n = $rini(cadastros,$nick,Time,Goto)
        if (%n) { var %r = $calc($ctime($date $time) - $ctime(%n)) | if (%r >= 3600) { goto city } | else { msg =$nick $ct $+ Voc� s� pode mudar de cidade uma vez por hora. Ainda faltam $cc $+ $dur($gettok($duration($calc(3600 - %r)),1,32),$ct,$cc).e $ct $+ para voc� tentar novamente. | return } }
        else {
          :city
          var %d = $gettok(%x,2,58)
          if ($gettok(%x,0,59) > 1) { if (!$2) { msg =$nick $ct $+ � preciso especificar o destino com o comando ' $+ $cc $+ .Sim <destino> $+ $ct $+ '. | set %confirm. [ $+ [ $nick ] ] WRT: $+ %d | return } | if (!$findtok(%d,$2-,0,59)) { msg =$nick $ct $+ Destino inexistente. Reveja o que foi dito. | return } | var %d = $org($2-) }
          msg =$nick $chr(160) $cc $+ Writney $ct $+ - Suba a bordo, $nick $+ !
          if (!$findtok($dados($nick,$dados($nick,Info,Region),Visited),%d,0,58)) {
            if (%d == Dewford City) && ($gpoints($nick) <= 35000) { msg =$nick $ct $+ Voc� ainda n�o pode ir a $cc $+ %d $+ $ct $+ , pois ainda n�o possui a quantidade de pontos necess�ria. | return }
            if (%d == Slateport City) && ($gpoints($nick) <= 95000) { msg =$nick $ct $+ Voc� ainda n�o pode ir a $cc $+ %d $+ $ct $+ , pois ainda n�o possui a quantidade de pontos necess�ria. | return }
            var %v = $dados($nick,$dados($nick,Info,Region),Visited) | if (%v) { writeini pkp\cadastros\ $+ $nick $+ .ini $dados($nick,Info,Region) Visited %v $+ : $+ %d } | else { writeini pkp\cadastros\ $+ $nick $+ .ini $dados($nick,Info,Region) Visited %d }
          }
          msg =$nick $ct $+ Voc� saiu de $cc $+ $rini(cadastros,$nick,Info,Locate) $+ $ct $+ . Bem vindo � $cc $+ %d $+ $ct $+ .
          wlog user $nick Traveled with npc Writney and arrived on %d $+ .
          writeini pkp\cadastros\ $+ $nick $+ .ini Info LastLocate $dados($nick,Info,Locate) | writeini pkp\cadastros\ $+ $nick $+ .ini Info Locate %d | writeini pkp\cadastros\ $+ $nick $+ .ini Time Goto $date $time
          return
        }
      }
      elseif ($gettok(%x,1,58) == GYM) {
        unset %confirm. [ $+ [ $nick ] ] | writeini pkp\cadastros\ $+ $nick $+ .ini Info Money $calc($rini(cadastros,$nick,Info,Money) - 15000)
        set %gym. [ $+ [ $nick ] ] $replace($dados($nick,Info,Locate),$chr(32),_) $+ :1:0
        var %gym = $readini(pkp\gym.ini,$iif($start($nick),Normal,Advanced),$replace($dados($nick,Info,Locate),$chr(32),_))
        wlog user $nick Started a GYM Challenge on $dados($nick,Info,Locate) $+ .
        var %adv = $gettok($gettok(%gym,4,172),1,58) | battle.npc $nick %adv | sset [ [ B. ] $+ [ $checknickid($nick).id ] $+ [ .Gym ] ] ON | sset [ [ B. ] $+ [ $checknickid($nick).id ] $+ [ .Say:2 ] ] 0;0; $+ $gettok($gettok(%gym,5,172),1,59)
      }
      elseif ($gettok(%x,1,58) == LEA) {
        unset %confirm. [ $+ [ $nick ] ] | writeini pkp\cadastros\ $+ $nick $+ .ini Info Money $calc($rini(cadastros,$nick,Info,Money) - 30000)
        var %x = 1, %y = $readini(pkp\status.ini,$dados($nick,Info,Region),$iif($start($nick),League,League2)), %r = 0
        while ($gettok(%y,%x,58)) {
          var %n = $gettok(%y,%x,58)
          if (%n == Gary) && ($start($nick)) { var %n = Gary $+ $dados($nick,Quests,Gary) }
          if (%r) { var %r = %r $+ : $+ %n } | else { var %r = %n } | inc %x
        }
        wlog user $nick Started a LEAGUE Challenge on $dados($nick,Info,Locate) $+ .
        if ($dados($nick,Info,Region) == Johto) {
          var %team = 1506:1507: $+ $gettok(1508:1509,$rand(1,2),58) $+ :1510:1511:1512:1513:1514: $+ $gettok(1515:1516,$rand(1,2),58) $+ : $+ $gettok(1517:1518:1519,$rand(1,3),58) $+ :1520:1521:1522:1523:1524:1525:1526, %team = $gettok($randtok(%team,58),1-5,58), %control = $readini(pkp\status.ini,Active,Control)
          writeini pkp\cadastros\ $+ $nick $+ .ini Clock League $dados($nick,Info,Online)
        }
        if (%control) && ($checknick(%control) == Ok!) { remini pkp\cadastros\ $+ %control $+ .ini Info Control | if (%control != $nick) { msg $+(=,%control) $cc $+ $dados(%control,Info,Nick) $+ $ct $+ , um novo desafio � liga foi iniciado. Se voc� deseja realmente enfrentar $cc $+ $dados($nick,Info,Nick) $ct $+ na final, digite ' $+ $cc $+ .Sim $+ $ct $+ '. Caso contr�rio, digite apenas ' $+ $cc $+ .nao $+ $ct $+ '. | set %confirm. [ $+ [ %control ] ] CNT } }
        set %league. [ $+ [ $nick ] ] 1;0; $+ %r $+ $iif(%team,; $+ %team) | if (%team) { battle.npc.team $nick $gettok(%r,1,58) $gettok(%team,1,58) } | else { battle.npc $nick $gettok(%r,1,58) }
        sset [ [ B. ] $+ [ $checknickid($nick).id ] $+ [ .League ] ] ON
      }
      elseif ($gettok(%x,1,58) == CNT) {
        unset %confirm. [ $+ [ $nick ] ] | msg =$nick $ct $+ Voc� controlar� o �ltimo combatente da liga pok�mon. Boa sorte. | writeini pkp\cadastros\ $+ %control $+ .ini Info Control ON
      }
      elseif ($gettok(%x,1,58) == AQU) {
        unset %confirm. [ $+ [ $nick ] ]
        wlog user $nick Started to battle against AQUA members.
        if ($gettok(%x,2,58) == 1) { set %battle. [ $+ [ $nick ] ] Sam_Aqua:March_Aqua;1;AQUA1 }
        elseif ($gettok(%x,2,58) == 2) { set %battle. [ $+ [ $nick ] ] Earl_Aqua:Marta_Aqua:Shelly_Aqua;1;AQUA2 }
        elseif ($gettok(%x,2,58) == 3) { set %battle. [ $+ [ $nick ] ] Rick_Aqua:Matt_Aqua;1;AQUA3 }
        elseif ($gettok(%x,2,58) == 4) { set %battle. [ $+ [ $nick ] ] Glenn_Aqua:Matt_Aqua:Shelly_Aqua:Archie;1;AQUA4 }
        var %adv = $gettok($gettok(%battle. [ $+ [ $nick ] ],1,59),1,58) | battle.npc $nick %adv | sset [ [ B. ] $+ [ $checknickid($nick).id ] $+ [ .Quest ] ] AQUA $+ $gettok(%x,2,58)
      }
      elseif ($gettok(%x,1,58) == MGM) {
        unset %confirm. [ $+ [ $nick ] ]
        wlog user $nick Started to battle against MAGMA members.
        if ($gettok(%x,2,58) == 1) { set %battle. [ $+ [ $nick ] ] Elenna_Magma:Tabitha_Magma:Maxie;1;MAGMA1 }
        elseif ($gettok(%x,2,58) == 2) { set %battle. [ $+ [ $nick ] ] Alan_Magma:Elliot_Magma:Ronny_Magma:Tabitha_Magma:Maxie;1;MAGMA2 }
        elseif ($gettok(%x,2,58) == 3) { set %battle. [ $+ [ $nick ] ] Maxie;1;MAGMA3 }
        var %adv = $gettok($gettok(%battle. [ $+ [ $nick ] ],1,59),1,58) | battle.npc $nick %adv | sset [ [ B. ] $+ [ $checknickid($nick).id ] $+ [ .Quest ] ] MAGMA $+ $gettok(%x,2,58)
      }
      elseif ($gettok(%x,1,58) == RKT) {
        unset %confirm. [ $+ [ $nick ] ]
        wlog user $nick Started to battle against ROCKET members.
        if ($gettok(%x,2,58) == 1) { set %battle. [ $+ [ $nick ] ] Sanno_Rocket:Billy_Rocket:Track_Rocket;1;ROCKET1 }
        if ($gettok(%x,2,58) == 2) { set %battle. [ $+ [ $nick ] ] Arthur_Rocket:Trevor_Rocket:Chris_Rocket:Trent_Rocket;1;ROCKET2 }
        if ($gettok(%x,2,58) == 3) { set %battle. [ $+ [ $nick ] ] Frank_Rocket�:Chris_Rocket�:Joyce_Rocket:Trent_Rocket�:Admin_Bunch:Boss_Giovanni;1;ROCKET3 }
        if ($gettok(%x,2,58) == 4) { set %battle. [ $+ [ $nick ] ] Mitch_Rocket:Andrew_Rocket:Hank_Rocket;1;ROCKET4 }
        if ($gettok(%x,2,58) == 5) { set %battle. [ $+ [ $nick ] ] 1314:1315:RKT4;1;ROCKET5 }
        if ($gettok(%x,2,58) == 6) { set %battle. [ $+ [ $nick ] ] 1319:1320:1321:1322:1323:1065;1;ROCKET6 }
        if ($gettok(%x,2,58) == 7) { set %battle. [ $+ [ $nick ] ] 1429:1430:1431:1432;1;ROCKET7 }
        if ($gettok(%x,2,58) == 8) { set %battle. [ $+ [ $nick ] ] 1430:1429:1431:1433;1;ROCKET8 }
        var %adv = $gettok($gettok(%battle. [ $+ [ $nick ] ],1,59),1,58) | battle.npc $nick %adv | sset [ [ B. ] $+ [ $checknickid($nick).id ] $+ [ .Quest ] ] ROCKET $+ $gettok(%x,2,58) | return
      }
      elseif ($gettok(%x,1,58) == SVR) {
        unset %confirm. [ $+ [ $nick ] ]
        set %battle. [ $+ [ $nick ] ] 1437;1;SILVER
        var %adv = $gettok($gettok(%battle. [ $+ [ $nick ] ],1,59),1,58) | battle.npc $nick %adv | sset [ [ B. ] $+ [ $checknickid($nick).id ] $+ [ .Quest ] ] SILVER | return
      }
      elseif ($gettok(%x,1,58) == FEA) {
        unset %confirm. [ $+ [ $nick ] ]
        var %f = $gettok(%x,2,58), %leg = $readini(pkp\status.ini,$dados($nick,Info,Region),Legendary)
        if (%f == Silver) { var %pk = Lugia, %lv = 70, %move = Whirlpool } | else { var %pk = Ho-oh, %lv = 70, %move = Fire Spin }
        msg =$nick $ct $+ Item $cc $+ %f Feather $ct $+ est� reagindo com o pok�mon...
        var %x = 1
        if (!$totalpokes($nick)) { msg =$nick $ct $+ Por alguma raz�o ainda desconhecida, voc� n�o est� com pok�mon algum. Reporte este bug ao moderador. | var %x }
        if ($dados($nick,Team,1) == Egg) { msg =$nick $ct $+ Por alguma raz�o ainda desconhecida, voc� n�o est� com pok�mon v�lido neste momento. Reporte este bug ao moderador. | var %x }
        if ($totalpokes($nick) == 6) { msg =$nick $ct $+ Voc� n�o p�de batalhar com $cc $+ %pk $ct $+ porque j� tem seis pok�mon no time! | var %x }
        if ($dados($nick,%pk,Name)) { msg =$nick $ct $+ Voc� n�o p�de batalhar com $cc $+ %pk $ct $+ porque j� tem o mesmo no time! | var %x }
        if ($appeared(%pk)) { msg =$nick $ct $+ Voc� n�o p�de batalhar com $cc $+ %pk $ct $+ porque algu�m chegou primeiro. Aguarde. | var %x }
        if (%x) {
          if (!$findtok(%leg,%pk,0,58)) || ($dados($nick,Quests,%pk)) {
            if (%f == Rainbow) { msg =$nick $ct $+ Pok�mon $cc $+ %pk $ct $+ lan�ou um brilho intenso e desapareceu... }
            else { msg =$nick $ct $+ Pok�mon $cc $+ %pk $ct $+ dissipou o enorme redemoinho e mergulhou nas profundezas do oceano... }
            writeini pkp\cadastros\ $+ $nick $+ .ini Quests Luck $rand(1,3)
          }
          else {
            writeini pkp\cadastros\ $+ $nick $+ .ini Quests %pk Ok
            battle.wild $nick $dados($nick,Team,1) %pk %lv lb 10
            var %ID = $checknickid($nick).ID, %alvo = 1, %n = 2 | sset [ [ B. ] $+ [ %ID ] $+ [ .Vortex. ] $+ [ %alvo ] ] %move $+ : $+ %n | sset [ [ B. ] $+ [ %ID ] $+ [ .VTurn. ] $+ [ %n ] ] 0 | sset [ [ B. ] $+ [ %ID ] $+ [ .VTurns. ] $+ [ %n ] ] 999
          }
        }
        else {
          var %l = $dados($nick,Info,Locate), %d = $dados($nick,Info,LastLocate)
          if ($gotoplace($nick,%l,%d) == Ok!) {
            var %d = $gotoplace($nick,%l,%d).get | if ($gettok(%d,2,35)) { writeini pkp\cadastros\ $+ $nick $+ .ini Info Path $gettok(%d,2,35) } | elseif ($dados($nick,Info,Path)) { remini pkp\cadastros\ $+ $nick $+ .ini Info Path } | var %d = $gettok(%d,1,35)
            msg =$nick $ct $+ Voc� saiu de $cc $+ $rini(cadastros,$nick,Info,Locate) $+ $ct $+ . Bem vindo a $cc $+ %d $+ $ct $+ .
            wlog user $nick Arrived at %d successfully.
            writeini pkp\cadastros\ $+ $nick $+ .ini Info Locate %d | writeini pkp\cadastros\ $+ $nick $+ .ini Info LastLocate %l | writeini pkp\cadastros\ $+ $nick $+ .ini Time Goto $date $time
            place.events
          }
          return
        }
        item.rem $nick %f Feather
      }
      elseif ($gettok(%x,1,58) == FUJ) {
        unset %confirm. [ $+ [ $nick ] ] | set %battle. [ $+ [ $nick ] ] Timmy_Rocket:Joey_Rocket:Frank_Rocket;1;FUJI
        wlog user $nick Started to battle against ROCKET members.
        var %adv = $gettok($gettok(%battle. [ $+ [ $nick ] ],1,59),1,58) | battle.npc $nick %adv | sset [ [ B. ] $+ [ $checknickid($nick).id ] $+ [ .Quest ] ] FUJI | return
      }
      elseif ($gettok(%x,1,58) == DOJ) {
        unset %confirm. [ $+ [ $nick ] ] | set %battle. [ $+ [ $nick ] ] Blackbelt_Hideki:Blackbelt_Mike:Blackbelt_Koichi;1;DOJO
        wlog user $nick Started a DOJO Challenge on $dados($nick,Info,Locate) $+ .
        var %adv = $gettok($gettok(%battle. [ $+ [ $nick ] ],1,59),1,58) | battle.npc $nick %adv | sset [ [ B. ] $+ [ $checknickid($nick).id ] $+ [ .Quest ] ] DOJO | return
      }
      elseif ($gettok(%x,1,58) == MAY) {
        unset %confirm. [ $+ [ $nick ] ]
        wlog user $nick Started to battle against npc May.
        if ($gettok(%x,2,58) == 1) { var %adv = Novice_May }
        elseif ($gettok(%x,2,58) == 2) { var %adv = Expert_May }
        battle.npc $nick %adv | sset [ [ B. ] $+ [ $checknickid($nick).id ] $+ [ .Quest ] ] MAY $+ $gettok(%x,2,58)
      }
      elseif ($gettok(%x,1,58) == HLN) { unset %confirm. [ $+ [ $nick ] ] | battle.npc $nick Helen | sset [ [ B. ] $+ [ $checknickid($nick).id ] $+ [ .Quest ] ] HELEN | wlog user $nick Started to battle against npc Helen. }
      elseif ($gettok(%x,1,58) == CLK) {
        unset %confirm. [ $+ [ $nick ] ]
        var %adv = $gettok(%x,2,58) | if (%adv isnum) { var %n = $int($calc(%adv / 100)) $+ 00, %name = $rini(npc,%n,%adv,Name) } | else { var %name = %adv }
        writeini pkp\cadastros\ $+ $nick $+ .ini Clock %name $dados($nick,Info,Online) | battle.npc $nick %adv | wlog user $nick Started to battle against npc %name $+ .
        return
      }
      elseif ($gettok(%x,1,58) == NXT) {
        unset %confirm. [ $+ [ $nick ] ] | var %g = %gym. [ $+ [ $nick ] ], %nbattle = $calc($gettok(%g,2,58) + 1)
        var %gym = $readini(pkp\gym.ini,$iif($start($nick),Normal,Advanced),$gettok(%g,1,58)), %adv = $gettok($gettok(%gym,4,172),%nbattle,58) | set %gym. [ $+ [ $nick ] ] $gettok(%g,1,58) $+ : $+ %nbattle $+ : $+ $gettok(%g,3,58) | battle.npc $nick %adv | sset [ [ B. ] $+ [ $checknickid($nick).id ] $+ [ .Gym ] ] ON | sset [ [ B. ] $+ [ $checknickid($nick).id ] $+ [ .Say:2 ] ] 0;0; $+ $gettok($gettok(%gym,5,172),%nbattle,59) | return
      }
      elseif ($gettok(%x,1,58) == LG2) {
        unset %confirm. [ $+ [ $nick ] ] | var %l = %league. [ $+ [ $nick ] ], %nbattle = $gettok(%l,1,59), %adv = $gettok(%l,3,59), %team = $gettok(%l,4,59), %adv = $gettok(%adv,%nbattle,58)
        if (%nbattle == 5) && ($dados($nick,Info,Region) == Johto) {
          var %control = $readini(pkp\status.ini,Active,Control)
          if ($dados(%control,Info,Control) != ON) && (%active.league == $nick) { if (%confirm. [ $+ [ %control ] ]) { unset %confirm. [ $+ [ %control ] ] | if ($checknick(%control) == Ok!) { msg $+(=,%control) $ct $+ O desafio de $cc $+ %active.league $ct $+ j� come�ou. Seu pedido de confirma��o foi cancelado. } | var %control = 0 } }
        }
        if ($gettok(%team,%nbattle,58)) { battle.npc.team $nick %adv $gettok(%team,%nbattle,58) $iif(%control,%control) } | else { battle.npc $nick %adv $iif(%control,%control) }
        sset [ [ B. ] $+ [ $checknickid($nick).id ] $+ [ .League ] ] ON
      }
      elseif ($gettok(%x,1,58) == NXQ) {
        unset %confirm. [ $+ [ $nick ] ] | var %b = %battle. [ $+ [ $nick ] ], %nbattle = $calc($gettok(%b,2,59) + 1), %adv = $gettok($gettok(%b,1,59),%nbattle,58)
        set %battle. [ $+ [ $nick ] ] $gettok(%b,1,59) $+ ; $+ %nbattle $+ ; $+ $gettok(%b,3,59)
        if (%adv == RKT4) {
          msg =$nick $chr(160) $cc $+ Sofia $ct $+ (ROCKET) - Hahaha, pobre $cc $+ Lance $+ $ct $+ , n�o se desespere... Ainda n�o terminei de mostrar todo o poder dos meus pok�mon...
          msg =$nick $chr(160) $cc $+ Lance $ct $+ - Trapaceiros! Dois contra um, n�o podia esperar nada menos de voc�s... $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , vamos, preciso de sua ajuda aqui!
          battle.npc $nick $+ ;1318 1317;1316
        }
        else { battle.npc $nick %adv }
        sset [ [ B. ] $+ [ $checknickid($nick).id ] $+ [ .Quest ] ] $gettok(%b,3,59)
      }
      elseif ($gettok(%x,1,58) == BRD) {
        unset %confirm. [ $+ [ $nick ] ] | var %n = $gettok(%x,2,58)
        if (%stand. [ $+ [ %n ] ]) {
          unset %stand. [ $+ [ %n ] ]
          var %pk.1 = $rini(cadastros,$nick,Team,1), %sex.1 = $rini(cadastros,$nick,%pk.1,Sex), %moveset.1 = $rini(cadastros,$nick,%pk.1,Move1) $+ $iif($rini(cadastros,$nick,%pk.1,Move2),: $+ $rini(cadastros,$nick,%pk.1,Move2) $+ $iif($rini(cadastros,$nick,%pk.1,Move3),: $+ $rini(cadastros,$nick,%pk.1,Move3) $+ $iif($rini(cadastros,$nick,%pk.1,Move4),: $+ $rini(cadastros,$nick,%pk.1,Move4))))
          var %pk.2 = $rini(cadastros,%n,Team,1), %sex.2 = $rini(cadastros,%n,%pk.2,Sex), %moveset.2 = $rini(cadastros,%n,%pk.2,Move1) $+ $iif($rini(cadastros,%n,%pk.2,Move2),: $+ $rini(cadastros,%n,%pk.2,Move2) $+ $iif($rini(cadastros,%n,%pk.2,Move3),: $+ $rini(cadastros,%n,%pk.2,Move3) $+ $iif($rini(cadastros,%n,%pk.2,Move4),: $+ $rini(cadastros,%n,%pk.2,Move4))))
          breed $nick $+ ; $+ %pk.1 $+ ; $+ %sex.1 $+ ; $+ %moveset.1 $+ ; $+ %n $+ ; $+ %pk.2 $+ ; $+ %sex.2 $+ ; $+ %moveset.2
        }
        else { msg =$nick $ct $+ N�o foi poss�vel completar o cruzamento porque $cc $+ %n $ct $+ n�o est� mais em modo de espera. | return }
      }
      elseif ($gettok(%x,1,58) == TRD) {
        var %n = $gettok(%x,2,58), %pkn = $gettok(%x,3,58), %pk = $dados($nick,$2,Name)
        if (!%pk) { msg =$nick $ct $+ Para confirmar, � necess�rio especificar o nome do pok�mon que voc� deseja trocar pelo $cc $+ %pkn $ct $+ de $cc $+ %n $+ $ct $+ . | return }
        if ($is_legend(%pk)) { msg =$nick $ct $+ Por se tratar de um pok�mon $cc $+ lend�rio $+ $ct $+ , n�o pode ser trocado. | return }
        unset %confirm. [ $+ [ $nick ] ]
        if (%stand. [ $+ [ %n ] ]) {
          set %stand. [ $+ [ $nick ] ] Trade_wait $+ : $+ %n | unset %stand. [ $+ [ %n ] ]
          set %confirm. [ $+ [ %n ] ] TR2: $+ $dados($nick,Info,Nick) $+ : $+ %pk $+ : $+ %pkn
          msg =$nick $cc $+ %pk $ct $+ foi escolhido para trocar. Agora, aguarde a confirma��o de $cc $+ %n $+ $ct $+ . | var %nick = $dados($nick,Info,Nick)
          msg $+(=,%n) $cc $+ %n $+ $ct $+ , $cc $+ %nick $ct $+ escolheu $rtypename(%pk,$dados(%nick,%pk,Sex),$dados(%nick,%pk,Level),$dados(%nick,%pk,Shiny)) para trocar pelo seu $rtypename(%pkn,$dados(%n,%pkn,Sex),$dados(%n,%pkn,Level),$dados(%n,%pkn,Shiny)) $+ . Deseja realmente prosseguir?
          msg $+(=,%n) $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para cancelar.
        }
        else { msg =$nick $ct $+ N�o foi poss�vel prosseguir com a troca porque $cc $+ %n $ct $+ n�o est� mais em modo de espera. | return }
      }
      elseif ($gettok(%x,1,58) == TR2) {
        var %n = $gettok(%x,2,58), %pkn = $gettok(%x,3,58), %pk = $gettok(%x,4,58), %nick = $dados($nick,Info,Nick)
        unset %confirm. [ $+ [ $nick ] ]
        if (%stand. [ $+ [ %n ] ]) {
          unset %stand. [ $+ [ %n ] ]
          if (%pkn != %pk) {
            if ($dados(%n,%pk,Name)) { var %msg = $ct $+ N�o foi poss�vel concluir a troca. $cc $+ %n $ct $+ j� possui o pok�mon $cc $+ %pk $+ $ct $+ . | msg $+(=,$nick) %msg | msg $+(=,%n) %msg | return }
            if ($dados(%nick,%pkn,Name)) { var %msg = $ct $+ N�o foi poss�vel concluir a troca. $cc $+ %nick $ct $+ j� possui o pok�mon $cc $+ %pkn $+ $ct $+ . | msg $+(=,$nick) %msg | msg $+(=,%n) %msg | return }
          }
          remteam %n %pkn | remteam %nick %pk
          var %line = $getpkline(%n,%pkn) | remini pkp\cadastros\ $+ %n $+ .ini %pkn
          if ($teampos(%n,Egg)) { remteam %n Egg | addteam %n %pk | addteam %n Egg }
          else { addteam %n %pk }
          copyreg pkp\cadastros\ $+ %nick $+ .ini pkp\cadastros\ $+ %n $+ .ini %pk | remini pkp\cadastros\ $+ %nick $+ .ini %pk
          tokenize 59 %line
          if ($teampos(%nick,Egg)) { remteam %nick Egg | addteam %nick %pkn | addteam %nick Egg }
          else { addteam %nick %pkn }
          if (%pkn == Egg) {
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 Name $1
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 DNA $2
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 Hatch $3
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 Milhagem $4
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 Nature $5
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 Sex $6
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 GV $7
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 Shiny $8
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 Memory $9
            if ($10) { writeini pkp\cadastros\ $+ %nick $+ .ini $1 Trait $10 }

            if ($11) { writeini pkp\cadastros\ $+ %nick $+ .ini $1 IVHp $11 }
            if ($12) { writeini pkp\cadastros\ $+ %nick $+ .ini $1 IVAtk $12 }
            if ($13) { writeini pkp\cadastros\ $+ %nick $+ .ini $1 IVDef $13 }
            if ($14) { writeini pkp\cadastros\ $+ %nick $+ .ini $1 IVSpd $14 }
            if ($15) { writeini pkp\cadastros\ $+ %nick $+ .ini $1 IVSAtk $15 }
            if ($16) { writeini pkp\cadastros\ $+ %nick $+ .ini $1 IVSDef $16 }

            if ($17) { writeini pkp\cadastros\ $+ %nick $+ .ini $1 Move1 $17 }
            if ($18) { writeini pkp\cadastros\ $+ %nick $+ .ini $1 Move2 $18 }
            if ($19) { writeini pkp\cadastros\ $+ %nick $+ .ini $1 Move3 $19 }
            if ($20) { writeini pkp\cadastros\ $+ %nick $+ .ini $1 Move4 $20 }
          }
          else {
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 Name $1
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 ID $2
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 Level $3
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 Nature $4
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 Sex $5
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 GV $6
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 Shiny $7
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 Trait $8
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 ExpStat $9
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 Exp $10
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 Next $11
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 Memory $12
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 Loyalty $13
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 Hold $14
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 Ribbon $15
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 IVHp $16
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 IVAtk $17
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 IVDef $18
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 IVSpd $19
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 IVSAtk $20
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 IVSDef $21
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 EVHP $22
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 EVAtk $23
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 EVDef $24
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 EVSpd $25
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 EVSAtk $26
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 EVSDef $27
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 HP $28
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 Atk $29
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 Def $30
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 Spd $31
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 SAtk $32
            writeini pkp\cadastros\ $+ %nick $+ .ini $1 SDef $33
            if ($34) { writeini pkp\cadastros\ $+ %nick $+ .ini $1 Learn $34 }
            if ($35) { writeini pkp\cadastros\ $+ %nick $+ .ini $1 Move1 $35 }
            if ($36) { writeini pkp\cadastros\ $+ %nick $+ .ini $1 Move2 $36 }
            if ($37) { writeini pkp\cadastros\ $+ %nick $+ .ini $1 Move3 $37 }
            if ($38) { writeini pkp\cadastros\ $+ %nick $+ .ini $1 Move4 $38 }
          }
          if (%pk != Egg) {
            if (!$pokedex(%n,%pk)) { .echo $pokedex(%n,%pk).add }
            if ($dados(%n,%pk,ID) != %n) { writeini pkp\cadastros\ $+ %n $+ .ini %pk Loyalty 70 }
          }
          if (%pkn != Egg) {
            if (!$pokedex(%nick,%pkn)) { .echo $pokedex(%nick,%pkn).add }
            if ($dados(%nick,%pkn,ID) != %nick) { writeini pkp\cadastros\ $+ %nick $+ .ini %pkn Loyalty 70 }
          }
          wlog user %n Traded %pkn for %pk with %nick $+ . | wlog user %nick Traded %pk for %pkn with %n $+ .
          writeini pkp\cadastros\ $+ %n $+ .ini Time Trade $date $time | writeini pkp\cadastros\ $+ %nick $+ .ini Time Trade $date $time
          msg $+(=,%n) $ct $+ Troca efetuada com sucesso. Voc� recebeu o pok�mon $rtypename(%pk,$dados(%n,%pk,Sex),$dados(%n,%pk,Level),$dados(%n,%pk,Shiny)) $+ .
          msg $+(=,%nick) $ct $+ Troca efetuada com sucesso. Voc� recebeu o pok�mon $rtypename(%pkn,$dados(%nick,%pkn,Sex),$dados(%nick,%pkn,Level),$dados(%nick,%pkn,Shiny)) $+ .
          return
        }
        else { msg =$nick $ct $+ N�o foi poss�vel concluir a troca porque $cc $+ %n $ct $+ n�o est� mais em modo de espera. | return }
      }
      elseif ($gettok(%x,1,58) == RYD) {
        unset %confirm. [ $+ [ $nick ] ] | var %n = $gettok(%x,2,58)
        wlog user $nick %n was traded to another bike.
        if (%n == Mach Bike) { item.rem $nick Mach Bike | item.add $nick Acro Bike | msg =$nick $chr(160) $cc $+ Rydel $ct $+ - �timo! Com a Acro Bike, voc� estar� pronto para qualquer aventura. | return }
        else { item.rem $nick Acro Bike | item.add $nick Mach Bike | msg =$nick $chr(160) $cc $+ Rydel $ct $+ - �timo! Com a Mach Bike, voc� vai se mover mais r�pido do que nunca! | return }
      }
      elseif ($gettok(%x,1,58) == TNT) {
        unset %confirm. [ $+ [ $nick ] ]
        var %l = $gettok(%x,2,58), %tent = $readini(pkp\status.ini,Tent,$replace(%l,$chr(32),_)), %rules = $gettok(%tent,1,59), %modes = $gettok(%tent,2,59)
        var %x = 0 | while (%x < $gettok(%rules,1,58)) {
          inc %x | var %pk = $rini(cadastros,$nick,Team,%x), %type = $iif(%type,%type $basestat(%pk,type),$basestat(%pk,type))
          if (!%pk) { msg =$nick $ct $+ Voc� est� violando uma das regras. Voc� precisa ter $cc $+ $numero($gettok(%rules,1,58)) $ct $+ pok�mon v�lidos no seu time. | return }
          if (%pk == Egg) { msg =$nick $ct $+ Voc� est� violando uma das regras. $cc $+ Egg $ct $+ n�o � um pok�mon v�lido. | return }
          if ($dados($nick,%pk,Level) < $gettok(%rules,2,58)) { msg =$nick $ct $+ Voc� est� violando a seguinte regra: $cc $+ level m�nimo $ct $+ dos pok�mon � $cc $+ $gettok(%rules,2,58) $+ $ct $+ . | return }
          if ($gettok(%rules,4,58) !isin $basestat(%pk,type)) && ($gettok(%rules,4,58)) { msg =$nick $ct $+ Voc� est� violando a seguinte regra: $cc $+ apenas $ct $+ pok�mon do tipo $cc $+ $gettok(%rules,4,58) $+ $ct $+ . | return }
          if ($gettok(%rules,5,58) isin $basestat(%pk,type)) && ($gettok(%rules,5,58)) { msg =$nick $ct $+ Voc� est� violando a seguinte regra: $cc $+ qualquer $ct $+ tipo de pok�mon $cc $+ exceto $gettok(%rules,2,58) $+ $ct $+ . | return }
          if (d isin %modes) { if ($totalpokes($nick) < 2) || ($dados($nick,Team,2) == Egg) { msg =$nick $ct $+ Para batalhar em dupla, � necess�rio no m�nimo $cc $+ dois $ct $+ pok�mon v�lidos no time! | return } }
        }
        if ($gettok(%rules,3,58)) {
          while ($gettok(%type,1,32)) && (!%monotype) { if ($findtok(%type,$gettok(%type,1,32),0,32) == $gettok(%rules,1,58)) { var %monotype = 1 } | var %type = $deltok(%type,1,32) }
          if (!%monotype) { msg =$nick $ct $+ Voc� est� violando uma das regras. � preciso que todos os membros do time tenham um tipo em comum. | return }
        }
        if (%stand. [ $+ [ $nick ] ]) { unset %stand. [ $+ [ $nick ] ] }
        if (d isin %modes) { b.create.fila $rini(cadastros,$nick,Info,Nick) $rini(cadastros,$nick,Team,1) $rini(cadastros,$nick,Team,2) } | else { b.create.fila $rini(cadastros,$nick,Info,Nick) $rini(cadastros,$nick,Team,1) }
        var %ID = $checknickid($nick).id | sset [ [ B. ] $+ [ %ID ] $+ [ .BattleTent ] ] %l | sset [ [ B. ] $+ [ %ID ] $+ [ .Match ] ] $gettok(%rules,1,58) | if (u isin %modes) { sset [ [ B. ] $+ [ %ID ] $+ [ .PPUp ] ] ON } | if (p isin %modes) { sset [ [ B. ] $+ [ %ID ] $+ [ .PP ] ] ON } | if (s isin %modes) { sset [ [ B. ] $+ [ %ID ] $+ [ .Switch ] ] ON } | if (a isin %modes) { sset [ [ B. ] $+ [ %ID ] $+ [ .SLPClause ] ] ON | sset [ [ B. ] $+ [ %ID ] $+ [ .FRZClause ] ] ON }
        wlog user $nick A TENT Battle was successfully created, on %l $+ .
        msg =$nick $ct $+ Sua batalha foi criada com sucesso. Sua ID � ' $+ $cc $+ %ID $+ $ct $+ ', guarde-a para uso posterior. | return
      }
      elseif ($gettok(%x,1,58) == SFR) { unset %confirm. [ $+ [ $nick ] ] | var %ID = $checknickid($nick).id | sset [ [ B. ] $+ [ %ID ] $+ [ .Auto ] ] ON | sset [ [ B. ] $+ [ %ID ] $+ [ .Wild ] ] ON | sset [ [ B. ] $+ [ %ID ] $+ [ .Safari ] ] ON | sset [ [ B. ] $+ [ %ID ] $+ [ .Ball ] ] $iif($rini(cadastros,$nick,Info,Premium),6,3) | b.start.fight %ID | wlog user $nick $v(B. $+ %ID $+ .Poke.2) was found at Safari Zone! | return }
      elseif ($gettok(%x,1,58) == NCL) {
        unset %confirm. [ $+ [ $nick ] ] | var %pk = $gettok(%x,2,58) | if (%pk == Egg) { msg =$nick $chr(160) $cc $+ Nicolas $ct $+ - Sinto muito, mas n�o posso fazer $cc $+ Eggs $ct $+ desaprenderem golpes, afinal eles n�o sabem nenhum! Mas, a prop�sito, como conseguiu deixar seu time com um Egg na lideran�a? Interessante, talvez voc� deva usar ' $+ $cc $+ .Report $+ $ct $+ '! | return }
        if (!$rini(cadastros,$nick,%pk,Move2)) { msg =$nick $chr(160) $cc $+ Nicolas $ct $+ - Sinto muito, mas seu pok�mon n�o pode ficar sem golpes... | return }
        var %m = 0 | while (%m < 4) { inc %m | if ($rini(cadastros,$nick,%pk,Move $+ %m)) { if (%moves) { var %moves = %moves $+ : $+ $rini(cadastros,$nick,%pk,Move $+ %m) } | else { var %moves = $rini(cadastros,$nick,%pk,Move $+ %m) } } }
        var %m = 0, %n = $gettok(%moves,0,58) | while (%m < %n) { inc %m | if (%r) { if (%m == %n) { var %r = %r $ct $+ ou $cc $+ $gettok(%moves,%m,58) } | else { var %r = %r $+ $ct $+ , $cc $+ $gettok(%moves,%m,58) } } | else { var %r = $cc $+ $gettok(%moves,%m,58) } }
        set %mvdel. [ $+ [ $nick ] ] %pk $+ ; $+ %moves | msg =$nick $chr(160) $cc $+ Nicolas $ct $+ - Qual desses golpes voc� quer que ele esque�a? %r $+ $ct $+ ? | return
      }
      elseif ($gettok(%x,1,58) == NC2) { unset %confirm. [ $+ [ $nick ] ] | var %pk = $gettok(%x,2,58), %move = $gettok(%x,3,58) | moverem $nick %pk %move | wlog user $nick %pk $+ 's %move was removed by npc Nicolas. | msg =$nick $chr(160) $cc $+ Nicolas $ct $+ - Pronto! $nick $+ , volte sempre! | return }
      elseif ($gettok(%x,1,58) == RLN) {
        unset %confirm. [ $+ [ $nick ] ]
        var %pk = $dados($nick,Team,1), %npc = $gettok(%x,2,58), %learn = $dados($nick,%pk,Learn), %lv = $dados($nick,%pk,Level), %x = 0 | while (%x < 4) { inc %x | if ($dados($nick,%pk,Move $+ %x)) { if (%move) { var %move = %move $+ : $+ $dados($nick,%pk,Move $+ %x) } | else { var %move = $dados($nick,%pk,Move $+ %x) } } }
        var %moves = $read(pkp\moveset.txt,s,%pk), %y = 1
        while ($gettok(%moves,%y,44)) {
          var %t = $gettok(%moves,%y,44), %t2 = $gettok(%t,-1,32), %t = $move($nullfill($remove(%t,$chr(32) $+ %t2)))
          if (%t2 <= %lv) && (!$findtok(%learn,%t,0,58)) && (!$findtok(%move,%t,0,58)) { var %r = $addtok(%r,%t,58) }
          inc %y
        }
        if (%r) {
          if ($gettok(%r,0,58) > 1) { msg =$nick $chr(160) $cc $+ %npc $ct $+ - $cc $+ %pk $ct $+ pode aprender os seguintes ataques: $separecom(%r,ou,58,$cc,$ct) $+ $ct $+ . | msg =$nick $ct $+ Digite o nome do ataque escolhido para o aprendizado. | set %relearn. [ $+ [ $nick ] ] %npc $+ ; $+ %r }
          else { msg =$nick $chr(160) $cc $+ %npc $ct $+ - $cc $+ %pk $ct $+ pode aprender apenas um ataque: $cc $+ %r $+ $ct $+ . E ent�o? Deseja realmente que o pok�mon reaprenda o golpe $cc $+ %r $ct $+ por um pre�o simb�lico de $cc $+ $chr(36) $+ $getmoney($readini(pkp\status.ini,Active,Relearn)) $+ $ct $+ ? | set %confirm. [ $+ [ $nick ] ] RL2: $+ %npc $+ : $+ %r }
        }
        else { msg =$nick $chr(160) $cc $+ %npc $ct $+ - Sinto muito, mas $cc $+ %pk $ct $+ n�o tem ataques a serem reaprendidos. Verifique os ataques que seu pok�mon j� pode aprender. }
        return
      }
      elseif ($gettok(%x,1,58) == RL2) {
        unset %confirm. [ $+ [ $nick ] ]
        var %npc = $gettok(%x,2,58), %m = $gettok(%x,3,58), %pk = $dados($nick,Team,1), %price = $readini(pkp\status.ini,Active,Relearn)
        if ($dados($nick,Info,Money) < %price) { msg =$nick $chr(160) $cc $+ %npc $ct $+ - Hm, voc� n�o tem dinheiro suficiente. Volte quando tiver. | return } | writeini pkp\cadastros\ $+ $nick $+ .ini Info Money $calc($dados($nick,Info,Money) - %price)
        var %x = 0 | while (%x < 4) { inc %x | if ($dados($nick,%pk,Move $+ %x)) { if (%move) { var %move = %move $+ : $+ $dados($nick,%pk,Move $+ %x) } | else { var %move = $dados($nick,%pk,Move $+ %x) } } }
        if ($gettok(%move,0,58) == 4) { var %l = $dados($nick,%pk,Learn) | if (%l) { writeini pkp\cadastros\ $+ $nick $+ .ini %pk Learn %l $+ : $+ %m } | else { writeini pkp\cadastros\ $+ $nick $+ .ini %pk Learn %m } | msg =$nick $chr(160) $cc $+ %npc $ct $+ - Est� feito, seu pok�mon j� est� apto a aprender o golpe $cc $+ %m $+ $ct $+ . | wlog user $nick %pk can learn %m $+ , tought by %npc $+ . }
        else { addmove $nick %pk %m | msg =$nick $chr(160) $cc $+ %npc $ct $+ - Pronto, est� feito. $cc $+ %pk $ct $+ aprendeu o golpe $cc $+ %m $+ $ct $+ . | wlog user $nick %pk relearned %m with %npc $+ . }
        return
      }
      elseif ($gettok(%x,1,58) == ESQ) {
        unset %confirm. [ $+ [ $nick ] ]
        if ($gettok(%x,2,58) == 1) { set %esqueci. [ $+ [ $nick ] ] 0�0 | msg =$nick $ct $+ Digite sua $cc $+ pergunta secreta $+ $ct $+ . | return }
        elseif ($gettok(%x,2,58) == 2) { remini pkp\cadastros\ $+ $nick $+ .ini Info Recover | msg =$nick $ct $+ Voc� $cc $+ apagou $ct $+ o registro de sua $cc $+ pergunta secreta $+ $ct $+ . Este servi�o est� agora $cc $+ indispon�vel $+ $ct $+ . | return }
      }
      elseif ($gettok(%x,1,58) == JSM) {
        unset %confirm. [ $+ [ $nick ] ]
        if ($gettok(%x,2,58) == 1) { item.rem $nick MooMoo Milk | msg =$nick $chr(160) $cc $+ Jasmine $ct $+ - Muito, muito obrigada mesmo! Meu pok�mon parece melhor agora. Voltarei ao gin�sio e aguardarei seu desafio. Hahaha, est� preparado? }
        elseif ($gettok(%x,2,58) == 2) { item.rem $nick Rare Potion | msg =$nick $chr(160) $cc $+ Jasmine $ct $+ - Obrigada, muito obrigada! Meu pok�mon j� est� melhorando de sua doen�a, isso � �timo! Gra�as a sua ajuda ele estar� pronto para a nossa batalha no gin�sio! Hahaha, est� preparado? }
        writeini pkp\cadastros\ $+ $nick $+ .ini Quests Jasmine Ok | return
      }
      elseif ($gettok(%x,1,58) == DNC) {
        unset %confirm. [ $+ [ $nick ] ]
        wlog user $nick Started a DANCING Challenge. | writeini pkp\cadastros\ $+ $nick $+ .ini Clock Dancing $dados($nick,Info,Online)
        set %battle. [ $+ [ $nick ] ] $randtok(1305:1306:1307:1308:1309,58) $+ :1310;1;DANCE
        var %adv = $gettok($gettok(%battle. [ $+ [ $nick ] ],1,59),1,58) | battle.npc $nick %adv | sset [ [ B. ] $+ [ $checknickid($nick).id ] $+ [ .Quest ] ] DANCE
      }
      elseif ($gettok(%x,1,58) == CUT) {
        unset %confirm. [ $+ [ $nick ] ]
        var %price = $gettok(%x,2,58), %pk = $dados($nick,Team,1)
        var %loyalty = $dados($nick,%pk,Loyalty), %qnt = $gettok(%loyalty,2,58), %loyalty = $gettok(%loyalty,1,58)
        var %a = $rand(2,10), %b = $rand(0,4), %c = $calc((6 + %a) * $iif(%b,1,-1))
        if (%b) { if (%a < 5) { var %state = Ficou bem interessante, acho que seu pok�mon tamb�m gostou. } | elseif (%a > 8) { var %state = Nossa, eu realmente me inspirei desta vez! Ficou divino! } | else { var %state = Eu diria que seu pok�mon simplesmente adorou seu novo visual! } }
        else { if (%a < 5) { var %state = Hum, talvez n�o ficou como eu esperava... Desculpe! } | elseif (%a > 8) { var %state = Nossa, eu fiquei totalmente fora de mim! N�o acredito que deixei isso acontecer! Coitado do pok�mon, perdoe-me... } | else { var %state = Nossa, definitivamente n�o era como eu esperava. Seu pok�mon n�o gostou disso e nem eu, pessoalmente. Sinto muito. } }
        if ($dados($nick,Info,Money) < %price) { msg =$nick $chr(160) $cc $+ Warren $ct $+ - Sem dinheiro, nada feito! Afinal, eu preciso pagar minhas contas tamb�m! }
        else {
          var %loyalty = $calc(%loyalty + %qnt + %c)
          if (%loyalty < 0) { var %loyalty = 0 } | elseif (%loyalty > 255) { var %loyalty = 255 }
          writeini pkp\cadastros\ $+ $nick $+ .ini %pk Loyalty %loyalty
          writeini pkp\cadastros\ $+ $nick $+ .ini Info Money $calc($dados($nick,Info,Money) - %price)
          writeini pkp\cadastros\ $+ $nick $+ .ini Clock Haircut $dados($nick,Info,Online)
          msg =$nick $chr(160) $cc $+ Warren $ct $+ - Aqui est�, $cc $+ %pk $+ $ct $+ ! %state
        }
        return
      }
      elseif ($gettok(%x,1,58) == MILK) {
        unset %confirm. [ $+ [ $nick ] ]
        var %price = $gettok(%x,2,58)
        if ($dados($nick,Info,Money) < %price) { msg =$nick $chr(160) $cc $+ Nelson $ct $+ - Voc� n�o tem dinheiro suficiente... � uma pena, at� mais! | return }
        else {
          writeini pkp\cadastros\ $+ $nick $+ .ini Info Money $calc($dados($nick,Info,Money) - %price)
          msg =$nick $chr(160) $cc $+ Nelson $ct $+ - Aqui est�, seu $cc $+ MooMoo Milk $+ $ct $+ . Aproveite! | item.add $nick MooMoo Milk
        }
        return
      }
      elseif ($gettok(%x,1,58) == CAD) { var %file = PkP\Del.txt | write %file $dados($nick,Info,Nick) $+ : $getip($nick) $date $time | msg =$nick $ct $+ Sua solicita��o de descadastramento foi enviada. Aguarde pela confirma��o de um moderador. | wlog user $nick Sent request to remove register. | unset %confirm. [ $+ [ $nick ] ] | return }
      elseif ($gettok(%x,1,58) == NICK) { var %file = PkP\Newnick.txt | write %file $dados($nick,Info,Nick) $+ : $gettok(%x,2,58) $date $time | msg =$nick $ct $+ Sua solicita��o de altera��o de nick para $cc $+ $gettok(%x,2,58) $ct $+ foi enviada. Aguarde pela confirma��o de um moderador. | wlog user $nick Sent request to change nickname. | unset %confirm. [ $+ [ $nick ] ] | return }
      elseif ($gettok(%x,1,58) == BRN) {
        writeini pkp\cadastros\ $+ $gettok(%x,2,58) $+ .ini Rental Brain $dados($nick,Info,Nick)
        writeini pkp\cadastros\ $+ $nick $+ .ini Rental Team $gettok($readini(pkp\status.ini,Active,Brain),2,58)
        set %rental. [ $+ [ $nick ] ] BRAIN | msg =$nick $ct $+ Muito bem, voc� assumir� o controle da batalha. Fique atento! Para ver suas informa��es no $cc $+ Battle Rental $+ $ct $+ , digite ' $+ $cc $+ .dados $+ $ct $+ '. | unset %confirm. [ $+ [ $nick ] ] | return
      }
    }
    elseif ($1 == .Nao) || ($1 == .N�o) {
      var %x = %confirm. [ $+ [ $nick ] ] | if (!%x) { msg =$nick $ct $+ N�o h� solicita��o de confirma��o em andamento. | return }
      if ($gettok(%x,1,58) == RLS) { .msg =$nick $ct $+ Seu pedido foi cancelado. | unset %confirm. [ $+ [ $nick ] ] | .timerRLS [ $+ [ $nick ] ] off | return }
      elseif ($gettok(%x,1,58) == BAT) { msg =$nick $ct $+ Pedido de batalha rejeitado! | msg = [ $+ [ $v([ [ B. ] $+ [ $gettok(%x,2,58) ] $+ [ .Player.2 ] ]) ] ] $cc $+ $nick $ct $+ rejeitou o seu pedido. | b.left $gettok(%x,2,58) | unset %confirm. [ $+ [ $nick ] ] | return }
      elseif ($gettok(%x,1,58) == SHP) { unset %confirm. [ $+ [ $nick ] ] | msg =$nick $ct $+ Voc� n�o aceitou entrar no navio. | return }
      elseif ($gettok(%x,1,58) == THM) { msg =$nick $chr(160) $cc $+ Thomas $ct $+ - Que pena... Mas estou certo de que faremos neg�cios em breve. At� l�! | unset %confirm. [ $+ [ $nick ] ] | return }
      elseif ($gettok(%x,1,58) == THS) { msg =$nick $chr(160) $cc $+ Thomas $ct $+ - Logo quando eu pensei que far�amos neg�cio... Tudo bem, nos vemos depois! | unset %confirm. [ $+ [ $nick ] ] | return }
      elseif ($gettok(%x,1,58) == NCL) { msg =$nick $chr(160) $cc $+ Nicolas $ct $+ - Tudo bem. Volte sempre que precisar! | unset %confirm. [ $+ [ $nick ] ] | return }
      elseif ($gettok(%x,1,58) == NC2) { msg =$nick $chr(160) $cc $+ Nicolas $ct $+ - Est� certo... Volte sempre! | unset %confirm. [ $+ [ $nick ] ] | return }
      elseif ($gettok(%x,1,58) == WRT) { msg =$nick $chr(160) $cc $+ Writney $ct $+ - Tudo bem. Me procure quando precisar! | unset %confirm. [ $+ [ $nick ] ] | return }
      elseif ($gettok(%x,1,58) == GYM) { msg =$nick $chr(160) $cc $+ Juiz $ct $+ - Quer um tempo para se preparar? S�bia escolha. Volte quando estiver pronto. | unset %confirm. [ $+ [ $nick ] ] | return }
      elseif ($gettok(%x,1,58) == LEA) {
        msg =$nick $chr(160) $cc $+ Juiz $ct $+ - Muito bem. Mas volte quando estiver pronto. | unset %confirm. [ $+ [ $nick ] ] | if (%active.league == $nick) { var %control = $readini(pkp\status.ini,Active,Control) | if (%confirm. [ $+ [ %control ] ]) { unset %confirm. [ $+ [ %control ] ] | if ($checknick(%control) == Ok!) { msg $+(=,%control) $ct $+ O desafio de $cc $+ %active.league $ct $+ foi cancelado. } } | unset %active.league }
        return
      }
      elseif ($gettok(%x,1,58) == LG2) {
        msg =$nick $chr(160) $cc $+ Juiz $ct $+ - Desistiu? Isso n�o � bom... Mas volte quando estiver pronto. | unset %confirm. [ $+ [ $nick ] ] | unset %league. [ $+ [ $nick ] ]
        return
      }
      elseif ($gettok(%x,1,58) == NXT) { msg =$nick $ct $+ Seu desafio de gin�sio foi cancelado. | unset %confirm. [ $+ [ $nick ] ] | unset %gym. [ $+ [ $nick ] ] | return }
      elseif ($gettok(%x,1,58) == COIN) { var %npc = $gettok(%x,2,58) | msg =$nick $chr(160) $cc $+ %npc $ct $+ - Tudo bem. Volte sempre! | unset %confirm. [ $+ [ $nick ] ] | return }
      elseif ($gettok(%x,1,58) == DNC) { msg =$nick $chr(160) $cc $+ Nancy $ct $+ - Como n�o? Prometo que n�o se arrepender�! | unset %confirm. [ $+ [ $nick ] ] | return }
      elseif ($gettok(%x,1,58) == CNT) { msg =$nick $ct $+ Voc� n�o ser� o combatente da �ltima batalha. | unset %confirm. [ $+ [ $nick ] ] | return }
      elseif ($gettok(%x,1,58) == AQU) {
        if ($gettok(%x,2,58) == 1) { msg =$nick $chr(160) $cc $+ Stern $ct $+ - Ahhh! Estou perdido! }
        elseif ($gettok(%x,2,58) == 2) { msg =$nick $chr(160) $cc $+ Prof Will $ct $+ - Meu pok�mon!! }
        elseif ($gettok(%x,2,58) == 3) { msg =$nick $ct $+ Voc� saiu do $cc $+ Aqua Hideout $+ $ct $+ . }
        elseif ($gettok(%x,2,58) == 4) { msg =$nick $ct $+ Voc� desistiu de batalhar com a Equipe Aqua. }
        unset %confirm. [ $+ [ $nick ] ] | return
      }
      elseif ($gettok(%x,1,58) == MGM) {
        if ($gettok(%x,2,58) == 1) { msg =$nick $chr(160) $cc $+ Archie $ct $+ - $nick $+ , preciso de sua ajuda, eles querem fazer o Mt Chimney entrar em erup��o! }
        elseif ($gettok(%x,2,58) == 2) { msg =$nick $ct $+ Voc� saiu do $cc $+ Magma Hideout $+ $ct $+ . }
        elseif ($gettok(%x,2,58) == 3) { msg =$nick $chr(160) $cc $+ Steven $ct $+ - Vamos, $nick $+ ! Eles s� podem estar ficando loucos! }
        unset %confirm. [ $+ [ $nick ] ] | return
      }
      elseif ($gettok(%x,1,58) == RKT) {
        if ($gettok(%x,2,58) == 1) {
          msg =$nick $chr(160) $cc $+ Track $ct $+ (ROCKET) - Saia daqui! | writeini pkp\cadastros\ $+ $nick $+ .ini Info Locate Pewter City | remini pkp\cadastros\ $+ $nick $+ .ini Time Goto
          msg =$nick $ct $+ Voc� foi expulso do $cc $+ Mt Moon $+ $ct $+ . Bem vindo a $cc $+ Pewter City $+ $ct $+ .
        }
        if ($gettok(%x,2,58) == 2) { msg =$nick $ct $+ Voc� fugiu do $cc $+ Rocket Hideout $+ $ct $+ . }
        if ($gettok(%x,2,58) == 3) { msg =$nick $ct $+ Voc� fugiu da $cc $+ Silph Corporation $+ $ct $+ . }
        if ($gettok(%x,2,58) == 4) { msg =$nick $ct $+ Voc� fugiu da $cc $+ Sprout Tower $+ $ct $+ . }
        if ($gettok(%x,2,58) == 5) { msg =$nick $ct $+ Voc� fugiu do $cc $+ Rocket Hideout $+ $ct $+ . }
        if ($gettok(%x,2,58) == 6) { msg =$nick $ct $+ Voc� fugiu da $cc $+ Radio Tower $+ $ct $+ . }
        if ($gettok(%x,2,58) == 7) { msg =$nick $ct $+ Voc� fugiu da equipe $cc $+ Rocket $+ $ct $+ . }
        if ($gettok(%x,2,58) == 8) { msg =$nick $ct $+ Voc� fugiu da equipe $cc $+ Rocket $+ $ct $+ . }
        unset %confirm. [ $+ [ $nick ] ] | return
      }
      elseif ($gettok(%x,1,58) == RLN) { msg =$nick $chr(160) $cc $+ $gettok(%x,2,58) $ct $+ - Se n�o quiser meus servi�os, tudo bem. Afinal, n�o iria oferec�-los de gra�a... | unset %confirm. [ $+ [ $nick ] ] }
      elseif ($gettok(%x,1,58) == RL2) { msg =$nick $chr(160) $cc $+ $gettok(%x,2,58) $ct $+ - Bem, quando precisar de meus servi�os, avise ent�o. | unset %confirm. [ $+ [ $nick ] ] }
      elseif ($gettok(%x,1,58) == FUJ) { msg =$nick $ct $+ � melhor n�o mexer com esses encrenqueiros mesmo... | unset %confirm. [ $+ [ $nick ] ] }
      elseif ($gettok(%x,1,58) == DOJ) { msg =$nick $chr(160) $cc $+ Koichi $ct $+ - Muito bem, volte quando achar que est� pronto, afinal n�o haver� uma segunda chance. | unset %confirm. [ $+ [ $nick ] ] }
      elseif ($gettok(%x,1,58) == MAY) { if ($gettok(%x,2,58) == 1) { msg =$nick $chr(160) $cc $+ May $ct $+ - Est� certo! Mas n�o saia desta cidade antes de batalhar comigo, certo? Tchau! } | elseif ($gettok(%x,2,58) == 1) { msg =$nick $chr(160) $cc $+ May $ct $+ - Logo quando estava anciosa... Mas quando estiver pronto, me procure, ok? } | unset %confirm. [ $+ [ $nick ] ] | return }
      elseif ($gettok(%x,1,58) == HLN) { msg =$nick $chr(160) $cc $+ Helen $ct $+ - Realmente, melhor voc� se preparar. Eu vou avisando que n�o ser� f�cil a sua vit�ria nesta batalha! | unset %confirm. [ $+ [ $nick ] ] | return }
      elseif ($gettok(%x,1,58) == CLK) {
        var %adv = $gettok(%x,2,58) | if (%adv isnum) { var %n = $int($calc(%adv / 100)) $+ 00, %name = $rini(npc,%n,%adv,Name) } | else { var %name = %adv }
        if (%name == Wally) { msg =$nick $chr(160) $cc $+ Wally $ct $+ - Est� certo! Mas estarei esperando seu desafio aqui! }
        elseif (%name == May) { msg =$nick $chr(160) $cc $+ May $ct $+ - Tudo bem, eu sou paciente... Podemos ir agora?! }
        elseif (%name == Steven) { msg =$nick $chr(160) $cc $+ Steven $ct $+ - Muito bem, mas se ver alguma pedra rara por favor entre em contato! }
        elseif (%name == Brendan) { msg =$nick $chr(160) $cc $+ Brendan $ct $+ - Desculpe se n�o consigo controlar minha ansiedade, mas quero que saiba que para mim � uma honra t�-lo como advers�rio! }
        unset %confirm. [ $+ [ $nick ] ] | return
      }
      elseif ($gettok(%x,1,58) == NXQ) {
        if ($gettok(%battle. [ $+ [ $nick ] ],3,59) == ROCKET1) {
          msg =$nick $chr(160) $cc $+ Track $ct $+ (ROCKET) - Saia daqui! | writeini pkp\cadastros\ $+ $nick $+ .ini Info Locate Pewter City | remini pkp\cadastros\ $+ $nick $+ .ini Time Goto
          msg =$nick $ct $+ Voc� foi expulso do $cc $+ Mt Moon $+ $ct $+ . Bem vindo a $cc $+ Pewter City $+ $ct $+ .
        }
        if ($gettok(%battle. [ $+ [ $nick ] ],3,59) == ROCKET2) { msg =$nick $chr(160) $ct $+ Voc� fugiu do $cc $+ Rocket Hideout $+ $ct $+ . }
        if ($gettok(%battle. [ $+ [ $nick ] ],3,59) == ROCKET3) { msg =$nick $chr(160) $ct $+ Voc� fugiu da $cc $+ Silph Corporation $+ $ct $+ . }
        if ($gettok(%battle. [ $+ [ $nick ] ],3,59) == ROCKET4) { msg =$nick $chr(160) $ct $+ Voc� fugiu da $cc $+ Sprout Tower $+ $ct $+ . }
        if ($gettok(%battle. [ $+ [ $nick ] ],3,59) == ROCKET5) {
          var %m = $dados($nick,Info,Money), %r = 5000 | if (%m < %r) { var %r = %m } | var %m = $calc(%m - %r) | if (%r) { writeini pkp\cadastros\ $+ $nick $+ .ini Info Money %m }
          msg =$nick $ct $+ Voc� fugiu do $cc $+ Rocket Hideout $+ $ct $+ . $iif(%r,Voc� foi roubado e perdeu $cc $+ $chr(36) $+ $getmoney(%r) $+ $ct $+ .)
        }
        if ($gettok(%battle. [ $+ [ $nick ] ],3,59) == ROCKET6) {
          var %m = $dados($nick,Info,Money), %r = 10000 | if (%m < %r) { var %r = %m } | var %m = $calc(%m - %r) | if (%r) { writeini pkp\cadastros\ $+ $nick $+ .ini Info Money %m }
          msg =$nick $ct $+ Voc� fugiu da $cc $+ Radio Tower $+ $ct $+ . $iif(%r,Voc� foi roubado e perdeu $cc $+ $chr(36) $+ $getmoney(%r) $+ $ct $+ .)
        }
        if ($gettok(%battle. [ $+ [ $nick ] ],3,59) == ROCKET7) {
          var %m = $dados($nick,Info,Money), %r = 15000 | if (%m < %r) { var %r = %m } | var %m = $calc(%m - %r) | if (%r) { writeini pkp\cadastros\ $+ $nick $+ .ini Info Money %m }
          msg =$nick $ct $+ Voc� fugiu da equipe $cc $+ Rocket $+ $ct $+ . $iif(%r,Voc� foi roubado e perdeu $cc $+ $chr(36) $+ $getmoney(%r) $+ $ct $+ .)
        }
        if ($gettok(%battle. [ $+ [ $nick ] ],3,59) == ROCKET8) {
          var %m = $dados($nick,Info,Money), %r = 15000 | if (%m < %r) { var %r = %m } | var %m = $calc(%m - %r) | if (%r) { writeini pkp\cadastros\ $+ $nick $+ .ini Info Money %m }
          msg =$nick $ct $+ Voc� fugiu da equipe $cc $+ Rocket $+ $ct $+ . $iif(%r,Voc� foi roubado e perdeu $cc $+ $chr(36) $+ $getmoney(%r) $+ $ct $+ .)
        }
        if ($gettok(%battle. [ $+ [ $nick ] ],3,59) == AQUA1) { msg =$nick $chr(160) $cc $+ Stern $ct $+ - Ahhh! Estou perdido! }
        if ($gettok(%battle. [ $+ [ $nick ] ],3,59) == AQUA2) { msg =$nick $chr(160) $cc $+ Prof Will $ct $+ - Ei! N�o os deixe levar meu pok�mon! Fa�a alguma coisa! }
        if ($gettok(%battle. [ $+ [ $nick ] ],3,59) == AQUA3) { msg =$nick $ct $+ Voc� saiu do $cc $+ Aqua Hideout $+ $ct $+ . }
        if ($gettok(%battle. [ $+ [ $nick ] ],3,59) == AQUA4) { msg =$nick $ct $+ Voc� desistiu de batalhar com a Equipe Aqua. }
        if ($gettok(%battle. [ $+ [ $nick ] ],3,59) == MAGMA1) { msg =$nick $chr(160) $cc $+ Archie $ct $+ - $nick $+ , preciso de sua ajuda, eles querem fazer o Mt Chimney entrar em erup��o! }
        if ($gettok(%battle. [ $+ [ $nick ] ],3,59) == MAGMA2) { msg =$nick $ct $+ Voc� saiu do $cc $+ Magma Hideout $+ $ct $+ . }
        if ($gettok(%battle. [ $+ [ $nick ] ],3,59) == MAGMA3) { msg =$nick $chr(160) $cc $+ Steven $ct $+ - Vamos, $nick $+ ! Eles s� podem estar ficando loucos! }
        if ($gettok(%battle. [ $+ [ $nick ] ],3,59) == FUJI) { msg =$nick $ct $+ Voc� desistiu de batalhar contra os membros da equipe $cc $+ Rocket $+ $ct $+ . }
        unset %confirm. [ $+ [ $nick ] ] | unset %battle. [ $+ [ $nick ] ]
        return
      }
      elseif ($gettok(%x,1,58) == SVR) {
        var %oitem = $gettok(%x,2,58)
        msg =$nick $chr(160) $cc $+ Silver $ct $+ - Conformarei-me com meu $cc $+ %oitem $ct $+ mesmo. Preciso ir agora, capturar um pok�mon...
        if (%oitem == Silver Feather) { var %team = 1434 } | else { var %team = 1435 }
        writeini pkp\cadastros\ $+ $nick $+ .ini Quests Silver %team
        unset %confirm. [ $+ [ $nick ] ]
        return
      }
      elseif ($gettok(%x,1,58) == FEA) {
        msg =$nick $ct $+ Voc� desistiu de usar o item $cc $+ $gettok(%x,2,58) Feather $+ $ct $+ .
        var %l = $dados($nick,Info,Locate), %d = $dados($nick,Info,LastLocate)
        if ($gotoplace($nick,%l,%d) == Ok!) {
          var %d = $gotoplace($nick,%l,%d).get | if ($gettok(%d,2,35)) { writeini pkp\cadastros\ $+ $nick $+ .ini Info Path $gettok(%d,2,35) } | elseif ($dados($nick,Info,Path)) { remini pkp\cadastros\ $+ $nick $+ .ini Info Path } | var %d = $gettok(%d,1,35)
          msg =$nick $ct $+ Voc� saiu de $cc $+ $rini(cadastros,$nick,Info,Locate) $+ $ct $+ . Bem vindo a $cc $+ %d $+ $ct $+ .
          wlog user $nick Arrived at %d successfully.
          writeini pkp\cadastros\ $+ $nick $+ .ini Info Locate %d | writeini pkp\cadastros\ $+ $nick $+ .ini Info LastLocate %l | writeini pkp\cadastros\ $+ $nick $+ .ini Time Goto $date $time
          place.events
        }
        unset %confirm. [ $+ [ $nick ] ]
        return
      }
      elseif ($gettok(%x,1,58) == BRD) { var %n = $gettok(%x,2,58) | if ($gettok(%stand. [ $+ [ %n ] ],1,58) == Daycare_wait) { msg = [ $+ [ %n ] ] $ct $+ Seu pedido de $cc $+ cruzamento $ct $+ foi recusado por $cc $+ $rini(cadastros,$nick,Info,Nick) $+ $ct $+ . | unset %stand. [ $+ [ %n ] ] } | msg =$nick $ct $+ Voc� recusou a solicita��o de cruzamento. Seu modo de $cc $+ espera $ct $+ ainda est� $cc $+ ativado $+ $ct $+ . | unset %confirm. [ $+ [ $nick ] ] | set %stand. [ $+ [ $nick ] ] Daycare | return }
      elseif ($gettok(%x,1,58) == TRD) { var %n = $gettok(%x,2,58) | if ($gettok(%stand. [ $+ [ %n ] ],1,58) == Trade_wait) { msg = [ $+ [ %n ] ] $ct $+ A $cc $+ troca $ct $+ de pok�mon foi cancelada por $cc $+ $dados($nick,Info,Nick) $+ $ct $+ . | unset %stand. [ $+ [ %n ] ] } | msg =$nick $ct $+ Voc� cancelou a $cc $+ troca $ct $+ de pok�mon. Seu modo de $cc $+ espera $ct $+ ainda est� $cc $+ ativado $+ $ct $+ . | unset %confirm. [ $+ [ $nick ] ] | set %stand. [ $+ [ $nick ] ] Trade | return }
      elseif ($gettok(%x,1,58) == TR2) { var %n = $gettok(%x,2,58) | if ($gettok(%stand. [ $+ [ %n ] ],1,58) == Trade_wait) { msg = [ $+ [ %n ] ] $ct $+ A $cc $+ troca $ct $+ de pok�mon foi cancelada por $cc $+ $dados($nick,Info,Nick) $+ $ct $+ . Seu modo de $cc $+ espera $ct $+ ainda est� $cc $+ ativado $+ $ct $+ . | set %stand. [ $+ [ %n ] ] Trade } | msg =$nick $ct $+ Voc� cancelou a $cc $+ troca $ct $+ de pok�mon. | unset %confirm. [ $+ [ $nick ] ] | return }
      elseif ($gettok(%x,1,58) == RYD) { msg =$nick $chr(160) $cc $+ Rydel $ct $+ - Oh, est� certo. | unset %confirm. [ $+ [ $nick ] ] | return }
      elseif ($gettok(%x,1,58) == TNT) { msg =$nick $ct $+ Volte sempre � $cc $+ Battle Tent $+ $ct $+ . | unset %confirm. [ $+ [ $nick ] ] | return }
      elseif ($gettok(%x,1,58) == JSM) { unset %confirm. [ $+ [ $nick ] ] | msg =$nick $chr(160) $cc $+ Jasmine $ct $+ - � uma pena... Preciso cuidar do meu pok�mon at� ele melhorar... N�o podemos batalhar no gin�sio agora! | return }
      elseif ($gettok(%x,1,58) == CUT) { unset %confirm. [ $+ [ $nick ] ] | msg =$nick $chr(160) $cc $+ Warren $ct $+ - Tudo bem, volte outra hora quando quiser. | return }
      elseif ($gettok(%x,1,58) == MILK) { unset %confirm. [ $+ [ $nick ] ] | msg =$nick $chr(160) $cc $+ Nelson $ct $+ - Tudo bem, volte sempre! | return }
      elseif ($gettok(%x,1,58) == SFR) {
        var %n = $gettok(%x,2,58), %m = $iif($rini(cadastros,$nick,Info,Premium),6,3), %id = $checknickid($nick).ID
        if ($calc(%n + 1) <= %m) {
          battle.wild $nick $dados($nick,Team,1) qz
          return
        }
        else { msg =$nick $ct $+ Seu safari foi finalizado. Voc� n�o pode procurar mais do que $cc $+ $numero(%m) $ct $+ pok�mon na $cc $+ Safari Zone $ct $+ diariamente. | remini pkp\cadastros\ $+ $nick $+ .ini $v(B. $+ %ID $+ .Poke.2) | b.remove.fila $nick | uset [ [ B. ] $+ [ %ID ] $+ [ * ] ] | unset %confirm. [ $+ [ $nick ] ] | return }
      }
      elseif ($gettok(%x,1,58) == ESQ) {
        unset %confirm. [ $+ [ $nick ] ]
        if ($gettok(%x,2,58) == 1) { if ($rini(cadastros,$nick,Info,Recover)) { set %confirm. [ $+ [ $nick ] ] ESQ:2 | msg =$nick $ct $+ Deseja desativar a sua pergunta secreta? | msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar. } | else { msg =$nick $ct $+ Seu assistente foi finalizado. } | return }
        elseif ($gettok(%x,2,58) == 2) { msg =$nick $ct $+ Seu assistente foi finalizado. | return }
      }
      elseif ($gettok(%x,1,58) == CAD) { unset %confirm. [ $+ [ $nick ] ] | msg =$nick $ct $+ Sua solicita��o foi cancelada com sucesso. | return }
      elseif ($gettok(%x,1,58) == NICK) { unset %confirm. [ $+ [ $nick ] ] | msg =$nick $ct $+ Sua solicita��o foi cancelada com sucesso. | return }
      elseif ($gettok(%x,1,58) == BRN) {
        remini pkp\cadastros\ $+ $gettok(%x,2,58) $+ .ini Rental Brain
        writeini pkp\cadastros\ $+ $gettok(%x,2,58) $+ .ini Rental Auto ON
        writeini pkp\cadastros\ $+ $nick $+ .ini Rental Team $gettok($readini(pkp\status.ini,Active,Brain),2,58)
        msg =$nick $ct $+ Voc� $cc $+ n�o $ct $+ assumir� o controle da batalha. | unset %confirm. [ $+ [ $nick ] ] | return
      }
    }
    elseif ($1 == .Market) {
      if (!$findtok($readini(pkp\status.ini,$dados($nick,Info,Region),Market),$dados($nick,Info,Locate),0,58)) { msg =$nick $ct $+ N�o h� $cc $+ market $ct $+ em sua cidade atual. | return }
      if ($checknickid($nick) == Ok!) { msg =$nick $ct $+ Voc� n�o pode entrar no $cc $+ market $ct $+ enquanto batalha. | return }
      if ($v(Watch. [ $+ [ $nick ] ])) { msg =$nick $ct $+ Voc� n�o pode entrar no $cc $+ market $ct $+ enquanto assiste a batalhas. Para parar de assisti-la, digite ' $+ $cc $+ .Assistir $+ $ct $+ '. | return }
      if (%confirm. [ $+ [ $nick ] ]) { msg =$nick $ct $+ Antes de entrar no $cc $+ market $ct $+ , digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar o �ltimo pedido. | return }
      if (%stand. [ $+ [ $nick ] ]) { unset %stand. [ $+ [ $nick ] ] }
      cmd.Market $1- | return
    }
    elseif ($1 == .Daycare) {
      if (!$findtok(Mauville City:Goldenrod City,$dados($nick,Info,Locate),0,58)) { msg =$nick $ct $+ Na sua cidade atual n�o h� um $cc $+ Daycare Center $+ $ct $+ . | return }
      if ($checknickid($nick) == Ok!) { msg =$nick $ct $+ Voc� n�o pode ir ao $cc $+ Daycare Center $ct $+ enquanto batalha. | return }
      if ($v(Watch. [ $+ [ $nick ] ])) { msg =$nick $ct $+ Voc� est� assistindo a batalha de ID $cc $+ $v(Watch. [ $+ [ $nick ] ]) $+ $ct $+ . Para parar de assisti-la, digite ' $+ $cc $+ .Assistir $+ $ct $+ '. | return }
      if (%confirm. [ $+ [ $nick ] ]) { msg =$nick $ct $+ Antes de entrar acessar o $cc $+ Daycare $+ $ct $+ , digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar o �ltimo pedido. | return }
      if ($2) {
        if ($rini(cadastros,$nick,Team,3)) { msg =$nick $ct $+ Para fazer o cruzamento de seus pok�mon, deixe apenas $cc $+ dois $ct $+ no seu time. Ou ainda, deixe apenas $cc $+ um $ct $+ no time, e efetue um cruzamento com o pok�mon de outro treinador. | return }
        if ($teampos($nick,Egg)) { msg =$nick $ct $+ Voc� n�o pode utilizar $cc $+ Eggs $ct $+ em cruzamentos. | return }
        var %r = $calc($ctime($date $time) - $ctime($rini(cadastros,$nick,Time,Daycare))), %price = $readini(pkp\status.ini,Active,Daycare) | if (%r < 86400) { msg =$nick $ct $+ Voc� j� efetuou um cruzamento em menos de $cc $+ 24 $ct $+ horas atr�s. Aguarde $dur($calc(86400 - %r),$ct,$cc) para tentar novamente. | return }
        if ($dados($nick,Info,Premium)) { var %price = $int($calc(%price / 2)) }
        if ($2 == stand) {
          var %x = %stand. [ $+ [ $nick ] ]
          if (%x == Daycare) { unset %stand. [ $+ [ $nick ] ] | msg =$nick $ct $+ Voc� desativou o modo de espera para o $cc $+ Daycare Center $+ $ct $+ . | return }
          elseif (%x) {
            if ($gettok(%x,1,58) == Daycare_wait) { var %n = $gettok(%x,2,58) | unset %confirm. [ $+ [ %n ] ] | unset %stand. [ $+ [ $nick ] ] | msg = [ $+ [ %n ] ] $ct $+ A solicita��o de cruzamento de $cc $+ $nick $ct $+ foi cancelada. | msg =$nick $ct $+ Voc� desativou seu $cc $+ modo de espera $ct $+ para o $cc $+ Daycare Center $+ $ct $+ . | return }
            else { msg =$nick $ct $+ Seu modo de espera j� est� $cc $+ ativado $ct $+ em outra fun��o. | return }
          }
          else {
            if ($rini(cadastros,$nick,Team,2)) { msg =$nick $ct $+ Para ativar o modo de espera, deixe apenas o $cc $+ pok�mon $ct $+ que voc� deseja $cc $+ cruzar $ct $+ no time. | return }
            if ($rini(cadastros,$nick,$rini(cadastros,$nick,Team,1),ID) != $nick) { msg =$nick $ct $+ O pok�mon selecionado n�o pode ser cruzado. Apenas o treinador original poder� faz�-lo. | return }
            if ($rini(cadastros,$nick,Info,Money) < 5000) { msg =$nick $ct $+ Voc� n�o tem dinheiro suficiente para um cruzamento! | return }
            set %stand. [ $+ [ $nick ] ] Daycare | msg =$nick $ct $+ Voc� ativou o modo de espera para o $cc $+ Daycare Center $+ $ct $+ . Para desativar, digite ' $+ $cc $+ .Daycare stand $+ $ct $+ ' novamente. | return
          }
        }
        elseif ($2 == with) {
          var %n = $rini(cadastros,$3,Info,Nick)
          if (!%n) { msg =$nick $ct $+ O treinador selecionado n�o est� cadastrado. | return }
          if (%n == $nick) { msg =$nick $ct $+ Para cruzar apenas seus pok�mon, utilize ' $+ $cc $+ .DayCare Breed $+ $ct $+ '. | return }
          if (!$active(%n).time) { msg =$nick $ct $+ O treinador selecionado n�o est� online. | return }
          if ($rini(cadastros,$nick,Team,2)) { msg =$nick $ct $+ Para efetuar cruzamento entre o seu pok�mon com o de seu amigo, � necess�rio que voc� deixe apenas um pok�mon em seu time. | return }
          if ($rini(cadastros,$nick,$rini(cadastros,$nick,Team,1),ID) != $nick) { msg =$nick $ct $+ O pok�mon selecionado n�o pode ser cruzado. Apenas o treinador original poder� faz�-lo. | return }
          if (!%stand. [ $+ [ %n ] ]) { msg =$nick $ct $+ O treinador ' $+ $cc $+ %n $+ $ct $+ ' n�o est� em modo de espera. | return }
          if (%stand. [ $+ [ %n ] ] != Daycare) { msg =$nick $ct $+ O treinador selecionado n�o est� em modo de espera para $cc $+ Daycare $+ $ct $+ . | return }
          if (%confirm. [ $+ [ %n ] ]) { msg =$nick $cc $+ %n $ct $+ j� est� sendo solicitado para efetuar um cruzamento. | return }
          if ($rini(cadastros,$nick,Info,Money) < 5000) { msg =$nick $ct $+ Voc� n�o tem dinheiro suficiente para um cruzamento! | return }
          set %confirm. [ $+ [ %n ] ] BRD: $+ $nick | unset %stand. [ $+ [ %n ] ] | set %stand. [ $+ [ $nick ] ] Daycare_wait: $+ %n
          msg =$nick $ct $+ Sua solicita��o de cruzamento foi enviada para $cc $+ %n $+ $ct $+ . Aguarde sua resposta, ou n�o ser� poss�vel completar a solicita��o.
          var %pk = $rini(cadastros,%n,Team,1), %pk2 = $rini(cadastros,$nick,Team,1)
          msg = [ $+ [ $3 ] ] $cc $+ %n $+ $ct $+ , $cc $+ $nick $ct $+ est� tentando efetuar um cruzamento de $rtypename($rini(cadastros,$nick,%pk2,Name),$rini(cadastros,$nick,%pk2,Sex),$rini(cadastros,$nick,%pk2,Level),$rini(cadastros,$nick,%pk2,Shiny)) $ct $+ com o seu $rtypename($rini(cadastros,%n,%pk,Name),$rini(cadastros,%n,%pk,Sex),$rini(cadastros,%n,%pk,Level),$rini(cadastros,%n,%pk,Shiny)) $+ $ct $+ . Deseja efetuar o cruzamento?
          msg = [ $+ [ $3 ] ] $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para aceitar ou ' $+ $cc $+ .nao $+ $ct $+ ' para recusar. | return
        }
        elseif ($2 == breed) {
          if (%stand. [ $+ [ $nick ] ]) { msg =$nick $ct $+ Antes de efetuar o cruzamento, voc� deve $cc $+ desativar $ct $+ o modo de $cc $+ espera $+ $ct $+ . | return }
          if (!$rini(cadastros,$nick,Team,2)) { msg =$nick $ct $+ Coloque no seu time os dois pok�mon que voc� deseja cruzar. | return }
          if ($rini(cadastros,$nick,$rini(cadastros,$nick,Team,1),ID) != $nick) { msg =$nick $cc $+ $rini(cadastros,$nick,Team,1) $ct $+ n�o pode ser cruzado. Apenas o treinador original poder� faz�-lo. | return }
          if ($rini(cadastros,$nick,$rini(cadastros,$nick,Team,2),ID) != $nick) { msg =$nick $cc $+ $rini(cadastros,$nick,Team,2) $ct $+ n�o pode ser cruzado. Apenas o treinador original poder� faz�-lo. | return }
          if ($rini(cadastros,$nick,Info,Money) < %price) { msg =$nick $ct $+ � necess�rio ter, no m�nimo, $cc $+ $chr(36) $+ $getmoney(%price) $ct $+ de dinheiro para um cruzamento. | return }
          var %pk.1 = $rini(cadastros,$nick,Team,1), %sex.1 = $rini(cadastros,$nick,%pk.1,Sex), %moveset.1 = $rini(cadastros,$nick,%pk.1,Move1) $+ $iif($rini(cadastros,$nick,%pk.1,Move2),: $+ $rini(cadastros,$nick,%pk.1,Move2) $+ $iif($rini(cadastros,$nick,%pk.1,Move3),: $+ $rini(cadastros,$nick,%pk.1,Move3) $+ $iif($rini(cadastros,$nick,%pk.1,Move4),: $+ $rini(cadastros,$nick,%pk.1,Move4))))
          var %pk.2 = $rini(cadastros,$nick,Team,2), %sex.2 = $rini(cadastros,$nick,%pk.2,Sex), %moveset.2 = $rini(cadastros,$nick,%pk.2,Move1) $+ $iif($rini(cadastros,$nick,%pk.2,Move2),: $+ $rini(cadastros,$nick,%pk.2,Move2) $+ $iif($rini(cadastros,$nick,%pk.2,Move3),: $+ $rini(cadastros,$nick,%pk.2,Move3) $+ $iif($rini(cadastros,$nick,%pk.2,Move4),: $+ $rini(cadastros,$nick,%pk.2,Move4))))
          breed $nick $+ ; $+ %pk.1 $+ ; $+ %sex.1 $+ ; $+ %moveset.1 $+ ; $+ $nick $+ ; $+ %pk.2 $+ ; $+ %sex.2 $+ ; $+ %moveset.2
          return
        }
        else { msg =$nick $ct $+ Este comando foi utilizado incorretamente. Para ver as sintaxes, digite apenas ' $+ $cc $+ .daycare $+ $ct $+ '. | return }
      }
      else {
        msg =$nick $ct $+ Bem vindo ao $cc $+ Daycare Center $ct $+ de $cc $+ $rini(cadastros,$nick,Info,Locate) $+ $ct $+ .
        msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .Daycare breed $+ $ct $+ ' para $cc $+ efetuar $ct $+ o $cc $+ cruzamento $ct $+ entre seus pok�mon, por isso deixe apenas $cc $+ dois $ct $+ no seu time, exatamente os que voc� pretende cruzar;
        msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .Daycare stand $+ $ct $+ ' para $cc $+ esperar $ct $+ por outros $cc $+ treinadores $ct $+ e efetuar o $cc $+ cruzamento $ct $+ entre eles. Deixe apenas $cc $+ um $ct $+ pok�mon no time, o que voc� pretende cruzar;
        msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .Daycare with <nick> $+ $ct $+ ' para $cc $+ selecionar $ct $+ um treinador que j� esteja em modo de $cc $+ espera $+ $ct $+ . Deixe apenas $cc $+ um $ct $+ pok�mon no time, ou seja, o que voc� pretende cruzar;
        msg =$nick $ct $+ Fim da rela��o de comandos do $cc $+ Daycare Center $+ $ct $+ .
        if (!$dados($nick,Info,Perfil,19)) {
          msg =$nick $chr(160) $ct $+ Se voc� pretende cruzar dois pok�mon do seu time, deixe-os no time apenas e remova os demais. Ent�o, digite ' $+ $cc $+ .daycare breed $+ $ct $+ '. H�, no entanto, outra forma de efetuar cruzamentos. Dessa vez, dois usu�rios distintos, cada qual com seu pok�mon isolado no time (significa que n�o h� outros al�m desse) pretendem cruz�-los. Ent�o, um dever� ativar o modo $cc $+ stand $ct $+ digitando ' $+ $cc $+ .daycare stand $+ $ct $+ ' e o outro digitar ' $+ $cc $+ .daycare with <nick do anterior> $+ $ct $+ '. Neste tipo de cruzamento, quem esteve em modo $cc $+ stand $ct $+ receber� o ovo do cruzamento.
        }
        return
      }
      else { msg =$nick $ct $+ Houve um erro de sintaxe no comando. Digite ' $+ $cc $+ .Daycare $+ $ct $+ ' para mais informa��es. | return }
    }
    elseif ($1 == .Trade) {
      if ($checknickid($nick) == Ok!) { msg =$nick $ct $+ N�o � poss�vel $cc $+ trocar $ct $+ pok�mon enquanto batalha. | return }
      if ($v(Watch. [ $+ [ $nick ] ])) { msg =$nick $ct $+ Voc� est� assistindo a batalha de ID $cc $+ $v(Watch. [ $+ [ $nick ] ]) $+ $ct $+ . Para parar de assisti-la, digite ' $+ $cc $+ .Assistir $+ $ct $+ '. | return }
      if (%confirm. [ $+ [ $nick ] ]) { msg =$nick $ct $+ Antes de $cc $+ trocar $ct $+ pok�mon, digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar o �ltimo pedido. | return }
      if ($findtok($readini(pkp\status.ini,%region,NoPC),%l,0,58)) { msg =$nick $ct $+ N�o � poss�vel trocar pok�mon. Sua cidade n�o possui um $cc $+ Pok�mon Center $+ $ct $+ . | return }
      if ($2) {
        var %n = $readini(pkp\status.ini,Active,Trade) | if ($dados($nick,$dados($nick,Info,Start),Badges).n < %n) { msg =$nick $ct $+ N�o � poss�vel trocar pok�mon. Voc� precisa obter, no m�nimo, $cc $+ $numero(%n) $ct $+ ins�gneas em batalhas de gin�sio. | return }
        if ($2 == stand) {
          var %x = %stand. [ $+ [ $nick ] ]
          if (%x == Trade) { unset %stand. [ $+ [ $nick ] ] | msg =$nick $ct $+ Voc� desativou o modo de espera para a $cc $+ troca $ct $+ de pok�mon. | return }
          elseif (%x) {
            if ($gettok(%x,1,58) == Trade_wait) { var %n = $gettok(%x,2,58) | unset %confirm. [ $+ [ %n ] ] | unset %stand. [ $+ [ $nick ] ] | msg = [ $+ [ %n ] ] $ct $+ A solicita��o de $cc $+ troca $ct $+ de $cc $+ $dados($nick,Info,Nick) $ct $+ foi cancelada. | msg =$nick $ct $+ Voc� desativou seu $cc $+ modo de espera $ct $+ para a $cc $+ troca $ct $+ de pok�mon. | return }
            else { msg =$nick $ct $+ Seu modo de espera j� est� $cc $+ ativado $ct $+ em outra fun��o. | return }
          }
          else {
            var %r = $calc($ctime($date $time) - $ctime($rini(cadastros,$nick,Time,Trade))) | if (%r < 259200) { msg =$nick $ct $+ Voc� j� efetuou uma troca em menos de $cc $+ tr�s $ct $+ dias atr�s. Aguarde $dur($calc(259200 - %r),$ct,$cc) para tentar novamente. | return }
            set %stand. [ $+ [ $nick ] ] Trade | msg =$nick $ct $+ Voc� ativou o modo de espera para a $cc $+ troca $ct $+ de pok�mon. Para desativar, digite ' $+ $cc $+ .Trade stand $+ $ct $+ ' novamente. | return
          }
        }
        elseif ($2 == with) {
          var %n = $rini(cadastros,$3,Info,Nick), %pk = $dados($nick,$4,Name)
          if (!%n) { msg =$nick $ct $+ Para trocar um pok�mon, � necess�rio especificar o $cc $+ nick $ct $+ de $cc $+ outro $ct $+ usu�rio. | return }
          if (!%pk) { msg =$nick $ct $+ Para trocar um pok�mon, � preciso especific�-lo $cc $+ corretamente $+ $ct $+ . Verifique o nome do mesmo ou se o pok�mon ainda est� em seu time, neste momento. | return }
          if ($is_legend(%pk)) { msg =$nick $ct $+ Por se tratar de um pok�mon $cc $+ lend�rio $+ $ct $+ , n�o pode ser trocado. | return }
          if (%n == $nick) { msg =$nick $ct $+ Para trocar um pok�mon, � necess�rio especificar o $cc $+ nick $ct $+ de $cc $+ outro $ct $+ usu�rio. | return }
          if (%stand. [ $+ [ $nick ] ]) { msg =$nick $ct $+ Antes de efetuar uma troca, voc� deve $cc $+ desativar $ct $+ seu modo de $cc $+ espera $+ $ct $+ . | return }
          if (!%stand. [ $+ [ %n ] ]) { msg =$nick $cc $+ %n $ct $+ n�o est� em modo de espera. | return }
          if (!$active(%n).time) { msg =$nick $cc $+ %n $ct $+ n�o est� conectado neste momento. | return }
          var %r = $calc($ctime($date $time) - $ctime($rini(cadastros,$nick,Time,Trade))) | if (%r < 259200) { msg =$nick $ct $+ Voc� j� efetuou uma troca em menos de $cc $+ tr�s $ct $+ dias atr�s. Aguarde $dur($calc(259200 - %r),$ct,$cc) para tentar novamente. | return }
          if (%stand. [ $+ [ %n ] ] != Trade) { msg =$nick $cc $+ %n $ct $+ n�o est� em modo de espera para $cc $+ Trade $+ $ct $+ . | return }
          if (%confirm. [ $+ [ %n ] ]) { msg =$nick $cc $+ %n $ct $+ j� est� sendo solicitado para efetuar uma troca. | return }
          if ($dados($nick,Info,Region) != $dados(%n,Info,Region)) { msg =$nick $cc $+ %n $ct $+ est� muito longe e n�o � poss�vel estabelecer conex�o. | return }
          set %confirm. [ $+ [ %n ] ] TRD: $+ $dados($nick,Info,Nick) $+ : $+ %pk | unset %stand. [ $+ [ %n ] ] | set %stand. [ $+ [ $nick ] ] Trade_wait: $+ %n
          msg =$nick $ct $+ Sua solicita��o de troca foi enviada para $cc $+ %n $+ $ct $+ . Aguarde sua resposta, ou n�o ser� poss�vel complet�-la.
          msg = [ $+ [ $3 ] ] $cc $+ %n $+ $ct $+ , $cc $+ $dados($nick,Info,Nick) $ct $+ est� oferecendo o pok�mon $rtypename(%pk,$dados($nick,%pk,Sex),$dados($nick,%pk,Level),$dados($nick,%pk,Shiny)) $ct $+ para realizar uma troca. Deseja realmente prosseguir?
          msg = [ $+ [ $3 ] ] $ct $+ Se sua resposta for afirmativa, digite ent�o ' $+ $cc $+ .Sim <Pok�mon> $+ $ct $+ ', especificando assim o pok�mon que voc� deseja trocar. Caso contr�rio, digite simplesmente ' $+ $cc $+ .nao $+ $ct $+ '. | return
        }
        else { msg =$nick $ct $+ Este comando foi utilizado incorretamente. Para ver as sintaxes, digite apenas ' $+ $cc $+ .Trade $+ $ct $+ '. | return }
      }
      else {
        msg =$nick $ct $+ Bem vindo ao assistente de $cc $+ trocas $ct $+ de $cc $+ pok�mon $+ $ct $+ .
        msg =$nick $chr(160) $cc $+ $arrange(.Trade stand,160,28) $ct $+ - para iniciar o modo de espera para trocas;
        msg =$nick $chr(160) $cc $+ .Trade with <Nick> <Pok�mon> $ct $+ - para trocar o pok�mon especificado com o nick selecionado;
        msg =$nick $ct $+ Fim da rela��o de comandos do sistema de $cc $+ trocas $+ $ct $+ .
        if (!$dados($nick,Info,Perfil,19)) {
          msg =$nick $chr(160) $ct $+ Um treinador deve usar o primeiro comando para manter-se em espera, da� outro treinador usa o segundo para iniciar o processo de troca com ele. A partir da�, um pedido de confirma��o para o primeiro treinador ser� enviado, enquanto isso o segundo manter�-se em espera. Ap�s a confirma��o do primeiro, este volta ao modo de espera, enquanto o segundo ser� informado da escolha de pok�mon do outro treinador e decidir� se deseja finalizar a troca.
        }
        return
      }
      else { msg =$nick $ct $+ Houve um erro de sintaxe no comando. Digite ' $+ $cc $+ .Trade $+ $ct $+ ' para mais informa��es. | return }
    }
    elseif ($1 == .Criar) {
      if ($checknickid($nick) == Ok!) { msg =$nick $ct $+ Voc� j� est� participando de uma batalha. | return }
      if ($v(Watch. [ $+ [ $nick ] ])) { msg =$nick $ct $+ Voc� j� est� assistindo a batalha de ID $cc $+ $v(Watch. [ $+ [ $nick ] ]) $+ $ct $+ . Para parar de assisti-la, digite ' $+ $cc $+ .Assistir $+ $ct $+ '. | return }
      if (!$rini(cadastros,$nick,$2,Name)) { msg =$nick $ct $+ Voc� n�o tem o pok�mon selecionado. | return }
      if ($2 == Egg) { msg =$nick $ct $+ Voc� n�o pode usar um $cc $+ Egg $ct $+ numa batalha. | return }
      if ($3) {
        if (!$rini(cadastros,$nick,$3,Name)) { msg =$nick $ct $+ Voc� n�o tem o pok�mon selecionado. | return }
        if ($3 == Egg) { msg =$nick $ct $+ Voc� n�o pode usar um $cc $+ Egg $ct $+ numa batalha. | return }
        if ($2 == $3) { msg =$nick $ct $+ Para batalhar em dupla, especifique pok�mon $cc $+ diferentes $ct $+ para usar. | return }
      }
      if (%confirm. [ $+ [ $nick ] ]) { msg =$nick $ct $+ Antes de criar uma luta, digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar o �ltimo pedido. | return }
      var %x = $tevent(Criar,$nick).time
      if (%x) {
        var %r = $calc($ctime($date $time) - $ctime(%x)) | if (%r >= 5) { goto criar }
        else { msg =$nick $ct $+ N�o fa�a flood com este comando. Voc� poder� reutiliz�-lo em $cc $+ $calc(5 - %r) $ct $+ $iif($calc(5 - %r) > 1,segundos.,segundo.) | return }
      }
      else {
        :criar
        if (%stand. [ $+ [ $nick ] ]) { unset %stand. [ $+ [ $nick ] ] }
        b.create.fila $dados($nick,Info,Nick) $2 $3 | msg =$nick $ct $+ O ID da sua luta � $cc $+ $checknickid($nick).id $+ $ct $+ . Guarde-a para uso posterior. | tevent Criar $nick

        if (!$dados($nick,Info,Perfil,21)) {
          if (!$someone($nick).n) && ($readini(pkp\region_battles.ini,$dados($nick,Info,Region),$replace($dados($nick,Info,Locate),$chr(32),_))) {
            msg =$nick $ct $+ Cuidado! Treinadores que est�o sozinhos s�o subestimados por outros...
            .timer $+ $+(RANDOM,.,$nick) 1 $random.battle.time() /random.battle $nick
          }
        }
      }
      return
    }
    elseif ($1 == .Assistir) {
      if ($checknickid($nick) == Ok!) { msg =$nick $ct $+ Voc� n�o pode assistir outras batalhas enquanto luta! | return }
      if (%stand. [ $+ [ $nick ] ]) { unset %stand. [ $+ [ $nick ] ] }
      if ($2) {
        if ($v(Watch. [ $+ [ $nick ] ])) { msg =$nick $ct $+ Voc� j� est� assistindo a batalha de ID $cc $+ $v(Watch. [ $+ [ $nick ] ]) $+ $ct $+ . Para parar de assisti-la, digite ' $+ $cc $+ .Assistir $+ $ct $+ '. | return }
        if ($2 isnum) {
          if ($b.check.id($2) == No!) { msg =$nick $ct $+ A luta $cc $+ $2 $ct $+ n�o existe. Digite ' $+ $cc $+ .Listar $+ $ct $+ ' para list�-las. | return }
          var %id = $2
        }
        else {
          if ($npc($2)) { msg =$nick $ct $+ Este treinador n�o � um usu�rio v�lido. | return }
          if (!$dados($2,Info,Nick)) { msg =$nick $ct $+ O treinador selecionado n�o existe. | return }
          if ($checknickid($2) == No!) || (($dados($2,Info,Hide)) && (!$dados($nick,Info,Hide))) { msg =$nick $ct $+ Treinador $cc $+ $dados($2,Info,Nick) $ct $+ n�o est� batalhando. | return }
          var %id = $checknickid($2).id
        }
        if (!$v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ 2 ] ])) { msg =$nick $ct $+ Esta batalha ainda n�o come�ou. | return }
        if ($findtok($v(B. [ $+ [ %ID ] $+ ] .Watching),$nick,0,58)) { msg =$nick $ct $+ Voc� j� est� assistindo a esta batalha! | return }
        var %nick = $dados($nick,Info,Nick) | if (!$dados($nick,Info,Hide)) { msgfight %ID $cc $+ $nick $ct $+ come�ou a $cc $+ assistir $ct $+ � batalha. } | if ($v(B. [ $+ [ %ID ] $+ ] .Watching)) { var %r = [ [ $v(B. [ $+ [ %ID ] $+ ] .Watching) ] $+ [ : ] $+ [ %nick ] ] | sset B. [ $+ [ %ID ] $+ ] .Watching %r } | else { sset B. [ $+ [ %ID ] $+ ] .Watching %nick } | sset Watch. [ $+ [ $nick ] ] %ID | msg =$nick $ct $+ Voc� est� assistindo a batalha de ID $cc $+ %ID $+ $ct $+ . Quando quiser parar de assisti-la, digite ' $+ $cc $+ .Assistir $+ $ct $+ '.

        var %x = 1
        if (!$v([ [ B. ] $+ [ %ID ] $+ [ .Wild ] ])) {
          if ($battle.team(%ID,$rvs(%x))) { msg =$nick $ct $+ Assistindo batalha contra $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $rvs(%x) ] ]) $ct $+ ( $+ $chr(35) $+ $outfit(%ID,$rvs(%x)) $+ ) e $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $battle.team(%ID,$rvs(%x)).num ] ]) $ct $+ ( $+ $chr(35) $+ $outfit(%ID,$battle.team(%ID,$rvs(%x)).num) $+ ) $+ ... }
          else { msg =$nick $ct $+ Assistindo batalha contra $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $rvs(%x) ] ]) $ct $+ ( $+ $chr(35) $+ $outfit(%ID,$rvs(%x)) $+ ) $+ ... }
        }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .2vs2 ] ])) {
          var %x = 0 | while (%x < 2) { inc %x | if ($battle.team(%ID,%x)) { if (%x == 1) { var %team1 = $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %x ] ]) $+ $lb $+ / $+ $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $battle.team(%ID,%x).num ] ]) } | else { var %team2 = $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %x ] ]) $+ $lb $+ / $+ $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $battle.team(%ID,%x).num ] ]) } } | else { var %team [ $+ [ %x ] ] $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %x ] ]) } }
          msg =$nick $lb $+ Batalha entre %team1 $lb $+ e %team2 $lb $+ - Arena: $v([ [ B. ] $+ [ %ID ] $+ [ .Arena ] ])
          var %x = 0 | while (%x < 4) {
            inc %x
            if ($battle.player(%ID,%x) == %x) { var %p [ $+ [ %x ] ] $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %x ] ]) $+ $lb $+ ( $+ $iif($v([ [ B. ] $+ [ %ID ] $+ [ .Gender. ] $+ [ %x ] ]) == Female,13F,$iif($v([ [ B. ] $+ [ %ID ] $+ [ .Gender. ] $+ [ %x ] ]) == Male,12M,N/A)) $+ $lb $+ ) $+ $iif($v([ [ B. ] $+ [ %ID ] $+ [ .Shiny. ] $+ [ %x ] ]) == ON,4+ $+ $lb $+,$+) $+ / $+ $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Lvl. ] $+ [ %x ] ]) }
            else {
              if (%p [ $+ [ $battle.side(%x) ] ]) { var %p [ $+ [ $battle.side(%x) ] ] %p [ $+ [ $battle.side(%x) ] ] $lb $+ e $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %x ] ]) $+ $lb $+ ( $+ $iif($v([ [ B. ] $+ [ %ID ] $+ [ .Gender. ] $+ [ %x ] ]) == Female,13F,$iif($v([ [ B. ] $+ [ %ID ] $+ [ .Gender. ] $+ [ %x ] ]) == Male,12M,N/A)) $+ $lb $+ ) $+ $iif($v([ [ B. ] $+ [ %ID ] $+ [ .Shiny. ] $+ [ %x ] ]) == ON,4+ $+ $lb $+,$+) $+ / $+ $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Lvl. ] $+ [ %x ] ]) }
              else { var %p [ $+ [ $battle.side(%x) ] ] $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %x ] ]) $+ $lb $+ ( $+ $iif($v([ [ B. ] $+ [ %ID ] $+ [ .Gender. ] $+ [ %x ] ]) == Female,13F,$iif($v([ [ B. ] $+ [ %ID ] $+ [ .Gender. ] $+ [ %x ] ]) == Male,12M,N/A)) $+ $lb $+ ) $+ $iif($v([ [ B. ] $+ [ %ID ] $+ [ .Shiny. ] $+ [ %x ] ]) == ON,4+ $+ $lb $+,$+) $+ / $+ $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Lvl. ] $+ [ %x ] ]) }
            }
          }
          var %x = 1, %y = 3:1:4:2 | while ($gettok(%y,%x,58)) { if (%p [ $+ [ $gettok(%y,%x,58) ] ]) { msg =$nick $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $gettok(%y,%x,58) ] ]) $lb $+ est� usando %p [ $+ [ $gettok(%y,%x,58) ] ] $+ $lb $+ ! } | inc %x }
        }
        else {
          var %sh1 = $v([ [ B. ] $+ [ %ID ] $+ [ .Shiny. ] $+ [ 1 ] ]), %sh2 = $v([ [ B. ] $+ [ %ID ] $+ [ .Shiny. ] $+ [ 2 ] ]), %g1 = $v([ [ B. ] $+ [ %ID ] $+ [ .Gender. ] $+ [ 1 ] ]), %g2 = $v([ [ B. ] $+ [ %ID ] $+ [ .Gender. ] $+ [ 2 ] ])
          msg =$nick $lb $+ Batalha entre $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ 1 ] ]) $+ $lb $+ ( $+ $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ 1 ] ]) $+ $lb $+ $iif(%sh1 == ON,4 $+ $chr(43) $+ $lb $+,$+) $+ $iif(%g1 == Male,/ $+ 12M $+ $lb $+,$iif(%g1 == Female,/ $+ 13F $+ $lb $+,$+)) $+ ) e $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ 2 ] ]) $+ $lb $+ ( $+ $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ 2 ] ]) $+ $lb $+ $iif(%sh2 == ON,4 $+ $chr(43) $+ $lb $+ ,$+) $+ $iif(%g2 == Male,/ $+ 12M $+ $lb $+,$iif(%g2 == Female,/ $+ 13F $+ $lb $+,$+)) $+ ) - Arena: $v([ [ B. ] $+ [ %ID ] $+ [ .Arena ] ])
        }
        msg =$nick $lb $+ Por favor, aguarde a sele��o de golpes dos treinadores.
      }
      else {
        if ($v(Watch. [ $+ [ $nick ] ])) { var %id = $v(Watch. [ $+ [ $nick ] ]) | sset B. [ $+ [ %ID ] $+ ] .Watching $remtok($v(B. [ $+ [ %ID ] $+ ] .Watching),$nick,1,58) | uset Watch. [ $+ [ $nick ] ] | msg =$nick $ct $+ Voc� parou de assistir � luta $cc $+ %ID $+ $ct $+ . | msgfight %ID $cc $+ $nick $ct $+ parou de assistir � batalha. }
        else { msg =$nick $ct $+ Erro de sintaxe do comando. Digite ' $+ $cc $+ .Ajuda $+ $ct $+ ' para mais informa��es. | return }
      }
      return
    }
    elseif ($1 == .Pokedex) {
      if (!$item($nick,PokeDex).qnt) { msg =$nick $ct $+ Apenas usu�rios que possuem o item $cc $+ PokeDex $ct $+ podem usar este comando. | return }
      var %z = $tevent(Dex,$nick).time, %z = $iif(%z,%z,0), %y = $calc($ctime($date $time) - $ctime(%z))
      if (%y < 10) { msg =$nick $ct $+ N�o fa�a flood com este comando. Voc� poder� reutiliz�-lo em $cc $+ $calc(10 - %y) $ct $+ $iif($calc(10 - %y) > 1,segundos.,segundo.) | return }
      if ($2) && ($2 !isnum) {
        if (!$basestat($2,etype)) { msg =$nick $ct $+ Erro de sintaxe neste comando. Digite ' $+ $cc $+ .Ajuda $+ $ct $+ ' para mais informa��es. | return }
        var %info = 1 | if ($rini(cadastros,$nick,Info,Access) < 5) { if (!$pokedex($nick,$2)) { var %info = 0 } }
        var %pk = $basestat($2,name)
        if (%info) { tevent Dex $nick }
        msg =$nick $ct $+ Exibindo informa��es com a $cc $+ National Dex $+ $ct $+ :
        if (!$basestat(%pk,num)) { msg =$nick $ct $+ N�o h� informa��es dispon�veis para $cc $+ %pk $+ $ct $+ . | return }
        msg =$nick $chr(160) $ct $+ $chr(35) $+ $cc $+ $basestat(%pk,num) $ct $+ - %pk
        msg =$nick $chr(160) $ct $+ Type: $cc $+ $replace($basestat(%pk,Type),$chr(32),$+ $ct $+ / $+ $cc $+)
        if (%info) {
          msg =$nick $chr(160) $ct $+ Trait: $cc $+ $replace($basestat(%pk,Trait),$chr(44),$+ $chr(32) $+ $ct $+ ou $+ $cc $+)
          msg =$nick $chr(160) $ct $+ Weight: $cc $+ $replace($basestat(%pk,Weight),$chr(46),$+ $ct $+ $chr(44) $+ $cc $+) $ct $+ kg
          var %t = $readini(pkp\evolve.ini,Evolve,%pk), %x = 0, %y = $gettok(%t,0,59)
          while (%x < %y) {
            inc %x | var %z = $gettok(%t,%x,59)
            if ($gettok(%z,2,58) != No) { var %e = Lv $gettok(%z,2,58) } | if ($gettok(%z,3,58) != No) { var %e = $gettok(%z,3,58) } | if ($gettok(%z,4,58) != No) { var %e = Loyalty } | if ($gettok(%z,6,58) != No) { var %e = Trade } | if ($gettok(%z,5,58) != No) { if (%e) { var %e = Hold $gettok(%z,5,58) $+ $chr(44) trade } | else { var %e = Hold $gettok(%z,5,58) } } | if ($gettok(%z,7,58) != No) { if (%e) { var %e = %e $+ $chr(44) $gettok(%z,7,58) > $gettok(%z,8,58) } | else { var %e = $gettok(%z,7,58) > $gettok(%z,8,58) } }
            if (%r) { if (%x == %y) { var %r = %r $ct $+ ou $cc $+ $gettok(%z,1,58) $+ $ct $+ ( $+ %e $+ ) } | else { var %r = %r $+ $ct $+ $chr(44) $cc $+ $gettok(%z,1,58) $+ $ct $+ ( $+ %e $+ ) } } | else { var %r = $cc $+ $gettok(%z,1,58) $+ $ct $+ ( $+ %e $+ ) }
          }
          msg =$nick $chr(160) $ct $+ Evolution: $iif(%r,%r,Nenhuma) | var %r = 0
        }
        msg =$nick $chr(160) $ct $+ Location:
        var %found = $dex.search($nick,%pk), %got = 0
        if ($gettok(%found,1,59)) { msg =$nick $chr(160) $chr(160) $cc $+ * $ct $+ Comum: $separecom($gettok(%found,1,59),e,58,$cc,$ct) | inc %got }
        if ($gettok(%found,2,59)) { msg =$nick $chr(160) $chr(160) $cc $+ * $ct $+ Incomum: $separecom($gettok(%found,2,59),e,58,$cc,$ct) | inc %got }
        if ($gettok(%found,3,59)) { msg =$nick $chr(160) $chr(160) $cc $+ * $ct $+ Raro: $separecom($gettok(%found,3,59),e,58,$cc,$ct) | inc %got }
        if ($gettok(%found,4,59)) { msg =$nick $chr(160) $chr(160) $cc $+ * $ct $+ Rarissimo: $separecom($gettok(%found,4,59),e,58,$cc,$ct) | inc %got }
        var %found = $dex.search($nick,%pk).rod
        if ($gettok(%found,1,59)) { msg =$nick $chr(160) $chr(160) $cc $+ * $ct $+ Comum ( $+ $cc $+ Old Rod $+ $ct $+ ): $separecom($gettok(%found,1,59),e,58,$cc,$ct) | inc %got }
        if ($gettok(%found,2,59)) { msg =$nick $chr(160) $chr(160) $cc $+ * $ct $+ Comum ( $+ $cc $+ Good Rod $+ $ct $+ ): $separecom($gettok(%found,2,59),e,58,$cc,$ct) | inc %got }
        if ($gettok(%found,3,59)) { msg =$nick $chr(160) $chr(160) $cc $+ * $ct $+ Comum ( $+ $cc $+ Super Rod $+ $ct $+ ): $separecom($gettok(%found,3,59),e,58,$cc,$ct) | inc %got }
        if ($gettok(%found,4,59)) { msg =$nick $chr(160) $chr(160) $cc $+ * $ct $+ Raro ( $+ $cc $+ Super Rod $+ $ct $+ ): $separecom($gettok(%found,4,59),e,58,$cc,$ct) | inc %got }
        if (!%got) { msg =$nick $chr(160) $chr(160) $cc $+ Desconhecida }

        tokenize 32 $basestat(%pk,Base) | msg =$nick $chr(160) $ct $+ Stat $chr(124) Base
        msg =$nick $chr(160) $ct $+ HP $str($+ $chr(160) $+,2) $+ $chr(124) $gbarra2($1,255,2,0,1) $ct $+ ( $+ $1 $+ $ct $+ )
        msg =$nick $chr(160) $ct $+ Atk $str($+ $chr(160) $+,1) $+ $chr(124) $gbarra2($2,255,2,0,1) $ct $+ ( $+ $2 $+ )
        msg =$nick $chr(160) $ct $+ Def $str($+ $chr(160) $+,1) $+ $chr(124) $gbarra2($3,255,2,0,1) $ct $+ ( $+ $3 $+ )
        msg =$nick $chr(160) $ct $+ Spd $str($+ $chr(160) $+,1) $+ $chr(124) $gbarra2($4,255,2,0,1) $ct $+ ( $+ $4 $+ )
        msg =$nick $chr(160) $ct $+ SAtk $str($+ $chr(160) $+,0) $+ $chr(124) $gbarra2($5,255,2,0,1) $ct $+ ( $+ $5 $+ )
        msg =$nick $chr(160) $ct $+ SDef $str($+ $chr(160) $+,0) $+ $chr(124) $gbarra2($6,255,2,0,1) $ct $+ ( $+ $6 $+ )

        if (%info) {
          var %moves = $read(pkp\moveset.txt, s, %pk), %x = $gettok(%moves,0,44), %y = 0
          while (%y < %x) {
            inc %y | var %t = $gettok(%moves,%y,44), %t2 = $gettok(%t,-1,32), %t = $move($nullfill($remove(%t,$chr(32) $+ %t2)))
            if (!$findtok(%l,%t,0,58)) { if (%l) { var %l = %l $+ : $+ %t } | else { var %l = %t } | if (%r) { if (%y == %x) { var %r = %r $ct $+ e $cc $+ %t $+ $ct $+ ( $+ $base(%t2,10,10,2) $+ )  } | else { var %r = %r $+ $ct $+ $chr(44) $cc $+ %t $+ $ct $+ ( $+ $base(%t2,10,10,2) $+ ) } } | else { var %r = $cc $+ %t $+ $ct $+ ( $+ $base(%t2,10,10,2) $+ ) } }
          }
          msg =$nick $chr(160) $ct $+ Level Moves: | msg =$nick $chr(160) $chr(160) %r | var %r = 0, %l = 0
          msg =$nick $chr(160) $ct $+ TM Moves:
          var %tms = $read(pkp\techniques.txt,s,%pk), %x = $wildtok(%tms,TM*,0,32), %y = 0
          while (%y < %x) {
            inc %y | var %t = $rmove($wildtok(%tms,TM*,%y,32)), %t2 = $remove($wildtok(%tms,TM*,%y,32),TM)
            if (!$findtok(%l,%t,0,58)) {
              if (%l) { var %l = %l $+ : $+ %t } | else { var %l = %t }
              if (%r) {
                if (%y == %x) { var %r = %r $ct $+ e $cc $+ %t $+ $ct $+ ( $+ %t2 $+ ) }
                else { var %r = %r $+ $ct $+ $chr(44) $cc $+ %t $+ $ct $+ ( $+ %t2 $+ ) | if (%x > 15) { if (%y == 10) || (%y == 20) || (%y == 30) || (%y == 40) || (%y == 50) { msg =$nick $chr(160) $chr(160) %r | var %r = 0 } } }
              }
              else { var %r = $cc $+ %t $+ $ct $+ ( $+ %t2 $+ ) }
            }
          }
          if (!%r) { var %r = Nenhum } | msg =$nick $chr(160) $chr(160) %r
          var %r = 0, %l = 0

          if ($rini(cadastros,$nick,Info,Access) == 5) || ($dados($nick,Quests,UpdateDex)) {
            msg =$nick $chr(160) $ct $+ Tutor Moves:
            var %x = $wildtok(%tms,MT*,0,32), %y = 0
            while (%y < %x) {
              inc %y | var %t = $rmove($wildtok(%tms,MT*,%y,32)), %t2 = $remove($wildtok(%tms,MT*,%y,32),MT)
              if (!$findtok(%l,%t,0,58)) {
                if (%l) { var %l = %l $+ : $+ %t } | else { var %l = %t }
                if (%r) {
                  if (%y == %x) { var %r = %r $ct $+ e $cc $+ %t $+ $ct $+ ( $+ %t2 $+ ) }
                  else { var %r = %r $+ $ct $+ $chr(44) $cc $+ %t $+ $ct $+ ( $+ %t2 $+ ) | if (%x > 15) { if (%y == 10) || (%y == 20) || (%y == 30) || (%y == 40) || (%y == 50) { msg =$nick $chr(160) $chr(160) %r | var %r = 0 } } }
                }
                else { var %r = $cc $+ %t $+ $ct $+ ( $+ %t2 $+ ) }
              }
            }
            if (!%r) { var %r = Nenhum } | msg =$nick $chr(160) $chr(160) %r | var %r = 0, %l = 0
            msg =$nick $chr(160) $ct $+ Egg Moves:
            var %pre = $preevolution(%pk), %egg = $read(pkp\eggmoves.txt,s,%pre), %x = $gettok(%egg,0,58), %y = 0
            while (%y < %x) {
              inc %y | var %t = $move($gettok(%egg,%y,58))
              if (!$findtok(%l,%t,0,58)) {
                if (%l) { var %l = %l $+ : $+ %t } | else { var %l = %t }
                if (%r) {
                  if (%y == %x) { var %r = %r $ct $+ e $cc $+ %t }
                  else { var %r = %r $+ $ct $+ $chr(44) $cc $+ %t | if (%x > 15) { if (%y == 10) || (%y == 20) || (%y == 30) || (%y == 40) || (%y == 50) { msg =$nick $chr(160) $chr(160) %r | var %r = 0 } } }
                }
                else { var %r = $cc $+ %t }
              }
            }
            if (!%r) { var %r = Nenhum } | msg =$nick $chr(160) $chr(160) %r | var %r = 0, %l = 0
          }

          var %x = $wildtok(%tms,HM*,0,32), %y = 0
          while (%y < %x) {
            inc %y | var %t = $rmove($wildtok(%tms,HM*,%y,32)), %t2 = $remove($wildtok(%tms,HM*,%y,32),HM)
            if (!$findtok(%l,%t,0,58)) {
              if (%l) { var %l = %l $+ : $+ %t } | else { var %l = %t }
              if (%r) { if (%y == %x) { var %r = %r $ct $+ e $cc $+ %t $+ $ct $+ ( $+ %t2 $+ ) } | else { var %r = %r $+ $ct $+ $chr(44) $cc $+ %t $+ $ct $+ ( $+ %t2 $+ ) } }
              else { var %r = $cc $+ %t $+ $ct $+ ( $+ %t2 $+ ) }
            }
          }
          if (!%r) { var %r = Nenhum } | msg =$nick $chr(160) $ct $+ HM Moves: | msg =$nick $chr(160) $chr(160) %r | var %r = 0, %l = 0
        }
        msg =$nick $ct $+ Fim da exibi��o de informa��es.
      }
      else {
        var %t = $rini(cadastros,$nick,Info,Pokedex), %r = 0, %p = 0
        if (!$2) {
          msg =$nick $ct $+ Sua PokeDex cont�m informa��es de $cc $+ %t $ct $+ pok�mon. Para list�-los, digite ' $+ $cc $+ .Pokedex <1 a 8> $+ $ct $+ ', determinando a p�gina a ser visualizada.
          msg =$nick $ct $+ Exibindo estat�sticas gerais da sua PokeDex:
          msg =$nick $chr(160) $cc $+ 386 $ct $+ dispon�veis, $cc $+ $rini(cadastros,$nick,Info,Pokedex) $ct $+ capturado $+ $iif($rini(cadastros,$nick,Info,Pokedex) > 1,s,$+) $+ : $gbarra($rini(cadastros,$nick,Info,Pokedex),386,:cc;,15,17) $cc $+ $int($calc($rini(cadastros,$nick,Info,Pokedex) * 100 / 386)) $+ $ct $+ % | return
        }
        else {
          var %x = $calc(($2 - 1) * 50)
          if (%x > 386) { msg =$nick $ct $+ Sua PokeDex atual s� reconhece $cc $+ 386 $ct $+ pok�mon diferentes. Aguarde novas atualiza��es. | return }
          tevent Dex $nick
          msg =$nick $ct $+ Exibindo a $cc $+ $ordinal($2).f $ct $+ p�gina de sua $cc $+ PokeDex $ct $+ (National Dex):
          while (%x < 386) {
            inc %x | inc %p | var %tpk = $rini(cadastros,$nick,Pokedex,$base(%x,10,10,3))
            if (%tpk) && (%tpk != None) {
              if ($gettok(%tpk,0,58) > 1) { var %tpk = $gettok(%tpk,$rand(1,$gettok(%tpk,0,58)),58) }
              inc %r | msg =$nick $chr(160) $ct $+ $chr(35) $+ $cc $+ $base(%x,10,10,3) $ct $+ - $cc $+ %tpk
            }
            else { msg =$nick $chr(160) $ct $+ $chr(35) $+ $cc $+ $base(%x,10,10,3) $ct $+ - ??? }
            if (%p == 50) { var %x = 386 }
          }
          msg =$nick $ct $+ Estat�sticas: 
          msg =$nick $chr(160) $cc $+ %p $ct $+ exibidos, $cc $+ %r $ct $+ capturado $+ $iif(%r > 1,s,$+) $+ : $gbarra(%r,%p,:cc;,15,17) $cc $+ $int($calc(%r * 100 / %p)) $+ $ct $+ %
        }
      }
      return
    }
    elseif ($1 == .Ribbon) {
      if ($checknickid($nick) == Ok!) { msg =$nick $ct $+ Voc� n�o pode examinar $cc $+ medalhas $ct $+ enquanto batalha! | return }
      if ($v(Watch. [ $+ [ $nick ] ])) { msg =$nick $ct $+ Voc� n�o pode examinar $cc $+ medalhas $ct $+ enquanto assiste a outras batalhas. Para parar de assisti-la, digite ' $+ $cc $+ .Assistir $+ $ct $+ '. | return }
      if (%confirm. [ $+ [ $nick ] ]) { msg =$nick $ct $+ Antes de voc� examinar $cc $+ medalhas $+ $ct $+ , digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar o �ltimo pedido. | return }
      if (!$2) || (!$basestat($2,type)) { msg =$nick $ct $+ Para usar este comando corretamente, determine que $cc $+ pok�mon $ct $+ voc� ir� examinar. | return }
      if (!$dados($nick,$2,Name)) { msg =$nick $ct $+ O pok�mon escolhido precisa estar presente no $cc $+ time $+ $ct $+ . | return }
      var %pk = $basestat($2,name)
      if ($dados($nick,%pk,Ribbon)) { var %rib = $dados($nick,%pk,Ribbon) | msg =$nick $ct $+ Exibindo medalhas de $cc $+ %pk $+ $ct $+ : | while (%rib) { msg =$nick $chr(160) $cc $+ $gettok(%rib,1,58) | var %rib = $deltok(%rib,1,58) } | msg =$nick $ct $+ Fim da exibi��o de medalhas. }
      else { msg =$nick $ct $+ Seu pok�mon $cc $+ %pk $ct $+ n�o tem medalhas. }
      return
    }
    elseif ($1 == .Fly) {
      if ($team.hm($nick,Fly) == No!) { msg =$nick $ct $+ Voc� n�o pode utilizar ainda a t�cnica $cc $+ Fly $+ $ct $+ . | return }
      if ($checknickid($nick) == Ok!) { msg =$nick $ct $+ Voc� n�o pode utilizar a t�cnica $cc $+ Fly $ct $+ enquanto batalha! | return }
      if ($v(Watch. [ $+ [ $nick ] ])) { msg =$nick $ct $+ Voc� n�o pode utilizar a t�cnica $cc $+ Fly $ct $+ enquanto assiste a outras batalhas. Para parar de assisti-la, digite ' $+ $cc $+ .Assistir $+ $ct $+ '. | return }
      if (%confirm. [ $+ [ $nick ] ]) { msg =$nick $ct $+ Antes de utilizar a t�cnica $cc $+ Fly $+ $ct $+ , digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar o �ltimo pedido. | return }
      if (%stand. [ $+ [ $nick ] ]) { unset %stand. [ $+ [ $nick ] ] }
      var %r = $dados($nick,Info,Region), %c = $dados($nick,%r,Visited), %l = $dados($nick,Info,Locate)
      if ($findtok($region($2-),Johto,0,58)) { var %far = White City:Dark Cave:Peak Town:Sunrise City:Fog Cave:Silverst City | if ($findtok(%far,%l,0,58)) { var %c = %far } | else { var %c = $remtoks(%c,%far,58) } }
      var %c = $remtoks(%c,$readini(pkp\status.ini,%r,NoFlyTo),58)
      if ($2) {
        if ($region($2-)) {
          if (!$findtok($region($2-),%r,0,58)) { msg =$nick $ct $+ N�o � poss�vel voar para localidades muito distantes... | return }
          if ($findtok(%c,$2-,0,58)) {
            var %l = $rini(cadastros,$nick,Info,Locate)
            if ($findtok($readini(pkp\status.ini,%r,NoFlyFrom),%l,0,58)) { msg =$nick $ct $+ Voc� n�o pode utilizar $cc $+ Fly $ct $+ em sua localiza��o atual! | return }
            if (%l == $2-) { msg =$nick $ct $+ Voc� j� est� em $cc $+ %l $+ $ct $+ ! | return }
            if ($v($+(Clock.,$nick)) isnum 4-6) && (%l == Pacifidlog Town) {
              var %x = 0, %p = $totalpokes($nick) | if ($dados($nick,Egg,Name)) { if ($dados($nick,Team,1) == Wailord) && ($dados($nick,Team,$calc(%p - 1)) == Relicanth) { var %x = 1 } } | else { if ($dados($nick,Team,1) == Wailord) && ($dados($nick,Team,%p) == Relicanth) { var %x = 1 } }
              if (%x) && (!$dados($nick,Quests,Tomb)) { msg =$nick $ct $+ Parab�ns, o selo foi quebrado! Voc� p�de ouvir um $cc $+ terremoto $+ $ct $+ ... | wlog user $nick An earthquake could be heard... | writeini pkp\cadastros\ $+ $nick $+ .ini Quests Tomb Ok }
            }
            msg =$nick $ct $+ Voc� saiu de $cc $+ %l $+ $ct $+ . Bem vindo � $cc $+ $org($2-) $+ $ct $+ .
            writeini pkp\cadastros\ $+ $nick $+ .ini Info Locate $org($2-) | writeini pkp\cadastros\ $+ $nick $+ .ini Time Goto $date $time
            wlog user $nick Flew to $org($2-) $+ .
            place.events
            return
          }
          else { msg =$nick $ct $+ Voc� n�o pode usar $cc $+ Fly $ct $+ para ir a $cc $+ $org($2-) $+ $ct $+ . | return }
        }
        else { msg =$nick $ct $+ A cidade selecionada n�o existe ou n�o est� dispon�vel. | return }
      }
      else {
        var %n = $gettok(%c,0,58), %r = 0, %x = 0 | while (%x < %n) { inc %x | if (%r) { if (%x == %n) { var %r = %r $ct $+ e $cc $+ $gettok(%c,%x,58) } | else { var %r = %r $+ $ct $+ , $cc $+ $gettok(%c,%x,58) } } | else { var %r = $cc $+ $gettok(%c,%x,58) } }
        msg =$nick $cc $+ $nick $+ $ct $+ , voc� poder� usar a t�cnica $cc $+ Fly $ct $+ para estas localiza��es:
        msg =$nick $chr(160) $separecom(%c,ou,58,$cc,$ct) $+ $ct $+ . | msg =$nick $ct $+ Para mudar para a localiza��o desejada, digite " $+ $cc $+ .Fly <localiza��o> $+ $ct $+ ". | return
      }
    }
    elseif ($1 == .Pontos) {
      if ($2) { var %n = $2 } | else { var %n = $nick }
      if (!$rini(cadastros,%n,Info,Nick)) { msg =$nick $cc $+ %n $ct $+ n�o est� cadastrado. | return }
      if (!$dados(%n,Info,Perfil,16)) && (%n != $nick) { msg =$nick $cc $+ $rini(cadastros,%n,Info,Nick) $ct $+ desabilitou a visualiza��o de sua pontua��o atual. | return }
      msg =$nick $ct $+ A pontua��o atual de $cc $+ $rini(cadastros,%n,Info,Nick) $ct $+ no sistema � de $cc $+ $pontuacao(%n) $ct $+ pontos. | return
    }
    elseif ($1 == .Entrar) {
      if ($checknickid($nick).id != No!) { msg =$nick $ct $+ Voc� j� est� participando de uma luta. | return }
      if ($v(Watch. [ $+ [ $nick ] ])) { msg =$nick $ct $+ Voc� j� est� assistindo a batalha de ID $cc $+ $v(Watch. [ $+ [ $nick ] ]) $+ $ct $+ . Para parar de assisti-la, digite ' $+ $cc $+ .Assistir $+ $ct $+ '. | return }
      if (%confirm. [ $+ [ $nick ] ]) { msg =$nick $ct $+ Antes de entrar numa luta, digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar o �ltimo pedido. | return }
      if (%stand. [ $+ [ $nick ] ]) { unset %stand. [ $+ [ $nick ] ] }
      if ($2) {
        if ($b.check.id($2) == No!) { msg =$nick $ct $+ A luta $cc $+ $2 $ct $+ n�o existe. Digite ' $+ $cc $+ .Listar $+ $ct $+ ' para list�-las. | return }
        if (!$rini(cadastros,$nick,$3,Name)) { msg =$nick $ct $+ Voc� n�o tem o pok�mon selecionado. | return }
        if ($3 == Egg) { msg =$nick $ct $+ N�o � poss�vel usar $cc $+ Eggs $ct $+ em batalhas. | return }
      }
      else {
        var %l = $rini(cadastros,$nick,Info,Last)
        if (!%l) || ($npc($gettok(%l,3,58))) || ($dados($gettok(%l,3,58),Info,Hide)) { msg =$nick $ct $+ N�o h� registro de sua �ltima batalha. Determine o $cc $+ ID $ct $+ e o $cc $+ pok�mon $ct $+ que voc� quer usar para a batalha. | return }
        if ($checknickid($gettok(%l,3,58)) == No!) { msg =$nick $ct $+ Usu�rio $cc $+ $gettok(%l,3,58) $ct $+ n�o criou nenhuma luta. Para ver as lutas em andamento, digite $cc $+ .listar $+ $ct $+ . | return }
        if (!$rini(cadastros,$nick,$gettok(%l,2,58),Name)) { msg =$nick $ct $+ Pok�mon $cc $+ $gettok(%l,2,58) $ct $+ n�o foi encontrado. | return }
        tokenize 32 .Entrar $checknickid($gettok(%l,3,58)).id $gettok(%l,2,58)
      }
      if ($v([ [ B. ] $+ [ $2 ] $+ [ .Player.2 ] ])) { msg =$nick $ct $+ Esta luta j� possui 2 lutadores. | return }
      if ($v([ [ B. ] $+ [ $2 ] $+ [ .2vs2 ] ])) {
        if ($4) {
          if (!$rini(cadastros,$nick,$4,Name)) { msg =$nick $ct $+ Voc� n�o tem o pok�mon selecionado. | return }
          if ($4 == Egg) { msg =$nick $ct $+ N�o � poss�vel usar $cc $+ Eggs $ct $+ em batalhas. | return }
          if ($3 == $4) { msg =$nick $ct $+ Para batalhas em $cc $+ dupla $+ $ct $+ , use pok�mon $cc $+ diferentes $+ $ct $+ . | return }
        }
        else { msg =$nick $ct $+ Para entrar nesta batalha, voc� precisar� usar $cc $+ dois $ct $+ pok�mon. | return }
      }
      if ($v([ [ B. ] $+ [ $2 ] $+ [ .BattleTent ] ])) {
        var %l = $v([ [ B. ] $+ [ $2 ] $+ [ .BattleTent ] ]), %tent = $readini(pkp\status.ini,Tent,$replace(%l,$chr(32),_)), %rules = $gettok(%tent,1,59), %modes = $gettok(%tent,2,59)
        var %x = 0 | while (%x < $gettok(%rules,1,58)) {
          inc %x | var %pk = $rini(cadastros,$nick,Team,%x), %type = $iif(%type,%type $database(%pk,type),$database(%pk,type))
          if (!%pk) { msg =$nick $ct $+ Voc� est� violando uma das regras. Voc� precisa ter $cc $+ $numero($gettok(%rules,1,58)) $ct $+ pok�mon v�lidos no seu time. | return }
          if (%pk == Egg) { msg =$nick $ct $+ Voc� est� violando uma das regras. $cc $+ Egg $ct $+ n�o � um pok�mon v�lido. | return }
          if ($dados($nick,%pk,Level) < $gettok(%rules,2,58)) { msg =$nick $ct $+ Voc� est� violando a seguinte regra: $cc $+ level m�nimo $ct $+ dos pok�mon � $cc $+ $gettok(%rules,2,58) $+ $ct $+ . | return }
          if ($gettok(%rules,4,58) !isin $basestat(%pk,type)) && ($gettok(%rules,4,58)) { msg =$nick $ct $+ Voc� est� violando a seguinte regra: $cc $+ apenas $ct $+ pok�mon do tipo $cc $+ $gettok(%rules,4,58) $+ $ct $+ . | return }
          if ($gettok(%rules,5,58) isin $basestat(%pk,type)) && ($gettok(%rules,5,58)) { msg =$nick $ct $+ Voc� est� violando a seguinte regra: $cc $+ qualquer $ct $+ tipo de pok�mon $cc $+ exceto $gettok(%rules,5,58) $+ $ct $+ . | return }
          if (d isin %modes) { if ($totalpokes($nick) < 2) || ($dados($nick,Team,2) == Egg) { msg =$nick $ct $+ Para batalhar em dupla, � necess�rio no m�nimo $cc $+ dois $ct $+ pok�mon v�lidos no time! | return } }
        }
        if ($gettok(%rules,3,58)) {
          while ($gettok(%type,1,32)) && (!%monotype) { if ($findtok(%type,$gettok(%type,1,32),0,32) == $gettok(%rules,1,58)) { var %monotype = 1 } | var %type = $deltok(%type,1,32) }
          if (!%monotype) { msg =$nick $ct $+ Voc� est� violando uma das regras. � preciso que todos os membros do time tenham um tipo em comum. | return }
        }
        if ($v([ [ B. ] $+ [ $2 ] $+ [ .2vs2 ] ])) { b.join $2 $nick $rini(cadastros,$nick,Team,1) $rini(cadastros,$nick,Team,2) } | else { b.join $2 $nick $rini(cadastros,$nick,Team,1) }
        if ($rini(cadastros,$v([ [ B. ] $+ [ $2 ] $+ [ .Player.1 ] ]),Perfil,12) == ON) { b.start.fight $checknickid($nick).ID | return }
        else { set %confirm. [ $+ [ $v([ [ B. ] $+ [ $2 ] $+ [ .Player.1 ] ]) ] ] BAT: $+ $2 | msg =$nick $ct $+ Seu pedido de batalha foi enviado. Aguarde. | msg = [ $+ [ $v([ [ B. ] $+ [ $2 ] $+ [ .Player.1 ] ]) ] ] $cc $+ $v([ [ B. ] $+ [ $2 ] $+ [ .Player.1 ] ]) $+ $ct $+ , $cc $+ $nick $ct $+ entrou em sua batalha no $cc $+ Battle Tent $+ $ct $+ . Para iniciar esta batalha, digite $cc $+ .Sim $ct $+ ou $cc $+ .nao $ct $+ para recusar o advers�rio. | return }
      }
      b.join $2 $dados($nick,Info,Nick) $3 $iif($v([ [ B. ] $+ [ $2 ] $+ [ .2vs2 ] ]),$4) | if ($dados($v([ [ B. ] $+ [ $2 ] $+ [ .Player.1 ] ]),Info,Perfil,15)) { b.start.fight $checknickid($nick).ID | return }
      else { set %confirm. [ $+ [ $v([ [ B. ] $+ [ $2 ] $+ [ .Player.1 ] ]) ] ] BAT: $+ $2 | msg =$nick $ct $+ Seu pedido de batalha foi enviado. Aguarde.
        if ($v([ [ B. ] $+ [ $2 ] $+ [ .2vs2 ] ])) { msg = [ $+ [ $v([ [ B. ] $+ [ $2 ] $+ [ .Player.1 ] ]) ] ] $cc $+ $v([ [ B. ] $+ [ $2 ] $+ [ .Player.1 ] ]) $+ $ct $+ , $cc $+ $nick $ct $+ est� querendo lutar com voc� usando $cc $+ $rini(cadastros,$nick,$3,Name) $+ $ct $+ , $ct $+ lv $cc $+ $rini(cadastros,$nick,$3,Level) $+ $ct $+ , e $cc $+ $rini(cadastros,$nick,$4,Name) $+ $ct $+ , $ct $+ lv $cc $+ $rini(cadastros,$nick,$4,Level) $+ $ct $+ . Para iniciar esta luta, digite $cc $+ .sim $+ $ct $+ . Para cancel�-la e aguardar novos jogadores, digite $cc $+ .nao $+ $ct $+ . }
        else { msg = [ $+ [ $v([ [ B. ] $+ [ $2 ] $+ [ .Player.1 ] ]) ] ] $cc $+ $v([ [ B. ] $+ [ $2 ] $+ [ .Player.1 ] ]) $+ $ct $+ , $cc $+ $nick $ct $+ est� querendo lutar com voc� usando $cc $+ $rini(cadastros,$nick,$3,Name) $+ $ct $+ , $ct $+ lv $cc $+ $rini(cadastros,$nick,$3,Level) $+ $ct $+ . Para iniciar esta luta, digite $cc $+ .sim $+ $ct $+ . Para cancel�-la e aguardar novos jogadores, digite $cc $+ .nao $+ $ct $+ . }
        return
      }
    }
    elseif ($1 == .Moveset) {
      if ($checknickid($nick) == Ok!) { msg =$nick $ct $+ Voc� n�o pode adicionar um golpe durante uma luta. | return }
      if (!$rini(cadastros,$nick,$2,Name)) { msg =$nick $ct $+ Voc� n�o tem o pok�mon selecionado. | return }
      if ($3 !isnum 1-4) { msg =$nick $ct $+ O Slot selecionado � inexistente. Reveja a sintaxe do comando. | return }
      if ($left($rmove($rini(cadastros,$nick,$2,Move [ $+ [ $3 ] ])).s,2) == HM) { msg =$nick $ct $+ N�o � poss�vel apagar uma $cc $+ habilidade $ct $+ do pok�mon. | return }
      var %move = $4-
      if ($left(%move,2) == TM) || ($left(%move,2) == HM) || ($left(%move,2) == MT) {
        if ($item($nick,%move).check == No!) { .msg =$nick $ct $+ Voc� n�o tem o item selecionado. | return }
        if ($findtok($read(pkp\techniques.txt,s,$2),%move,0,32)) { var %item = %move, %move = $rmove(%move) }
        else { .msg =$nick $cc $+ $rini(cadastros,$nick,$2,Name) $ct $+ n�o pode aprender o $cc $+ $upper(%move) $+ $ct $+ . | return }
      }
      else { if (!$count($rini(cadastros,$nick,$2,Learn),$4-)) { msg =$nick $ct $+ O golpe selecionado n�o pode ser aprendido no level atual. | return } }
      if ($rini(cadastros,$nick,$2,Move1) == %move) || ($rini(cadastros,$nick,$2,Move2) == %move) || ($rini(cadastros,$nick,$2,Move3) == %move) || ($rini(cadastros,$nick,$2,Move4) == %move) { msg =$nick $ct $+ O golpe selecionado j� foi ensinado ao pok�mon. | return }
      if (%item) { if ($left(%item,2) != HM) { item.rem $nick %item } | var %item = 0 }
      else { var %learn = $rini(cadastros,$nick,$2,Learn), %move = $gettok(%learn,$findtok(%learn,$4-,1,58),58), %res = $remtok(%learn,$4-,1,58) | if (%res) { writeini pkp\cadastros\ $+ $nick $+ .ini $2 Learn %res } | else { remini pkp\cadastros\ $+ $nick $+ .ini $2 Learn } }
      writeini pkp\cadastros\ $+ $nick $+ .ini $2 Move [ $+ [ $3 ] ] %move
      wlog user $nick %move was taught to $basestat($2) at slot $3 $+ .
      msg =$nick $ct $+ Golpe $cc $+ %move $ct $+ adicionado no Slot $cc $+ $3 $+ $ct $+ . | return
    }
    elseif ($1 == .Desistir) {
      if ($checknickid($nick) == No!) { msg =$nick $ct $+ Voc� n�o est� participando de nenhuma batalha. | return }
      var %ID = $checknickid($nick).id
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait.2 ] ])) { msg =$nick $ct $+ Voc� n�o pode desistir de uma luta depois que ela j� tiver come�ado. | return }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Player.2 ] ])) {
        if ($nick == $v([ [ B. ] $+ [ %ID ] $+ [ .Player.1 ] ])) { msg =$nick $ct $+ Sua luta foi cancelada. | msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player.2 ] ]) ] ] $cc $+ $nick $ct $+ desistiu da batalha. | b.remove.fila $nick | unset %confirm. [ $+ [ $nick ] ] | return }
        else { var %x = 0 | while (%x < 4) { inc %x | if ($v([ [ B. ] $+ [ %id ] $+ [ .Player. ] $+ [ %x ] ]) == $nick) { var %n = $battle.player(%ID,%x) } } | msg =$nick $ct $+ Seu pedido de luta com $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player.1 ] ]) $ct $+ foi cancelado. | msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player.1 ] ]) ] ] $cc $+ $nick $ct $+ desistiu da batalha. | unset %confirm. [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player.1 ] ]) ] ] | b.left %ID %n | return }
      }
      if ($timer($+(RANDOM,.,$nick))) { .timer $+ $+(RANDOM,.,$nick) off }
      b.remove.fila $nick | uset [ [ B. ] $+ [ %ID ] $+ [ * ] ] | msg =$nick $ct $+ Sua luta foi cancelada. | return
    }
    elseif ($1 == .Perfil) {
      var %l = $lines(pkp\perfil.txt)
      if ($2 == set) {
        if ($3 !isnum 1- $+ %l) { msg =$nick $ct $+ O n�mero fornecido n�o existe ou n�o est� dispon�vel. Digite ' $+ $cc $+ .Perfil List $+ $ct $+ ' para list�-las, ou apenas ' $+ $cc $+ .Perfil $+ $ct $+ ' para mais informa��es. | return }
        var %s = $upper($4)
        if (%s) { if (!$findtok(ON:OFF,%s,0,58)) { msg =$nick $ct $+ Especifique $cc $+ ON $ct $+ para habilitar uma op��o ou $cc $+ OFF $ct $+ para desabilit�-la. | return } | if (%s == $iif($dados($nick,Info,Perfil,$3),ON,OFF)) { msg =$nick $ct $+ Nenhuma altera��o foi realizada. | return } }
        else { var %s = $iif($dados($nick,Info,Perfil,$3),OFF,ON) }
        .echo $iif(%s == ON,$dados($nick,Info,Perfil,$3).on,$dados($nick,Info,Perfil,$3).off) | msg =$nick $ct $+ A op��o $chr(35) $+ $cc $+ $3 $ct $+ foi mudada para ' $+ $cc $+ %s $+ $ct $+ '. | wlog user $nick Perfil changed to ' $+ %s $+ ' at option number $3 $+ . | return
      }
      elseif ($2 == list) {
        msg =$nick $ct $+ Exibindo as op��es do seu $cc $+ Perfil $+ $ct $+ :
        var %x = 0 | while (%x < %l) { inc %x | msg =$nick $chr(160) $ct $+ $chr(35) $+ $cc $+ $base(%x,10,10,2) $iif($dados($nick,Info,Perfil,%x),$ct $+ $chr(40) $+ $cc $+ $chr(215) $+ $ct $+ $chr(41),$ct $+ $chr(40) $+ $chr(32) $+ $ct $+ $chr(41)) $ct $+ $read(pkp\perfil.txt,%x) }
        msg =$nick $ct $+ Fim da exibi��o.
        return
      }
      else {
        msg =$nick $ct $+ Bem vindo ao seu $cc $+ Perfil $+ $ct $+ ! Atrav�s dele, � poss�vel configurar os padr�es de acesso de acordo com suas prefer�ncias.
        msg =$nick $chr(160) $cc $+ $arrange(.Perfil List,160,24) $ct $+ - Lista as op��es dispon�veis, enumeradas;
        msg =$nick $chr(160) $cc $+ $arrange(.Perfil Set <N> (ON/OFF),160,24) $ct $+ - Marca/desmarca uma op��o do seu perfil;
        msg =$nick $ct $+ Ao listar as op��es, voc� poder� ver o n�mero correspondente � cada op��o. A seguir, se quiser acion�-la, use a sintaxe acima, substituindo $cc $+ <N> $ct $+ pelo n�mero correspondente e $cc $+ ON $ct $+ para acionar, ou $cc $+ OFF $ct $+ para cancelar. Se nada for especificado, a op��o ser� marcada ou desmarcada de acordo com seu estado atual.
        return
      }
    }
    elseif ($1 == .Dados) {
      var %x = $tevent(Dados,$nick).time
      if (%x) { var %r = $calc($ctime($date $time) - $ctime(%x)) | if (%r >= 3) { goto dados } | else { msg =$nick $ct $+ Voc� s� pode usar o comando ' $+ $cc $+ .Dados $+ $ct $+ ' num intervalo de $cc $+ tr�s $ct $+ segundos. | return } }
      else {
        :dados
        if ($is_rental($nick)) { view.dados.rental $nick $2 }
        else {
          if ($2) {
            if (!$basestat($2,etype)) && ($2 != Egg) { if ($2 == $nick) { view.dados 1 $2- } | else { view.dados 0 $2- } }
            else { view.dados 1 $nick $2 }
          }
          else { view.dados 1 $nick }
        }
        return
      }
    }
    elseif ($1 == .Premium) {
      if (%premium) || (%premium.users) {
        var %x = $tevent(Premium,$nick).time
        if (%x) { var %r = $calc($ctime($date $time) - $ctime(%x)) | if (%r >= 30) { goto premium } | else { msg =$nick $ct $+ Voc� s� pode usar o comando ' $+ $cc $+ .Premium $+ $ct $+ ' num intervalo de $cc $+ trinta $ct $+ segundos. | return } }
        else {
          :premium
          tevent Premium $nick
          if (%premium.users) { if ($chat(0) == %premium.users) { premium add $dados($nick,Info,Nick) 7 | sendamsg $nick $ct $+ Parab�ns! $cc $+ $dados($nick,Info,Nick) $ct $+ ganhou uma conta premiada de $cc $+ sete $ct $+ dias! N�mero de usu�rios conectados: $cc $+ $chat(0) $+ $ct $+ . | unset %premium.users | return } }
          if (%premium) {
            if ($findtok(%premium,$2-,0,32)) { premium add $dados($nick,Info,Nick) $gettok(3 3 2 2 1,$rini(cadastros,$nick,Info,Access),32) | sendamsg $nick $ct $+ Parab�ns! $cc $+ $dados($nick,Info,Nick) $ct $+ ganhou uma conta premiada! Senha usada: ' $+ $cc $+ $gettok(%premium,$findtok(%premium,$2-,1,32),32) $+ $ct $+ '. | if (%premium == $2-) { unset %premium } | else { set %premium $remtok(%premium,$2-,1,32) } }
            else { msg =$nick $ct $+ Senha ' $+ $cc $+ $2- $+ $ct $+ ' incorreta. Tente novamente. }
          }
        }
      }
      else { msg =$nick $ct $+ Este comando n�o pode ser utilizado neste momento. }
      return
    }
    elseif ($1 == .Premio) {
      if ($readini(pkp\status.ini,Prize,Active)) {
        if ($checknickid($nick) == Ok!) { msg =$nick $ct $+ Voc� n�o pode participar da premia��o enquanto batalha! | return }
        if ($v(Watch. [ $+ [ $nick ] ])) { msg =$nick $ct $+ Voc� n�o pode participar da premia��o enquanto assiste a outras batalhas. Para parar de assisti-la, digite ' $+ $cc $+ .Assistir $+ $ct $+ '. | return }
        if (%confirm. [ $+ [ $nick ] ]) { msg =$nick $ct $+ Antes de participar da premia��o, digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar o �ltimo pedido. | return }
        if (!$dados($nick,Team,1)) { msg =$nick $ct $+ Antes de participar de premia��es, � preciso adquirir um pok�mon! | return }
        var %x = $tevent(Premio,$nick).time, %r = $calc($ctime($date $time) - $ctime(%x))
        if (%x) && (%r < 10) { msg =$nick $ct $+ N�o fa�a flood com este comando. Voc� poder� reutiliz�-lo em $cc $+ $calc(10 - %r) $ct $+ $iif($calc(10 - %r) > 1,segundos.,segundo.) | return }
        var %prize.turn = $readini(pkp\status.ini,Prize,Turn), %my.turn = %premio. [ $+ [ $nick ] ]
        if ($iif(%my.turn,%my.turn,0) < %prize.turn) {
          var %type = $readini(pkp\status.ini,Prize,Type), %prize = $prize, %pass = $2-
          if (%type == Pokemon) {
            if ($dados($nick,%prize,Name)) { msg =$nick $ct $+ Voc� j� tem um pok�mon de mesmo nome da premia��o! Se quiser participar, precisar� remover $cc $+ %prize $ct $+ do time. | return }
            if ($dados($nick,Team,6)) { msg =$nick $ct $+ Voc� j� tem seis pok�mon! Libere espa�o em seu time para participar da premia��o. | return }
          }
          var %game.type = $readini(pkp\status.ini,Prize,GameType), %range = $readini(pkp\status.ini,Prize,Range), %times = $readini(pkp\status.ini,Prize,Times), %a = $readini(pkp\status.ini,Prize,Answer), %sec = $gettok($dur($timer(Premio).secs),1,32)
          if (%pass) {
            if (%game.type == 1) {
              if ($len(%pass) != %times) { msg =$nick $ct $+ Sua senha deve conter $cc $+ $numero(%times) $ct $+ d�gitos. | return }
              var %x = 0 | while (%x < %times) { inc %x | if ($mid(%pass,1,1) !isnum $+(1-,%range)) { msg =$nick $ct $+ Sua senha cont�m caracteres inv�lidos. Apenas os n�meros $cc $+ 1 $ct $+ a $cc $+ %range $ct $+ s�o permitidos! | return } }
              if (%pass != %a) {
                var %x = 0, %r = 0 | while (%x < %times) { inc %x | if ($mid(%pass,%x,1) == $mid(%a,%x,1)) { inc %r } | else { var %x = %times } }
                if (%r) { msg =$nick $ct $+ Voc� acertou $iif(%r > 0,os,o) $cc $+ $numero(%r) $ct $+ primeir $+ $iif(%r > 0,os,o) d�git $+ $iif(%r > 0,os,o) $+ : " $+ $cc $+ $left(%a,%r) $+ $str($chr(183),$calc(%times - %r)) $+ $ct $+ ". Aguarde $+ $chr(44) $iif(%sec > 1,faltam,falta) $dur($timer(Premio).secs,$ct,$cc) para a pr�xima rodada. }
                else { msg =$nick $ct $+ Voc� errou o primeiro d�gito. Aguarde $+ $chr(44) $iif(%sec > 1,faltam,falta) $dur($timer(Premio).secs,$ct,$cc) para a pr�xima rodada. }
                set %premio. [ $+ [ $nick ] ] %prize.turn
                return
              }
            }
            if (%game.type == 2) {
              if (%pass !isnum) || (%pass < 0) { msg =$nick $ct $+ Voc� cometeu um erro na sua resposta. Verifique as regras novamente, digitando ' $+ $cc $+ .Premio $+ $ct $+ '. | return }
              if (%pass != %a) {
                msg =$nick $ct $+ Infelizmente a soma n�o � ' $+ $cc $+ $int(%pass) $+ $ct $+ '. Aguarde $+ $chr(44) $iif(%sec > 1,faltam,falta) $dur($timer(Premio).secs,$ct,$cc) para a pr�xima rodada.
                set %premio. [ $+ [ $nick ] ] %prize.turn | return
              }
            }
            if (%game.type == 3) {
              var %a = $gettok($readini(pkp\status.ini,Prize,Q $+ %prize.turn),2,172)
              if (%pass != %a) {
                msg =$nick $ct $+ Sua resposta est� $cc $+ incorreta $+ $ct $+ . Aguarde $+ $chr(44) $iif(%sec > 1,faltam,falta) $dur($timer(Premio).secs,$ct,$cc) para a pr�xima rodada.
                set %premio. [ $+ [ $nick ] ] %prize.turn | var %point = 0
              }
              else {
                msg =$nick $ct $+ Parab�ns! Voc� ganhou um ponto pela resposta $cc $+ correta $+ $ct $+ ! $iif(%prize.turn < %times,Aguarde $+ $chr(44) $iif(%sec > 1,faltam,falta) $dur($timer(Premio).secs,$ct,$cc) para a pr�xima rodada.,Agora $+ $chr(44) aguarde pela contabiliza��o dos pontos.)
                var %point = 1
              }
              var %score = $readini(pkp\status.ini,Prize,Score)
              if ($wildtok(%score,* $nick,0,58)) {
                if (%point) {
                  var %my.score = $wildtok(%score,* $nick,1,58), %m = $findtok(%score,%my.score,1,58) | writeini pkp\status.ini Prize Score $puttok(%score,$base($calc($gettok(%my.score,1,32) + %point),10,10,2) $nick,%m,58)
                  set %premio. [ $+ [ $nick ] ] %prize.turn
                }
              }
              else {
                writeini pkp\status.ini Prize Score $addtok(%score,$base(%point,10,10,2) $nick,58)
                writeini pkp\cadastros\ $+ $nick $+ .ini Info Lock .Market;.Daycare;.Evoluir;.Trade;.PC
              }
              return
            }
            if (%game.type == 4) {
              if (%pass != %a) {
                msg =$nick $ct $+ Senha $cc $+ incorreta $+ $ct $+ .
                set %premio. [ $+ [ $nick ] ] %prize.turn
                return
              }
            }
            premio.add $nick | sendamsg $me $cc $+ $dados($nick,Info,Nick) $ct $+ foi o vencedor da premia��o! Resposta correta: ' $+ $cc $+ %a $+ $ct $+ '.
            premio.clear | return
          }
          else {
            if (%game.type == 1) {
              msg =$nick $ct $+ Este jogo consiste em determinar os d�gitos de uma $cc $+ senha $ct $+ formada apenas por $cc $+ n�meros $+ $ct $+ . Quem descobrir esta senha primeiro, ser� o vencedor.
              msg =$nick $ct $+ A senha cont�m $cc $+ $numero(%times) $ct $+ d�gitos e estes podem ser os n�meros $cc $+ 1 $ct $+ a $cc $+ %range $+ $ct $+ , n�o havendo restri��es quanto a repeti��o deles na senha, muito menos quanto � utiliza��o de todos eles.
              msg =$nick $chr(160) $ct $+ Digite " $+ $cc $+ .Premio <Senha> $+ $ct $+ " para fazer a sua tentativa. A pr�xima rodada ocorrer� em $dur($timer(Premio).secs,$ct,$cc) $+ .
            }
            elseif (%game.type == 2) {
              msg =$nick $ct $+ Este jogo consiste em determinar a soma dos dados lan�ados. Quem cumprir esta tarefa, ser� o vencedor.
              msg =$nick $ct $+ Foram lan�ados $cc $+ $numero(%times) $ct $+ dados, cada qual com $cc $+ $numero(%range) $ct $+ faces. Cada rodada reveler� o n�mero obtido do dado seguinte. Neste momento, os dados exibidos s�o os seguintes:
              var %r, %x = 0, %prize.faces = $readini(pkp\status.ini,Prize,Faces) | while (%x < %times) { inc %x | var %r = %r $chr(124) $+ $rct $iif(%prize.turn > %x,$gettok(%prize.faces,%x,32),$chr(160)) $ct $+ $chr(124) }
              msg =$nick $chr(160) $ct $+ %r
              msg =$nick $chr(160) $ct $+ Digite " $+ $cc $+ .Premio <Soma> $+ $ct $+ " para fazer a sua tentativa. A pr�xima rodada ocorrer� em $dur($timer(Premio).secs,$ct,$cc) $+ .
            }
            elseif (%game.type == 3) {
              msg =$nick $ct $+ Este jogo consiste em responder corretamente �s perguntas lan�adas. Cada resposta correta ser� pontuada.
              msg =$nick $ct $+ Ao terminar todas as $cc $+ $numero2(%times) $+ $ct $+ , aquele que tiver obtido mais pontos ser� o vencedor. Se houver empate, o vencedor ser� escolhido aleatoriamente.
              msg =$nick $chr(160) $ct $+ Pergunta ( $+ $cc $+ %prize.turn $+ $ct $+ / $+ $cc $+ %times $+ $ct $+ ):
              msg =$nick $chr(160) $chr(160) $ct $+ $gettok($readini(pkp\status.ini,Prize,Q $+ %prize.turn),1,172)
              msg =$nick $chr(160) $ct $+ Digite " $+ $cc $+ .Premio <Resposta> $+ $ct $+ " para responder. A pr�xima pergunta estar� dispon�vel em $dur($timer(Premio).secs,$ct,$cc) $+ .
            }
            else {
              msg =$nick $ct $+ Este jogo consiste apenas em inserir uma senha determinada anteriormente. O organizador deste evento fornecer� informa��es para desvend�-la. Lembre-se, entretanto, que o uso de uma senha incorreta o eliminar� desta premia��o, pois n�o h� outras chances dispon�veis.
              msg =$nick $chr(160) $ct $+ Digite " $+ $cc $+ .Premio <Senha> $+ $ct $+ " para participar. Esta senha estar� indispon�vel em $dur($timer(Premio).secs,$ct,$cc) $+ .
            }
            if (%type == Pokemon) { var %n = o pok�mon $cc $+ %prize }
            elseif (%type == Premium) { var %n = uma conta $cc $+ premiada }
            elseif (%type == Dinheiro) { var %n = uma quantia em dinheiro de $cc $+ $chr(36) $+ $getmoney(%prize) }
            elseif (%type == Milhagem) { var %n = $cc $+ %prize $ct $+ Pok�Milhas }
            msg =$nick $ct $+ O vencedor obter� %n $+ $ct $+ . Boa sorte!
          }
        }
        else {
          .msg =$nick $ct $+ Voc� j� fez a sua tentativa! $iif($readini(pkp\status.ini,Prize,GameType) != 4,Aguarde $+ $chr(44) $iif(%sec > 1,faltam,falta) $dur($timer(Premio).secs,$ct,$cc) para a pr�xima rodada.)
          tevent Premio $nick
          return
        }
      }
      else { .msg =$nick $ct $+ N�o h� premia��o alguma em andamento. | return }
    }
    elseif ($1 == .Milhagem) {
      if ($2) {
        if ($checknickid($nick) == Ok!) { msg =$nick $ct $+ N�o � poss�vel acessar as milhagens enquanto batalha. | return }
        if ($v(Watch. [ $+ [ $nick ] ])) { msg =$nick $ct $+ Voc� est� assistindo a batalha de ID $cc $+ $v(Watch. [ $+ [ $nick ] ]) $+ $ct $+ . Para parar de assisti-la, digite ' $+ $cc $+ .Assistir $+ $ct $+ '. | return }
        if (%confirm. [ $+ [ $nick ] ]) { msg =$nick $ct $+ Antes de acessar as milhagens, digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar o �ltimo pedido. | return }
        if (%stand. [ $+ [ $nick ] ]) { unset %stand. [ $+ [ $nick ] ] }
        if ($2 == Wild) {
          var %m = $rini(cadastros,$nick,Info,Milhagem) | if ($calc(%m / 600) < 100) { msg =$nick $ct $+ Voc� n�o tem milhagens $cc $+ suficientes $ct $+ para liberar os pok�mon selvagens! | return }
          var %x = $gettok($dados($nick,Time,Wild),1,59), %y = $gettok($dados($nick,Time,Wild),2,59), %y = $iif(%y,%y,0), %pr = $dados($nick,Info,Premium), %r = $calc($ctime($date $time) - $ctime(%x))
          if (!%x) || (%y < $iif(%pr,6,3)) || (%r >= 86400) || ($calc($dados($nick,Info,Online) - $dados($nick,Clock,Wild)) >= $iif(%pr,1800,3600)) { msg =$nick $ct $+ Ainda � poss�vel batalhar com pok�mon selvagem! | return }
          wlog user $nick Traded miles for a newly wild.
          writeini pkp\cadastros\ $+ $nick $+ .ini Info Milhagem $calc(%m - (100 * 600)) | remini pkp\cadastros\ $+ $nick $+ .ini Time Wild | msg =$nick $ct $+ Voc� converteu $cc $+ 100 $ct $+ Pok�Milhas em novas batalhas com pok�mon $cc $+ selvagem $+ $ct $+ . | return
        }
        elseif ($2 == Loja) {
          var %l = $rini(cadastros,$nick,Info,Locate), %ac = $rini(cadastros,$nick,Info,Access)
          if ($shop(%l)) {
            if ($3) {
              if ($3 == Comprar) {
                if ($4 isnum) { if ($4 isnum 1-99) { var %qnt = $int($4), %i = $item.data($5-,name) } | else { msg =$nick $ct $+ Determine um n�mero $cc $+ v�lido $ct $+ de itens para comprar. | return } } | else { var %qnt = 1, %i = $item.data($4-,name) }
                if ($findtok($shop(Milhagem,%ac),%i,0,58)) {
                  var %p = $item.data(%i,milha), %m = $rini(cadastros,$nick,Info,Milhagem)
                  if (!%qnt) { msg =$nick $ct $+ Nenhum item foi comprado. | return }
                  if ($calc($item($nick,%i).qnt + %qnt) > 99) { msg =$nick $ct $+ Voc� n�o pode carregar mais do que $cc $+ %i $ct $+ (� $+ $cc $+ 99 $+ $ct $+ )! | return }
                  if ($calc(%m / 600) < $calc(%p * %qnt)) {
                    if (%qnt > 1) { msg =$nick $ct $+ Voc� n�o tem $cc $+ $calc(%p * %qnt) $ct $+ Pok�Milhas para comprar $cc $+ %i $ct $+ (� $+ $cc $+ $base(%qnt,10,10,2) $+ $ct $+ )! }
                    else { msg =$nick $ct $+ Voc� n�o tem $cc $+ $calc(%p * %qnt) $ct $+ Pok�Milhas para comprar $cc $+ %i $+ $ct $+ ! } | return
                  }
                  var %u = $item.data(%i,use)
                  if ($findtok(Special:Mult,%u,0,58)) { if ($item($nick,%i).qnt) { msg =$nick $ct $+ Voc� j� possui o item $cc $+ %i $+ $ct $+ . | return } | if (%qnt > 1) { msg =$nick $ct $+ Voc� n�o pode carregar mais de um $cc $+ %i $ct $+ em sua mochila! | return } }
                  wlog user $nick %i (� $+ $base(%qnt,10,10,2) $+ ) $iif(%qnt > 1,were,was) bought with Pok�Milhas.
                  writeini pkp\cadastros\ $+ $nick $+ .ini Info Milhagem $calc(%m - (%p * %qnt * 600)) | item.add $nick %i $+ : $+ %qnt | msg =$nick $cc $+ %i $ct $+ (� $+ $cc $+ $base(%qnt,10,10,2) $+ $ct $+ ) $iif(%qnt > 1,foram comprados,foi comprado) com sucesso. Voc� ainda tem $cc $+ $dados($nick,Info,Milhagem) $ct $+ Pok�Milhas.
                }
                else { msg =$nick $ct $+ O item selecionado n�o foi encontrado. | return }
              }
              else { msg =$nick $ct $+ Erro de sintaxe do comando. Digite ' $+ $cc $+ .Milhagem loja $+ $ct $+ ' para mais informa��es. }
            }
            else {
              msg =$nick $ct $+ Bem vindo a loja de milhagem de $cc $+ %l $+ $ct $+ , $cc $+ $nick $+ $ct $+ !
              msg =$nick $ct $+ Exibindo lista de artigos:
              var %i = $shop(Milhagem,%ac), %x = 0, %t = $gettok(%i,0,58)
              while (%x < %t) {
                inc %x | var %ti = $gettok(%i,%x,58)
                msg =$nick $chr(160) $cc $+ $arrange($item.data(%ti,name),160,15) $ct $+ Pok�Milhas: $cc $+ $arrange($item.data(%ti,milha),160,4) $ct $+ Descri��o: $cc $+ $item.data(%ti,desc)
              }
              msg =$nick $ct $+ Fim da lista de artigos.
              msg =$nick $chr(160) $cc $+ Vendedor $ct $+ - Ol�! Para comprar alguma coisa, digite $cc $+ .milhagem loja comprar <item> $+ $ct $+ .
            }
            return
          }
          else { msg =$nick $ct $+ N�o h� lojas em sua cidade atual. | return }
        }
        elseif ($2 == Goto) {
          var %m = $rini(cadastros,$nick,Info,Milhagem) | if ($calc(%m / 600) < 20) { msg =$nick $ct $+ Voc� n�o tem milhas $cc $+ suficientes $ct $+ para liberar a passagem entre cidades! | return }
          var %x = $dados($nick,Time,Goto), %r = $calc($ctime($date $time) - $ctime(%x))
          if (!%x) || (%r >= $iif($item($nick,Running Shoes).qnt,600,1200)) { msg =$nick $ct $+ Voc� j� pode mover-se entre cidades! | return }
          wlog user $nick Traded miles for a move between places.
          writeini pkp\cadastros\ $+ $nick $+ .ini Info Milhagem $calc(%m - (20 * 600)) | remini pkp\cadastros\ $+ $nick $+ .ini Time Goto | msg =$nick $ct $+ Voc� converteu $cc $+ 20 $ct $+ Pok�Milhas em uma passagem entre $cc $+ cidades $+ $ct $+ . | return
        }
        elseif ($2 == Rental) {
          var %m = $rini(cadastros,$nick,Info,Milhagem) | if ($calc(%m / 600) < 50) { msg =$nick $ct $+ Voc� n�o tem milhas $cc $+ suficientes $ct $+ para liberar um desafio no $cc $+ Battle Rental $+ $ct $+ ! | return }
          var %x = $dados($nick,Time,Rental), %x = $iif(%x,$ctime(%x),0), %r = $calc($ctime($date $time) - %x), %time = $readini(pkp\status.ini,Active,Rental)
          if (%r >= %time) { msg =$nick $ct $+ N�o � necess�rio trocar suas milhas. Voc� pode enfrentar o $cc $+ Battle Rental $ct $+ neste momento. | return }
          wlog user $nick Traded miles for playing rental.
          writeini pkp\cadastros\ $+ $nick $+ .ini Info Milhagem $calc(%m - (50 * 600)) | remini pkp\cadastros\ $+ $nick $+ .ini Time Rental | msg =$nick $ct $+ Voc� converteu $cc $+ 50 $ct $+ Pok�Milhas em um desafio no $cc $+ Battle Rental $+ $ct $+ . | return
        }
        elseif ($2 == Cash) {
          var %m = $rini(cadastros,$nick,Info,Milhagem), %g = $dados($nick,Info,Money) | if ($calc(%m / 600) < 10) { msg =$nick $ct $+ Voc� n�o tem milhas $cc $+ suficientes $ct $+ para trocar por grana! | return }
          wlog user $nick Traded miles for cash.
          writeini pkp\cadastros\ $+ $nick $+ .ini Info Milhagem $calc(%m - (10 * 600)) | writeini pkp\cadastros\ $+ $nick $+ .ini Info Money $calc(%g + 1000) | msg =$nick $ct $+ Voc� converteu $cc $+ 10 $ct $+ Pok�Milhas em $cc $+ $chr(36) $+ 1000 $ct $+ de dinheiro. | return
        }
        elseif ($2 == Ship) && ($dados($nick,$dados($nick,Info,Start),Badges).n == 8) {
          var %m = $rini(cadastros,$nick,Info,Milhagem) | if ($calc(%m / 600) < 300) { msg =$nick $ct $+ Voc� n�o tem milhas $cc $+ suficientes $ct $+ para liberar a passagem entre continentes! | return }
          var %x = $dados($nick,Clock,Ship) | if (!%x) || ($calc($dados($nick,Info,Online) - %x) >= 21600) { msg =$nick $ct $+ Voc� j� pode viajar entre continentes! | return }
          wlog user $nick Traded miles for a ship passage.
          writeini pkp\cadastros\ $+ $nick $+ .ini Info Milhagem $calc(%m - (300 * 600)) | remini pkp\cadastros\ $+ $nick $+ .ini Clock Ship | msg =$nick $ct $+ Voc� converteu $cc $+ 300 $ct $+ Pok�Milhas em uma passagem entre $cc $+ continentes $+ $ct $+ . | return
        }
        else { .msg =$nick $ct $+ N�o existe a op��o selecionada ou est� indispon�vel. Digite ' $+ $cc $+ .Milhagem $+ $ct $+ ' para saber como gastar suas Pok�Milhas. | return }
      }
      else {
        msg =$nick $ct $+ Voc� pode converter suas $cc $+ Pok�Milhas $ct $+ em diversas tarefas aqui no bot. A seguir est� a rela��o de comandos:
        msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .Milhagem Wild $+ $ct $+ ' para converter $cc $+ 100 $ct $+ Pok�Milhas $ct $+ em novas batalhas com pok�mon $cc $+ selvagem $+ $ct $+ ;
        msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .Milhagem Loja $+ $ct $+ ' para $cc $+ comprar $ct $+ itens usando Pok�Milhas. � necess�rio que sua cidade atual possua uma loja;
        msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .Milhagem Goto $+ $ct $+ ' e gastando apenas $cc $+ 20 $ct $+ Pok�Milhas voc� poder� se locomover novamente entre $cc $+ cidades $+ $ct $+ ;
        msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .Milhagem Rental $+ $ct $+ ' para converter $cc $+ 50 $ct $+ Pok�Milhas em novo desafio no $cc $+ Battle Rental $+ $ct $+ .
        if ($dados($nick,$dados($nick,Info,Start),Badges).n == 8) { msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .Milhagem Ship $+ $ct $+ ' e gastando $cc $+ 300 $ct $+ Pok�Milhas voc� poder� se locomover novamente entre $cc $+ continentes $+ $ct $+ ; }
        msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .Milhagem Cash $+ $ct $+ ' para converter $cc $+ 10 $ct $+ Pok�Milhas em $cc $+ $chr(36) $+ 1000 $ct $+ de grana.
        msg =$nick $ct $+ Fim da rela��o de comandos.
        return
      }
    }
    elseif ($1 == .Evoluir) {
      if ($checknickid($nick) == Ok!) { msg =$nick $ct $+ Voc� n�o pode evoluir um pok�mon durante uma luta. | return }
      if (!$rini(cadastros,$nick,$2,Name)) { msg =$nick $ct $+ Voc� n�o tem o pok�mon selecionado. | return }
      if ($v(Watch. [ $+ [ $nick ] ])) { msg =$nick $ct $+ Voc� est� assistindo a batalha de ID $cc $+ $v(Watch. [ $+ [ $nick ] ]) $+ $ct $+ . Para parar de assisti-la, digite ' $+ $cc $+ .Assistir $+ $ct $+ '. | return }
      if (%stand. [ $+ [ $nick ] ]) { unset %stand. [ $+ [ $nick ] ] }
      if ($3) {
        if ($basestat($3,Type)) {
          if ($rini(cadastros,$nick,$3,Name)) { msg =$nick $ct $+ N�o foi poss�vel tentar evolu�-lo para $cc $+ $3 $+ $ct $+ . Voc� j� possui um $cc $+ pok�mon $ct $+ com o $cc $+ mesmo nome $ct $+ no time! | return }
          if ($evolve($nick,$2,$3) == Ok!) {
            var %poke = $3, %player = $nick
            if ($pokedex(%player,%poke) == $false) { .echo $pokedex(%player,%poke).add }
            evolvepoke %player $2 %poke | var %nmove = $check.move(%poke,$rini(cadastros,%player,%poke,Level))
            if (%nmove) {
              var %x = 1 | while ($gettok(%nmove,%x,58)) {
                if ($learned(%player,%poke,$gettok(%nmove,%x,58)) == No!) && (!$findtok($rini(cadastros,%nick,%poke,Learn),$gettok(%nmove,%x,58),0,58)) {
                  if ($rini(cadastros,%player,%poke,Move4)) { if ($rini(cadastros,%player,%poke,Learn)) { writeini pkp\cadastros\ $+ %player $+ .ini %poke Learn $rini(cadastros,%player,%poke,Learn) $+ : $+ $gettok(%nmove,%x,58) } | else { writeini pkp\cadastros\ $+ %player $+ .ini %poke Learn $gettok(%nmove,%x,58) } }
                  else { addmove %player %poke $gettok(%nmove,%x,58) }
                }
                inc %x
              }
            }
            if (%poke == Ninjask) {
              if ($totalpokes($nick) < 6) && ($item($nick,Ultra Ball).qnt) && (!$rini(cadastros,$nick,Shedinja,Name)) {
                if ($teampos($nick,Egg)) { remteam $nick Egg | addteam $nick Shedinja | addteam $nick Egg }
                else { addteam $nick Shedinja }
                if ($pokedex($nick,Shedinja) == $false) { .echo $pokedex($nick,Shedinja).add }
                item.rem $nick Ultra Ball | var %m = $gettok($rini(cadastros,$nick,%poke,Memory),1-2,58) $+ :Ultra Ball
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja Name Shedinja
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja ID $rini(cadastros,$nick,%poke,ID)
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja Level $rini(cadastros,$nick,%poke,Level)
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja Nature $rini(cadastros,$nick,%poke,Nature)
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja Sex Unknown
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja GV $rini(cadastros,$nick,%poke,GV)
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja Shiny $rini(cadastros,$nick,%poke,Shiny)
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja Trait Wonder Guard
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja ExpStat Erratic
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja Exp $rini(cadastros,$nick,%poke,Exp)
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja Next $rini(cadastros,$nick,%poke,Next)
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja Memory %m
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja Loyalty $rini(cadastros,$nick,%poke,Loyalty)
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja Hold 0
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja Ribbon 0
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja IVHp $rini(cadastros,$nick,%poke,IVHp)
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja IVAtk $rini(cadastros,$nick,%poke,IVAtk)
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja IVDef $rini(cadastros,$nick,%poke,IVDef)
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja IVSpd $rini(cadastros,$nick,%poke,IVSpd)
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja IVSAtk $rini(cadastros,$nick,%poke,IVSAtk)
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja IVSDef $rini(cadastros,$nick,%poke,IVSDef)
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja EVHp $rini(cadastros,$nick,%poke,EVHp)
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja EVAtk $rini(cadastros,$nick,%poke,EVAtk)
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja EVDef $rini(cadastros,$nick,%poke,EVDef)
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja EVSpd $rini(cadastros,$nick,%poke,EVSpd)
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja EVSAtk $rini(cadastros,$nick,%poke,EVSAtk)
                writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja EVSDef $rini(cadastros,$nick,%poke,EVSDef)
                recalc $nick Shedinja | writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja Move1 $rini(cadastros,$nick,%poke,Move1)
                if ($rini(cadastros,$nick,%poke,Move2)) { writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja Move2 $rini(cadastros,$nick,%poke,Move2) }
                if ($rini(cadastros,$nick,%poke,Move3)) { writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja Move3 $rini(cadastros,$nick,%poke,Move3) }
                if ($rini(cadastros,$nick,%poke,Move4)) { writeini pkp\cadastros\ $+ $nick $+ .ini Shedinja Move4 $rini(cadastros,$nick,%poke,Move4) }
              }
            }
            wlog user $nick Evolved $basestat($2) to $basestat(%poke) at level $dados($nick,%poke,Level) $+ .
            msg =$nick $ct $+ Seu pok�mon $cc $+ $basestat($2) $ct $+ evoluiu para $cc $+ $basestat(%poke) $+ $ct $+ !
          }
          else { msg =$nick $ct $+ Seu pok�mon n�o p�de evoluir. }
        }
        else { msg =$nick $ct $+ Para $cc $+ evoluir $ct $+ seu $cc $+ pok�mon $+ $ct $+ , digite $cc $+ .Evoluir <Pok�mon> <Evolu��o> $+ $ct $+ . Para saber quais $cc $+ evolu��es $ct $+ seu pok�mon $cc $+ possui $+ $ct $+ , digite apenas $cc $+ .Evoluir <pok�mon> $+ $ct $+ . }
        return
      }
      else { var %t = $readini(pkp\evolve.ini,Evolve,$2) | if (%t) { msg =$nick $ct $+ Pok�mon $cc $+ $rini(cadastros,$nick,$2,Name) $ct $+ pode evoluir para $evolution($2) $+ $ct $+ . } | else { msg =$nick $ct $+ O pok�mon selecionado n�o pode ser evolu�do. } | return }
    }
    elseif ($1 == .Alvo) {
      if ($checknickid($nick) == No!) { msg =$nick $ct $+ Voc� n�o est� participando de nenhuma batalha. | return }
      var %ID = $checknickid($nick).id, %loop = $iif($v([ [ B. ] $+ [ %ID ] $+ [ .2vs2 ] ]),4,2), %x = 0, %r = 0, %e = 0
      if (%loop < 4) { msg =$nick $ct $+ Este comando � restrito para batalhas $cc $+ em dupla $+ $ct $+ . | return }
      while (%x < %loop) {
        inc %x
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %x ] ])) && (!%n) {
          if ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %x ] ]) == $nick) || ($v([ [ B. ] $+ [ %ID ] $+ [ .TruePlayer: ] $+ [ %x ] ]) == $nick) {
            if ($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %x ] ])) {
              if ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %x ] ]),1,59) != Switch) {
                if ($v([ [ B. ] $+ [ %ID ] $+ [ .Target. ] $+ [ %x ] ])) { inc %r }
                else { var %n = %x }
              }
            }
            else { inc %e }
          }
        }
      }
      if (!%n) {
        if (%e) { msg =$nick $ct $+ N�o � poss�vel determinar um alvo do pok�mon sem antes determinar seu golpe. }
        elseif (%r) { msg =$nick $ct $+ N�o � poss�vel alterar um alvo determinado anteriormente. }
        else { msg =$nick $ct $+ N�o foi poss�vel determinar o alvo do pok�mon. } | return
      }
      if ($2) {
        if ($2 !isnum 1-4)  { msg =$nick $ct $+ Erro de sintaxe. Para determinar seu alvo, digite ' $+ $cc $+ .Alvo <n�mero correspondente> $+ $ct $+ '. | return }
        var %tt = $battle.target(%ID,%n).all | if (!$findtok(%tt,$2,0,58)) { msg =$nick $ct $+ Alvo inv�lido. Digite ' $+ $cc $+ .Alvo $+ $ct $+ ' para listar os dispon�veis. | return }
        sset [ [ B. ] $+ [ %ID ] $+ [ .Target. ] $+ [ %n ] ] $2 | msg =$nick $lb $+ Alvo de $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) $lb $+  selecionado: $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $2 ] ]) $+ 's $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ $2 ] ]) $+ $lb $+ .
        if ($battle.wait(%ID)) {
          if ($battle.side(%n) == %n) {
            var %t = $battle.team(%ID,%n).num
            if (!$v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %t ] ])) {
              if ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %t ] ]) == $nick) {
                ; var %s = $timer(EndTurn $+ %ID).secs
                ; msg =$nick $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %t ] ]) $+ $lb $+ , escolha o golpe de $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %t ] ]) $+ $lb $+ . $chr(91) $+ $returnmoves(%ID,%t) $+ $chr(93) $+ . Voc� tem %s $iif(%s > 1,segundos,segundo) $+ .
                .timerEndTurn $+ %ID 1 60 /battle.turn %ID | msg =$nick $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %t ] ]) $+ $lb $+ , escolha o golpe de $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %t ] ]) $+ $lb $+ . $chr(91) $+ $returnmoves(%ID,%t) $+ $chr(93) $+ . Voc� tem 1 minuto.
              }
              elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .TruePlayer: ] $+ [ %t ] ]) == $nick) {
                .timerEndTurn $+ %ID 1 60 /battle.turn %ID | msg =$nick $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .TruePlayer: ] $+ [ %t ] ]) $+ $lb $+ , escolha o golpe de $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %t ] ]) $+ $lb $+ . $chr(91) $+ $returnmoves(%ID,%t) $+ $chr(93) $+ . Voc� tem 1 minuto.
              }
            }
          }
        }
        else { fightturns %ID } | return
      }
      else {
        var %x = 0, %y = 0, %z = 0 | while (%x < 4) { inc %x | if ($len($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %x ] ])) > %y) { var %y = $len($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %x ] ])) } | if ($len($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %x ] ])) > %z) { var %z = $len($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %x ] ])) } }

        var %tt = $battle.target(%ID,%n).all, %x = 1, %side = $battle.side(%n)
        msg =$nick $ct $+ Exibindo poss�veis alvos para $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) $+ $ct $+ :
        while ($gettok(%tt,%x,58)) {
          var %t = $gettok(%tt,%x,58)
          if ($battle.side(%t) == %side) {
            msg =$nick $ct $+ $chr(35) $+ $cc $+ %t $ct $+ $arrange($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %t ] ]),160,%y).right $+ 's $arrange($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %t ] ]),160,%z) HP[ $+ $barra($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %t ] ]),$v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %t ] ])) $+ $ct $+ ] $chr(40) $+ $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %t ] ]) $+ $ct $+ / $+ $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %t ] ]) $+ $ct $+ $chr(41) $iif($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %t ] ]),$realstatus($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %t ] ])),$+) $iif($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %t ] ]),$cc $+ Hold: $ct $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %t ] ]))
          }
          else {
            var %rate = $int($calc($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %t ] ]) / $v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %t ] ]) * 100)) $+ $chr(37)
            msg =$nick $ct $+ $chr(35) $+ $cc $+ %t $cc $+ $arrange($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %t ] ]),160,%y).right $+ 's $arrange($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %t ] ]),160,%z) $ct $+ HP[ $+ $barra($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %t ] ]),$v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %t ] ])) $+ $ct $+ ] $chr(40) $+ %rate $+ $chr(41) $iif($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %t ] ]),$realstatus($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %t ] ])))
          }
          inc %x
        }
        if (!%tt) { msg =$nick $ct $+ Nenhum alvo encontrado. Por favor, reporte este erro ao $cc $+ moderador $+ $ct $+ . }
        else { msg =$nick $ct $+ Fim da exibi��o de alvos. Para determinar o alvo, digite ' $+ $cc $+ .Alvo <n�mero correspondente> $+ $ct $+ '. } | return
      }

    }
    elseif ($1 == .Golpe) {
      if ($checknickid($nick) == No!) { msg =$nick $ct $+ Voc� n�o est� participando de nenhuma batalha. | return }
      var %ID = $checknickid($nick).id, %loop = $iif($v([ [ B. ] $+ [ %ID ] $+ [ .2vs2 ] ]),4,2), %x = 0, %r = 0, %p = 0
      while (%x < %loop) {
        inc %x
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %x ] ])) && (!%n) {
          if ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %x ] ]) == $nick) || ($v([ [ B. ] $+ [ %ID ] $+ [ .TruePlayer: ] $+ [ %x ] ]) == $nick) {
            if ($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %x ] ])) { if ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %x ] ]),1,59) == Switch) { inc %r } | if (!$v([ [ B. ] $+ [ %ID ] $+ [ .Target. ] $+ [ %x ] ])) { var %p = %x } }
            else { if (!$v([ [ B. ] $+ [ %ID ] $+ [ .Target. ] $+ [ %x ] ])) { if (!%p) { var %n = %x } } }
          }
        }
      }
      if (!%n) {
        if (%r < $iif($battle.team(%ID,%p),1,$iif(%loop == 4,2,1))) {
          if ($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %p ] ])) {
            if (!$v([ [ B. ] $+ [ %ID ] $+ [ .Target. ] $+ [ %p ] ])) { msg =$nick $ct $+ Seu golpe n�o foi selecionado. � necess�rio determinar o alvo para o golpe $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %p ] ]) $ct $+ de $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %p ] ]) $ct $+ com o comando ' $+ $cc $+ .Alvo $+ $ct $+ '. }
            else { msg =$nick $ct $+ Seu golpe n�o foi selecionado. � imposs�vel alter�-lo: $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %p ] ]) $+ $ct $+ . Aguarde. }
          }
          else { msg =$nick $ct $+ Seu golpe n�o foi selecionado. Voc� n�o pode alterar um golpe j� selecionado. }
        }
        else { msg =$nick $ct $+ Seu golpe n�o foi selecionado. Voc� n�o pode alterar um golpe j� selecionado. }
        return
      }
      if (!$timer(EndTurn $+ %ID)) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %n ] ])) { msg =$nick $ct $+ Seu golpe n�o foi selecionado. Aguarde o pedido de sele��o. | return } }
      if (!$2) { msg =$nick $ct $+ Seu golpe n�o foi selecionado. Para faz�-lo, digite ' $+ $cc $+ .Golpe <ataque> $+ $ct $+ '. | return }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Move1. ] $+ [ %n ] ]) == $2-) { var %m = 1 } | if ($v([ [ B. ] $+ [ %ID ] $+ [ .Move2. ] $+ [ %n ] ]) == $2-) { var %m = 2 } | if ($v([ [ B. ] $+ [ %ID ] $+ [ .Move3. ] $+ [ %n ] ]) == $2-) { var %m = 3 } | if ($v([ [ B. ] $+ [ %ID ] $+ [ .Move4. ] $+ [ %n ] ]) == $2-) { var %m = 4 } | if (!%m) && ($2- != $returnmoves(%id,%n)) { msg =$nick $ct $+ Seu pok�mon $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) $ct $+ n�o possui o golpe selecionado. | return }
      if (!$findtok($rmoves(%ID,%n).left,$2-,0,58)) && ($2- != Struggle) { msg =$nick $ct $+ Seu golpe n�o foi selecionado. Seu pok�mon $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) $ct $+ n�o possui mais $cc $+ PP $ct $+ para esse golpe! | return }
      if ($2- != Struggle) {
        if ($wildtok($v([ [ B. ] $+ [ %ID ] $+ [ .Disable. ] $+ [ %n ] ]),$2- $+ $chr(59) $+ *,0,58)) { msg =$nick $ct $+ Seu golpe n�o foi selecionado. Ele est� desabilitado. | return }
        if (!$findtok($rmoves(%ID,%n),$2-,0,58)) {
          if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Choice Band) && ($v([ [ B. ] $+ [ %ID ] $+ [ .Choice. ] $+ [ %n ] ])) { if ($2- != $v([ [ B. ] $+ [ %ID ] $+ [ .Choice. ] $+ [ %n ] ])) { msg =$nick $ct $+ Seu golpe n�o foi selecionado. S� � poss�vel usar o golpe $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Choice. ] $+ [ %n ] ]) $+ $ct $+ ! | return } }
          if ($v([ [ B. ] $+ [ %ID ] $+ [ .Encore. ] $+ [ %n ] ])) { if ($2- != $v([ [ B. ] $+ [ %ID ] $+ [ .Encore. ] $+ [ %n ] ])) { msg =$nick $ct $+ Seu pok�mon s� pode usar o golpe $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Encore. ] $+ [ %n ] ]) $+ $ct $+ , ele est� sob efeito de $cc $+ Encore $+ $ct $+ ! | return } }
          if ($v([ [ B. ] $+ [ %ID ] $+ [ .Taunt. ] $+ [ %n ] ])) && ($gettok($read(pkp\moveslist.txt,s,$2-),7,58)) { msg =$nick $ct $+ Seu golpe n�o foi selecionado. Durante $cc $+ Taunt $+ $ct $+ , s� � poss�vel usar golpes ofensivos! }
          else { msg =$nick $ct $+ Seu golpe n�o foi selecionado. Durante $cc $+ Torment $+ $ct $+ , n�o � poss�vel usar o mesmo golpe duas vezes, em sequ�ncia! } | return
        }
      }
      sset [ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %n ] ] $iif($v([ [ B. ] $+ [ %ID ] $+ [ .Move [ $+ [ %m ] $+ ] . ] $+ [ %n ] ]),$v([ [ B. ] $+ [ %ID ] $+ [ .Move [ $+ [ %m ] $+ ] . ] $+ [ %n ] ]),Struggle)
      var %target = $gettok($read(pkp\moveslist.txt, s, $v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %n ] ])),5,58)
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %n ] ]) == Curse) && (Ghost isin $v([ [ B. ] $+ [ %ID ] $+ [ .Type. ] $+ [ %n ] ])) { var %target = OneEnemy }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .2vs2 ] ])) {
        if (%target == OneEnemy) {
          msg =$nick $lb $+ Golpe selecionado: $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) $+ 's $v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %n ] ]) $+ $lb $+ .
          var %s = $timer(EndTurn $+ %ID).secs | uset [ [ B. ] $+ [ %ID ] $+ [ .Target. ] $+ [ %n ] ]
          msg =$nick $bb $+ $nick $+ $lb $+ , escolha o alvo para $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) $+ $lb $+ . Para list�-los, digite ' $+ $bb $+ .Alvo $+ $lb $+ '. Voc� ainda tem %s $iif(%s > 1,segundos,segundo) $+ .
          return
        }
        else { sset [ [ B. ] $+ [ %ID ] $+ [ .Target. ] $+ [ %n ] ] $battle.target(%ID,%n) }
      }
      else { sset [ [ B. ] $+ [ %ID ] $+ [ .Target. ] $+ [ %n ] ] $iif(%n == 1,2,1) }
      msg =$nick $lb $+ Golpe selecionado: $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) $+ 's $v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %n ] ]) $+ $lb $+ . $iif($battle.wait(%ID),Aguarde o ataque de seu advers�rio.)

      if ($battle.wait(%ID)) {
        if ($battle.side(%n) == %n) {
          var %t = $battle.team(%ID,%n).num
          if ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %t ] ]) == $nick) && (!$v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %t ] ])) {
            ; var %s = $timer(EndTurn $+ %ID).secs
            ; msg =$nick $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %t ] ]) $+ $lb $+ , escolha o golpe de $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %t ] ]) $+ $lb $+ . $chr(91) $+ $returnmoves(%ID,%t) $+ $chr(93) $+ . Voc� tem %s $iif(%s > 1,segundos,segundo) $+ .
            .timerEndTurn $+ %ID 1 60 /battle.turn %ID | msg =$nick $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %t ] ]) $+ $lb $+ , escolha o golpe de $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %t ] ]) $+ $lb $+ . $chr(91) $+ $returnmoves(%ID,%t) $+ $chr(93) $+ . Voc� tem 1 minuto.
          }
          if ($v([ [ B. ] $+ [ %ID ] $+ [ .TruePlayer: ] $+ [ %t ] ]) == $nick) && (!$v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %t ] ])) {
            .timerEndTurn $+ %ID 1 60 /battle.turn %ID | msg =$nick $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .TruePlayer: ] $+ [ %t ] ]) $+ $lb $+ , escolha o golpe de $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %t ] ]) $+ $lb $+ . $chr(91) $+ $returnmoves(%ID,%t) $+ $chr(93) $+ . Voc� tem 1 minuto.
          }
        }
      }
      else { fightturns %ID } | return
    }
    elseif ($1 == .Fugir) {
      if ($checknickid($nick) == No!) { msg =$nick $ct $+ Voc� n�o est� participando de nenhuma batalha. | return }
      var %ID = $checknickid($nick).id, %loop = $iif($v([ [ B. ] $+ [ %ID ] $+ [ .2vs2 ] ]),4,2), %x = 0, %r = 0, %p = 0
      if (!$v([ [ B. ] $+ [ %ID ] $+ [ .Wild ] ])) { msg =$nick $ct $+ N�o � poss�vel fugir de batalhas com treinadores! | return }
      while (%x < %loop) {
        inc %x
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %x ] ])) && (!%n) {
          if ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %x ] ]) == $nick) {
            if ($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %x ] ])) { if ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %x ] ]),1,59) == Switch) { inc %r } | if (!$v([ [ B. ] $+ [ %ID ] $+ [ .Target. ] $+ [ %x ] ])) { var %p = %x } }
            else { if (!$v([ [ B. ] $+ [ %ID ] $+ [ .Target. ] $+ [ %x ] ])) { if (!%p) { var %n = %x } } }
          }
        }
      }
      if (!%n) {
        if (%r < $iif($battle.team(%ID,%p),1,$iif(%loop == 4,2,1))) {
          if ($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %p ] ])) {
            if (!$v([ [ B. ] $+ [ %ID ] $+ [ .Target. ] $+ [ %p ] ])) { msg =$nick $ct $+ Seu pok�mon n�o p�de fugir. � necess�rio determinar o alvo para o golpe $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %p ] ]) $ct $+ de $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %p ] ]) $ct $+ com o comando ' $+ $cc $+ .Alvo $+ $ct $+ '. }
            else { msg =$nick $ct $+ Seu pok�mon n�o p�de fugir. � imposs�vel alterar o golpe selecionado: $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %p ] ]) $+ $ct $+ . Aguarde. }
          }
          else { msg =$nick $ct $+ Seu pok�mon n�o p�de fugir. Voc� n�o pode alterar um golpe j� selecionado. }
        }
        else { msg =$nick $ct $+ Seu pok�mon n�o p�de fugir. Voc� n�o pode alterar um golpe j� selecionado. }
        return
      }
      if (!$timer(EndTurn $+ %ID)) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %n ] ])) { msg =$nick $ct $+ Seu pok�mon n�o p�de fugir. Aguarde o pedido de sele��o de golpes. | return } }
      if ($checkfoe.left(%ID,%n,Trait.,Arena Trap)) {
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) != Levitate) && (Flying !isin $v([ [ B. ] $+ [ %ID ] $+ [ .Type. ] $+ [ %n ] ])) {
          msg =$nick $ct $+ Seu pok�mon n�o p�de fugir. Est� preso por $cc $+ Arena Trap $+ $ct $+ . | return
        }
      }
      if ($checkfoe.left(%ID,%n,Trait.,Magnet Pull)) { if (Steel isin $v([ [ B. ] $+ [ %ID ] $+ [ .Type. ] $+ [ %n ] ])) { msg =$nick $ct $+ Seu pok�mon n�o p�de fugir. Est� preso por $cc $+ Magnet Pull $+ $ct $+ . | return } }
      if ($checkfoe.left(%ID,%n,Trait.,Shadow Tag)) { msg =$nick $ct $+ Seu pok�mon n�o p�de fugir. Est� preso por $cc $+ Shadow Tag $+ $ct $+ . | return }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Ingrain. ] $+ [ %n ] ])) { msg =$nick $ct $+ Seu pok�mon n�o p�de fugir. Est� preso por $cc $+ Ingrain $+ $ct $+ . | return }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Vortex. ] $+ [ %n ] ])) { msg =$nick $ct $+ Seu pok�mon n�o p�de fugir. Est� preso por $cc $+ $gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Vortex. ] $+ [ %n ] ]),1,58) $+ $ct $+ . | return }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .NoEscape. ] $+ [ %n ] ])) { msg =$nick $ct $+ Seu pok�mon n�o p�de fugir. Est� sob efeito do golpe $cc $+ $gettok($v([ [ B. ] $+ [ %ID ] $+ [ .NoEscape. ] $+ [ %n ] ]),2,58) $+ $ct $+ ! | return }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Shiny. ] $+ [ $rvs(%n) ] ]) == ON) { msg =$nick $ct $+ Seu pok�mon n�o p�de fugir. $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ $rvs(%n) ] ]) $ct $+ � um pok�mon shiny! | return }
      sset [ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %n ] ] Run
      fightturns %ID
      return
    }
    elseif ($1 == .Listar) {
      var %x = $tevent(Listar,$nick).time
      if (%x) { var %r = $calc($ctime($date $time) - $ctime(%x)) | if (%r >= 10) { goto listar } | else { msg =$nick $ct $+ Voc� s� pode usar o comando ' $+ $cc $+ .Listar $+ $ct $+ ' num intervalo de $cc $+ dez $ct $+ segundos. | return } }
      else {
        :listar
        tevent Listar $nick
        var %n = 1, %nb = 0 | while ($v([ [ F. ] $+ [ %n ] $+ [ .ID ] ])) {
          if (%n == 1) { msg =$nick $ct $+ As seguintes batalhas ou safaris est�o em andamento: }
          var %id = $v([ [ F. ] $+ [ %n ] $+ [ .ID ] ]), %v = 0
          if (!$dados($v([ [ B. ] $+ [ %ID ] $+ [ .Player.1 ] ]),Info,Hide)) { var %v = 1 }
          if ($dados($v([ [ B. ] $+ [ %ID ] $+ [ .Player.1 ] ]),Info,Hide)) && ($nick == $v([ [ B. ] $+ [ %ID ] $+ [ .Player.1 ] ])) { var %v = 1 }
          if (%v) {
            inc %nb
            if ($v([ [ B. ] $+ [ %ID ] $+ [ .Gym ] ])) { var %b = Gin�sio }
            elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .League ] ])) { var %b = Liga }
            elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Rental ] ])) { var %b = Rental }
            elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Wild ] ])) { var %b = Safari }
            else { var %b = Batalha }
            if ($v([ [ B. ] $+ [ %ID ] $+ [ .BattleTent ] ])) && (!$v([ [ B. ] $+ [ %ID ] $+ [ .Trait.2 ] ])) {
              var %p = $v([ [ B. ] $+ [ %ID ] $+ [ .BattleTent ] ]), %p = $v([ [ B. ] $+ [ %ID ] $+ [ .Match ] ]), %h = $cc $+ $v(B. $+ %ID $+ .Player.1) $ct $+ $chr(40) $+ $cc $+ $numero(%p) $ct $+ pok�mon $+ $chr(41) $iif($v(B. $+ %ID $+ .Player.2),$ct $+ / Advers�rio: $cc $+ $v(B. $+ %ID $+ .Player.2) $ct $+ $chr(40) $+ $cc $+ $numero(%p) $ct $+ pok�mon $+ $chr(41))
            }
            else { if ($v([ [ B. ] $+ [ %ID ] $+ [ .View ] ])) { var %h = $v([ [ B. ] $+ [ %ID ] $+ [ .View ] ]) } | else { var %h = $battle.show(%ID) } }
            msg =$nick $ct $+ %b $chr(35) $+ $cc $+ %nb $+ $ct $+ : ID: $cc $+ %ID $ct $+ / Host: %h
          }
          inc %n
        }
        if (!%nb) { msg =$nick $ct $+ N�o h� lutas em andamento. | return } | else { msg =$nick $ct $+ Fim da listagem de batalhas em andamento. | return }
      }
    }
    elseif ($1 == .Users) {
      var %x = $chat(0), %y = 1, %z = 0, %h = 0 | while (%y <= %x) { if ($chat(%y).status == Waiting) { inc %z } | if ($dados($chat(%y),Info,Hide)) { inc %h } | inc %y }
      msg =$nick $ct $+ Est�o, neste momento, conectados $cc $+ $calc(%x - %h) $ct $+ $iif($calc(%x - %h) > 1,usu�rios,usu�rio) e $cc $+ $iif(%z,%z,nenhum) $ct $+ tentando se conectar.
      var %time = $tevent(Users,$nick).time
      if (%time) { if ($calc($ctime($date $time) - $ctime(%time)) >= 60) { var %did = 1 } } | else { var %did = 1 }
      if (%did) {
        var %x = $chat(0), %y = 1, %n = 0 | while (%y <= %x) {
          var %z = $chat(%y), %z = $iif($dados(%z,Info,Nick),$dados(%z,Info,Nick),%z) | if ($rini(cadastros,$nick,Info,Access) == 5) { var %ip = $chat(%y).ip } | else { var %ip = $gettok($chat(%y).ip,1-3,46) $+ .??? }
          if (!$dados(%z,Info,Hide)) { inc %n | msg =$nick $ct $+ $chr(35) $+ $cc $+ $base(%n,10,10,2) $coloracc(%z) $+ $userorg(%z) $ct $+ Status: $userstat(%y) $ct $+ IP: $cc $+ %ip }
          inc %y
        }
        msg =$nick $ct $+ Fim da lista de usu�rios. | if ($rini(cadastros,$nick,Info,Access) < 5) { tevent Users $nick }
      } | return
    }
    elseif ($1 == .Report) {
      if ($2) {
        var %x = $dados($nick,Time,Report), %x = $iif(%x,%x,0), %r = $calc($ctime($date $time) - $ctime(%x))
        if (%r < 7200) { msg =$nick $ct $+ Por favor, utilize $cc $+ .Report $ct $+ moderadamente, num intervalo de $cc $+ duas $ct $+ horas. }
        else {
          write pkp\log\reports.txt $date $time $+ > $+ $dados($nick,Info,Nick) $+ > $2-
          wlog user $nick Sent a new report to the admin.
          writeini pkp\cadastros\ $+ $nick $+ .ini Time Report $date $time
          msg =$nick $ct $+ Obrigado por $cc $+ reportar $ct $+ ao administrador. Se a mensagem for validada, voc� receber� $cc $+ 100 $ct $+ Pok�Milhas.
          return
        }
      }
      else { msg =$nick $ct $+ Para reportar algum $cc $+ bug $+ $ct $+ , enviar $cc $+ sugest�o $+ $ct $+ , $cc $+ denunciar $ct $+ qualquer tipo de viola��o de regra no bot, digite ' $+ $cc $+ .Report <mensagem> $+ $ct $+ '. Sua mensagem ser� analisada pelo administrador e, se for validada, voc� ser� premiado com $cc $+ 100 $ct $+ Pok�Milhas. }
      return
    }
    elseif ($1 == .Map) {
      if ($checknickid($nick) == Ok!) { msg =$nick $ct $+ Voc� n�o pode ver o mapa enquanto batalha! | return }
      if ($v(Watch. [ $+ [ $nick ] ])) { msg =$nick $ct $+ Voc� n�o pode ver o mapa enquanto assiste a outras batalhas. Para parar de assisti-la, digite ' $+ $cc $+ .Assistir $+ $ct $+ '. | return }
      if (%confirm. [ $+ [ $nick ] ]) { msg =$nick $ct $+ Antes de ver o mapa, digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar o �ltimo pedido. | return }
      var %x = $tevent(Map,$nick).time
      if (%x) {
        var %r = $calc($ctime($date $time) - $ctime(%x)) | if (%r >= 60) { goto map }
        else { msg =$nick $ct $+ N�o fa�a flood com este comando. Voc� poder� reutiliz�-lo em $cc $+ $calc(60 - %r) $ct $+ $iif($calc(60 - %r) > 1,segundos.,segundo.) | return }
      }
      else {
        :map
        cmd.map $1-
        tevent Map $nick | return
      }
    }
    elseif ($1 == .Corner) {
      var %l = $dados($nick,Info,Locate)
      if (!$findtok(Celadon City:Goldenrod City,%l,0,58)) { msg =$nick $ct $+ N�o h� $cc $+ Game Corner $ct $+ em sua localiza��o atual. | return }
      if ($checknickid($nick) == Ok!) { msg =$nick $ct $+ Voc� n�o pode jogar no $cc $+ Game Corner $ct $+ enquanto batalha! | return }
      if ($v(Watch. [ $+ [ $nick ] ])) { msg =$nick $ct $+ Voc� n�o pode jogar no $cc $+ Game Corner $ct $+ enquanto assiste a outras batalhas. Para parar de assisti-la, digite ' $+ $cc $+ .Assistir $+ $ct $+ '. | return }
      if (%confirm. [ $+ [ $nick ] ]) { msg =$nick $ct $+ Antes de jogar no $cc $+ Game Corner $+ $ct $+ , digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar o �ltimo pedido. | return }
      if (!$item($nick,Coin Case).qnt) { msg =$nick $ct $+ N�o pode jogar no $cc $+ Game Corner $ct $+ se n�o tiver um $cc $+ Coin Case $+ $ct $+ ! | return }
      if ($2 == jogar) {
        var %c = $3, %coin = $dados($nick,Info,Coin)
        if (%c !isnum 1-5) { msg =$nick $ct $+ Sua aposta n�o pode ser menor que $cc $+ uma $ct $+ moeda nem superior a $cc $+ cinco $ct $+ moedas. | return }
        if (%coin < %c) { msg =$nick $ct $+ Voc� n�o tem a quantidade de moedas apostadas. Digite ' $+ $cc $+ .item use Coin Case $+ $ct $+ ' para obter essa informa��o. | return }
        writeini pkp\cadastros\ $+ $nick $+ .ini Info Coin $calc(%coin - %c)
        var %x1 = $rand(0,20), %x2 = $rand(0,20), %x3 = $rand(0,20), %prize = 0
        msg =$nick $ct $+ Voc� apostou $cc $+ $numero2(%c) $ct $+ $iif(%c > 1,moedas,moeda) $+ !
        msg =$nick Resultado da m�quina: $cc $+ $base(%x1,10,10,2) $ct $+ - $cc $+ $base(%x2,10,10,2) $ct $+ - $cc $+ $base(%x3,10,10,2)
        if (!%x1) && (!%x2) && (!%x3) { var %prize = 200 }
        elseif (%x2 == $calc(%x1 * 3)) && (%x3 == $calc(%x2 * 3)) { var %prize = 100 }
        elseif (%x1 == %x2) && (%x2 == %x3) { var %prize = 50 }
        elseif (!%x1) && (%x2) && (!%x3) { var %prize = 30 }
        elseif (%x2 == $calc(%x1 + 1)) && (%x3 == $calc(%x2 + 1)) { var %prize = 20 }
        elseif (%x1 == %x3) && (!%x2) { var %prize = 15 }
        elseif (%x1 == %x3) && (%x2 > %x1) { var %prize = 12 }
        elseif (%x1 == $calc(%x2 * 2)) && (%x2 == %x3) { var %prize = 7 }
        elseif (%x3 == $calc(%x2 * 2)) && (%x2 == %x1) { var %prize = 7 }
        elseif ($calc(%x1 + %x2 + %x3) > 54) { var %prize = 5 }
        if (%prize) {
          msg =$nick $ct $+ Sorte! Voc� foi premiado! Voc� apostou $cc $+ %c $ct $+ $iif(%c > 1,moedas,moeda) (� $+ $cc $+ %prize $+ $ct $+ ) e ganhou $cc $+ � $+ $getmoney($calc(%c * %prize)) $+ $ct $+ !
          var %r = $calc($dados($nick,Info,Coin) + %c * %prize) | writeini pkp\cadastros\ $+ $nick $+ .ini Info Coin $iif(%r > 9999,9999,%r)
        }
        else { msg =$nick $ct $+ Voc� n�o recebeu pr�mio algum. Se tiver d�vidas, veja a premia��o. }
      }
      elseif ($findtok(prize:prizes:premio:premios:pr�mio:pr�mios:premia��o:premia�ao:premiacao,$2,0,58)) {
        msg =$nick $ct $+ Exibindo lista de premia��o do $cc $+ Game Corner $+ $ct $+ :
        var %n1 = 00, %n2 = 00, %n3 = 00, %prize = 200 | msg =$nick $chr(160) $cc $+ %n1 $ct $+ - $cc $+ %n2 $ct $+ - $cc $+ %n3 $ct $+ (� $+ $cc $+ $arrange(%prize,160,3).right $+ $ct $+ )
        var %n1 = 1n, %n2 = 3n, %n3 = 9n, %prize = 100 | msg =$nick $chr(160) $cc $+ %n1 $ct $+ - $cc $+ %n2 $ct $+ - $cc $+ %n3 $ct $+ (� $+ $cc $+ $arrange(%prize,160,3).right $+ $ct $+ )
        var %n1 = 1n, %n2 = 1n, %n3 = 1n, %prize = 50 | msg =$nick $chr(160) $cc $+ %n1 $ct $+ - $cc $+ %n2 $ct $+ - $cc $+ %n3 $ct $+ (� $+ $cc $+ $arrange(%prize,160,3).right $+ $ct $+ )
        var %n1 = 00, %n2 = 1n, %n3 = 00, %prize = 30 | msg =$nick $chr(160) $cc $+ %n1 $ct $+ - $cc $+ %n2 $ct $+ - $cc $+ %n3 $ct $+ (� $+ $cc $+ $arrange(%prize,160,3).right $+ $ct $+ )
        var %n1 = 1a, %n2 = 1b, %n3 = 1c, %prize = 20 | msg =$nick $chr(160) $cc $+ %n1 $ct $+ - $cc $+ %n2 $ct $+ - $cc $+ %n3 $ct $+ (� $+ $cc $+ $arrange(%prize,160,3).right $+ $ct $+ )
        var %n1 = 1n, %n2 = 00, %n3 = 1n, %prize = 15 | msg =$nick $chr(160) $cc $+ %n1 $ct $+ - $cc $+ %n2 $ct $+ - $cc $+ %n3 $ct $+ (� $+ $cc $+ $arrange(%prize,160,3).right $+ $ct $+ )
        var %n1 = 1n, %n2 = +n, %n3 = 1n, %prize = 12 | msg =$nick $chr(160) $cc $+ %n1 $ct $+ - $cc $+ %n2 $ct $+ - $cc $+ %n3 $ct $+ (� $+ $cc $+ $arrange(%prize,160,3).right $+ $ct $+ )
        var %n1 = 1n, %n2 = 2n, %n3 = 2n, %prize = 7 | msg =$nick $chr(160) $cc $+ %n1 $ct $+ - $cc $+ %n2 $ct $+ - $cc $+ %n3 $ct $+ (� $+ $cc $+ $arrange(%prize,160,3).right $+ $ct $+ )
        var %n1 = 1n, %n2 = 1n, %n3 = 2n, %prize = 7 | msg =$nick $chr(160) $cc $+ %n1 $ct $+ - $cc $+ %n2 $ct $+ - $cc $+ %n3 $ct $+ (� $+ $cc $+ $arrange(%prize,160,3).right $+ $ct $+ )
        var %n1 = ?+, %n2 = ?+, %n3 = ?+, %prize = 5 | msg =$nick $chr(160) $cc $+ %n1 $ct $+ - $cc $+ %n2 $ct $+ - $cc $+ %n3 $ct $+ (� $+ $cc $+ $arrange(%prize,160,3).right $+ $ct $+ )
        msg =$nick $ct $+ Tradu��o:
        var %x = 8
        msg =$nick $chr(160) $cc $+ $arrange(a b c,160,%x) $ct $+ - n�meros consecutivos;
        msg =$nick $chr(160) $cc $+ $arrange(+n,160,%x) $ct $+ - n�mero maior que ' $+ $cc $+ n $+ $ct $+ ';
        msg =$nick $chr(160) $cc $+ $arrange(?+ ?+ ?+,160,%x) $ct $+ - soma dos n�meros superior a $cc $+ 54 $+ $ct $+ ;
        msg =$nick $ct $+ Fim da exibi��o da lista.
      }
      elseif ($2 == comprar) {
        var %a = $rini(cadastros,$nick,Info,Access), %p = Game Corner $+ : $+ %l
        if ($3) {
          if ($3 isnum) { if ($3 isnum 1-99) { var %qnt = $int($3), %i = $4- } | else { msg =$nick $ct $+ Determine um n�mero $cc $+ v�lido $ct $+ de itens ou pok�mon para comprar. | return } } | else { var %qnt = 1, %i = $3- }
          if ($findtok($shop(%p,%a),%i,0,58)) {
            if (!%qnt) { msg =$nick $ct $+ Nada foi comprado. | return }
            if ($ispk(%i)) {
              if (%qnt > 1) { msg =$nick $ct $+ Voc� n�o pode comprar mais de $cc $+ um $ct $+ pok�mon! | return }
              if ($dados($nick,%i,Name)) { msg =$nick $ct $+ Voc� n�o p�de comprar porque tem um pok�mon de mesmo nome no time. | return }
              if ($dados($nick,Team,6)) { msg =$nick $ct $+ Libere espa�o no seu time para comprar pok�mon. | return }
              var %c = $dados($nick,Info,Coin), %i = $org(%i), %cost = $corner(%i,price)
              if (%c < $calc(%cost * %qnt)) { msg =$nick $ct $+ Voc� n�o tem $cc $+ � $+ $getmoney($calc(%cost * %qnt)) $ct $+ para comprar $cc $+ %i $+ $ct $+ ! | return }
              wlog user $nick Pok�mon %i was bought with coins.
              if (!$pokedex($nick,%i)) { .echo $pokedex($nick,%i).add } | addpoke $nick %i 30 30: $+ %p $+ :Poke  Ball | writeini pkp\cadastros\ $+ $nick $+ .ini Info Coin $calc(%c - %cost * %qnt) | msg =$nick $ct $+ Parab�ns, $cc $+ %i $ct $+ foi comprado com sucesso.
            }
            else {
              var %cost = $item.data(%i,coin), %c = $dados($nick,Info,Coin), %i = $item.data(%i,Name)
              if ($calc($item($nick,%i).qnt + %qnt) > 99) { msg =$nick $ct $+ Voc� n�o pode carregar mais do que $cc $+ %i $ct $+ (� $+ $cc $+ 99 $+ $ct $+ )! | return }
              if (%c < $calc(%cost * %qnt)) {
                if (%qnt > 1) { msg =$nick $ct $+ Voc� n�o tem $cc $+ � $+ $getmoney($calc(%cost * %qnt)) $ct $+ para comprar $cc $+ %i $ct $+ (� $+ $cc $+ $base(%qnt,10,10,2) $+ $ct $+ )! }
                else { msg =$nick $ct $+ Voc� n�o tem $cc $+ � $+ $getmoney($calc(%cost * %qnt)) $ct $+ para comprar $cc $+ %i $+ $ct $+ ! }
                return
              }
              var %u = $item.data(%i,use)
              if (%u == Special) || (%u == Mult) { if ($item($nick,%i).qnt) { msg =$nick $ct $+ Voc� j� possui o item $cc $+ %i $+ $ct $+ . | return } | if (%qnt > 1) { msg =$nick $ct $+ Voc� n�o pode carregar mais de um $cc $+ %i $ct $+ em sua mochila! | return } }
              wlog user $nick %i (� $+ $base(%qnt,10,10,2) $+ ) $iif(%qnt > 1,were,was) bought with coins.
              writeini pkp\cadastros\ $+ $nick $+ .ini Info Coin $calc(%c - %cost * %qnt) | item.add $nick %i $+ : $+ %qnt | msg =$nick $cc $+ %i $ct $+ (� $+ $cc $+ $base(%qnt,10,10,2) $+ $ct $+ ) $iif(%qnt > 1,foram comprados,foi comprado) com sucesso.
            }
          }
          else { if ($ispk(%i)) { msg =$nick $ct $+ N�o � vendido o pok�mon $cc $+ $basestat(%i) $+ $ct $+ . } | else { msg =$nick $ct $+ O item selecionado n�o foi encontrado no estoque. } }
        }
        elseif (!$3) {
          msg =$nick $ct $+ Exibindo lista de artigos do $cc $+ Game Corner $ct $+ de $cc $+ $dados($nick,Info,Locate) $+ $ct $+ :
          var %i = $shop(%p,%a), %x = 0, %t = $gettok(%i,0,58)
          while (%x < %t) {
            inc %x | var %ti = $gettok(%i,%x,58)
            if ($ispk(%ti)) {
              if (!%y) { var %y = 1 | msg =$nick $chr(160) }
              msg =$nick $chr(160) $cc $+ $arrange($org(%ti),160,15) $ct $+ Pre�o: $cc $+ � $+ $arrange($getmoney($corner(%ti,price)),160,7) $ct $+ Descri��o: $cc $+ Pok�mon.
            }
            else { msg =$nick $chr(160) $cc $+ $arrange($item.data(%ti,name),160,15) $ct $+ Pre�o: $cc $+ � $+ $arrange($getmoney($item.data(%ti,coin)),160,7) $ct $+ Descri��o: $cc $+ $item.data(%ti,desc) }
          }
          msg =$nick $ct $+ Fim da lista de artigos.
          msg =$nick $ct $+ Para comprar alguma coisa, digite " $+ $cc $+ .Corner Comprar <item/pok�mon> $+ $ct $+ ".
        }
      }
      elseif (!$2) {
        msg =$nick $ct $+ Bem vindo ao $cc $+ Game Corner $ct $+ de $cc $+ %l $+ $ct $+ !
        msg =$nick $chr(160) $ct $+ Para jogar, digite " $+ $cc $+ .Corner Jogar <Moedas> $+ $ct $+ ", especificando o n�mero de $cc $+ moedas $ct $+ que voc� deseja $cc $+ apostar $+ $ct $+ ;
        msg =$nick $chr(160) $ct $+ Para visualizar a premia��o, digite " $+ $cc $+ .Corner Premia��o $+ $ct $+ " e ser�o listados os diferentes $cc $+ resultados $ct $+ poss�veis de $cc $+ premia��o $+ $ct $+ ;
        msg =$nick $chr(160) $ct $+ Para comprar itens, digite " $+ $cc $+ .Corner Comprar $+ $ct $+ " e voc� visualizar� os $cc $+ itens $ct $+ ou $cc $+ pok�mon $ct $+ dispon�veis;
        msg =$nick $chr(160) $ct $+ Para trocar seu dinheiro por novas moedas, procure a balconista do $cc $+ Game Corner $+ $ct $+ .
        msg =$nick $ct $+ Fim da exibi��o de comandos.
      }
      else { msg =$nick $ct $+ Voc� utilizou de forma errada este comando. Reveja o que escreveu. Para mais informa��es, digite ' $+ $cc $+ .Corner $+ $ct $+ '. }
      return
    }
    elseif ($1 == .Top) {
      if ($checknickid($nick) == Ok!) { msg =$nick $ct $+ Voc� n�o pode ver o $cc $+ Top $ct $+ enquanto batalha! | return }
      if ($v(Watch. [ $+ [ $nick ] ])) { msg =$nick $ct $+ Voc� n�o pode ver o $cc $+ Top $ct $+ enquanto assiste a outras batalhas. Para parar de assisti-la, digite ' $+ $cc $+ .Assistir $+ $ct $+ '. | return }
      if (%confirm. [ $+ [ $nick ] ]) { msg =$nick $ct $+ Antes de ver o $cc $+ Top $+ $ct $+ , digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar o �ltimo pedido. | return }
      if ($2) { var %x = 1- $+ $top.total | if ($2 !isnum) { msg =$nick $ct $+ Voc� utilizou este comando de forma errada. Digite ' $+ $cc $+ .Top $+ $ct $+ ' para listar os melhores, ou especifique uma posi��o com ' $+ $cc $+ .Top <posi��o> $+ $ct $+ '. | return } | if ($2 !isnum %x) { msg =$nick $ct $+ As posi��es est�o entre $cc $+ 1 $ct $+ e $cc $+ $top.total $+ $ct $+ . Digite ent�o ' $+ $cc $+ .Top < $+ %x $+ > $+ $ct $+ '. | return } | var %n = $int($2) } | else { var %n = 10 }
      var %x = $tevent(Top,$nick).time
      if (%x) {
        var %r = $calc($ctime($date $time) - $ctime(%x)) | if (%r >= 10) { goto top }
        else { msg =$nick $ct $+ N�o fa�a flood com este comando. Voc� poder� reutiliz�-lo em $cc $+ $calc(10 - %r) $ct $+ $iif($calc(10 - %r) > 1,segundos.,segundo.) | return }
      }
      else {
        :top
        if (%n < 10) { var %r = %n } | else { var %r = 10 } | msg =$nick $ct $+ Exibindo a posi��o geral dos treinadores no $cc $+ $me $+ $ct $+ :
        var %x = $calc(%n - %r), %p = $len($getmoney($top.pt($calc(%x + 1))))
        if (!$2) || ($2 < 11) {
        msg =$nick $chr(160) $ct $+ Posi��o $cc $+ $arrange(0,160,$len(%n)).right $+ � $+  $ct $+ : $cc $+ $arrange(Corpse,160,20) $ct $+ - $cc $+ $arrange($getmoney(99999999),160,%p).right $ct $+ pontos }
        while (%x < %n) {
          if ($top.pos($calc(%x + 1))) {
            inc %x | var %nick = $top.pos(%x), %points = $top.pt(%nick), %points = $iif(%points,%points,0)
            msg =$nick $chr(160) $ct $+ Posi��o $cc $+ $arrange(%x,160,$len(%n)).right $+ � $+ $ct $+ : $cc $+ $arrange(%nick,160,20) $ct $+ - $cc $+ $arrange($getmoney(%points),160,%p).right $ct $+ pontos $iif($rini(cadastros,%nick,Info,Premium),$ct $+ $chr(40) $+ 4+ $+ $ct $+ $chr(41))
          }
          else { var %x = %n }
        }
        msg =$nick $ct $+ Est�o cadastrados cerca de $cc $+ $int($calc($findfile(pkp\cadastros\,*.ini,0) / 10)) $+ 0 $ct $+ treinadores, apenas $cc $+ $top.total $ct $+ est�o classificados no ' $+ $cc $+ .Top $+ $ct $+ '.
        msg =$nick $ct $+ Treinadores marcados com 4+ $ct $+ est�o com seus cadastros premiados atualmente.
        tevent Top $nick | return
      }
    }
    elseif ($1 == .Atualizar) && ($rini(cadastros,$nick,Info,Access) == 5) {
      if (%stand. [ $+ [ $nick ] ]) { unset %stand. [ $+ [ $nick ] ] }
      if ($2 == add) {
        if ($3) {
          if ($checknickid($3) == Ok!) { .msg =$nick $ct $+ Este usu�rio est� batalhando no momento. | return }
          if ($isfile(pkp\cadastros\ $+ $3 $+ .ini) == $false) { .msg =$nick $ct $+ Este usu�rio $cc $+ $3 $ct $+ n�o est� cadastrado. | return }
          if ($rini(cadastros,$3,Info,Access) == 5) && ($3 != $nick) { .msg =$nick $ct $+ Imposs�vel alterar dados de outro moderador. | return }
          if ($5 !isnum) { .msg =$nick $ct $+ O level selecionado � inv�lido. | return }
          if ($pokedex($3,$4) == $false) { .echo $pokedex($3,$4).add }
          addpoke $3 $4 $5 $5 $+ :PkPAdv:Poke  Ball
          if ($6) {
            if (s isin $6) { writeini pkp\cadastros\ $+ $3 $+ .ini $4 Shiny ON }
            if (u isin $6) { writeini pkp\cadastros\ $+ $3 $+ .ini $4 IVHp 31 | writeini pkp\cadastros\ $+ $3 $+ .ini $4 IVAtk 31 | writeini pkp\cadastros\ $+ $3 $+ .ini $4 IVDef 31 | writeini pkp\cadastros\ $+ $3 $+ .ini $4 IVSpd 31 | writeini pkp\cadastros\ $+ $3 $+ .ini $4 IVSAtk 31 | writeini pkp\cadastros\ $+ $3 $+ .ini $4 IVSDef 31 | recalc $3 $4 }
            if (b isin $6) { writeini pkp\cadastros\ $+ $3 $+ .ini $4 EVHp 85 | writeini pkp\cadastros\ $+ $3 $+ .ini $4 EVAtk 85 | writeini pkp\cadastros\ $+ $3 $+ .ini $4 EVDef 85 | writeini pkp\cadastros\ $+ $3 $+ .ini $4 EVSpd 85 | writeini pkp\cadastros\ $+ $3 $+ .ini $4 EVSAtk 85 | writeini pkp\cadastros\ $+ $3 $+ .ini $4 EVSDef 85 | recalc $3 $4 }
            if ($basestat($4,GV) isnum 0-256) {
              if (m isin $6) { if ($basestat($4,GV) < 256) { writeini pkp\cadastros\ $+ $3 $+ .ini $4 Sex Male | writeini pkp\cadastros\ $+ $3 $+ .ini $4 GV 0 } }
              if (f isin $6) { if ($basestat($4,GV)) { writeini pkp\cadastros\ $+ $3 $+ .ini $4 Sex Female | writeini pkp\cadastros\ $+ $3 $+ .ini $4 GV 255 } }
            }
          }
          write pkp\log\admin.txt : $+ $date ( $+ $time $+ ):
          write pkp\log\admin.txt : $+ $nick $+ : .Atualizar $upper($2) $3-
          write pkp\log\admin.txt $chr(32)
          .msg =$nick $ct $+ Dados atualizados com sucesso.
        }
        else {
          msg =$nick $ct $+ Par�metros ( $+ $cc $+ ADD $+ $ct $+ ):
          msg =$nick $chr(160) $cc $+ b $ct $+ - para distribuir efforts de forma balanceada (85 em cada atributo);
          msg =$nick $chr(160) $cc $+ f $ct $+ - para que o pok�mon seja f�mea (se puder);
          msg =$nick $chr(160) $cc $+ m $ct $+ - para que o pok�mon seja macho (se puder);
          msg =$nick $chr(160) $cc $+ s $ct $+ - para tornar um pok�mon shiny;
          msg =$nick $chr(160) $cc $+ u $ct $+ - para tornar um pok�mon uber (com IVs m�ximos);
        }
        return
      }
      elseif ($2 == rem) {
        if ($checknickid($3) == Ok!) { .msg =$nick $ct $+ Este usu�rio est� batalhando no momento. | return }
        if ($isfile(pkp\cadastros\ $+ $3 $+ .ini) == $false) { .msg =$nick $ct $+ Este usu�rio $cc $+ $3 $ct $+ n�o est� cadastrado. | return }
        if ($rini(cadastros,$3,Info,Access) == 5) && ($3 != $nick) { .msg =$nick $ct $+ Imposs�vel alterar dados de outro moderador. | return }
        if ($checkteam($3,$4) == $false) { .msg =$nick $ct $+ O usu�rio selecionado n�o tem o pok�mon. | return }
        write pkp\log\admin.txt : $+ $date ( $+ $time $+ ):
        write pkp\log\admin.txt : $+ $nick $+ : .Atualizar $upper($2) $3-
        write pkp\log\admin.txt :DATA: $data(pkp\cadastros\ $+ $3 $+ .ini,$4)
        write pkp\log\admin.txt $chr(32)
        remteam $3 $4 | remini pkp\cadastros\ $+ $3 $+ .ini $4 | .msg =$nick $ct $+ Dados atualizados com sucesso. | return
      }
      elseif ($2 == report) {
        var %f = pkp\log\reports.txt, %t = $lines(%f)
        if ($3 == list) {
          if (%t) {
            msg =$nick $ct $+ Exibindo lista de mensagens reportadas:
            var %x = 0 | while (%x < %t) {
              inc %x | var %c = $read(%f,%x) | msg =$nick $chr(160) $ct $+ $chr(35) $+ $cc $+ $base(%x,10,10,2) $ct $+ - $cc $+ $gettok(%c,2,62) $ct $+ ( $+ $gettok(%c,1,62) $+ )
            }
            msg =$nick $ct $+ Fim da exibi��o de mensagens.
          }
          else { msg =$nick $ct $+ N�o h� mensagens reportadas neste momento. }
        }
        elseif ($3 == read) {
          if ($4 !isnum $+(1-,%t)) { msg =$nick $ct $+ Especifique o n�mero da mensagem a ser lida corretamente. }
          else {
            var %c = $read(%f,$int($4))
            msg =$nick $ct $+ Mensagem $chr(35) $+ $cc $+ $base($int($4),10,10,2) $+ $ct $+ : | msg =$nick $chr(160) $ct $+ $deltok(%c,1-2,62)
            msg =$nick $ct $+ Fim da exibi��o.
          }
        }
        elseif ($3 == prize) {
          if ($4 !isnum $+(1-,%t)) { msg =$nick $ct $+ Especifique o n�mero da mensagem a ser premiada corretamente. }
          else {
            var %c = $read(%f,$int($4)), %n = $gettok(%c,2,62)
            if ($dados(%n,Info,Nick)) {
              writeini pkp\cadastros\ $+ %n $+ .ini Info Milhagem $calc($rini(cadastros,%n,Info,Milhagem) + (600 * 100))
              msg =$nick $ct $+ Usu�rio $cc $+ %n $ct $+ foi premiado com sucesso.
              if ($checknick(%n) == Ok!) { msg $+(=,%n) $ct $+ Parab�ns, sua mensagem reportada foi premiada! Voc� ganhou $cc $+ 100 $ct $+ Pok�Milhas! }
              wlog user %n $dados($nick,Info,Nick) prized his report with pok�miles.
              .write $+(-dl,$int($4)) %f
            }
            else { msg =$nick $ct $+ Usu�rio $cc $+ %n $ct $+ n�o encontrado. }
          }
        }
        elseif ($3 == del) {
          if ($4 == all) { .write -c %f | msg =$nick $ct $+ Todas as mensagens foram apagadas. | wlog $nick Removed all reports from register. }
          elseif ($4 !isnum $+(1-,%t)) { msg =$nick $ct $+ Especifique o n�mero da mensagem a ser apagada corretamente. }
          else {
            .write $+(-dl,$int($4)) %f
            .msg =$nick $ct $+ Mensagem $chr(35) $+ $cc $+ $base($int($4),10,10,2) $ct $+ foi apagada.
            wlog $nick Removed report number $int($4) $+ .
          }
        }
        else {
          msg =$nick $ct $+ Bem vindo ao assistente de leitura de $cc $+ reports $ct $+ (mensagens enviadas pelos usu�rios diretamente ao administrador).
          msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .Atualizar REPORT LIST $+ $ct $+ ' para listar todos as mensagens enviadas.
          msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .Atualizar READ <mensagem> $+ $ct $+ ' para ler a mensagem selecionada. O valor de mensagem deve ser o n�mero da mesma, indicado ao list�-las.
          msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .Atualizar PRIZE <mensagem> $+ $ct $+ ' para premiar a mensagem selecionada. Ao premi�-la, a mensagem ser� apagada da lista automaticamente.
          msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .Atualizar DEL <mensagem> $+ $ct $+ ' para apagar a mensagem selecionada. Lembre-se que os n�meros equivalentes das demais mensagens s�o alterados ao apagar alguma mensagem. Liste-as antes de prosseguir. Se quiser apagar todas, especifique $cc $+ ALL $ct $+ ap�s $cc $+ DEL $+ $ct $+ .
          msg =$nick $ct $+ Fim da exibi��o de comandos.
        }
        return
      }
      elseif ($2 == evolve) {
        if ($checknickid($3) == Ok!) { .msg =$nick $ct $+ Este usu�rio est� batalhando no momento. | return } | if ($isfile(pkp\cadastros\ $+ $3 $+ .ini) == $false) { .msg =$nick $ct $+ Este usu�rio $cc $+ $3 $ct $+ n�o est� cadastrado. | return } | if ($checkteam($3,$4) == $false) { .msg =$nick $ct $+ O usu�rio selecionado n�o tem o pok�mon. | return } | if ($checkteam($3,$5) == $true) { .msg =$nick $ct $+ A evolu��o n�o pode ser conclu�da, j� existe um pok�mon com o mesmo nome no time. | return } | if (!$wildtok($readini(pkp\evolve.ini,Evolve,$4),$5 $+ *,0,59)) { msg =$nick $ct $+ Pok�mon $cc $+ $4 $ct $+ n�o pode evoluir para $cc $+ $5 $+ $ct $+ . | return }
        if ($rini(cadastros,$3,Info,Access) == 5) && ($3 != $nick) { .msg =$nick $ct $+ Imposs�vel alterar dados de outro moderador. | return }
        if ($pokedex($3,$5) == $false) { .echo $pokedex($3,$5).add }
        write pkp\log\admin.txt : $+ $date ( $+ $time $+ ):
        write pkp\log\admin.txt : $+ $nick $+ : .Atualizar $upper($2) $3-
        write pkp\log\admin.txt :DATA: $data(pkp\cadastros\ $+ $3 $+ .ini,$4)
        write pkp\log\admin.txt $chr(32)
        evolvepoke $3 $4 $5 | var %poke = $5, %player = $3, %nmoves = $check.move(%poke,$rini(cadastros,%player,%poke,Level)), %x = 1
        while ($gettok(%nmoves,%x,58)) {
          if ($learned(%player,%poke,$gettok(%nmoves,%x,58)) == No!) && (!$findtok($rini(cadastros,%nick,%poke,Learn),$gettok(%nmoves,%x,58),0,58)) {
            if ($rini(cadastros,%player,%poke,Move4)) {
              if ($rini(cadastros,%player,%poke,Learn)) { writeini pkp\cadastros\ $+ %player $+ .ini %poke Learn $rini(cadastros,%player,%poke,Learn) $+ : $+ $gettok(%nmoves,%x,58) }
              else { writeini pkp\cadastros\ $+ %player $+ .ini %poke Learn $gettok(%nmoves,%x,58) }
            }
            else { addmove %player %poke $gettok(%nmoves,%x,58) }
          }
          inc %x
        }
        .msg =$nick $ct $+ Dados atualizados com sucesso. | return
      }
      elseif ($2 == data) {
        var %admin = Architect:Corpse
        if ($checknickid($gettok($3,1,58)) == Ok!) { .msg =$nick $ct $+ Este usu�rio est� batalhando no momento. | return } | if (!$isfile(pkp\cadastros\ $+ $gettok($3,1,58) $+ .ini)) { .msg =$nick $ct $+ Este usu�rio $cc $+ $gettok($3,1,58) $ct $+ n�o est� cadastrado. | return }
        if ($gettok($3,2,58) == BOX) { var %f = pkp\box\ $+ $gettok($3,1,58) $+ \ $+ $gettok($3,3,58) $+ .ini } | else { var %f = pkp\cadastros\ $+ $3 $+ .ini }
        var %f.section = Pokedex:Quests:Hoenn:Kanto:Item:Historico:PC, %f.reg = Nick:Password:Access:Coin:Item:Pokedex:Premium:StoreMarket:Recover:Perfil:Start
        if ($4) {
          if ($findtok(%f.section,$4,0,58)) && (!$findtok(%admin,$nick,0,58)) { msg =$nick $ct $+ Estes registros s� podem ser alterados manualmente, por quest�es de seguran�a. | return }
          if ($5) {
            var %z = $4
            if (!$ini(%f,%z,$5)) && (!$ini(%f,%z)) { msg =$nick $ct $+ Caminho n�o encontrado. Reveja os registros e as se��es para mais detalhes. | return }
            if ($rini(cadastros,$3,Info,Access) == 5) && ($3 != $nick) { .msg =$nick $ct $+ Imposs�vel alterar dados de outro moderador. | return }
            if ($findtok(%f.reg,$5,0,58)) { msg =$nick $ct $+ Estes registros s� podem ser alterados manualmente, por quest�es de seguran�a. | return }
            if ($5 == Online) && ($3 != $nick) { msg =$nick $ct $+ Estes registros s� podem ser alterados manualmente, por quest�es de seguran�a. | return }
            if ($6 == $null) { msg =$nick $ct $+ Para remover um valor (n�o recomendado), modifique-o para UNSET. | return }
            write pkp\log\admin.txt : $+ $date ( $+ $time $+ ):
            write pkp\log\admin.txt : $+ $nick $+ : .Atualizar $upper($2) $3-
            write pkp\log\admin.txt :DATA: $4 $5 = $readini(%f,$4,$5)
            write pkp\log\admin.txt $chr(32)
            if ($6 == unset) { remini %f $4 $5 }
            else { writeini %f $4 $5 $6- }
            .msg =$nick $ct $+ Dados atualizados com sucesso. | return
          }
          else {
            msg =$nick $ct $+ Exibindo registros para a se��o $cc $+ $4 $+ $ct $+ :
            var %x = $ini(%f,$4,0), %y = 0 | while (%y < %x) {
              inc %y
              var %z = $ini(%f,$4,%y)
              if (!$findtok(%f.reg,%z,0,58)) || ($findtok(%admin,$nick,0,58)) {
                msg =$nick $chr(160) $ct $+ $chr(35) $+ $cc $+ $base(%y,10,10,2) $ct $+ - $cc $+ %z $ct $+ = $cc $+ $readini(%f,$4,%z)
              }
            }
            msg =$nick $ct $+ Fim da exibi��o. | return
          }
        }
        else {
          msg =$nick $ct $+ Exibindo se��es para $cc $+ $3 $+ $ct $+ :
          var %x = $ini(%f,0), %y = 0 | while (%y < %x) {
            inc %y
            if (!$findtok(%f.section,$ini(%f,%y),0,58)) || ($findtok(%admin,$nick,0,58)) {
              msg =$nick $chr(160) $ct $+ $chr(35) $+ $cc $+ $base(%y,10,10,2) $ct $+ - $cc $+ $ini(%f,%y) $ct $+ ( $+ $ini(%f,%y,0) registros)
            }
          }
          msg =$nick $ct $+ Fim da exibi��o. | return
        }
      }
      elseif ($2 == NICK) {
        var %file = pkp\newnick.txt
        if ($3 == LIST) {
          if ($lines(%file)) {
            msg =$nick $ct $+ Exibindo lista de usu�rios que desejam alterar o nickname: | var %x = 1
            while ($read(%file,%x)) {
              var %r = $read(%file,%x), %n = $gettok(%r,1,58), %new = $nullfill($gettok(%r,2,32)), %date = $nullfill($gettok(%r,3-4,32))
              msg =$nick $chr(160) $ct $+ $chr(35) $+ $base(%x,10,10,2) $cc $+ $arrange(%n,160,15).right $ct $+ -> $cc $+ $arrange(%new,160,15).center $ct $+ ( $+ $cc $+ %date $+ $ct $+ )
              inc %x
            }
            msg =$nick $ct $+ Fim da exibi��o da lista.
          }
          else { msg =$nick $ct $+ Nenhum usu�rio solicitou altera��o de nick. }
        }
        elseif ($3 == REM) {
          if ($lines(%file)) {
            if ($4) {
              if ($read(%file,s,$4 $+ :)) { var %r = $readn, %n = $gettok($read(%file,%r),1,58) | .write $+(-dl,%r) %file | msg =$nick $cc $+ %n $ct $+ foi removido com sucesso da lista. }
              else { msg =$nick $ct $+ O usu�rio selecionado n�o est� na lista de altera��o de nick. }
            }
            else { .write -c %file | msg =$nick $ct $+ Todos os usu�rios foram removidos da lista de altera��o de nick. }
          }
          else { msg =$nick $ct $+ N�o h� usu�rios na lista de altera��o de nick. }
        }
        elseif ($3 == NEW) {
          if ($4) {
            if ($read(%file,s,$4 $+ :)) {
              var %r = $readn, %n = $gettok($read(%file,%r),1,58), %new = $nullfill($gettok($read(%file,%r),2,32))
              if ($nbot(%n) == Ok!) && (%n != $nick) { .msg =$nick $ct $+ O usu�rio $cc $+ $dados(%n,Info,Nick) $ct $+ est� conectado no momento. | return }
              .write $+(-dl,%r) %file
              if ($dados(%new,Info,Nick)) { .msg =$nick $ct $+ N�o � poss�vel mudar o nick $cc $+ %new $+ $ct $+ . Este usu�rio j� existe! | return }
              if ($npc(%new)) { .msg =$nick $ct $+ O novo nick selecionado n�o � v�lido. | return }
              if (%n == $nick) { nick.kick $me $nick Alterando nick... }
              usernick %n %new
              if ($checknick($nick) == Ok!) { .msg =$nick $ct $+ Usu�rio $cc $+ %n $ct $+ teve seu nick alterado para $cc $+ %new $+ $ct $+ . }
              wlog user %new Changed its nickname from %n $+ .
            }
            else { msg =$nick $ct $+ O usu�rio selecionado n�o est� na lista de mudan�a de nick. }
          }
          else { msg =$nick $ct $+ Neste comando, � preciso especificar o nick do usu�rio que deseja alterar seu nick. }
        }
        elseif (!$3) {
          msg =$nick $ct $+ Para realizar a altera��o de nick de um usu�rio, � necess�rio, primeiramente, que o mesmo solicite. A seguir, um moderador deve verificar a exist�ncia do pedido de altera��o e confirm�-lo ou n�o. Dessa forma, pretende-se oferecer mais seguran�a ao usu�rio.
          msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .Atualizar NICK LIST $+ $ct $+ ' para listar todos os usu�rios que solicitaram a altera��o de nick, com suas respectivas datas e novos nicks.
          msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .Atualizar NICK REM (<nick>) $+ $ct $+ ' para remover um usu�rio da lista de solicita��o de altera��o. Se um nick n�o for especificado, apagar� todos os itens da lista.
          msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .Atualizar NICK NEW <nick> $+ $ct $+ ' para descadastrar um usu�rio que tenha solicitado a sua altera��o.
          msg =$nick $ct $+ N�o � recomend�vel a altera��o de nicks, pois sempre deixar� rastros do nick anterior nos demais cadastros. Esta aplica��o s� altera ID dos pok�mon do usu�rio solicitado, n�o de todos os usu�rios. Portanto, deve ser usado apenas em casos especiais.
        }
        else { msg =$nick $ct $+ Digite ' $+ $cc $+ .Atualizar $+ $ct $+ ' para ver os comandos dispon�veis e como utiliz�-los. Se tiver d�vidas sobre este especificadamente, ent�o digite ' $+ $cc $+ .Atualizar NICK $+ $ct $+ ' apenas. }
        return
      }
      elseif ($2 == view) {
        view.dados 2 $3-
        return
      }
      elseif ($2 == pc) {
        view.pc 2 $3-
        return
      }
      elseif ($2 == wild) {
        if ($3) {
          if ($checknick($3) == No!) { msg =$nick $ct $+ O usu�rio selecionado n�o est� conectado ao bot. | return }
          if (!$4) || (!$basestat($4,etype)) { msg =$nick $ct $+ � necess�rio especificar o pok�mon que o usu�rio selecionado ir� utilizar durante sua batalha com pok�mon selvagem. | return }
          write pkp\log\admin.txt : $+ $date ( $+ $time $+ ):
          write pkp\log\admin.txt : $+ $nick $+ : .Atualizar WILD $3-
          write pkp\log\admin.txt $chr(32)
          battle.wild $3-
        }
        else {
          msg =$nick $ct $+ H� muitas maneiras de utilizar este comando. Primeiro, obrigatoriamente, especifique $cc $+ usu�rio $ct $+ e $cc $+ pok�mon $ct $+ usado. Os pr�ximos par�metros dever�o seguir uma ordem para serem interpretados (todos s�o opcionais):
          msg =$nick $chr(160) $cc $+ .Atualizar WILD <nick> <pok�mon> (<pok�mon>) (<level>) (<par�metros>)
          msg =$nick $ct $+ Perceba que $cc $+ (<pok�mon>) $ct $+ � o pok�mon selvagem e $cc $+ (<level>) $ct $+ o level do mesmo. Se esta ordem for invertida, n�o ser� poss�vel completar a solicita��o de batalha. Como todos s�o opcionais, voc� pode querer apenas especificar o level, ent�o simplesmente n�o especifique o pok�mon selvagem nem qualquer outro par�metro.
          msg =$nick $ct $+ Par�metros ( $+ $cc $+ WILD $+ $ct $+ ):
          msg =$nick $chr(160) $cc $+ b $ct $+ - proveniente de ' $+ $cc $+ ball $+ $ct $+ ', indica que o n�mero de pok�bolas permitidas antes do advers�rio fugir foi especificada;
          msg =$nick $chr(160) $cc $+ h $ct $+ - proveniente de ' $+ $cc $+ hold $+ $ct $+ ', indica que um item equipado foi especificado para o pok�mon selvagem;
          msg =$nick $chr(160) $cc $+ f $ct $+ - proveniente de ' $+ $cc $+ female $+ $ct $+ ', atribui o g�nero feminino ao pok�mon selvagem, se poss�vel;
          msg =$nick $chr(160) $cc $+ m $ct $+ - proveniente de ' $+ $cc $+ male $+ $ct $+ ', atribui o g�nero masculino ao pok�mon selvagem, se poss�vel;
          msg =$nick $chr(160) $cc $+ q $ct $+ - proveniente de ' $+ $cc $+ query $+ $ct $+ ', significa que ser� solicitada uma confirma��o do usu�rio antes da batalha iniciar.
          msg =$nick $chr(160) $cc $+ s $ct $+ - proveniente de ' $+ $cc $+ shiny $+ $ct $+ ', atribui o fator shiny ao pok�mon selvagem;
          msg =$nick $chr(160) $cc $+ u $ct $+ - proveniente de ' $+ $cc $+ uber $+ $ct $+ ', atribui ao pok�mon selvagem IVs m�ximos;
          msg =$nick $chr(160) $cc $+ z $ct $+ - proveniente de ' $+ $cc $+ zone $+ $ct $+ ', significa que a batalha acontecer� na $cc $+ Safari Zone $+ $ct $+ ;
          msg =$nick $ct $+ Em rela��o aos par�metros $cc $+ b $ct $+ e $cc $+ h $+ $ct $+ , que servem apenas como indicadores, os valores indicados pelos mesmos devem ser especificados ap�s os par�metros e estarem separados por v�rgula, obedecendo a ordem em que os mesmos foram previamente apresentados. Por exemplo, suponhamos que � de seu desejo que o pok�mon fuja com apenas $cc $+ tr�s $ct $+ pok�bolas e que carregue um $cc $+ Leftovers $+ $ct $+ . Os par�metros, ent�o, devem ser apresentados dessa forma: $cc $+ bh 3,Leftovers $ct $+ ou $cc $+ hb Leftovers,3 $+ $ct $+ .
          msg =$nick $ct $+ Se a batalha puder ser iniciada, o usu�rio selecinado ter� esta batalha contabilizada em seu hist�rico. Por exemplo, se quatro batalhas forem efetuadas (por um usu�rio n�o-premiado) tr�s delas ser�o contadas como batalhas do $cc $+ wild di�rio $+ $ct $+ , e as demais ser�o atribu�das ao $cc $+ wild extra $+ $ct $+ .
        }
        return
      }
      elseif ($2 == npc) {
        var %ID = $3, %file = $int($calc(%ID / 100)) $+ 00
        if (%ID) {
          if ($exists(pkp\npc\ $+ %file $+ .ini)) {
            if ($ini(pkp\npc\ $+ %file $+ .ini,1) == %file) { var %nID = $calc(1 + %ID - %file) }
            else { var %nID = $calc(%ID - %file) }
            if ($4) {
              if ($rini(npc,%file,%ID,$4) != $null) {
                if ($5 != $null) {
                  var %v = $rini(npc,%file,%ID,$4)
                  if (%v == $5-) { msg =$nick $ct $+ Nenhuma modifica��o foi realizada. | return }
                  writeini pkp\npc\ $+ %file $+ .ini %ID $4 $5-
                  write pkp\log\admin.txt : $+ $date ( $+ $time $+ ):
                  write pkp\log\admin.txt : $+ $nick $+ : .Atualizar $upper($2) $3-
                  write pkp\log\admin.txt :DATA: %ID $4 = %v
                  write pkp\log\admin.txt $chr(32)
                  msg =$nick $ct $+ Exibindo modifica��o da chave ' $+ $cc $+ $upper($4) $+ $ct $+ ' em $cc $+ %ID $+ $ct $+ :
                  msg =$nick $chr(160) $ct $+ %v
                  msg =$nick $chr(160) $cc $+ $5-
                  msg =$nick $ct $+ NPC $cc $+ %ID $ct $+ modificado com sucesso.
                }
                else { msg =$nick $ct $+ Especifique um valor v�lido para a chave ' $+ $cc $+ $upper($4) $+ $ct $+ '. }
              }
              else { msg =$nick $ct $+ Esta chave ' $+ $cc $+ $upper($4) $+ $ct $+ ' n�o foi encontrada em ID $cc $+ %ID $+ $ct $+ . }
            }
            else {
              var %x = 1
              if (!$rini(npc,%file,%ID,$ini(pkp\npc\ $+ %file $+ .ini,%nID,%x))) { msg =$nick $ct $+ Este NPC selecionado de ID $cc $+ %ID $ct $+ � inexistente. | return }
              msg =$nick $ct $+ Exibindo informa��es do NPC $cc $+ %ID $+ $ct $+ :
              while ($ini(pkp\npc\ $+ %file $+ .ini,%nID,%x)) {
                var %p = $ini(pkp\npc\ $+ %file $+ .ini,%nID,%x)
                msg =$nick $chr(160) $ct $+ $arrange(%p,160,6).right $+ : $cc $+ $rini(npc,%file,%ID,%p)
                inc %x
              }
              msg =$nick $ct $+ Fim da exibi��o.
            }
          }
          else { msg =$nick $ct $+ Este comando permite $cc $+ apenas $ct $+ a edi��o de NPCs. � preciso que voc� saiba o $cc $+ ID $ct $+ correspondente ao NPC corretamente. }
        }
        else {
          msg =$nick $ct $+ Atrav�s deste comando, � poss�vel analisar os valores atuais do $cc $+ NPC $ct $+ e edit�-los, apenas.
          msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .Atualizar NPC <ID> $+ $ct $+ ', para obter informa��es sobre este npc, representado por um ID.
          msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .Atualizar NPC <ID> <chave> <valor> $+ $ct $+ ', para alterar o valor correspondente � uma determinada chave do NPC.
          msg =$nick $ct $+ Lembre-se que qualquer altera��o pode ocasionar erro na atua��o deste NPC, portanto utilize-o com bastante cautela.
        }
        return
      }
      elseif ($2 == lock) {
        if ($isfile(pkp\cadastros\ $+ $3 $+ .ini) == $false) { .msg =$nick $ct $+ Este usu�rio $cc $+ $3 $ct $+ n�o est� cadastrado. | return }
        if ($rini(cadastros,$3,Info,Lock)) { .msg =$nick $ct $+ Desabilitado o modo LOCK para $cc $+ $3 $+ $ct $+ . | remini pkp\cadastros\ $+ $3 $+ .ini Info Lock | return }
        else {
          if ($rini(cadastros,$3,Info,Access) == 5) && ($3 != $nick) { .msg =$nick $ct $+ Imposs�vel alterar dados de outro moderador. | return }
          writeini pkp\cadastros\ $+ $3 $+ .ini Info Lock .Criar;.Entrar;.Desistir;.Assistir;.PC;.Pokedex;.Item;.Cidade;.Loja;.Market;.Daycare;.Fly;.Map;.MoveSet;.Evoluir;.Milhagem;.Top;.Ordem
          msg =$nick $ct $+ Modo LOCK habilitado para $cc $+ $3 $+ $ct $+ . | return
        }
      }
      elseif ($2 == money) {
        if ($isfile(pkp\cadastros\ $+ $3 $+ .ini) == $false) { .msg =$nick $ct $+ Este usu�rio $cc $+ $3 $ct $+ n�o est� cadastrado. | return }
        if ($rini(cadastros,$3,Info,Access) == 5) && ($3 != $nick) { .msg =$nick $ct $+ Imposs�vel alterar dados de outro moderador. | return }
        if ($4 == add) {
          if ($5 !isnum) || ($5 <= 0) { msg =$nick $ct $+ Sintaxe incorreta. Digite ' $+ $cc $+ .Atualizar $+ $ct $+ ' para mais informa��es. | return }
          var %n = $rini(cadastros,$3,Info,Money)
          write pkp\log\admin.txt : $+ $date ( $+ $time $+ ):
          write pkp\log\admin.txt : $+ $nick $+ : .Atualizar $upper($2) $3 $upper($4) $5
          write pkp\log\admin.txt :DATA: $chr(36) $+ $getmoney(%n)
          write pkp\log\admin.txt $chr(32)
          writeini pkp\cadastros\ $+ $3 $+ .ini Info Money $calc(%n + $5)
          msg =$nick $ct $+ Dados atualizados com sucesso. | return
        }
        elseif ($4 == rem) {
          if ($5 !isnum) || ($5 <= 0) { msg =$nick $ct $+ Sintaxe incorreta. Digite ' $+ $cc $+ .Atualizar $+ $ct $+ ' para mais informa��es. | return }
          var %n = $rini(cadastros,$3,Info,Money)
          if ($5 > %n) { msg =$nick $cc $+ $3 $ct $+ n�o tem dinheiro suficiente. | return }
          write pkp\log\admin.txt : $+ $date ( $+ $time $+ ):
          write pkp\log\admin.txt : $+ $nick $+ : .Atualizar $upper($2) $3 $upper($4) $5
          write pkp\log\admin.txt :DATA: $chr(36) $+ $getmoney(%n)
          write pkp\log\admin.txt $chr(32)
          writeini pkp\cadastros\ $+ $3 $+ .ini Info Money $calc(%n - $5)
          msg =$nick $ct $+ Dados atualizados com sucesso. | return
        }
        else { msg =$nick $ct $+ Sintaxe incorreta. Digite ' $+ $cc $+ .Atualizar $+ $ct $+ ' para mais informa��es. | return }
      }
      elseif ($2 == control) {
        var %x = $readini(pkp\status.ini,Active,Control) | if (%x == $nick) { .msg =$nick $ct $+ Voc� j� est� definido como controlador do campe�o da liga de $cc $+ Johto $+ $ct $+ . | return }
        if (%active.league) { .msg =$nick $ct $+ N�o � poss�vel alterar o controlador, pois $cc $+ %active.league $ct $+ j� est� batalhando na liga. | return }
        writeini pkp\status.ini Active Control $dados($nick,Info,Nick)
        msg =$nick $ct $+ Voc� foi definido como controlador do campe�o da liga de $cc $+ Johto $+ $ct $+ . Boa sorte!
        return
      }
      elseif ($2 == prize) {
        if ($3 == check) {
          if ($prize(type)) {
            var %t = $prize(type)
            msg =$nick $ct $+ Exibindo informa��es do pr�mio:
            if (%t == Pokemon) {
              msg =$nick $chr(160) $ct $+ Pok�mon: $cc $+ $prize
              msg =$nick $chr(160) $ct $+ Par�metros:
              if (!$prize(par,0)) { msg =$nick $chr(160) $chr(160) $cc $+ Nenhum }
              else {
                var %p = $prize(par), %x = 1
                while ($gettok(%p,%x,172)) { msg =$nick $chr(160) $chr(160) $ct $+ $gettok(%p,%x,172) $+ : $cc $+ $prize(par,$gettok(%p,%x,172)) | inc %x }
              }
            }
            elseif (%t == Premium) { msg =$nick $chr(160) $ct $+ Conta premiada de $cc $+ $prize $ct $+ dia(s). }
            elseif (%t == Dinheiro) { msg =$nick $chr(160) $ct $+ Dinheiro: $cc $+ $chr(36) $+ $getmoney($prize) }
            elseif (%t == Milhagem) { msg =$nick $chr(160) $ct $+ Milhagem: $cc $+ $prize $ct $+ Pok�Milhas }
            msg =$nick $ct $+ Fim da exibi��o de informa��es.
          }
          else { msg =$nick $ct $+ N�o h� pr�mio determinado neste momento. }
        }
        elseif ($3 == set) {
          if ($readini(pkp\status.ini,Prize,Active)) { msg =$nick $ct $+ N�o � poss�vel determinar novas premia��es enquanto uma j� est� em andamento! | return }
          if (%set_prize) {
            if (%set_prize == $nick) { msg =$nick $ct $+ Voc� j� est� determinando a premia��o! }
            else { msg =$nick $cc $+ $dados(%set_prize,Info,Nick) $ct $+ est� determinando a premia��o neste momento. Aguarde. }
          }
          else {
            set %set_prize $nick | set %set_prize_step 1
            msg =$nick $ct $+ Bem vindo ao assistente de premia��o. Primeiramente, determine que tipo de pr�mio ser� fornecido. Os tipos existentes s�o: $separecom(Pokemon:Premium:Dinheiro:Milhagem,e,58,$cc,$ct)
          }
        }
        elseif ($3 == start) {
          if (!$prize(type)) || (!$prize) { msg =$nick $ct $+ � preciso determinar o pr�mio corretamente antes de iniciar a premia��o! | return }
          if (%set_game) { if (%set_game == $nick) { msg =$nick $ct $+ Voc� j� est� iniciando o evento neste momento! } | else { msg =$nick $cc $+ $dados(%set_game,Info,Nick) $ct $+ est� determinando o evento neste momento! } | return }
          set %set_game $nick | set %set_game_step 1
          msg =$nick $ct $+ Bem vindo ao assistente de in�cio de premia��o. Primeiramente, vamos determinar que tipo de jogo os participantes v�o jogar. Digite o n�mero correspondente ao jogo desejado e complete com os par�metros em destaque.
          msg =$nick $chr(160) $cc $+ 1 $ct $+ - Descubra a senha de $cc $+ <n> $ct $+ d�gitos, com d�gitos que variam entre os n�meros 1 e $cc $+ <n> $+ $ct $+ ;
          msg =$nick $chr(160) $cc $+ 2 $ct $+ - Descubra a soma de $cc $+ <n> $ct $+ dados lan�ados, cada qual com $cc $+ <n> $ct $+ faces. A cada nova rodada, a face de um dado ser� revelada;
          msg =$nick $chr(160) $cc $+ 3 $ct $+ - Responda at� $cc $+ <n> $ct $+ perguntas diferentes, e cada resposta correta equivaler� a um ponto. A cada nova rodada, a pergunta ser� alterada;
          msg =$nick $chr(160) $cc $+ 4 $ct $+ - Descubra a senha, apenas. O m�todo de adquir�-la deve ser inventada por voc� mesmo. Fique a vontade para fazer outras modalidades de jogos;
          msg =$nick $ct $+ Se pretende escolher a modalidade $cc $+ 1 $+ $ct $+ , fique a vontade para, se preferir, determinar a resposta com um novo par�metro. Por exemplo, digite $cc $+ 1 3 5 151 $ct $+ (151 seria a resposta).
          msg =$nick $ct $+ Se pretende escolher a modalidade $cc $+ 2 $+ $ct $+ , apenas complete com os par�metros acima. A resposta ser� sempre determinada aleatoriamente.
          msg =$nick $ct $+ Se pretende escolher a modalidade $cc $+ 3 $+ $ct $+ , determine o n�mero de perguntas e iniciaremos um assistente para voc� determinar as perguntas e as respostas.
          msg =$nick $ct $+ Se pretende escolher a modalidade $cc $+ 4 $+ $ct $+ , � imprescind�vel que voc� determine a resposta.
        }
        elseif ($3 == clear) {
          if ($readini(pkp\status.ini,Prize,Active)) {
            if ($4 == All) { sendamsg $nick $cc $+ Aten��o $+ $ct $+ : A premia��o foi cancelada. }
            else { msg =$nick $ct $+ Se deseja realmente apagar tudo, inclusive a premia��o em andamento, digite ' $+ $cc $+ .Atualizar Prize Clear All $+ $ct $+ '. | return }
          }
          premio.clear | remini pkp\status.ini Prize | msg =$nick $ct $+ Todos os dados armazenados da premia��o foram apagados. | return
        }
        elseif (!$3) {
          msg =$nick $ct $+ Este comando � capaz de criar eventos especiais para os usu�rios, de maneiras variadas, com premia��o personaliz�vel.
          msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .atualizar prize CHECK $+ $ct $+ ' para verificar a premia��o estabelecida atualmente;
          msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .atualizar prize SET $+ $ct $+ ' para iniciar o assistente de determina��o de pr�mio;
          msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .atualizar prize START $+ $ct $+ ' para iniciar a premia��o. � necess�rio definir corretamente o pr�mio anteriormente;
          msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .atualizar prize CLEAR $+ $ct $+ ' apaga todo e qualquer rastro deixado por um evento anterior ou atual. Ou seja, se houver uma premia��o em andamento, ser� cancelada;
          msg =$nick $ct $+ Lembre-se que, ao determinar o pr�mio, os par�metros devem ser escritos nesta sintaxe: $cc $+ PAR1=VALOR1;PAR2=VALOR2(...) $+ $ct $+ . Por exemplo, se desejas que o pok�mon da premia��o seja shiny e com o Move1 Tackle, digite: $cc $+ Shiny=ON;Move1=Tackle $+ $ct $+ .
        }
        else { msg =$nick $ct $+ Sua sintaxe est� incorreta. Digite ' $+ $cc $+ .Atualizar Prize $+ $ct $+ ' para mais informa��es. }
        return
      }
      elseif ($2 == hide) {
        if ($3 == ON) {
          if ($dados($nick,Info,Hide)) { msg =$nick $ct $+ Voc� j� est� em modo ' $+ $cc $+ HIDE $+ $ct $+ '. | return }
          else {
            status.msg $nick PART
            writeini pkp\cadastros\ $+ $nick $+ .ini Info Hide ON | msg =$nick $ct $+ Voc� ativou o modo ' $+ $cc $+ HIDE $+ $ct $+ '.
            return
          }
        }
        elseif ($3 == OFF) {
          if (!$dados($nick,Info,Hide)) { msg =$nick $ct $+ Voc� n�o est� em modo ' $+ $cc $+ HIDE $+ $ct $+ '. | return }
          else {
            remini pkp\cadastros\ $+ $nick $+ .ini Info Hide | msg =$nick $ct $+ Voc� desativou o modo ' $+ $cc $+ HIDE $+ $ct $+ '.
            status.msg $nick JOIN | return
          }
        }
        else {
          msg =$nick $ct $+ Para esconder-se de outros usu�rios, digite ' $+ $cc $+ .Atualizar HIDE <ON/OFF> $+ $ct $+ '.
          msg =$nick $chr(160) $cc $+ * $ct $+ Suas mensagens normais ser�o exibidas para outros usu�rios, assim como voc� ainda poder� receber mensagens particulares e enviar.
          msg =$nick $chr(160) $cc $+ * $ct $+ Suas batalhas n�o poder�o ser assistidas, a menos que o usu�rio especifique o ID da batalha;
          msg =$nick $chr(160) $cc $+ * $ct $+ N�o ser�o listadas suas batalhas no ' $+ $cc $+ .Listar $+ $ct $+ ' desde que voc� seja o criador dela, nem na lista de usu�rios conectados.
        }
      }
      elseif ($2 == DEL) {
        var %file = pkp\del.txt
        if ($3 == LIST) {
          if ($lines(%file)) {
            msg =$nick $ct $+ Exibindo lista de usu�rios que desejam se descadastrar: | var %x = 1
            while ($read(%file,%x)) {
              var %r = $read(%file,%x), %n = $gettok(%r,1,58), %ip = $nullfill($gettok(%r,2,32)), %date = $nullfill($gettok(%r,3-4,32))
              msg =$nick $chr(160) $ct $+ $chr(35) $+ $base(%x,10,10,2) $cc $+ $arrange(%n,160,15).right $ct $+ - $cc $+ $arrange(%ip,160,15).center $ct $+ - $cc $+ %date
              inc %x
            }
            msg =$nick $ct $+ Fim da exibi��o da lista.
          }
          else { msg =$nick $ct $+ Nenhum usu�rio solicitou seu descadastramento. }
        }
        elseif ($3 == REM) {
          if ($lines(%file)) {
            if ($4) {
              if ($read(%file,s,$4 $+ :)) { var %r = $readn, %n = $gettok($read(%file,%r),1,58) | .write $+(-dl,%r) %file | msg =$nick $cc $+ %n $ct $+ foi removido com sucesso da lista. }
              else { msg =$nick $ct $+ O usu�rio selecionado n�o est� na lista de descadastramento. }
            }
            else { .write -c %file | msg =$nick $ct $+ Todos os usu�rios foram removidos da lista de descadastramento. }
          }
          else { msg =$nick $ct $+ N�o h� usu�rios na lista de descadastramento. }
        }
        elseif ($3 == NICK) {
          if ($4) {
            if ($read(%file,s,$4 $+ :)) {
              var %r = $readn, %n = $gettok($read(%file,%r),1,58) | .write $+(-dl,%r) %file
              if ($nbot(%n) == Ok!) { msg $+(=,%n) $ct $+ Voc� foi descadastrado com sucesso, $cc $+ %n $+ $ct $+ . | .active %n rem | .close -c %n }
              .remove PkP\Cadastros\ $+ %n $+ .ini | if ($exists(PkP\Box\ $+ %n $+ \)) { var %d = $findfile(PkP\Box\ $+ %n $+ \,*.*,0,.remove $1-) | .rmdir PkP\Box\ $+ %n $+ \ }
              if ($top.pos(%n)) { top.rem %n }
              sendamsg $nick $cc $+ %n $ct $+ foi descadastrado por $cc $+ $dados($nick,Info,Nick) $+ $ct $+ .
              msg =$nick $cc $+ %n $ct $+ foi descadastrado com sucesso.
            }
            else { msg =$nick $ct $+ O usu�rio selecionado n�o est� na lista de descadastramento. }
          }
          else { msg =$nick $ct $+ Neste comando, � preciso especificar o nick do usu�rio que deseja se descadastrar. }
        }
        elseif (!$3) {
          msg =$nick $ct $+ Para realizar o descadastramento de um usu�rio, � necess�rio, primeiramente, que o mesmo solicite. A seguir, um moderador deve verificar a exist�ncia do pedido de descadastramento e confirm�-lo ou n�o. Dessa forma, pretende-se oferecer mais seguran�a ao usu�rio.
          msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .Atualizar DEL LIST $+ $ct $+ ' para listar todos os usu�rios que solicitaram o descadastramento, com suas respectivas datas e IPs.
          msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .Atualizar DEL REM (<nick>) $+ $ct $+ ' para remover um usu�rio da lista de solicita��o de descadastramento. Se um nick n�o for especificado, apagar� todos os itens da lista.
          msg =$nick $chr(160) $ct $+ Digite ' $+ $cc $+ .Atualizar DEL NICK <nick> $+ $ct $+ ' para descadastrar um usu�rio que tenha solicitado o seu descadastramento.
          msg =$nick $ct $+ N�o � recomend�vel o descadastramento de usu�rios com cadastro desenvolvido. � melhor deix�-lo banido indeterminadamente, se este usu�rio estiver tentando prejudic�-lo, do que descadastr�-lo, pois o mesmo poder� se recadastrar e voltar.
        }
        else { msg =$nick $ct $+ Digite ' $+ $cc $+ .Atualizar $+ $ct $+ ' para ver os comandos dispon�veis e como utiliz�-los. Se tiver d�vidas sobre este especificadamente, ent�o digite ' $+ $cc $+ .Atualizar DEL $+ $ct $+ ' apenas. }
        return
      }
      elseif (!$2) {
        msg =$nick $ct $+ Exibindo a lista de comandos relacionados ao ' $+ $cc $+ .Atualizar $+ $ct $+ '.
        msg =$nick $chr(160) $ct $+ Para adicionar um pok�mon, digite ' $+ $cc $+ .Atualizar ADD $+ $ct $+ ' e leia mais a respeito.
        msg =$nick $chr(160) $ct $+ Para remover um pok�mon, digite ' $+ $cc $+ .Atualizar REM <nick> <pok�mon> $+ $ct $+ '. Este pok�mon n�o � removido da $cc $+ PokeDex $ct $+ do usu�rio.
        msg =$nick $chr(160) $ct $+ Para evoluir um pok�mon, digite ' $+ $cc $+ .Atualizar EVOLVE <nick> <pok�mon> <evolu��o> $+ $ct $+ '. A evolu��o ser� adicionada automaticamente � $cc $+ PokeDex $ct $+ do usu�rio.
        msg =$nick $chr(160) $ct $+ Para alterar alguma informa��o do usu�rio, digite ' $+ $cc $+ .Atualizar DATA <nick> <par�metros> $+ $ct $+ '. Para visualizar os par�metros de uma se��o, n�o especifique o par�metro e eles ser�o listados.
        msg =$nick $chr(160) $ct $+ Para visualizar informa��es de um usu�rio, digite ' $+ $cc $+ .Atualizar VIEW <nick> (<pok�mon>) $+ $ct $+ '. Esta informa��o ficar� dispon�vel mesmo desativando a exibi��o no perfil.
        msg =$nick $chr(160) $ct $+ Para a edi��o da grana do usu�rio, digite ' $+ $cc $+ .Atualizar MONEY <nick> <ADD/REM> <quantidade> $+ $ct $+ '. Adiciona ou remove dinheiro na quantidade especificada.
        msg =$nick $chr(160) $ct $+ Para ver informa��es do PC de um usu�rio, digite ' $+ $cc $+ .Atualizar PC <nick> [<box> (<pok�mon>)] $+ $ct $+ '. Funciona da mesma forma que o comando ' $+ $cc $+ .PC Stats $+ $ct $+ '.
        msg =$nick $chr(160) $ct $+ Para desabilitar os comandos para um usu�rio, digite ' $+ $cc $+ .Atualizar LOCK <nick> $+ $ct $+ '. Esta regra n�o se aplicar� a todos os comandos, os principais como $cc $+ .Dados $ct $+ continuar�o funcionando. Para desativar, basta usar o mesmo comando.
        msg =$nick $chr(160) $ct $+ Para esconder-se dos outros usu�rios, digite ' $+ $cc $+ .Atualizar HIDE ON $+ $ct $+ '. Al�m de sua entrada n�o ser percebida, suas batalhas n�o ser�o listadas e nem poder�o ser assistidas sem o ID. Lembre-se que sua pontua��o n�o ser� inclu�da no Top.
        msg =$nick $chr(160) $ct $+ Para definir-se como controlador do campe�o da liga de $cc $+ Johto $+ $ct $+ , digite ' $+ $cc $+ .Atualizar CONTROL $+ $ct $+ '. Neste momento, o moderador respons�vel � $cc $+ $readini(pkp\status.ini,Active,Control) $+ $ct $+ .
        msg =$nick $chr(160) $ct $+ Para edi��o de NPCs, utilize o comando ' $+ $cc $+ .Atualizar NPC $+ $ct $+ ' e veja mais informa��es. Lembre-se que � preciso muito cuidado ao modific�-los, um erro pode cometer problemas no desempenho do NPC e gerar bugs.
        msg =$nick $chr(160) $ct $+ Para descadastrar um usu�rio, leia mais a respeito digitando ' $+ $cc $+ .Atualizar DEL $+ $ct $+ '.
        msg =$nick $chr(160) $ct $+ Para realizar uma batalha com pok�mon selvagem, digite ' $+ $cc $+ .Atualizar WILD $+ $ct $+ ' e leia mais a respeito.
        msg =$nick $chr(160) $ct $+ Para realizar um evento especial, digite ' $+ $cc $+ .Atualizar PRIZE $+ $ct $+ ' e determine a premia��o antes de iniciar o evento.
        msg =$nick $chr(160) $ct $+ Para a leitura de reports, digite ' $+ $cc $+ .Atualizar REPORT $+ $ct $+ ' e veja os comandos relacionados.
        msg =$nick $ct $+ Todas as altera��es ocorridas ser�o devidamente logadas no sistema, para evitar perdas de dados importantes.
      }
      else { .msg =$nick $ct $+ Sintaxe inv�lida. $cc $+ .Atualizar help $ct $+ para mais informa��es. | return }
    }
    elseif ($1 == .Nickname) && ($rini(cadastros,$nick,Info,Access) == 5) {
      if (!$2) { .msg =$nick $ct $+ Voc� cometeu um erro de sintaxe. Digite ' $+ $cc $+ .Nickname <Novo Nick> $+ $ct $+ ' para alterar o nick atual do bot. | return }
      if ($server) {
        if ($me == $2) { .msg =$nick $ct $+ N�o houve altera��o alguma de $cc $+ nickname $+ $ct $+ . }
        else { .nick $2 | .msg =$nick $ct $+ Alterando $cc $+ nickname $ct $+ para $cc $+ $2 $+ $ct $+ ... }
      }
      else { .msg =$nick $ct $+ N�o estou conectado a nenhuma rede atualmente. Digite ' $+ $cc $+ .Server <servidor> $+ $ct $+ ' para conectar-me. }
      return
    }
    elseif ($1 == .Server) && ($rini(cadastros,$nick,Info,Access) == 5) {
      if (!$2) { .msg =$nick $ct $+ Voc� cometeu um erro de sintaxe. Digite ' $+ $cc $+ .Server <servidor> $+ $ct $+ ' para conectar o bot a um determinado servidor. | return }
      if ($server) && ($2 == $server) { .msg =$nick $ct $+ Reconectando-se ao servidor $cc $+ $server $+ $ct $+ ... }
      else { .msg =$nick $ct $+ Conectando-se ao servidor $cc $+ $2 $+ $ct $+ ... }
      .server $2
      return
    }
    elseif ($1 == .IP) && ($rini(cadastros,$nick,Info,Access) == 5) {
      msg =$nick $ct $+ IP atual do bot $cc $+ $me $ct $+ � $cc $+ $ip $+ : $+ $dccport $+ $ct $+ .
      return
    }
    elseif ($1 == .Kick) && ($rini(cadastros,$nick,Info,Access) >= 4) {
      if ($checknick($2) != Ok!) { msg =$nick $ct $+ Usu�rio $cc $+ $2 $ct $+ n�o est� conectado ao bot. | return }
      if ($nick == $2) { msg =$nick $ct $+ N�o foi poss�vel se auto-kickar do bot. | return }
      if ($rini(cadastros,$2,Info,Access) >= $rini(cadastros,$nick,Info,Access)) { msg =$nick $ct $+ Por quest�es de seguran�a, n�o foi poss�vel expulsar este usu�rio. | return }
      write pkp\log\admin.txt : $+ $date ( $+ $time $+ ):
      write pkp\log\admin.txt : $+ $nick $+ : .Kick $2-
      write pkp\log\admin.txt $chr(32)
      wlog user $2 Kicked by $nick $+ . $iif($3-,Reason: $3-)
      nick.kick $nick $2 $3- | return
    }
    elseif ($1 == .Ban) && ($rini(cadastros,$nick,Info,Access) >= 5) {
      if (!$rini(cadastros,$2,Info,Nick)) { msg =$nick $ct $+ Usu�rio $cc $+ $2 $ct $+ n�o est� cadastrado. | return }
      if ($nick == $2) { msg =$nick $ct $+ N�o foi poss�vel se auto-banir do bot. | return }
      if ($rini(cadastros,$2,Info,Access) >= $rini(cadastros,$nick,Info,Access)) { msg =$nick $ct $+ Por quest�es de seguran�a, n�o foi poss�vel expulsar este usu�rio. | return }
      write pkp\log\admin.txt : $+ $date ( $+ $time $+ ):
      write pkp\log\admin.txt : $+ $nick $+ : .Ban $2-
      write pkp\log\admin.txt $chr(32)
      wlog user $2 Was banned by $nick $+ .
      nick.ban $2 $iif($3,$3,0) | return
    }
    elseif ($1 == .Unban) && ($rini(cadastros,$nick,Info,Access) == 5) {
      if (!$rini(cadastros,$2,Info,Nick)) { msg =$nick $ct $+ Usu�rio $cc $+ $2 $ct $+ n�o est� cadastrado. | return }
      if (!$rini(cadastros,$2,Info,Banned)) { msg =$nick $ct $+ Usu�rio selecionado n�o est� banido. | return }
      write pkp\log\admin.txt : $+ $date ( $+ $time $+ ):
      write pkp\log\admin.txt : $+ $nick $+ : .Unban $2
      write pkp\log\admin.txt $chr(32)
      wlog user $2 Was unbanned by $nick $+ .
      remini pkp\cadastros\ $+ $2 $+ .ini Info Banned | msg =$nick $cc $+ $rini(cadastros,$2,Info,Nick) $ct $+ foi desbanido. | return
    }
    elseif ($1 == .Ignore) && ($rini(cadastros,$nick,Info,Access) == 5) {
      if ($2 == add) {
        if ($checknick($3) == Ok!) { var %ip = $getip($3), %nick = $dados($3,Info,Nick) }
        elseif ($checknick($getip($3).r) == Ok!) { var %ip = $3, %nick = $dados($getip($3).r,Info,Nick) }
        if (%ip) { if ($ignore(*!*@ $+ %ip)) { msg =$nick $ct $+ IP $cc $+ %ip $ct $+ j� est� sendo ignorado. Para listar, digite ' $+ $cc $+ .Ignore LIST $+ $ct $+ '. | return } | if (%nick == $nick) || ($rini(cadastros,%nick,Info,Access) == 5) { .msg =$nick $cc $+ %nick $ct $+ n�o pode ser ignorado. | return } | .ignore -w %ip | msg =$nick $ct $+ IP $cc $+ %ip $ct $+ foi adicionado � lista de ignorados com sucesso. | nick.kick $dados($nick,Info,Nick) %nick $iif($4-,$4-) }
        else { msg =$nick $ct $+ Houve um erro de sintaxe ou o usu�rio selecionado n�o est� conectado no momento. }
      }
      elseif ($2 == rem) {
        var %x = $ignore(0) | if (!%x) { msg =$nick $ct $+ N�o h� usu�rios ignorados neste momento. | return }
        if ($3) {
          if ($ignore(*!*@ $+ $3)) { .ignore -r $3 | msg =$nick $ct $+ IP $cc $+ $3 $ct $+ foi removido com sucesso da lista de ignorados. }
          else { msg =$nick $ct $+ O IP selecionado n�o foi encontrado. Para exibir a lista, digite ' $+ $cc $+ .Ignore LIST $+ $ct $+ '. }
        }
        else { .ignore -r $3 | msg =$nick $ct $+ Todos os ips ignorados foram cancelados. }
      }
      elseif ($2 == list) {
        var %x = $ignore(0) | if (!%x) { msg =$nick $ct $+ N�o h� usu�rios ignorados neste momento. | return }
        msg =$nick $ct $+ Exibindo a lista de usu�rios ignorados:
        var %x = 1 | while ($ignore(%x)) { msg =$nick $chr(160) $ct $+ $chr(35) $+ $cc $+ $base(%x,10,10,2) $ct $+ - $cc $+ $gettok($ignore(%x),2,64) | inc %x }
        msg =$nick $ct $+ Fim da lista de ignorados.
      }
      elseif (!$2) {
        .msg =$nick $ct $+ Este recurso permite editar os usu�rios que ser�o ignorados. A seguir, ser� exibida a rela��o de comandos:
        .msg =$nick $chr(160) $cc $+ $arrange(.Ignore ADD <IP/Nick> (<Motivo>),160,32) $ct $+ - Adiciona determinado $cc $+ IP $ct $+ ou $cc $+ Nick $ct $+ na lista de ignorados;
        .msg =$nick $chr(160) $cc $+ $arrange(.Ignore REM (<IP>),160,32) $ct $+ - Remove determinado $cc $+ IP $ct $+ da Ignore List, se nenhum for especificado, remove todos da lista;
        .msg =$nick $chr(160) $cc $+ $arrange(.Ignore LIST,160,32) $ct $+ - Lista todos os $cc $+ IP $ct $+ que j� est�o sendo ignorados;
        .msg =$nick $ct $+ � recomendado usar este comando apenas nos casos de usu�rios mal intencionados e que querem prejudicar a harmonia da comunidade. Nestes casos, ao ignorar, o bot automaticamente expulsar� o usu�rio e manter� seu IP ignorado.
      }
      else { .msg =$nick $ct $+ Este comando foi usado incorretamente. Digite ' $+ $cc $+ .Ignore $+ $ct $+ ' para mais informa��es. }
      return
    }
    elseif ($1 == .Match) && ($rini(cadastros,$nick,Info,Access) == 5) {
      if ($2-) {
        var %x = 0, %r = 0 | while (%x < 2) { inc %x | var %n = $gettok($2 $3,%x,32) | if ($gettok(%n,0,58) > 1) { inc %r } | inc %r }
        var %z = 1 | while (%z <= 2) {
          var %y = 1, %n = $gettok($2 $3,%z,32)
          while ($gettok(%n,%y,58)) {
            var %p = $gettok(%n,%y,58)
            if (!$rini(cadastros,%p,Info,Nick)) { msg =$nick $ct $+ Treinador $cc $+ %p $ct $+ n�o est� cadastrado. | return }
            if ($checknick(%p) == No!) { msg =$nick $cc $+ %p $ct $+ n�o est� conectado ao bot. | return }
            if ($checknickid(%p) == Ok!) { msg =$nick $ct $+ Treinador $cc $+ %p $ct $+ j� est� batalhando! | return }
            if (!$rini(cadastros,%p,Team,1)) { msg =$nick $ct $+ Treinador $cc $+ %p $ct $+ n�o tem pok�mon suficiente no time. | return }
            if ($gettok(%n,0,58) == 1) { if (%r > 2) || (d isin $4) { if (!$rini(cadastros,%p,Team,2)) || ($rini(cadastros,%p,Team,2) == Egg) { msg =$nick $ct $+ Treinador $cc $+ %p $ct $+ n�o tem pok�mon suficiente no time. | return } } }
            inc %y
          }
          inc %z
        }
        if ($gettok($2,1,58) == $gettok($3,1,58)) { msg =$nick $ct $+ A batalha � entre treinadores $cc $+ diferentes $+ $ct $+ . | return }
        if ($gettok($2,1,58) == $gettok($3,2,58)) { msg =$nick $ct $+ A batalha � entre treinadores $cc $+ diferentes $+ $ct $+ . | return }
        if ($gettok($2,2,58)) {
          if ($gettok($2,2,58) == $gettok($3,1,58)) { msg =$nick $ct $+ A batalha � entre treinadores $cc $+ diferentes $+ $ct $+ . | return }
          if ($gettok($2,2,58) == $gettok($3,2,58)) { msg =$nick $ct $+ A batalha � entre treinadores $cc $+ diferentes $+ $ct $+ . | return }
        }
        if (%stand. [ $+ [ $gettok($2,1,58) ] ]) { unset %stand. [ $+ [ $gettok($2,1,58) ] ] } | if (%stand. [ $+ [ $gettok($3,1,58) ] ]) { unset %stand. [ $+ [ $gettok($3,1,58) ] ] }
        if (%stand. [ $+ [ $gettok($2,2,58) ] ]) { unset %stand. [ $+ [ $gettok($2,2,58) ] ] } | if (%stand. [ $+ [ $gettok($3,2,58) ] ]) { unset %stand. [ $+ [ $gettok($3,2,58) ] ] }
        msg =$nick $ct $+ Batalha entre $cc $+ $replace($2,$chr(58),$ct $+ / $+ $cc $+) $ct $+ e $cc $+ $replace($3,$chr(58),$ct $+ / $+ $cc $+) $ct $+ iniciada!
        .echo $battle.start($replace($2,$chr(58),$chr(32)),$replace($3,$chr(58),$chr(32)),$4-)
        return
      }
      else {
        msg =$nick $ct $+ O comando $cc $+ .Match $ct $+ inicia uma batalha personalizada para treinadores automaticamente. Pode ser empregado para diversas finalidades, entre elas a realiza��o de $cc $+ campeonatos $+ $ct $+ , juntamente com outros comandos.
        msg =$nick $ct $+ Para inici�-la, digite ' $+ $cc $+ .Match <Player�[:Ally�]> <Player�[:Ally�]> (<par�metros>) $+ $ct $+ '. Dessa forma, voc� pode efetuar batalhas entre dois treinadores, tr�s ou quatro. Nos dois �ltimos casos, a batalha automaticamente ser� em dupla. O caractere de separa��o de nicks, ao determinar o time, � $cc $+ : $+ $ct $+ . Ent�o, se quiser criar um time corretamente, escreva os nicks dos aliados separados pelo caractere apresentado.
        msg =$nick $ct $+ Par�metros:
        msg =$nick $chr(160) $cc $+ d $ct $+ - Ativa o modo ' $+ $cc $+ Double Battle $+ $ct $+ ', ou batalha em dupla, para esta batalha;
        msg =$nick $chr(160) $cc $+ l $ct $+ - Armazenar� no log o resultado desta batalha especificadamente (n�o recomendado);
        msg =$nick $chr(160) $cc $+ m $ct $+ - � necess�rio especificar o n�mero de pok�mon para esta batalha (quantos cada treinador poder� usar nela);
        msg =$nick $chr(160) $cc $+ p $ct $+ - Ativa modo PP normal para esta batalha;
        msg =$nick $chr(160) $cc $+ s $ct $+ - Habilita trocas de pok�mon entre turnos com o comando $cc $+ .Trocar $+ $ct $+ ;
        msg =$nick $chr(160) $cc $+ u $ct $+ - Ativa modo PPUp para esta batalha;
        msg =$nick $chr(160) $cc $+ e $ct $+ - Impede a obten��o de pontos de $cc $+ experi�ncia $ct $+ e dinheiro;
        msg =$nick $chr(160) $cc $+ a $ct $+ - Ativa $cc $+ Sleep Clause $ct $+ e $cc $+ Frozen Clause $ct $+ para a batalha;
        msg =$nick $ct $+ Fim da exibi��o.
        return
      }
    }
    elseif ($1 == .Descadastrar) {
      if ($checknickid($nick) == Ok!) { msg =$nick $ct $+ Voc� n�o pode solicitar seu $cc $+ descadastramento $ct $+ enquanto batalha! | return }
      if ($v(Watch. [ $+ [ $nick ] ])) { msg =$nick $ct $+ Voc� n�o pode solicitar seu $cc $+ descadastramento $ct $+ enquanto assiste a batalhas. Para parar de assisti-la, digite ' $+ $cc $+ .Assistir $+ $ct $+ '. | return }
      if (%confirm. [ $+ [ $nick ] ]) { msg =$nick $ct $+ Antes de solicitar seu $cc $+ descadastramento $+ $ct $+ , digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar o �ltimo pedido. | return }
      var %file = PkP\Del.txt
      if ($read(%file,s,$nick $+ :)) { msg =$nick $ct $+ Voc� j� solicitou seu descadastramento. Agora, aguarde pela confirma��o de um moderador. }
      else {
        if ($top.pos($nick)) {
          set %confirm. [ $+ [ $nick ] ] CAD
          msg =$nick $ct $+ Deseja realmente solicitar o seu descadastramento? As mudan�as s�o irrevers�veis e � necess�rio um motivo aceit�vel para faz�-lo.
          msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar.
        }
        else { msg =$nick $ct $+ Para solicitar o descadastramento, o �nico requisito � que o usu�rio esteja incluso no ' $+ $cc $+ .Top $+ $ct $+ ', em qualquer posi��o. }
      }
      return
    }
    elseif ($1 == .Nick) {
      if ($checknickid($nick) == Ok!) { msg =$nick $ct $+ Voc� n�o pode solicitar $cc $+ altera��o de nick $ct $+ enquanto batalha! | return }
      if ($v(Watch. [ $+ [ $nick ] ])) { msg =$nick $ct $+ Voc� n�o pode solicitar sua $cc $+ altera��o de nick $ct $+ enquanto assiste a batalhas. Para parar de assisti-la, digite ' $+ $cc $+ .Assistir $+ $ct $+ '. | return }
      if (%confirm. [ $+ [ $nick ] ]) { msg =$nick $ct $+ Antes de solicitar sua $cc $+ altera��o de nick $+ $ct $+ , digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar o �ltimo pedido. | return }
      var %file = PkP\Newnick.txt
      if ($read(%file,s,$nick $+ :)) { msg =$nick $ct $+ Voc� j� solicitou uma altera��o de nick. Agora, aguarde pela confirma��o de um moderador. }
      else {
        if ($top.pos($nick)) {
          if (!$2) { msg =$nick $ct $+ Especifique o novo nick para a altera��o. Digite ' $+ $cc $+ .Nick <novo nick> $+ $ct $+ '. | return }
          set %confirm. [ $+ [ $nick ] ] NICK $+ : $+ $2
          msg =$nick $ct $+ Deseja realmente solicitar uma altera��o de nick para $cc $+ $2 $+ $ct $+ ? As mudan�as n�o s�o desprez�veis e � necess�rio um motivo aceit�vel para faz�-la.
          msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar.
        }
        else { msg =$nick $ct $+ Para solicitar altera��o de nick, o �nico requisito � que o usu�rio esteja incluso no ' $+ $cc $+ .Top $+ $ct $+ ', em qualquer posi��o. }
      }
      return
    }
    elseif ($1 == .Ordem) {
      if (!$rini(cadastros,$nick,$2,Name)) || (!$rini(cadastros,$nick,$3,Name)) { msg =$nick $ct $+ Voc� utilizou este comando de forma incorreta. Para trocar a posi��o de dois pok�mon diferentes, especifique o nome de cada um nesta sintaxe: ' $+ $cc $+ .Ordem <pok�mon> <outro pok�mon> $+ $ct $+ '. | return }
      if ($totalpokes($1) == 1) { msg =$nick $ct $+ Voc� tem apenas $cc $+ um $ct $+ pok�mon. N�o h� possibilidade de mudan�as. | return }
      if ($checknickid($nick) == Ok!) { msg =$nick $ct $+ Voc� n�o pode mudar a ordem dos pok�mon enquanto batalha! | return }
      if ($2 == $3) { msg =$nick $ct $+ Nenhuma mudan�a foi realizada. Tente mudar a ordem de pok�mon $cc $+ diferentes $+ $ct $+ . | return }
      if ($2 == Egg) || ($3 == Egg) { msg =$nick $ct $+ N�o � poss�vel mudar a ordem de $cc $+ Eggs $+ $ct $+ . | return }
      if (%stand. [ $+ [ $nick ] ]) { unset %stand. [ $+ [ $nick ] ] }
      var %pk1 = $basestat($2), %pos1 = $teampos($nick,%pk1), %pk2 = $basestat($3), %pos2 = $teampos($nick,%pk2)
      writeini pkp\cadastros\ $+ $nick $+ .ini Team %pos1 %pk2 | writeini pkp\cadastros\ $+ $nick $+ .ini Team %pos2 %pk1 | msg =$nick $ct $+ Posi��es de $cc $+ %pk1 $ct $+ e $cc $+ %pk2 $ct $+ foram trocadas com sucesso. | return
    }
    elseif ($1 == .Trocar) {
      if ($checknickid($nick) == No!) { msg =$nick $ct $+ Voc� n�o est� participando de nenhuma batalha. | return }
      var %ID = $checknickid($nick).id
      if (!$v([ [ B. ] $+ [ %ID ] $+ [ .Switch ] ])) { msg =$nick $ct $+ Nesta batalha, $cc $+ n�o $ct $+ � permitido $cc $+ trocar $ct $+ de pok�mon entre turnos. | return }
      var %loop = $iif($v([ [ B. ] $+ [ %ID ] $+ [ .2vs2 ] ]),4,2), %x = 0, %r = 0, %e = 0
      while (%x < %loop) {
        inc %x
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %x ] ])) && (!%n) {
          if ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %x ] ]) == $nick) || ($v([ [ B. ] $+ [ %ID ] $+ [ .TruePlayer: ] $+ [ %x ] ]) == $nick) {
            if ($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %x ] ])) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %x ] ]) == Switch) { var %n = %x } | else { inc %r } }
            else { var %n = %x }
          }
        }
      }
      if (!%n) { if (%r) { msg =$nick $ct $+ Voc� n�o pode mudar de golpe ap�s t�-lo selecionado. } | else { msg =$nick $ct $+ N�o foi poss�vel efetuar uma troca de pok�mon. } | return }

      if (!$v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %n ] ])) {
        if ($checkfoe.left(%ID,%n,Trait.,Arena Trap)) {
          if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) != Levitate) && (Flying !isin $v([ [ B. ] $+ [ %ID ] $+ [ .Type. ] $+ [ %n ] ])) {
            msg =$nick $ct $+ N�o foi poss�vel efetuar a troca. Seu pok�mon est� preso por $cc $+ Arena Trap $+ $ct $+ . | return
          }
        }
        if ($checkfoe.left(%ID,%n,Trait.,Magnet Pull)) { if (Steel isin $v([ [ B. ] $+ [ %ID ] $+ [ .Type. ] $+ [ %n ] ])) { msg =$nick $ct $+ N�o foi poss�vel efetuar a troca. Seu pok�mon est� preso por $cc $+ Magnet Pull $+ $ct $+ . | return } }
        if ($checkfoe.left(%ID,%n,Trait.,Shadow Tag)) { msg =$nick $ct $+ N�o foi poss�vel efetuar a troca. Seu pok�mon est� preso por $cc $+ Shadow Tag $+ $ct $+ . | return }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Ingrain. ] $+ [ %n ] ])) { msg =$nick $ct $+ N�o foi poss�vel efetuar a troca. Seu pok�mon est� preso por $cc $+ Ingrain $+ $ct $+ . | return }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Vortex. ] $+ [ %n ] ])) { msg =$nick $ct $+ N�o foi poss�vel efetuar a troca. Seu pok�mon est� preso por $cc $+ $gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Vortex. ] $+ [ %n ] ]),1,58) $+ $ct $+ . | return }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .NoEscape. ] $+ [ %n ] ])) { msg =$nick $ct $+ Seu pok�mon n�o pode escapar! Est� sob efeito do golpe $cc $+ $gettok($v([ [ B. ] $+ [ %ID ] $+ [ .NoEscape. ] $+ [ %n ] ]),2,58) $+ $ct $+ ! | return }
      }
      if ($2) {
        var %team = $battle.player(%ID,%n)
        if ($2 isnum 1-6) { var %tn = $2 } | else { var %tn = $teamnumber(%ID,%team,$2) }
        if (!%tn) { msg =$nick $ct $+ Voc� cometeu um erro na sintaxe do comando. Digite ' $+ $cc $+ .Trocar <pok�mon> $+ $ct $+ ' para trocar seu pok�mon durante a batalha. | return }
        var %pk = $v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %tn ] $+ ] : ] $+ [ %team ] ])
        if (!%pk) { msg =$nick $ct $+ Pok�mon selecionado � inv�lido. Digite ' $+ $cc $+ .Trocar $+ $ct $+ ' para list�-los. | return }
        if ($gettok(%pk,1,58) == $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ])) { msg =$nick $ct $+ Pok�mon $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) $ct $+ j� est� batalhando! | return }
        if (!$battle.team(%ID,%n)) {
          if ($gettok(%pk,1,58) == $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ $battle.team(%ID,%n).num ] ])) { msg =$nick $ct $+ Pok�mon $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ $battle.team(%ID,%n).num ] ]) $ct $+ j� est� batalhando! | return }
          var %ttn = $gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ $battle.team(%ID,%n).num ] ]),2,59) | if (%tn == %ttn) { msg =$nick $ct $+ Pok�mon $cc $+ $gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %ttn ] $+ ] : ] $+ [ %team ] ]),1,58) $ct $+ j� foi selecionado para batalhar! | return }
        }
        if (!$gettok(%pk,15,58)) { msg =$nick $ct $+ Pok�mon $cc $+ $gettok(%pk,1,58) $ct $+ n�o est� em condi��es de batalhar agora. | return }
        sset [ [ B. ] $+ [ %ID ] $+ [ .TPoke. ] $+ [ %n ] ] $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ])
        if (!$v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ])) {
          var %tnt = $teamnumber(%ID,%Team,$v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ])), %tpk = %pk, %pk = $v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %tnt ] $+ ] : ] $+ [ %Team ] ])
          sset [ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %tnt ] $+ ] : ] $+ [ %Team ] ] $gettok(%pk,1-7,58) $+ : $+ $else.null($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ])) $+ : $+ $gettok(%pk,9-14,58) $+ : $+ $v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]) $+ : $+ $else.null($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %n ] ])) $+ : $+ $gettok(%pk,17-20,58) $+ : $+ $else.null($v([ [ B. ] $+ [ %ID ] $+ [ .PP1. ] $+ [ %n ] ])) $+ : $+ $else.null($v([ [ B. ] $+ [ %ID ] $+ [ .PP2. ] $+ [ %n ] ])) $+ : $+ $else.null($v([ [ B. ] $+ [ %ID ] $+ [ .PP3. ] $+ [ %n ] ])) $+ : $+ $else.null($v([ [ B. ] $+ [ %ID ] $+ [ .PP4. ] $+ [ %n ] ]))
          var %pk = %tpk
          sset [ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ] $gettok(%pk,1,58)
        }
        sset [ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %n ] ] Switch; $+ %tn | sset [ [ B. ] $+ [ %ID ] $+ [ .Target. ] $+ [ %n ] ] $battle.target(%ID,%n)
        msg =$nick $lb $+ Pok�mon selecionado: $bb $+ $gettok(%pk,1,58) $+ $lb $+ . $iif($battle.wait(%ID),Aguarde o seu advers�rio.)
        if ($battle.wait(%ID)) {
          if ($battle.player(%ID,%n) == %n) {
            var %t = $battle.team(%ID,%n).num, %s = $timer(EndTurn $+ %ID).secs
            if ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %t ] ]) == $nick) {
              if ($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %t ] ]) == Switch) {
                if ($battle.left(%ID,%t).total) { msg =$nick $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %t ] ]) $+ $lb $+ , escolha o pok�mon com o comando ' $+ $bb $+ .Trocar $+ $lb $+ '. Voc� tem %s $iif(%s > 1,segundos,segundo) $+ . }
                else { sset [ [ B. ] $+ [ %ID ] $+ [ .Lose: ] $+ [ %t ] ] ON | sset [ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %t ] ] Struggle | sset [ [ B. ] $+ [ %ID ] $+ [ .Target. ] $+ [ %t ] ] %t | if (!$battle.wait(%ID)) { fightturns %ID } }
              }
              elseif (!$v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %t ] ])) { msg =$nick $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %t ] ]) $+ $lb $+ , escolha o golpe de $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %t ] ]) $+ $lb $+ . $chr(91) $+ $returnmoves(%ID,%t) $+ $chr(93) $+ . Voc� tem %s $iif(%s > 1,segundos,segundo) $+ . }
            }
            if ($v([ [ B. ] $+ [ %ID ] $+ [ .TruePlayer: ] $+ [ %t ] ]) == $nick) {
              if ($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %t ] ]) == Switch) {
                if ($battle.left(%ID,%t).total) { msg =$nick $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .TruePlayer: ] $+ [ %t ] ]) $+ $lb $+ , escolha o pok�mon com o comando ' $+ $bb $+ .Trocar $+ $lb $+ '. Voc� tem %s $iif(%s > 1,segundos,segundo) $+ . }
                else { sset [ [ B. ] $+ [ %ID ] $+ [ .Lose: ] $+ [ %t ] ] ON | sset [ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %t ] ] Struggle | sset [ [ B. ] $+ [ %ID ] $+ [ .Target. ] $+ [ %t ] ] %t | if (!$battle.wait(%ID)) { fightturns %ID } }
              }
              elseif (!$v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %t ] ])) { msg =$nick $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .TruePlayer: ] $+ [ %t ] ]) $+ $lb $+ , escolha o golpe de $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %t ] ]) $+ $lb $+ . $chr(91) $+ $returnmoves(%ID,%t) $+ $chr(93) $+ . Voc� tem %s $iif(%s > 1,segundos,segundo) $+ . }
            }
          }
        }
        else { fightturns %ID } | return
      }
      else {
        msg =$nick $ct $+ Exibindo as condi��es atuais de seu time:
        var %x = 1, %team = $battle.player(%ID,%n) | while (%x <= 6) {
          var %pk = $v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %x ] $+ ] : ] $+ [ %team ] ])
          if (%pk) {
            var %n1 = $calc($len($gettok(%pk,1,58)) + $iif($gettok(%pk,4,58) == Unknown,3,1) + $len($gettok(%pk,2,58))), %n1 = $gettok(%pk,1,58) $+ $iif($gettok(%pk,5,58) == ON,4+,$+) $+ $sex($gettok(%pk,4,58)) $+ $ct $+ / $+ $cc $+ $gettok(%pk,2,58) $+ $str($chr(160),$calc(16 - %n1)), %t = $battle.team(%ID,%n).num
            if ($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) == $gettok(%pk,1,58)) { msg =$nick $ct $+ $chr(35) $+ $cc $+ %x %n1 $ct $+ HP[ $+ $barra($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]),$v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %n ] ])) $+ $ct $+ ] ( $+ $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]) $+ $ct $+ / $+ $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %n ] ]) $+ $ct $+ ) $iif($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %n ] ]),$realstatus($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %n ] ])) $+ $ct $+,$+) $iif($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]),$ct $+ Hold: $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ])) }
            elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %t ] ]) == $gettok(%pk,1,58)) && ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %t ] ]) == $nick) { msg =$nick $ct $+ $chr(35) $+ $cc $+ %x %n1 $ct $+ HP[ $+ $barra($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %t ] ]),$v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %t ] ])) $+ $ct $+ ] ( $+ $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %t ] ]) $+ $ct $+ / $+ $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %t ] ]) $+ $ct $+ ) $iif($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %t ] ]),$realstatus($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %t ] ])) $+ $ct $+,$+) $iif($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %t ] ]),$ct $+ Hold: $cc $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %t ] ])) }
            else { msg =$nick $ct $+ $chr(35) $+ %x %n1 $ct $+ HP[ $+ $barra($gettok(%pk,15,58),$gettok(%pk,9,58)) $+ $ct $+ ] ( $+ $gettok(%pk,15,58) $+ / $+ $gettok(%pk,9,58) $+ ) $iif($gettok(%pk,16,58),$realstatus($gettok(%pk,16,58)) $+ $ct $+,$+) $iif($gettok(%pk,8,58),$ct $+ Hold: $cc $+ $gettok(%pk,8,58)) }
          }
          inc %x
        }
        msg =$nick $ct $+ Para selecionar outro pok�mon, utilize ' $+ $cc $+ .Trocar <pok�mon> $+ $ct $+ '. | return
      }
    }
    elseif ($1 == .Skin) {
      var %s = Padr�o:Love:Florest:Ocean:Dark:Plate:Classical:Ice:Thunder:Volcano:Storm:Land:Gold:Solid:Star:Santa
      if ($2) {
        if (!$findtok(%s,$2,0,58)) { msg =$nick $ct $+ Este tema de cor � inexistente ou n�o est� dispon�vel. Digite ' $+ $cc $+ .Skin $+ $ct $+ ' para visualiz�-las. | return }
        if ($2 == Padr�o) { if (!$rini(cadastros,$nick,Info,Skin)) { msg =$nick $ct $+ Seu tema de cor atual j� � o padr�o. | return } | remini pkp\cadastros\ $+ $nick $+ .ini Info Skin }
        else { if ($rini(cadastros,$nick,Info,Skin) == $2) { msg =$nick $ct $+ Seu tema de cor $cc $+ $rini(cadastros,$nick,Info,Skin) $ct $+ j� est� selecionado. | return } | writeini pkp\cadastros\ $+ $nick $+ .ini Info Skin $org($2) }
        msg =$nick $ct $+ Voc� mudou sua skin para $cc $+ $org($2) $+ $ct $+ . | return
      }
      else {
        msg =$nick $ct $+ Os seguintes $cc $+ temas $ct $+ de cores est�o dispon�veis:
        var %x = $gettok(%s,0,58), %y = 0 | while (%y < %x) { inc %y | if (%r) { if (%y == %x) { var %r = %r $ct $+ e $cc $+ $gettok(%s,%y,58) } | else { var %r = %r $+ $ct $+ , $cc $+ $gettok(%s,%y,58) } } | else { var %r = $cc $+ $gettok(%s,%y,58) } }
        msg =$nick $chr(160) %r
        msg =$nick $ct $+ Para selecionar algum, digite ' $+ $cc $+ .Skin <Tema> $+ $ct $+ '. | return
      }
    }
    elseif ($1 == .Esqueci) {
      if ($checknickid($nick) == Ok!) { msg =$nick $ct $+ Voc� n�o pode alterar sua pergunta secreta enquanto batalha! | return }
      if ($v(Watch. [ $+ [ $nick ] ])) { msg =$nick $ct $+ Voc� n�o pode alterar sua pergunta secreta enquanto assiste a outras batalhas. Para parar de assisti-la, digite ' $+ $cc $+ .Assistir $+ $ct $+ '. | return }
      if (%confirm. [ $+ [ $nick ] ]) { msg =$nick $ct $+ Antes de alterar sua pergunta secreta, digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar o �ltimo pedido. | return }
      var %x = $rini(cadastros,$nick,Info,Recover)
      if (%x) {
        msg =$nick $ct $+ Bem-vindo ao $cc $+ assistente $ct $+ de $cc $+ recupera��o de senha $+ $ct $+ . � muito importante a cria��o de uma pergunta secreta, pois, em caso de esquecimento, voc� ter� uma forma de recuper�-la. Deseja alterar sua $cc $+ pergunta secreta $ct $+ e sua $cc $+ resposta $+ $ct $+ ?
        msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar.
        set %confirm. [ $+ [ $nick ] ] ESQ:1 | return
      }
      else {
        msg =$nick $ct $+ Bem-vindo ao $cc $+ assistente $ct $+ de $cc $+ recupera��o de senha $+ $ct $+ . � muito importante a cria��o de uma pergunta secreta, pois, em caso de esquecimento, voc� ter� uma forma de recuper�-la. Deseja criar uma $cc $+ pergunta secreta $ct $+ e sua $cc $+ resposta $+ $ct $+ ?
        msg =$nick $ct $+ Digite ' $+ $cc $+ .Sim $+ $ct $+ ' para confirmar ou ' $+ $cc $+ .nao $+ $ct $+ ' para rejeitar.
        set %confirm. [ $+ [ $nick ] ] ESQ:1 | return
      }
    }
    elseif ($1 == .Pass) {
      if ($checknickid($nick) == Ok!) { msg =$nick $ct $+ Voc� n�o pode usar este comando enquanto batalha! | return }
      if ($v(Watch. [ $+ [ $nick ] ])) { msg =$nick $ct $+ Voc� n�o pode usar este comando enquanto assiste a outras batalhas. Para parar de assisti-la, digite ' $+ $cc $+ .Assistir $+ $ct $+ '. | return }
      if (%confirm. [ $+ [ $nick ] ]) { msg =$nick $ct $+ Antes de usar este comando, digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar o �ltimo pedido. | return }
      if (!$2) || (!$3) { msg =$nick $ct $+ Erro de sintaxe. Para alterar sua senha, digite ' $+ $cc $+ .Pass <senha atual> <nova senha> $+ $ct $+ '. | return }
      if ($2 == $3) { msg =$nick $ct $+ Sua nova senha n�o pode ser igual � senha anterior. | return }
      var %x = $rini(cadastros,$nick,Info,Password)
      if ($2 == %x) {
        if ($len($3) < 5) { msg =$nick $ct $+ Sua nova senha deve conter, no m�nimo, $cc $+ 5 $ct $+ caracteres. | return }
        if ($len($3) > 10) { msg =$nick $ct $+ Sua nova senha deve conter, no m�ximo, $cc $+ 10 $ct $+ caracteres. | return }
        if ($nickscan($3) == No!) { msg =$nick $ct $+ Sua nova senha cont�m caracteres inv�lidos. Utilize $cc $+ letras $ct $+ e $cc $+ n�meros $+ $ct $+ , de prefer�ncia. | return }
        writeini pkp\cadastros\ $+ $nick $+ .ini Info Password $3 | msg =$nick $ct $+ Senha alterada. | active $nick rem | nick.kick $me $nick | return
      }
      else { msg =$nick $ct $+ Ocorreu um erro. Voc� digitou a $cc $+ senha atual $ct $+ errada. | active $nick rem | nick.kick $me $nick | return }
    }
    elseif ($1 == .Rental) {
      var %f = pkp\rental_shop.ini
      if ($2 == start) {
        if ($is_rental($nick)) { msg =$nick $ct $+ Seu desafio no $cc $+ Battle Rental $ct $+ j� foi iniciado! }
        else {
          var %t = $ctime($dados($nick,Time,Rental)), %t = $iif(%t,%t,0), %t = $calc($ctime($date $time) - %t), %ft = $readini(pkp\status.ini,Active,Rental)
          if (%t >= %ft) {
            if ($checknickid($nick) == Ok!) { msg =$nick $ct $+ Voc� n�o pode acessar o $cc $+ Battle Rental $ct $+ enquanto batalha! | return }
            if ($v(Watch. [ $+ [ $nick ] ])) { msg =$nick $ct $+ Voc� n�o pode acessar o $cc $+ Battle Rental $ct $+ enquanto assiste a batalhas. Para parar de assisti-la, digite ' $+ $cc $+ .Assistir $+ $ct $+ '. | return }
            if (%confirm. [ $+ [ $nick ] ]) { msg =$nick $ct $+ Antes de desafiar $cc $+ Battle Rental $+ $ct $+ , digite $cc $+ .sim $ct $+ para confirmar ou $cc $+ .nao $ct $+ para rejeitar o �ltimo pedido. | return }
            if (%stand. [ $+ [ $nick ] ]) { unset %stand. [ $+ [ $nick ] ] }

            writeini pkp\cadastros\ $+ $nick $+ .ini Time Rental $date $time
            writeini pkp\cadastros\ $+ $nick $+ .ini Rental Battle 1
            remini pkp\cadastros\ $+ $nick $+ .ini Rental Team
            set %rental. [ $+ [ $nick ] ] $rental.set.team($nick)
            msg =$nick $ct $+ Antes de come�ar sua batalha no $cc $+ Battle Rental $+ $ct $+ , � preciso que escolha apenas $cc $+ tr�s $ct $+ destes pok�mon: $separecom(%rental. [ $+ [ $nick ] ],e,32,$cc,$ct) $+ $ct $+ . Se precisar ver informa��es detalhadas de algum deles, digite ' $+ $cc $+ .dados <pok�mon> $+ $ct $+ '.
            msg =$nick $ct $+ Por favor, digite o nome dos pok�mon que voc� escolheu para come�ar a seguir, com seus nomes respectivos na mesma linha. Por exemplo: ' $+ $cc $+ Pikachu Ditto Eevee $+ $ct $+ '.
            rental.check.brain $nick
          }
          else { msg =$nick $ct $+ Voc� precisa aguardar $dur($calc(%ft - %t),$ct,$cc) para tentar novamente. }
        }
      }
      elseif ($2 == shop) {
        if ($ini(%f,$3)) {
          msg =$nick $ct $+ Exibindo itens do grupo $cc $+ $ini(%f,$ini(%f,$3)) $+ $ct $+ ...
          var %x = 1 | while ($ini(%f,$3,%x)) { var %i = $ini(%f,$3,%x), %p = $readini(%f,$3,%i), %i = $replace(%i,_,$chr(32)) | msg =$nick $chr(160) $cc $+ $arrange($item.data(%i,name),160,15) $ct $+ BP: $cc $+ $base(%p,10,10,2) $ct $+ Descri��o: $cc $+ $item.data(%i,desc) | inc %x }
          msg =$nick $ct $+ Fim da exibi��o de itens.
        }
        else {
          msg =$nick $ct $+ Bem vindo � loja do $cc $+ Rental Battle $+ $ct $+ . N�o aceitamos dinheiro, apenas $cc $+ battle points $ct $+ ( $+ $cc $+ BP $+ $ct $+ ). Nosso estoque est� organizado de acordo com o tipo de item. Para listar os itens dispon�veis, digite " $+ $cc $+ .rental shop <grupo> $+ $ct $+ ". Os grupos dispon�veis s�o os seguintes:
          var %x = 1 | while ($ini(%f,%x)) { msg =$nick $chr(160) $cc $+ $ini(%f,%x) | inc %x }
          msg =$nick $ct $+ Fim da exibi��o de grupos dispon�veis.
        }
      }
      elseif ($2 == buy) {
        var %x = 1, %r = 0
        if ($3 isnum) { var %i = $item.data($4-,name), %qnt = $int($3) }
        else { var %i = $item.data($3-,name), %qnt = 1 }
        if (!%i) { msg =$nick $ct $+ Voc� n�o digitou corretamente o nome do item ou esqueceu de especific�-lo. Digite " $+ $cc $+ .rental shop $+ $ct $+ " para ver os itens dispon�veis. | return }
        if (%qnt <= 0) { msg =$nick $ct $+ A quantidade especificada � inv�lida. Tente um n�mero $cc $+ natural $ct $+ maior que $cc $+ zero $+ $ct $+ . | return }
        if (%qnt > 99) { msg =$nick $ct $+ A quantidade especificada � inv�lida. Voc� s� pode ter at� $cc $+ 99 $ct $+ itens iguais! | return }
        while ($ini(%f,%x)) && (!%r) { var %t = $ini(%f,%x) | if ($readini(%f,%t,$replace(%i,$chr(32),_))) { var %r = 1 } | inc %x }
        if (%r) {
          if ($calc(%qnt + $item($nick,%i).qnt) > 99) { var %qnt = $calc(99 - $item($nick,%i).qnt) }
          var %bp = $dados($nick,Info,BP), %price = $readini(%f,%t,$replace(%i,$chr(32),_)), %cost = $calc(%price * %qnt)
          if (%bp < %cost) { msg =$nick $ct $+ Voc� n�o tem a quantidade necess�ria de $cc $+ battle points $ct $+ para comprar $cc $+ %i $+ $ct $+ $iif(%qnt > 1,$chr(44) na quantidade solicitada.,.) | return }
          var %bp = $calc(%bp - %cost) | writeini pkp\cadastros\ $+ $nick $+ .ini Info BP %bp
          item.add $nick $+(%i,:,%qnt) | msg =$nick $cc $+ %i $ct $+ (� $+ $cc $+ $base(%qnt,10,10,2) $+ $ct $+ ) $iif(%qnt > 1,foram comprados,foi comprado) com sucesso. $iif(%bp > 0,Voc� ainda tem $cc $+ %bp $ct $+ BP $+ $iif(%bp > 1,s) $+ .)
        }
        else { msg =$nick $ct $+ Esse item $cc $+ %i $ct $+ n�o est� dispon�vel na loja do $cc $+ Battle Rental $+ $ct $+ . }
      }
      else {
        msg =$nick $ct $+ Bem vindo ao $cc $+ Rental Battle $+ $ct $+ ! Prepare-se para pegar emprestado alguns pok�mon e testar sua habilidade em formular novas estrat�gias. Ao derrotar sete treinadores, voc� obter� $cc $+ Battle Points $ct $+ ( $+ $cc $+ BP $+ $ct $+ ), que podem ser trocados por itens na loja especial.
        msg =$nick $chr(160) $ct $+ Para iniciar, digite " $+ $cc $+ .rental start $+ $ct $+ " e siga as instru��es.
        msg =$nick $chr(160) $ct $+ Para checar a loja, digite " $+ $cc $+ .rental shop $+ $ct $+ ".
        msg =$nick $chr(160) $ct $+ Para comprar algum item, digite " $+ $cc $+ .rental buy <item> $+ $ct $+ ".
        msg =$nick $chr(160) $ct $+ Para comprar v�rios itens de uma vez, use " $+ $cc $+ .rental buy <n�mero> <item> $+ $ct $+ ".
        msg =$nick $ct $+ Fim da rela��o de comandos.
        if (!$dados($nick,Info,Perfil,19)) {
          msg =$nick $chr(160) $ct $+ Quando seu desafio come�ar, ser� necess�rio escolher tr�s pok�mon dentre os apresentados. N�o h� como eles serem modificados. Organize-os no time da maneira que voc� achar mais conveniente, pois $cc $+ n�o $ct $+ ser� poss�vel $cc $+ modificar a ordem $ct $+ ao longo do desafio.
          msg =$nick $chr(160) $ct $+ Todos os treinadores envolvidos portar�o pok�mon com ID $cc $+ Rental $+ $ct $+ . Pok�mon com essa caracter�stica n�o podem ser modificados, sem exce��es. Ao terminar o desafio, voc� voltar� com seu time padr�o e n�o portar� mais nenhum desses pok�mon.
        }
      }
      return
    }
    else { msg =$nick $ct $+ Comando inexistente. Para mais informa��es, digite $cc $+ .Ajuda $+ $ct $+ . }
    return
  }
  if ($rini(cadastros,$nick,Info,Access) < 4) {
    var %frase = $strip($1-), %frase = $remove($gettok(%frase,1-7,32),�), %t = $v(FLOOD. $+ $nick)
    if (%frase) {
      ; if (entre isin %frase) || (visite isin %frase) || (join isin %frase) || (vamo isin %frase) || (go isin %frase) || (indo isin %frase) || (ir isin %frase) || (entrar isin %frase) || (visitar isin %frase) || ($left($gettok(%frase,1,32),1) == $chr(35))
      ; if ($count(%frase,$chr(35))) { .msg =$nick $ct $+ � proibido fazer $cc $+ propaganda $ct $+ de canal. Sua mensagem n�o foi enviada. | return }
      if (%t) {
        var %s = $gettok(%t,1,216), %r = $calc($ctime($date $time) - %s)
        if (%r isnum 0-5) {
          var %s = $gettok(%t,2,216), %f = $gettok(%t,3,216), %s = $calc(%s + 1)
          if (%f == %frase) { .msg =$nick $ct $+ Sua mensagem n�o foi enviada. N�o fa�a $cc $+ repeti��o $ct $+ de suas mensagens. | return }
          if (%s > 8) { if (%r < 3) { writeini pkp\cadastros\ $+ $nick $+ .ini Info Banned $date $time $+ ;1 | nick.kick $me $dados($nick,Info,Nick) Prote��o autom�tica anti-flood. | return } | else { sset FLOOD. $+ $nick $ctime($date $time) $+ � $+ 1 $+ � $+ %frase } }
          elseif (%s > 5) && ($calc(%s / %r) >= 2) { writeini pkp\cadastros\ $+ $nick $+ .ini Info Banned $date $time $+ ;1 | nick.kick $me $dados($nick,Info,Nick) Prote��o autom�tica anti-flood. | return }
          elseif (%s > 3) { if (%s > 4) && (%r > 2) { sset FLOOD. $+ $nick $ctime($date $time) $+ � $+ 1 $+ � $+ %frase } | else { .msg =$nick $ct $+ N�o fa�a $cc $+ flood $+ $ct $+ , ou seja, n�o envie muitas mensagens num per�odo curto de tempo. Se persistir, ser� banido. | sset FLOOD. $+ $nick $ctime($date $time) $+ � $+ %s $+ � $+ %frase | return } }
          else { sset FLOOD. $+ $nick $gettok(%t,1,216) $+ � $+ %s $+ � $+ %frase }
        }
        else { sset FLOOD. $+ $nick $ctime($date $time) $+ � $+ 1 $+ � $+ %frase }
      }
      else { sset FLOOD. $+ $nick $ctime($date $time) $+ � $+ 1 $+ � $+ %frase }
    }
    else { msg =$nick $ct $+ Sua mensagem possui caracteres inv�lidos. Ela n�o p�de ser enviada. | return }
  }
  if ($len($1-) > 400) { msg =$nick $ct $+ Sua mensagem ultrapassou o limite de $cc $+ 400 $ct $+ caracteres e n�o foi enviada. | return }
  if ($left($strip($1),1) == @) {
    var %n = $dados($right($strip($1),-1),Info,Nick)
    if (!%n) { msg =$nick $ct $+ Esta mensagem n�o p�de ser enviada, pois o destinat�rio n�o est� cadastrado. | return }
    if (%n == $nick) { .msg =$nick $ct $+ Esta mensagem n�o p�de ser enviada, pois seu destinat�rio � o pr�prio autor da mensagem. | return }
    if ($checknick(%n) == Ok!) {
      if ($2-) { if ($v(PVT. $+ $nick)) { uset PVT. $+ $nick | msg =$nick $ct $+ Fechada se��o de mensagem privada. Sua mensagem foi enviada para $cc $+ %n $+ $ct $+ . } | .msg = [ $+ [ %n ] ] < $+ $coloracc($nick) $+ $rini(cadastros,$nick,Info,Nick) $+ $ct $+ ( $+ $cc $+ PVT $+ $ct $+ ) $+ > $2- }
      else {
        if ($v(PVT. $+ $nick)) { if ($v(PVT. $+ $nick) == %n) { uset PVT. $+ $nick | msg =$nick $ct $+ Fechada se��o de mensagem privada com $cc $+ %n $+ $ct $+ . } | else { msg =$nick $ct $+ Fechada se��o de mensagem privada com $cc $+ $v(PVT. $+ %n) $+ $ct $+ . | sset PVT. $+ $nick %n | msg =$nick $ct $+ Iniciada se��o de mensagem privada com $cc $+ %n $+ $ct $+ . } }
        else { sset PVT. $+ $nick %n | msg =$nick $ct $+ Iniciada se��o de mensagem privada com $cc $+ %n $+ $ct $+ . }
      }
    }
    else { .msg =$nick $ct $+ A mensagem n�o p�de ser enviada para $cc $+ %n $+ $ct $+ . }
  }
  else {
    if ($v(PVT. $+ $nick)) {
      var %n = $v(PVT. $+ $nick)
      if ($checknick(%n) == Ok!) { .msg = [ $+ [ %n ] ] < $+ $coloracc($nick) $+ $rini(cadastros,$nick,Info,Nick) $+ $ct $+ ( $+ $cc $+ PVT $+ $ct $+ ) $+ > $1- }
      else { uset PVT. $+ $nick | msg =$nick $ct $+ Fechada se��o de mensagem privada com $cc $+ %n $+ $ct $+ . Sua mensagem n�o p�de ser enviada. | return }
    }
    else { .sendmsg $rini(cadastros,$nick,Info,Nick) $1- }
  }
}
alias sendamsg {
  var %x = 1 | while ($chat(%x)) { if ($chat(%x) != $1) && ($chat(%x).status == active) { if (!$findtok(%accesslist,$chat(%x),0,58)) && (!$findtok(%cadlist,$chat(%x),0,58)) { msg = [ $+ [ $chat(%x) ] ] $2- } } | inc %x }
}
alias sendmsg {
  if ($findtok(%accesslist,$1,0,58)) || ($findtok(%cadlist,$1,0,58)) { return }
  var %x = 1 | while ($chat(%x)) { if ($chat(%x) != $1) && ($chat(%x).status == active) { if (!$findtok(%accesslist,$chat(%x),0,58)) && (!$findtok(%cadlist,$chat(%x),0,58)) { msg = [ $+ [ $chat(%x) ] ] < $+ $iif($gettok($readini(pkp\status.ini,Active,Brain),1,58) == $1,04+) $+ $coloracc($1) $+ $1 $+ > $2- } } | inc %x }
}
alias coloracc {
  var %a = $rini(cadastros,$1,Info,Access), %c = $gettok(01 14 07 05 02,%a,32)
  return  $+ $iif(%a,%c,04)
}
alias motd {
  if (!$window(@Motd)) { window -hln @Motd }
  var %x = $lines(pkp\motd.txt), %y = 1 | while (%y <= %x) { aline @Motd $read(pkp\motd.txt,%y) | inc %y }
}
alias showmotd {
  if (!$window(@Motd)) { motd }
  var %x = $line(@Motd,0), %y = 1 | while (%y <= %x) { msg = [ $+ [ $1 ] ] $line(@Motd,%y) | inc %y }
}
alias cancellogin { unset %choice. [ $+ [ $1 ] ] | .timerACCESS $+ $1 off | set %accesslist $remtok(%accesslist,$1,1,58) | .chat_close $1 }
alias cancelcad { unset %cad. [ $+ [ $1 ] $+ ] * | .timerCAD $+ $1 off | set %cadlist $remtok(%cadlist,$1,1,58) | .close -c $1 }
alias organize { return $upper($left($1,1)) $+ $lower($right($1,-1)) }
alias org { var %x = 1 | while ($gettok($1-,%x,32)) { if (%r) { var %r = %r $organize($gettok($1-,%x,32)) } | else { var %r = $organize($gettok($1-,%x,32)) } | inc %x } | return %r }
alias userorg {
  var %x = $len($1), %y = 20 - %x
  return $1 $str($+ $chr(160) $+ ,%y)
}
alias userstat {
  if ($chat($1).status == Waiting) { return $cc $+ Conectando }
  else {
    if ($findtok(%cadlist,$chat($1),0,58)) { return $cc $+ Cadastrando }
    if ($findtok(%accesslist,$chat($1),0,58)) { return $cc $+ Identificando }
    if (%stand. [ $+ [ $chat($1) ] ]) { return $cc $+ $iif(Daycare isin %stand. [ $+ [ $chat($1) ] ],Daycare,$iif(Trade isin %stand. [ $+ [ $chat($1) ] ],Trade,%stand. [ $+ [ $chat($1) ] ])) }
    if ($checknickid($chat($1)) == Ok!) && (!$checknickid($chat($1)).hide) {
      if ($v([ [ B. ] $+ [ $checknickid($chat($1)).ID ] $+ [ .Player.2 ] ])) { return $cc $+ Batalhando }
      else { return $cc $+ Ativo $ct $+ (ID: $cc $+ $checknickid($chat($1)).ID $+ $ct $+ ) }
    }
    else { var %n = $calc($ctime($date $time) - $ctime($active($chat($1)).time)) | return $cc $+ Inativo $ct $+ (Idle: $cc $+ $replace($duration(%n),secs,s,sec,s,mins,m,min,m) $+ $ct $+ ) }
  }
}
alias rstat { var %x = 1 | while ($chat(%x)) { if ($chat(%x) == $1) { return $chat(%x).status } | inc %x } }

alias listtotal {
  echo Iniciando a lista de resultados...
  var %x = 1, %y = $lines(pkp\moveset.txt)
  while (%x < %y) {
    var %pk = $gettok($read(pkp\moveset.txt,%x),1,32), %total = $calc($basestat(%pk,HP) + $basestat(%pk,Atk) + $basestat(%pk,Def) + $basestat(%pk,Spd) + $basestat(%pk,SAtk) + $basestat(%pk,SDef))
    writeini pkp\basestat.ini Total %pk %total
    inc %x
  }
  echo Lista de resultados conclu�da.
}
alias pontos {
  var %n = $1, %pk = $2
  if (%pk == Egg) { return 100 }
  var %tbase = $basestat(%pk,totalbase), %lv = $rini(cadastros,%n,%pk,Level), %totaliv = $calc($rini(cadastros,%n,%pk,IvHP) + $rini(cadastros,%n,%pk,IvAtk) + $rini(cadastros,%n,%pk,IvDef) + $rini(cadastros,%n,%pk,IvSpd) + $rini(cadastros,%n,%pk,IvSAtk) + $rini(cadastros,%n,%pk,IvSDef)), %totalev = $calc($rini(cadastros,%n,%pk,EvHP) + $rini(cadastros,%n,%pk,EvAtk) + $rini(cadastros,%n,%pk,EvDef) + $rini(cadastros,%n,%pk,EvSpd) + $rini(cadastros,%n,%pk,EvSAtk) + $rini(cadastros,%n,%pk,EvSDef))
  var %exp = $rini(cadastros,%n,%pk,Exp), %l = $gettok($rini(cadastros,%n,%pk,Loyalty),1,58), %l = $iif(%l < 50,1,$iif(%l < 100,1.1,$iif(%l < 150,1.2,$iif(%l < 200,1.3,$iif(%l < 250,1.4,1.5))))), %m = $gettok($rini(cadastros,%n,%pk,Memory),3,58), %m = $iif(%m == Poke  Ball,1,$iif(%m == Great Ball,1.2,$iif(%m == Ultra Ball,1.3,$iif(%m == Master Ball,1.5,1.1)))), %rate = $basestat(%pk,catch), %s = $rini(cadastros,%n,%pk,Shiny), %s = $iif(%s == ON,1.5,1), %rib = $rini(cadastros,%n,%pk,Ribbon), %rib = $iif(%rib,$calc(1 + 0.05 * $gettok(%rib,0,58)),1)

  var %p1 = $int($calc((%tbase * %lv / %m) / 256 * ((256 - %rate) * 100 / 255 / 100))), %p2 = $int($calc( (%exp / (%lv ^ 2)) * ((%totaliv + %lv) / 1.5 + (%totalev * 2 / 64)) + (%tbase / 32))), %p3 = $int($calc(%p2 / 3 * $iif(!%p1,1,%p1) * %l / %m))

  return $int($calc(%p3 * %s * %rib))
}
alias totalev { var %n = $1, %pk = $2, %totalev = $calc($rini(cadastros,%n,%pk,EvHP) + $rini(cadastros,%n,%pk,EvAtk) + $rini(cadastros,%n,%pk,EvDef) + $rini(cadastros,%n,%pk,EvSpd) + $rini(cadastros,%n,%pk,EvSAtk) + $rini(cadastros,%n,%pk,EvSDef)) | return %totalev }
alias gpoints {
  var %r = 0, %p = 1
  while ($rini(cadastros,$1,Team,%p)) { var %r = %r + $pontos($1,$rini(cadastros,$1,Team,%p)) | inc %p }
  return %r
}
alias groupev {
  var %r = 0, %p = 1
  while ($rini(cadastros,$1,Team,%p)) { var %r = %r + $totalev($1,$rini(cadastros,$1,Team,%p)) | inc %p }
  return %r
}
alias box.add {
  if (!$exists(pkp\box\ $+ $1 $+ \)) { mkdir pkp\box\ $+ $1 $+ \ }
  var %n = $calc($findfile(pkp\box\ $+ $1 $+ \,*.ini,0) + 1), %active = $iif($2 == 5,Hoenn:Kanto:Johto,$dados($1,Info,Region))
  if ($dados($1,Quests,Global)) { var %active = Hoenn:Kanto:Johto }
  writeini pkp\box\ $+ $1 $+ \ $+ %n $+ .ini Info Size $2
  writeini pkp\box\ $+ $1 $+ \ $+ %n $+ .ini Info Link %active
}
alias nick.ban {
  if ($2) { msg = [ $+ [ $1 ] ] $ct $+ Voc� foi banido $cc $+ temporariamente $+ $ct $+ . | sendamsg $1 $coloracc($1) $+ $rini(cadastros,$1,Info,Nick) $ct $+ foi banido $cc $+ temporariamente $+ $ct $+ . | writeini pkp\cadastros\ $+ $1 $+ .ini Info Banned $date $time $+ ; $+ $2 }
  else { top.rem $1 | msg = [ $+ [ $1 ] ] $ct $+ Voc� foi banido por $cc $+ tempo indeterminado $+ $ct $+ . | sendamsg $1 $coloracc($1) $+ $rini(cadastros,$1,Info,Nick) $ct $+ foi banido por $cc $+ tempo indeterminado $+ $ct $+ . | writeini pkp\cadastros\ $+ $1 $+ .ini Info Banned $date $time }
  .active $1 rem | .close -c $1
}

alias nick.kick {
  if ($checknick($2) == Ok!) { msg = [ $+ [ $2 ] ] $ct $+ Voc� foi kickado do bot por $cc $+ $1 $+ $iif($3,$+ $ct $+ : ' $+ $cc $+ $3- $+ $ct $+ ',$+) $+ $ct $+ . }
  .active $2 rem | .close -c $2 | sendamsg $2 $coloracc($2) $+ $2 $ct $+ foi kickado do bot por $cc $+ $1 $+ $iif($3,$+ $ct $+ : ' $+ $cc $+ $3- $+ $ct $+ ',$+) $+ $ct $+ .
}

alias close {
  if ($left($1,2) == -c) {
    if ($findtok(%memorylist,$2,0,58)) { set %memorylist $remtok(%memorylist,$2,1,58) }
    if ($findtok(%accesslist,$2,0,58)) { cancellogin $2 }
    if ($findtok(%cadlist,$2,0,58)) { cancelcad $2 }
    if (%set_game == $2) { unset %set_game %set_game_step }
    if (%set_prize == $2) { unset %set_prize %set_prize_step }
    if (%choose. [ $+ [ $2 ] ]) { unset %choose. [ $+ [ $2 ] ] }
    if (%gym. [ $+ [ $2 ] ]) { unset %gym. [ $+ [ $2 ] ] }
    if (%league. [ $+ [ $2 ] ]) { unset %league. [ $+ [ $2 ] ] }
    if (%relearn. [ $+ [ $2 ] ]) { unset %relearn. [ $+ [ $2 ] ] }
    if (%stand. [ $+ [ $2 ] ]) { unset %stand. [ $+ [ $2 ] ] }
    if ($tevent(Criar,$2).time) { tevent Criar $2 rem }
    if ($tevent(Top,$2).time) { tevent Top $2 rem }
    if ($tevent(Listar,$2).time) { tevent Listar $2 rem }
    if ($tevent(Sorteio,$2).time) { tevent Sorteio $2 rem }
    if ($tevent(Dados,$2).time) { tevent Dados $2 rem }
    if ($tevent(Dex,$2).time) { tevent Dex $2 rem }
    if ($tevent(Users,$2).time) { tevent Users $2 rem }
    if ($tevent(Premium,$2).time) { tevent Premium $2 rem }
    if ($is_rental($2)) { remini pkp\cadastros\ $+ $2 $+ .ini Rental | unset %rental. [ $+ [ $2 ] ] }
    if ($v(Watch. [ $+ [ $2 ] ])) { sset B. [ $+ [ %ID ] $+ ] .Watching $remtok($v(B. [ $+ [ $v(Watch. [ $+ [ $2 ] ]) ] $+ ] .Watching),$2,1,58) | uset Watch. [ $+ [ $2 ] ] }
    var %ID = $checknickid($2).ID
    var %x = %confirm. [ $+ [ $2 ] ] | if (%x) { if ($gettok(%x,1,58) == RLS) { .timerRLS [ $+ [ $2 ] ] off } | elseif ($gettok(%x,1,58) == SFR) { b.remove.fila $2 | remini pkp\cadastros\ $+ $2 $+ .ini $v($+(B.,%ID,.Poke.2)) | uset [ [ B. ] $+ [ %ID ] $+ [ * ] ] | var %ID } | unset %confirm. [ $+ [ $2 ] ] }
    if (%ID) { 
      if ($v([ [ B. ] $+ [ %id ] $+ [ .Trait. ] $+ [ 2 ] ])) {
        var %x = 0, %y = 0
        while (%x < 4) {
          inc %x
          if ($v([ [ B. ] $+ [ %id ] $+ [ .TruePlayer: ] $+ [ %x ] ]) == $2) {
            var %y = 1
            uset [ [ B. ] $+ [ %id ] $+ [ .TruePlayer: ] $+ [ %x ] ]
          }
        }
        if (!%y) {
          .timerEndTurn $+ %ID off
          var %x = 0 | while (%x < 4) { inc %x | if ($v([ [ B. ] $+ [ %id ] $+ [ .Player. ] $+ [ %x ] ]) == $2) { var %n = %x } | sset [ [ B. ] $+ [ %id ] $+ [ .OutRules. ] $+ [ %x ] ] ON }
          winfight %ID $rvs(%n)
        }
      }
      elseif ($v([ [ B. ] $+ [ %id ] $+ [ .Player. ] $+ [ 2 ] ])) {
        if ($2 == $v([ [ B. ] $+ [ %ID ] $+ [ .Player.1 ] ])) {
          if (!$npc($v([ [ B. ] $+ [ %ID ] $+ [ .Player.2 ] ]))) { msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player.2 ] ]) ] ] Seu pedido de batalha foi cancelado. | b.remove.fila $2 | unset %confirm. [ $+ [ $2 ] ] }
        }
        else {
          var %x = 0 | while (%x < 4) { inc %x | if ($v([ [ B. ] $+ [ %id ] $+ [ .Player. ] $+ [ %x ] ]) == $2) { var %n = $battle.player(%ID,%x) } }
          msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player.1 ] ]) ] ] $cc $+ $rini(cadastros,$2,Info,Nick) $ct $+ desistiu da batalha. | b.left %ID %n
        }
      }
      else { b.remove.fila $2 | uset [ [ B. ] $+ [ %ID ] $+ [ * ] ] | .timerEndturn $+ %ID off }
    }
    var %x = %sell. [ $+ [ $2 ] ] | if (%x) { unset %sell. [ $+ [ $2 ] ] }
    var %x = %item. [ $+ [ $2 ] ] | if (%x) { unset %item. [ $+ [ $2 ] ] }
    var %x = %radio. [ $+ [ $2 ] ] | if (%x) { unset %radio. [ $+ [ $2 ] ] }
    if ($timer($+(RANDOM,.,$2))) { .timer $+ $+(RANDOM,.,$2) off }
    if ($v(PVT. $+ $2)) { uset PVT. $+ $2 }
    if ($v(FLOOD. $+ $2)) { uset FLOOD. $+ $2 }
    if (%active.league == $2) && (%active.league) { var %control = $readini(pkp\status.ini,Active,Control) | if (%confirm. [ $+ [ %control ] ]) { unset %confirm. [ $+ [ %control ] ] | if ($checknick(%control) == Ok!) { msg $+(=,%control) $ct $+ O desafio de $cc $+ %active.league $ct $+ foi cancelado. } } | unset %active.league }
    if ($active($2).time) {
      wlog user $2 Disconnected. | status.msg $2 PART | active $2 rem
      writeini pkp\cadastros\ $+ $2 $+ .ini Time Online $date $time
    }
  }
  .close $1-
}

alias arrange {
  var %text = $1, %chr = $2, %n = $3
  if ($prop) { var %type = $prop }

  var %t = $len($strip(%text)), %x = 0
  if ($4) { var %text = $4 }
  if (%t >= %n) { return %text }
  while (%t < %n) {
    inc %t
    if (%type == center) {
      if (%x) { var %text = $chr(%chr) $+ %text, %x = 0 }
      else { var %text = %text $+ $chr(%chr), %x = 1 }
    }
    elseif (%type == right) { var %text = $chr(%chr) $+ %text }
    else { var %text = %text $+ $chr(%chr) }
  }
  return %text
}
