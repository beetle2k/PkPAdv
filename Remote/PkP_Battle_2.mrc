; $foe(ID,Player,TEXTO.[,token]) -> $true se encontrar 'Player' dentro do 'TEXTO.' correspondente.
alias foe {
  var %ID = $1, %n = $2, %p = $3, %t = $iif($4 isnum,$4)
  if (!%t) { var %t = 58 }
  if ($battle.side(%n) == 1) { var %foes = 4:2:3:1 }
  else { var %foes = 3:1:4:2 }
  if ($5 != a) {
    var %foes = $remtok(%foes,%n,1,58)
    if ($5 != p) { var %foes = $remtok(%foes,$battle.team(%ID,%n).num,1,58) }
  }
  var %x = 1
  while ($gettok(%foes,%x,58)) {
    var %f = $gettok(%foes,%x,58), %foe = $v([ [ B. ] $+ [ %ID ] $+ [ . [ $+ [ %p ] ] ] $+ [ %f ] ])
    if ($findtok(%foe,%n,0,%t)) {
      if ($prop == rem) { var %foe = $remtok(%foe,%n,1,%t) | if (%foe) { sset [ [ B. ] $+ [ %ID ] $+ [ . [ $+ [ %p ] ] ] $+ [ %f ] ] %foe } | else { uset [ [ B. ] $+ [ %ID ] $+ [ . [ $+ [ %p ] ] ] $+ [ %f ] ] } }
      elseif ($prop == del) { uset [ [ B. ] $+ [ %ID ] $+ [ . [ $+ [ %p ] ] ] $+ [ %f ] ] }
      elseif (!$prop) { return $true }
    }
    inc %x
  }
  if (!$prop) { return $false }
}
; $checkfoe(ID,Player,TEXTO.,COMPARE) -> $true se TEXTO. dos advers�rios forem igual a 'COMPARE'.
alias checkfoe {
  var %ID = $1, %n = $2, %p = $3, %p2 = $4
  if ($battle.side(%n) == 1) { var %foes = 4:2:3:1 }
  else { var %foes = 3:1:4:2 }
  if ($5 != a) {
    var %foes = $remtok(%foes,%n,1,58)
    if ($5 != p) { var %foes = $remtok(%foes,$battle.team(%ID,%n).num,1,58) }
  }
  var %x = 1
  while ($gettok(%foes,%x,58)) {
    var %f = $gettok(%foes,%x,58), %foe = $v([ [ B. ] $+ [ %ID ] $+ [ . [ $+ [ %p ] ] ] $+ [ %f ] ])
    if (%foe == %p2) {
      if ($prop == del) { uset [ [ B. ] $+ [ %ID ] $+ [ . [ $+ [ %p ] ] ] $+ [ %f ] ] }
      elseif ($prop == num) { return %f }
      elseif (!$prop) { return $true }
    }
    inc %x
  }
  if (!$prop) { return $false }
}
alias checkfoe.left {
  var %ID = $1, %n = $2, %p = $3, %p2 = $4
  if ($battle.side(%n) == 1) { var %foes = 4:2:3:1 }
  else { var %foes = 3:1:4:2 }
  if ($5 != a) {
    var %foes = $remtok(%foes,%n,1,58)
    if ($5 != p) { var %foes = $remtok(%foes,$battle.team(%ID,%n).num,1,58) }
  }
  var %x = 1 | while ($gettok(%foes,%x,58)) { var %y = $gettok(%foes,%x,58) | if ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %y ] ]) > 0) { var %z = $addtok(%z,%y,58) } | inc %x }
  var %x = 1, %foes = %z
  while ($gettok(%foes,%x,58)) {
    var %f = $gettok(%foes,%x,58), %foe = $v([ [ B. ] $+ [ %ID ] $+ [ . [ $+ [ %p ] ] ] $+ [ %f ] ]), %y = 1
    while ($gettok(%p2,%y,58)) {
      if (%foe == $gettok(%p2,%y,58)) {
        if ($prop == del) { uset [ [ B. ] $+ [ %ID ] $+ [ . [ $+ [ %p ] ] ] $+ [ %f ] ] }
        elseif ($prop == num) { return %f }
        elseif (!$prop) { return $true }
      }
      inc %y
    }
    inc %x
  }
  if (!$prop) { return $false }
}

alias battle.wait {
  var %ID = $1, %x = 1, %r = 0
  while ($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %x ] ])) {
    var %m = $v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %x ] ])
    if (%m) { if (%m == Switch) { inc %r } | if (!$v([ [ B. ] $+ [ %ID ] $+ [ .Target. ] $+ [ %x ] ])) && ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %x ] ]) > 0) { inc %r } }
    else { if ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %x ] ]) > 0) { inc %r } }
    if ($prop == timer) { if ($timer(EndTurn $+ %ID)) { inc %r } }
    inc %x
  }
  if (%r) { return $true } | else { return $false }
}

alias battle.side {
  var %n = $1
  if (%n == 1) || (%n == 3) { return 1 }
  elseif (%n == 2) || (%n == 4) { return 2 }
}

; $battle.team(ID,N)[.num] - $true se forem dois treinadores diferentes no time do treinador N� N selecionado. .num para retornar o N� do outro treinador.
alias battle.team {
  var %ID = $1, %n = $2
  if ($prop == left) || ($prop == both) || ($prop == rand) {
    if ($battle.side(%n) == 1) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .2vs2 ] ])) { var %a = 3:1 } | else { var %a = 1 } }
    else { if ($v([ [ B. ] $+ [ %ID ] $+ [ .2vs2 ] ])) { var %a = 4:2 } | else { var %a = 2 } }
    var %x = 1, %l = 0 | while ($gettok(%a,%x,58)) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ $gettok(%a,%x,58) ] ]) > 0) { inc %l | var %r = $addtok(%r,$gettok(%a,%x,58),58) } | inc %x }
    if ($prop == left) { return %l }
    elseif ($prop == rand) { return $iif(%l > 1,$gettok(%r,$rand(1,2),58),$gettok(%r,1,58)) }
    else { return %r }
  }
  if (!$v([ [ B. ] $+ [ %ID ] $+ [ .2vs2 ] ])) { return $false }
  if ($prop == num) {
    if ($battle.side(%n) == 1) { if (%n == 1) { return 3 } | else { return 1 } }
    if ($battle.side(%n) == 2) { if (%n == 2) { return 4 } | else { return 2 } }
  }
  if ($battle.side(%n) == 1) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ 1 ] ]) == $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ 3 ] ])) { return $false } | else { return $true } }
  if ($battle.side(%n) == 2) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ 2 ] ]) == $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ 4 ] ])) { return $false } | else { return $true } }
}

; $battle.player(ID,N) - Retorna N se N existir, caso contr�rio retornar� TEAM.
; Serve para ser usado quando quiser saber a que TEAM um player dever� recorrer (ao seu particular ou conjunto).
alias battle.player {
  var %ID = $1, %n = $2
  if ($v([ [ B. ] $+ [ %ID ] $+ [ .Team1: ] $+ [ %n ] ])) { return %n }
  else { return $battle.side(%n) }
}

alias battle.target {
  var %ID = $1, %n = $2
  if ($battle.side(%n) == 1) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .2vs2 ] ])) { var %a = 4:2, %b = 3:1 } | else { return 2 } }
  else { if ($v([ [ B. ] $+ [ %ID ] $+ [ .2vs2 ] ])) { var %a = 3:1, %b = 4:2 } | else { return 1 } }
  var %x = 1, %l = 0 | while (%x <= 2) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ $gettok(%a,%x,58) ] ]) > 0) { inc %l | var %r = $addtok(%r,$gettok(%a,%x,58),58) } | inc %x }
  if ($prop == left) { return %l }
  if ($prop == partner) { return $gettok(%r,2,58) }
  if ($prop == both) { return %r }
  if ($prop == rand) { return $iif(%l > 1,$gettok(%r,$rand(1,2),58),$gettok(%r,1,58)) }
  if ($prop == all) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ $remtok(%b,%n,1,58) ] ]) > 0) { return %r $+ : $+ $remtok(%b,%n,1,58) } | else { return %r } }
  ; if ($v([ [ B. ] $+ [ %ID ] $+ [ .Target. ] $+ [ %n ] ])) { return $v([ [ B. ] $+ [ %ID ] $+ [ .Target. ] $+ [ %n ] ]) }
  return $gettok(%r,1,58)
}

alias battle.target� {
  var %ID = $1, %n = $2
  if ($battle.side(%n) == 1) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .2vs2 ] ])) { var %a = 4:2, %b = 3:1 } | else { return 2 } }
  else { if ($v([ [ B. ] $+ [ %ID ] $+ [ .2vs2 ] ])) { var %a = 3:1, %b = 4:2 } | else { return 1 } }
  var %x = 1, %l = 0 | while (%x <= 2) { if (!$v([ [ B. ] $+ [ %ID ] $+ [ .Lose: ] $+ [ $gettok(%a,%x,58) ] ])) { inc %l | var %r = $addtok(%r,$gettok(%a,%x,58),58) } | inc %x }
  if ($prop == left) { return %l }
  if ($prop == partner) { return $gettok(%r,2,58) }
  if ($prop == both) { return %r }
  if ($prop == rand) { return $iif(%l > 1,$gettok(%r,$rand(1,2),58),$gettok(%r,1,58)) }
  if ($prop == all) { if (!$v([ [ B. ] $+ [ %ID ] $+ [ .Lose: ] $+ [ $remtok(%b,%n,1,58) ] ])) { return %r $+ : $+ $remtok(%b,%n,1,58) } | else { return %r } }
  ; if ($v([ [ B. ] $+ [ %ID ] $+ [ .Target. ] $+ [ %n ] ])) { return $v([ [ B. ] $+ [ %ID ] $+ [ .Target. ] $+ [ %n ] ]) }
  return $gettok(%r,1,58)
}

; $battle.left(ID,N) - Props: rand, next, total (n�mero de pok�mon sobreviventes que N�O est�o na arena), num (retorna seus n�meros em rela��o ao time), *sem* (retorna o total de pok�mon vivos no time, incluindo o que estiver batalhando)

alias battle.total {
  var %ID = $1, %n = $battle.player(%ID,$2), %x = 1, %r = 0
  while ($v(B. $+ %ID $+ .Team $+ %x $+ : $+ %n)) { inc %x | inc %r }
  return %r
}
alias battle.left {
  var %ID = $1, %n = $2
  if ($v([ [ B. ] $+ [ %ID ] $+ [ .2vs2 ] ])) && (!$battle.team(%ID,%n)) {
    var %tn1 = $teamnumber(%ID,$battle.side(%n),$v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ])), %tn2 = $teamnumber(%ID,$battle.side(%n),$v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ $battle.team(%ID,%n).num ] ]))
    if ($prop == rand) { return $teamleft(%ID,$battle.side(%n),%tn1 $+ : $+ %tn2).rand }
    elseif ($prop == next) { return $teamleft(%ID,$battle.side(%n),%tn1 $+ : $+ %tn2).next }
    elseif ($prop == total) || ($prop == num) || ($prop == active) {
      var %x = 0, %r = 0 | while (%x < 6) {
        inc %x | if ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %x ] $+ ] : ] $+ [ $battle.side(%n) ] ]),15,58) > 0) {
          if ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %x ] $+ ] : ] $+ [ $battle.side(%n) ] ]),1,58) != $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ])) && ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %x ] $+ ] : ] $+ [ $battle.side(%n) ] ]),1,58) != $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ $battle.team(%ID,%n).num ] ])) { inc %r | var %t = $addtok(%t,%x,58) }
        }
      }
      return $iif($prop == total,%r,%t)
    }
    else { return $teamleft(%ID,$battle.side(%n)) }
  }
  else {
    var %tn1 = $teamnumber(%ID,%n,$v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]))
    if ($prop == rand) { return $teamleft(%ID,%n,%tn1).rand }
    elseif ($prop == next) { return $teamleft(%ID,%n,%tn1).next }
    elseif ($prop == total) || ($prop == num) {
      var %x = 0, %r = 0 | while (%x < 6) {
        inc %x | if ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %x ] $+ ] : ] $+ [ %n ] ]),15,58) > 0) {
          if ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %x ] $+ ] : ] $+ [ %n ] ]),1,58) != $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ])) { inc %r | var %t = $addtok(%t,%x,58) }
        }
      }
      return $iif($prop == total,%r,%t)
    }
    else { return $teamleft(%ID,%n) }
  }

}

alias change.order {
  var %o = $1
  if ($prop == first) { var %first = $2, %o = $remtok(%o,%first,1,58), %o = %first $+ : $+ %o | return %o }
  if ($prop == last) { var %last = $2, %o = $remtok(%o,%last,1,58), %o = %o $+ : $+ %last | return %o }
  return %o
}

alias teamnumber {
  var %ID = $1, %Player = $2, %Team = $battle.player(%ID,%Player)
  var %x = 0 | while (%x < 6) {
    inc %x
    if ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %x ] $+ ] : ] $+ [ %Team ] ]),1,58) == $iif($3,$3,$v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %Player ] ]))) { return %x }
  }
  return
}

alias teamleft {
  var %ID = $1, %Player = $2
  if ($prop == rand) {
    if ($3) { var %r = $3, %loop = $calc(6 - $gettok(%r,0,58)) }
    else { var %r = 0, %loop = 6 }
    var %x = 0 | while (%x < %loop) {
      inc %x
      :again
      var %n = $rand(1,6)
      if ($findtok(%r,%n,0,58)) { goto again }
      if (%r) { var %r = %r $+ : $+ %n } | else { var %r = %n }
      if ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %n ] $+ ] : ] $+ [ %Player ] ]),15,58) > 0) { return %n }
    }
    return 0
  }
  if ($prop == next) {
    if ($3) { var %r = $3 } | else { var %r = 0 }
    var %x = 0 | while (%x < 6) {
      inc %x
      if ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %x ] $+ ] : ] $+ [ %Player ] ]),15,58) > 0) {
        if (!$findtok(%r,%x,0,58)) { return %x }
      }
    }
    return 0
  }
  var %x = 0, %r = 0 | while (%x < 6) {
    inc %x
    if ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %x ] $+ ] : ] $+ [ %Player ] ]),15,58) > 0) { inc %r }
  }
  return %r
}

alias healteam {
  var %ID = $1, %Player = $2
  if ($prop == stat) {
    var %x = 0, %r = 0 | while (%x < 6) {
      inc %x
      if ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %x ] $+ ] : ] $+ [ %Player ] ]),16,58)) { sset [ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %x ] $+ ] : ] $+ [ %Player ] ] $gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %x ] $+ ] : ] $+ [ %Player ] ]),1-15,58) $+ :0: $+ $gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %x ] $+ ] : ] $+ [ %Player ] ]),17-24,58) }
    }
    return
  }
  var %x = 0, %r = 0 | while (%x < 6) {
    inc %x
    if ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %x ] $+ ] : ] $+ [ %Player ] ]),1,58)) { sset [ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %x ] $+ ] : ] $+ [ %Player ] ] $gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %x ] $+ ] : ] $+ [ %Player ] ]),1-14,58) $+ : $+ $gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %x ] $+ ] : ] $+ [ %Player ] ]),9,58) $+ :0: $+ $gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %x ] $+ ] : ] $+ [ %Player ] ]),17-20,58) $+ :0:0:0:0 }
  }
}

alias getteam {
  var %p = $1, %pk = $2
  if ($dados(%p,%pk,Name)) { var %hidden = $hp($rini(cadastros,%p,%pk,IVHp),$rini(cadastros,%p,%pk,IVAtk),$rini(cadastros,%p,%pk,IVDef),$rini(cadastros,%p,%pk,IVSpd),$rini(cadastros,%p,%pk,IVSAtk),$rini(cadastros,%p,%pk,IVSDef)) } | else { var %hidden = Dark;70 }
  var %x = $else.null($rini(cadastros,%p,%pk,Move1)) $+ : $+ $else.null($rini(cadastros,%p,%pk,Move2)) $+ : $+ $else.null($rini(cadastros,%p,%pk,Move3)) $+ : $+ $else.null($rini(cadastros,%p,%pk,Move4)) $+ :0:0:0:0
  return $rini(cadastros,%p,%pk,Name) $+ : $+ $rini(cadastros,%p,%pk,Level) $+ : $+ $rini(cadastros,%p,%pk,Nature) $+ : $+ $rini(cadastros,%p,%pk,Sex) $+ : $+ $rini(cadastros,%p,%pk,Shiny) $+ : $+ $rini(cadastros,%p,%pk,Trait) $+ : $+ $gettok($rini(cadastros,%p,%pk,Loyalty),1,58) $+ : $+ $rini(cadastros,%p,%pk,Hold) $+ : $+ $rini(cadastros,%p,%pk,HP) $+ : $+ $rini(cadastros,%p,%pk,Atk) $+ : $+ $rini(cadastros,%p,%pk,Def) $+ : $+ $rini(cadastros,%p,%pk,Spd) $+ : $+ $rini(cadastros,%p,%pk,SAtk) $+ : $+ $rini(cadastros,%p,%pk,SDef) $+ : $+ $rini(cadastros,%p,%pk,HP) $+ :0: $+ %x $+ : $+ %hidden

  ; Pok�mon:Level:Nature:Sex:Shiny:Trait:Loyalty:Hold:HP:ATK:DEF:SPD:SATK:SDEF:HPAtual:Status:Move1:Move2:Move3:Move4:PP1:PP2:PP3:PP4:HiddenPower
}

alias rteam {
  var %ID = $1, %n = $2, %pk = $3
  if (!%pk) { var %pk = $v($+(B.,%ID,.Poke.,%n)) }

  var %team = $battle.player(%ID,%n), %tn = $teamnumber(%ID,%Team,%pk)
  return $v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %tn ] $+ ] : ] $+ [ %Team ] ])
}

alias rteam.n {
  var %ID = $1, %n = $2, %tn = $3, %team = $battle.player(%ID,%n)
  return $v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %tn ] $+ ] : ] $+ [ %Team ] ])
}

alias realstatus {
  var %s = $gettok($1,1,59)
  if (%s == Sleep) { return 14SLP }
  elseif (%s == Paralyz) { return 7PLZ }
  elseif (%s == Burn) { return 4BRN }
  elseif (%s == Frozen) { return 2FRZ }
  elseif (%s == Poison) { return 6PSN }
  else { return NRM }
}

alias winfight {
  var %ID = $1, %side = $2, %win.exp = 0, %money = 0
  battle.thief %ID %side
  if ($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ $battle.team(%ID,$rvs(%side)).num ] ])) && (!$v([ [ B. ] $+ [ %ID ] $+ [ .Lose: ] $+ [ $battle.team(%ID,$rvs(%side)).num ] ])) { var %n = $battle.team(%ID,$rvs(%side)).num } | else { var %n = $rvs(%side) }

  var %x = $rvs(%side)
  if ($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ $battle.team(%ID,%x).num ] ])) && (!$v([ [ B. ] $+ [ %ID ] $+ [ .Lose: ] $+ [ $battle.team(%ID,%x).num ] ])) { var %lose = $battle.team(%ID,%x).num }
  if ($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %x ] ])) && (!$v([ [ B. ] $+ [ %ID ] $+ [ .Lose: ] $+ [ %x ] ])) { if (%lose) { var %lose = %lose $+ : $+ %x } | else { var %lose = %x } }

  var %ls = 1, %min.exp = 0
  while ($gettok(%lose,%ls,58)) {
    var %n = $gettok(%lose,%ls,58)

    var %base = $basestat($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]),BaseEXP), %lvl = $v([ [ B. ] $+ [ %ID ] $+ [ .Lvl. ] $+ [ %n ] ]), %exp = $int($calc((%base * %lvl) / 7)), %wild = $iif($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) == Wild,1,1.5), %foes = $battle.target�(%ID,%n).both
    var %min.exp = $int($calc(%min.exp + (%exp * %wild))), %exp = $int($calc(%exp / $gettok(%foes,0,58)))

    var %x = 1, %texp = 0
    while ($gettok(%foes,%x,58)) {
      var %foe = $gettok(%foes,%x,58)
      if (!$npc($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %foe ] ]))) { var %trainerID = $iif($rini(cadastros,$v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %foe ] ]),$v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %foe ] ]),ID) == $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %foe ] ]),1,1.5) } | else { var %trainerID = 1 }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %foe ] ]) == Lucky Egg) { var %exp.boost = 1.5 } | else { var %exp.boost = 1 }
      var %texp = $calc(%texp + $int($calc(%exp * %trainerID * %wild * %exp.boost)))
      inc %x
    }
    var %win.exp = $calc(%win.exp + %texp), %money = $calc(%money + (%lvl * 10))

    inc %ls
  }
  var %win.xp, %win.exp = $int($calc(%win.exp / $gettok(%foes,0,58))), %min.exp = $int($calc(%min.exp / $gettok(%foes,0,58))), %money = $int($calc(%money / $gettok(%foes,0,58)))

  var %z = 1, %win.xp = 0 | while ($gettok(%foes,%z,58)) {
    var %foe = $gettok(%foes,%z,58)

    if (!$v([ [ B. ] $+ [ %ID ] $+ [ .NoEXP: ] $+ [ %foe ] ])) {

      var %ls = 1
      while ($gettok(%lose,%ls,58)) {
        var %n = $gettok(%lose,%ls,58)

        var %l = $rini(cadastros,$v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %foe ] ]),Info,Last), %r = 0
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Lvl. ] $+ [ %foe ] ]) < 100) { var %loyalty = $rini(cadastros,$v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %foe ] ]),$v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %foe ] ]),Loyalty) }
        if (%loyalty != $null) {
          if ($gettok(%l,1,58) == win) {
            if ($gettok(%l,2,58) == $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %foe ] ])) { var %r = 0 } | else { var %r = 1 }
            if ($gettok(%l,3,58) == $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ])) { var %r = %r } | else { var %r = %r + 1 }
          }
          else { var %r = 0 }
          if (%r) {
            if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %foe ] ]) == Soothe Bell) { var %r = %r * 2 }
            var %loyalty = $gettok(%loyalty,1,58) $+ : $+ $calc($gettok(%loyalty,2,58) + %r)
          }
        }
        writeini pkp\cadastros\ $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %foe ] ]) $+ .ini Info Last win: $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %foe ] ]) $+ : $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ])
        if (%loyalty != $null) { writeini pkp\cadastros\ $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %foe ] ]) $+ .ini $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %foe ] ]) Loyalty %loyalty | var %loyalty }

        if ($v([ [ B. ] $+ [ %ID ] $+ [ .OutRules. ] $+ [ %foe ] ]) != ON) {

          if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %foe ] ]) == Macho Brace) { var %effort = 2 } | else { var %effort = 1 }
          var %bev = $basestat($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]),EV), %te = $totaleffort($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %foe ] ]),$v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %foe ] ]))
          if (%te < 510) {
            var %y = 0 | while (%y < %effort) {
              inc %y
              var %x = 0 | while (%x < 6) {
                inc %x | var %p = $gettok(%bev,%x,32), %stat = $dados($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %foe ] ]),$v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %foe ] ]),$+(EV,$nstat(%x))), %p = $iif($calc(%stat + %p) > 255,$calc(255 - %stat),%p), %p = $iif($calc(%te + %p) > 510,$calc(510 - %te),%p), %r = $calc(%stat + %p), %te = $calc(%te + %p)
                writeini pkp\cadastros\ $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %foe ] ]) $+ .ini $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %foe ] ]) $+(EV,$nstat(%x)) %r | if (%te == 510) { var %x = 6 }
              }
            }
          }
          if (%ls == 1) {
            writeini pkp\cadastros\ $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %foe ] ]) $+ .ini Info Money $calc($rini(cadastros,$v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %foe ] ]),Info,Money) + %money)
            addexp $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %foe ] ]) $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %foe ] ]) %win.exp
            inc %win.xp | var %win.received = $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %foe ] ])
          }
        }
        inc %ls
      }
    }

    if (%win.pk) { var %win.pk = %win.pk $lb $+ e $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %foe ] ]) | inc %win.pk.n } | else { var %win.pk = $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %foe ] ]), %win.pk.n = 1 }
    if (%win.p) {
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %foe ] ]) != $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $battle.team(%ID,%foe).num ] ])) { var %win.p = %win.p $lb $+ e $bb $+ $+(:player,%foe,;) | inc %win.p.n }
    }
    else { var %win.p = $+(:player,%foe,;), %win.p.n = 1 | if (!$npc($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %foe ] ]))) { writeini pkp\cadastros\ $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %foe ] ]) $+ .ini Historico Win $calc($dados($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %foe ] ]),Historico,Win) + 1) } }


    if ($npc($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %foe ] ]))) {
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %foe ] ]) == Wild) { remini pkp\cadastros\ $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $rvs(%foe) ] ]) $+ .ini $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %foe ] ]) }
    }
    else {
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %foe ] ]) != $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $battle.team(%ID,%foe).num ] ])) { writeini pkp\cadastros\ $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %foe ] ]) $+ .ini Historico Win $calc($dados($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %foe ] ]),Historico,Win) + 1) }
    }

    inc %z
  }

  var %lose.xp, %ls = 1, %lose.exp = 0
  while ($gettok(%lose,%ls,58)) {
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Lucky Egg) { var %exp.boost = 1.5 } | else { var %exp.boost = 1 }
    var %trainerID = $iif($rini(cadastros,$v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]),$v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]),ID) == $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]),1,1.5)

    var %lose.exp = $int($calc(%lose.exp + (%min.exp * %trainerID * %exp.boost)))
    inc %ls
  }

  var %lose.exp = $int($calc(%lose.exp / (2 * $gettok(%lose,0,58)))), %lose.money = $int($calc(%money / (2 * $gettok(%lose,0,58)))), %ls = 1

  while ($gettok(%lose,%ls,58)) {
    var %n = $gettok(%lose,%ls,58)

    if ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]) <= 0) { msgfight %ID $bb $+ $+(:player,%n,;) $+ 's $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) $lb $+ foi derrotado! }
    if (!$v([ [ B. ] $+ [ %ID ] $+ [ .NoEXP: ] $+ [ %n ] ])) {

      var %l = $rini(cadastros,$v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]),Info,Last), %r = 0
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Lvl. ] $+ [ %n ] ]) < 100) {
        var %loyalty = $rini(cadastros,$v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]),$v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]),Loyalty)
        if ($gettok(%l,1,58) == win) { var %r = 1 }
        else {
          if ($gettok(%l,2,58) == $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ])) { var %r = 1 }
          if ($checkfoe(%ID,%n,Player.,$gettok(%l,3,58))) { var %r = %r + 1 } | else { var %r = 0 }
        }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Soothe Bell) { var %r = $int($calc(%r / 2)) }
        if (%r) { if ($gettok(%loyalty,2,58)) { writeini pkp\cadastros\ $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) $+ .ini $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) Loyalty $gettok(%loyalty,1,58) $+ : $+ $calc($gettok(%loyalty,2,58) - %r) } | else { writeini pkp\cadastros\ $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) $+ .ini $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) Loyalty $gettok(%loyalty,1,58) $+ : $+ $calc(0 - %r) } }
      }
      writeini pkp\cadastros\ $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) $+ .ini Info Last lose: $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) $+ : $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $battle.target�(%ID,%n).rand ] ])

      if ($v([ [ B. ] $+ [ %ID ] $+ [ .OutRules. ] $+ [ %n ] ]) != ON) {
        writeini pkp\cadastros\ $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) $+ .ini Info Money $calc($rini(cadastros,$v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]),Info,Money) + %lose.money)
        addexp $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) %lose.exp
        inc %lose.xp | var %lose.received = $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ])
      }
    }

    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) == Wild) { remini pkp\cadastros\ $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $rvs(%n) ] ]) $+ .ini $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) }

    if (!$npc($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]))) { writeini pkp\cadastros\ $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) $+ .ini Historico Lose $calc($dados($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]),Historico,Lose) + 1) }

    if (%lose.p) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) != $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $battle.team(%ID,%n).num ] ])) { var %lose.p = %lose.p $lb $+ e $bb $+ $+(:player,%n,;) | inc %lose.p.n } }
    else { var %lose.p = $+(:player,%n,;), %lose.p.n = 1 }

    if (%lose.pk) { var %lose.pk = %lose.pk $lb $+ e $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) | inc %lose.pk.n }
    else { var %lose.pk = $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]), %lose.pk.n = 1 }

    inc %ls
  }

  var %p = $bb $+ %win.p $lb $+ $iif(%win.p.n > 1,derrotaram,derrotou) $bb $+ %lose.p $+ $lb $+ !
  if (%win.xp == %win.pk.n) { var %pk.win = $bb $+ %win.pk $lb $+ $iif(%win.pk.n > 1,ganharam,ganhou) $bb $+ %win.exp $lb $+ pontos de $iif(%win.pk.n > 1,experi�ncia cada,experi�ncia) e $bb $+ $chr(292) $+ $getmoney($calc(%money * %win.xp)) }
  elseif (!%win.xp) { var %pk.win = $bb $+ %win.pk $lb $+ n�o $iif(%win.pk.n > 1,ganharam,ganhou) pontos de experi�ncia }
  else { var %pk.win = $bb $+ %win.received $lb $+ ganhou $bb $+ %win.exp $lb $+ pontos de experi�ncia e $bb $+ $chr(292) $+ $getmoney($calc(%money * %win.xp)) }
  if (%lose.xp == %lose.pk.n) { var %pk.lose = $bb $+ %lose.pk $lb $+ $iif(%lose.pk.n > 1,ganharam,ganhou) $bb $+ %lose.exp $lb $+ pontos de $iif(%lose.pk.n > 1,experi�ncia cada,experi�ncia) e $bb $+ $chr(292) $+ $getmoney($calc(%lose.money * %lose.xp)) }
  elseif (!%lose.xp) { var %pk.lose = $bb $+ %lose.pk $lb $+ n�o $iif(%lose.pk.n > 1,ganharam,ganhou) pontos de experi�ncia }
  else { var %pk.lose = $bb $+ %lose.received $lb $+ ganhou $bb $+ %lose.exp $lb $+ pontos de experi�ncia e $bb $+ $chr(292) $+ $getmoney($calc(%lose.money * %lose.xp)) }

  msgfight %ID %p %pk.win $+ $lb $+ . %pk.lose $+ $lb $+ .

  if ($gettok($v(B. [ $+ [ %ID ] $+ ] .Say: [ $+ [ $rvs(%n) ] ]),2,59)) {
    if ($checknick($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ])) == Ok!) {
      var %x = $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $rvs(%n) ] ]) | if ($gettok(%x,0,95) > 1) { if ($findtok(Magma:Aqua:Rocket,$gettok(%x,2,95),0,58)) { var %x = $cc $+ $gettok(%x,1,95) $ct $+ ( $+ $upper($gettok(%x,2,95)) $+ ) } | else { var %x = $ct $+ $gettok(%x,1,95) $cc $+ $gettok(%x,2,95) } } | else { var %x = $cc $+ %x }
      msg $+(=,$v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ])) $chr(160) %x $ct $+ - $gettok($v(B. [ $+ [ %ID ] $+ ] .Say: [ $+ [ $rvs(%n) ] ]),2,59)
    }
  }
  if ($gettok($v(B. [ $+ [ %ID ] $+ ] .Say: [ $+ [ $battle.side(%n) ] ]),3,59)) {
    var %x = $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $battle.side(%n) ] ]) | if ($gettok(%x,0,95) > 1) { if ($findtok(Magma:Aqua:Rocket,$gettok(%x,2,95),0,58)) { var %x = $cc $+ $gettok(%x,1,95) $ct $+ ( $+ $upper($gettok(%x,2,95)) $+ ) } | else { var %x = $ct $+ $gettok(%x,1,95) $cc $+ $gettok(%x,2,95) } } | else { var %x = $cc $+ %x }
    if ($checknick($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $rvs(%n) ] ])) == Ok!) { msg $+(=,$v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $rvs(%n) ] ])) $chr(160) %x $ct $+ - $gettok($v(B. [ $+ [ %ID ] $+ ] .Say: [ $+ [ $battle.side(%n) ] ]),3,59) }
  }

  var %x = $iif($npc($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ])),$rvs(%n),%n), %n = %side
  b.remove.fila $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %x ] ])

  if ($v(B. [ $+ [ %ID ] $+ ] .Watching)) { var %x = $gettok($v(B. [ $+ [ %ID ] $+ ] .Watching),0,58), %y = 0 | while (%y < %x) { inc %y | uset Watch. [ $+ [ $gettok($v(B. [ $+ [ %ID ] $+ ] .Watching),%y,58) ] ] } }
  if ($v(B. [ $+ [ %ID ] $+ ] .Rental)) {
    if ($npc($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]))) {
      var %nick = $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $rvs(%n) ] ]), %t = $readini(pkp\status.ini,Active,Rental)
      var %brain = $v([ [ B. ] $+ [ %ID ] $+ [ .TruePlayer: ] $+ [ %n ] ])
      if (%brain) {
        var %bp = $calc($rini(cadastros,%brain,Info,Access) * 2) | writeini pkp\cadastros\ $+ %brain $+ .ini Info BP $calc($dados(%brain,Info,BP) + %bp)
        if ($checknick(%brain) == Ok!) { msg $+(=,%brain) $ct $+ Parab�ns, $cc $+ %brain $+ $ct $+ ! Voc� derrotou seu advers�rio no $cc $+ Battle Rental $+ $ct $+ ! Como pr�mio, voc� recebeu $cc $+ %bp $ct $+ battle point $+ $iif(%bp > 1,s) $+ ! }
      }
      elseif (!$calc( ($dados(%nick,Rental,Victory) + 1) % 7 )) {
        var %brain = $gettok($readini(pkp\status.ini,Active,Brain),1,58) | if (%confirm. [ $+ [ %brain ] ] == $+(BRN,:,%nick)) { unset %confirm. [ $+ [ %brain ] ] | if ($checknick(%brain) == Ok!) { msg $+(=,%brain) $ct $+ N�o � mais necess�rio sua confirma��o. Seu advers�rio j� foi derrotado. } }
        if ($dados(%nick,Rental,Brain) == %brain) { if (%rental. [ $+ [ %brain ] ] == BRAIN) { unset %rental. [ $+ [ %brain ] ] | if ($checknick(%brain) == Ok!) { msg $+(=,%brain) $ct $+ Sua inscri��o no $cc $+ Battle Rental $ct $+ foi cancelada, pois seu advers�rio j� foi derrotado. } } }
      }
      remini pkp\cadastros\ $+ %nick $+ .ini Rental
      writeini pkp\cadastros\ $+ %nick $+ .ini Time Rental $date $time
      if ($checknick(%nick) == Ok!) {
        msg $+(=,%nick) $cc $+ %nick $+ $ct $+ , voc� foi derrotado ao desafiar o $cc $+ Battle Rental $+ $ct $+ . Para tentar novamente, voc� precisa aguardar um per�odo de $dur(%t,$ct,$cc) $+ .
      }
    }
    else {
      var %nick = $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ])
      if ($dados(%nick,Rental,Battle) == 7) {
        writeini pkp\cadastros\ $+ %nick $+ .ini Rental Victory $calc($dados(%nick,Rental,Victory) + 1)
        var %recorde = $dados(%nick,Historico,Rental), %recorde = $iif(%recorde,%recorde,0)
        if ($dados(%nick,Rental,Victory) > %recorde) { writeini pkp\cadastros\ $+ %nick $+ .ini Historico Rental $dados(%nick,Rental,Victory) }
        var %bp = $calc($iif($dados(%nick,Rental,Victory) > 5,5,$dados(%nick,Rental,Victory)) + $rental.bonus(%nick))
        if (%bp < 0) { set %bp 0 }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $rvs(%n) ] ]) == Brain) { var %bp = $calc(%bp + 5) }
        writeini pkp\cadastros\ $+ %nick $+ .ini Info BP $calc($dados(%nick,Info,BP) + %bp)
        remini pkp\cadastros\ $+ %nick $+ .ini Time Rental
        remini pkp\cadastros\ $+ %nick $+ .ini Rental Auto
        if ($checknick(%nick) == Ok!) {
          msg $+(=,%nick) $ct $+ Parab�ns, $cc $+ %nick $+ $ct $+ ! Voc� derrotou todos os $cc $+ sete $ct $+ treinadores do $cc $+ Battle Rental $+ $ct $+ !
          if (%bp == 0) { msg $+(=,%nick) $ct $+ Como premia��o, voc� recebeu $cc $+ %bp $ct $+ battle points por finalizar com os pok�mon $separecom($dados(%nick,Rental,Team),e,32,$cc,$ct) $+ $ct $+ . N�o � t�o f�cil assim... tente n�o usar pok�mons t�o fortes da pr�xima vez! }
          else { msg $+(=,%nick) $ct $+ Como premia��o, voc� recebeu $cc $+ %bp $ct $+ battle point $+ $iif(%bp > 1,s) $+ . $iif($rental.bonus(%nick),Voc� obteve pontos extras por finalizar com os pok�mon $separecom($dados(%nick,Rental,Team),e,32,$cc,$ct) $+ $ct $+ .) }
        }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $rvs(%n) ] ]) == Brain) {
          var %brain = $gettok($readini(pkp\status.ini,Active,Brain),1,58)
          if ($dados(%nick,Historico,Rental) > $dados(%brain,Historico,Rental)) {
            var %warning = $ct $+ Aten��o, $cc $+ %brain $+ $ct $+ ! Seu advers�rio $cc $+ %nick $ct $+ mostrou-se mais experiente que voc� no $cc $+ Battle Rental $+ $ct $+ , e seu hist�rico mostra que o mesmo tem um recorde maior que o seu atualmente. Isso � o suficiente para que ele ocupe o seu lugar como $cc $+ Brain $ct $+ do $cc $+ Battle Rental $+ $ct $+ .
            if ($checknick(%brain) == Ok!) { msg $+(=,%brain) %warning }
            else { writeini pkp\cadastros\ $+ %brain $+ .ini Info Notice %warning }
            writeini pkp\status.ini Active Brain $dados(%nick,Info,Nick) $+ : $+ $dados(%nick,Rental,Team)
            sendamsg PkP $ct $+ Parab�ns, $cc $+ $dados(%nick,Info,Nick) $+ $ct $+ ! Voc� se tornou o novo $cc $+ Brain $ct $+ do $cc $+ Battle Rental $+ $ct $+ !
            if ($checknick(%nick) == Ok!) { msg $+(=,%nick) $ct $+ Agora, quando um treinador estiver pr�ximo de batalhar contra o $cc $+ Brain $+ $ct $+ , um aviso ser� exibido e voc� poder� escolher entre controlar o NPC ou n�o. Se aceitar, poder� usar seu time atual do $cc $+ Battle Rental $+ $ct $+ , que � composto por $separecom($dados(%nick,Rental,Team),e,32,$cc,$ct) $+ $ct $+ ! E, se vencer seu oponente, ganhar� battle points! Divirta-se! }
          }
          else { var %brain = $v([ [ B. ] $+ [ %ID ] $+ [ .TruePlayer: ] $+ [ $rvs(%n) ] ]) | if (%brain) && ($checknick(%brain) == Ok!) { msg $+(=,%brain) $ct $+ Que pena, $cc $+ %brain $+ $ct $+ ! Voc� foi derrotado pelo seu advers�rio no $cc $+ Battle Rental $+ $ct $+ ! Fique atento para mais desafios! } }
        }
      }
      else {
        set %rental. [ $+ [ %nick ] ] $dados(%nick,Rental,$dados(%nick,Rental,Battle))
        writeini pkp\cadastros\ $+ %nick $+ .ini Rental Battle $calc($dados(%nick,Rental,Battle) + 1)
        if ($checknick(%nick) == Ok!) {
          msg $+(=,%nick) $ct $+ Parab�ns, $cc $+ %nick $+ $ct $+ . Voc� acabou de derrotar seu $cc $+ $ordinal($calc($dados(%nick,Rental,Battle) - 1)) $ct $+ advers�rio no $cc $+ Battle Rental $+ $ct $+ ! Agora, se quiser trocar algum de seus pok�mon por um usado pelo oponente, digite " $+ $cc $+ .sim <seu pok�mon> <novo pok�mon> $+ $ct $+ " para fazer a troca. Por exemplo, " $+ $cc $+ .sim Pikachu Eevee $+ $ct $+ ". Se n�o desejar efetuar troca alguma, apenas digite " $+ $cc $+ .nao $+ $ct $+ " e prossiga para sua pr�xima luta.
          msg $+(=,%nick) $ct $+ Os pok�mon do advers�rio s�o os seguintes: $separecom(%rental. [ $+ [ %nick ] ],e,32,$cc,$ct) $+ $ct $+ .
          if (!$calc( ($dados(%nick,Rental,Victory) + 1) % 7 )) && ($dados(%nick,Rental,Battle) == 7) { msg $+(=,%nick) $chr(160) $cc $+ Juiz $ct $+ - Oh, oh! Acabei de descobrir algo... Cuidado! O pr�ximo treinador � muito, muito tem�vel! Esteja preparado para a pr�xima batalha ou ser� tarde demais! }
          else {
            var %usual = $usual.type($dados(%nick,Rental,$dados(%nick,Rental,Battle)))
            msg $+(=,%nick) $chr(160) $cc $+ Juiz $ct $+ - Ei, $cc $+ %nick $+ $ct $+ ! Acabei de descobrir que seu advers�rio $iif(%usual.type,tem prefer�ncia por pok�mon do tipo $cc $+ %usual.type $+ $ct $+ ! Fique atento!,n�o tem prefer�ncia por tipos de pok�mon...)
          }
          rental.check.brain %nick
        }
      }
    }
    uset B. $+ %ID $+ * | return
  }



  if (!$v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ])) && (!$v([ [ B. ] $+ [ %ID ] $+ [ .Gym ] ])) && (!$v([ [ B. ] $+ [ %ID ] $+ [ .League ] ])) { uset B. $+ %ID $+ * | return }

  if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ])) {
    if ($npc($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]))) {
      var %nick = $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $iif(%n == 1,2,1) ] ])
      unset %battle. [ $+ [ %nick ] ]
      if ($checknick(%nick) == Ok!) {
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == GARY) { msg $+(=,%nick) $chr(160) $cc $+ Prof Oak $ct $+ - Tudo bem, n�o precisa ficar triste. Ao longo do seu treinamento, voc� vai descobrir novas estrat�gias e vencer� suas batalhas sem maiores dificuldades. Boa sorte em sua jornada, $cc $+ %nick $+ $ct $+ . }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == GARY1) { msg $+(=,%nick) $chr(160) $cc $+ Gary $ct $+ - Hahaha, nos vemos depois, perdedor! | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Gary1 No }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == GARY2) { msg $+(=,%nick) $chr(160) $cc $+ Gary $ct $+ - Quando � que voc� vai entender que eu sou o melhor? | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Gary2 No }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == GARY3) { msg $+(=,%nick) $chr(160) $cc $+ Gary $ct $+ - Como espera derrotar a liga se n�o consegue me derrotar, ao menos? Hahaha, melhor voltar pra casa %nick $+ ! Eu vou em frente, at�! | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Gary3 No }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == ROCKET1) {
          msg $+(=,%nick) $chr(160) $cc $+ $remove($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]),_Rocket) $ct $+ (ROCKET) - Saia daqui! | writeini pkp\cadastros\ $+ %nick $+ .ini Info Locate Pewter City | remini pkp\cadastros\ $+ %nick $+ .ini Time Goto
          msg $+(=,%nick) $ct $+ Voc� foi expulso do $cc $+ Mt Moon $+ $ct $+ . Bem vindo a $cc $+ Pewter City $+ $ct $+ .
        }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == MAY) {
          msg $+(=,%nick) $chr(160) $cc $+ May $ct $+ - Ei, n�o precisa ficar triste com sua derrota! Pegue estas $cc $+ Poke  Ball $+ $ct $+ . Vou ensin�-lo como capturar pok�mon!
          msg $+(=,%nick) $chr(160) $cc $+ May $ct $+ - Para batalhar com pok�mon selvagens e tentar captur�-los, digite ' $+ $cc $+ .cidade $+ $ct $+ ' e veja como iniciar uma batalha com pok�mon $cc $+ selvagem $+ $ct $+ . Durante essa batalha, quando achar que deve usar sua Poke  Ball, digite ' $+ $cc $+ .Item USE Poke  Ball $+ $ct $+ '. Boa sorte! Nos veremos depois! | var %x = 0 | while (%x < 3) { inc %x | item.add %nick Poke  Ball }
        }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == BRENDAN) {
          msg $+(=,%nick) $chr(160) $cc $+ Brendan $ct $+ - Como eu disse, meus pok�mon est�o fortes! Ser� divertido nosso reencontro. Esteja preparado! | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Brendan1 No
        }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == FUJI) {
          msg $+(=,%nick) $chr(160) $cc $+ $gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]),1,95) $ct $+ (ROCKET) - N�o vou perder nem mais um segundo do meu tempo com voc�!
          var %m = $rini(cadastros,%nick,Info,Money), %n = $calc(%m - 5000), %p = $iif(%n < 0,%m,%n)
          if (%p) { msg $+(=,%nick) $ct $+ Voc� foi roubado e perdeu $cc $+ $chr(36) $+ 5,000 $ct $+ de dinheiro. | writeini pkp\cadastros\ $+ %nick $+ .ini Info Money %p }
        }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) == Sam_Aqua) {
          var %m = $rini(cadastros,%nick,Info,Money), %n = $calc(%m - 10000), %p = $iif(%n < 0,%m,%n)
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Sam $ct $+ (AQUA) - � bom que n�o volte mais aqui!
          if (%p) { msg = [ $+ [ %nick ] ] $ct $+ Voc� foi roubado e perdeu $cc $+ $chr(36) $+ 10,000 $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Info Money %p }
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) == March_Aqua) {
          var %m = $rini(cadastros,%nick,Info,Money), %n = $calc(%m - 10000), %p = $iif(%n < 0,%m,%n)
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ March $ct $+ (AQUA) - N�o acredito que um dos membros da equipe Aqua perdeu para voc�!
          if (%p) { msg = [ $+ [ %nick ] ] $ct $+ Voc� foi roubado e perdeu $cc $+ $chr(36) $+ 10,000 $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Info Money %p }
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) == Elenna_Magma) {
          var %m = $rini(cadastros,%nick,Info,Money), %n = $calc(%m - 10000), %p = $iif(%n < 0,%m,%n)
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Elenna $ct $+ (MAGMA) - Ha! E pensou que poderia derrotar a equipe Magma!
          if (%p) { msg = [ $+ [ %nick ] ] $ct $+ Voc� foi roubado e perdeu $cc $+ $chr(36) $+ 10,000 $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Info Money %p }
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) == Alan_Magma) {
          var %m = $rini(cadastros,%nick,Info,Money), %n = $calc(%m - 10000), %p = $iif(%n < 0,%m,%n)
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Alan $ct $+ (MAGMA) - Saia daqui e n�o volte mais!
          if (%p) { msg = [ $+ [ %nick ] ] $ct $+ Voc� foi roubado e perdeu $cc $+ $chr(36) $+ 10,000 $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Info Money %p }
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) == Elliot_Magma) {
          var %m = $rini(cadastros,%nick,Info,Money), %n = $calc(%m - 10000), %p = $iif(%n < 0,%m,%n)
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Elliot $ct $+ (MAGMA) - Suas inten��es s�o boas, talvez a Equipe Magma esteja indo longe demais...
          if (%p) { msg = [ $+ [ %nick ] ] $ct $+ Voc� foi roubado e perdeu $cc $+ $chr(36) $+ 10,000 $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Info Money %p }
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) == Ronny_Magma) {
          var %m = $rini(cadastros,%nick,Info,Money), %n = $calc(%m - 10000), %p = $iif(%n < 0,%m,%n)
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Ronny $ct $+ (MAGMA) - Saia daqui, garoto. Droga, queria ver o pok�mon lend�rio... Droga, eu disse pok�mon lend�rio?!
          if (%p) { msg = [ $+ [ %nick ] ] $ct $+ Voc� foi roubado e perdeu $cc $+ $chr(36) $+ 10,000 $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Info Money %p }
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) == Tabitha_Magma) {
          if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == MAGMA1) {
            msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Tabitha $ct $+ (MAGMA) - Eu, o administrador da equipe Magma, n�o posso deixar que treinadores como voc� permane�am aqui!
            msg = [ $+ [ %nick ] ] $ct $+ Voc� foi expulso do $cc $+ Mt Chimney $+ $ct $+ . Bem vindo a $cc $+ Lavaridge Town $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Info Locate Lavaridge Town
          }
          else {
            var %m = $rini(cadastros,%nick,Info,Money), %n = $calc(%m - 20000), %p = $iif(%n < 0,%m,%n)
            msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Tabitha $ct $+ (MAGMA) - Como voc� espera derrotar toda a Equipe Magma sozinho? N�o seja tolo.
            if (%p) { msg = [ $+ [ %nick ] ] $ct $+ Voc� foi roubado e perdeu $cc $+ $chr(36) $+ 20,000 $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Info Money %p }
          }
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) == Maxie) {
          if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == MAGMA2) {
            var %m = $rini(cadastros,%nick,Info,Money), %n = $calc(%m - 30000), %p = $iif(%n < 0,%m,%n)
            msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Maxie $ct $+ - Groudon! Mostre-me seu poder!
            if (%p) { msg = [ $+ [ %nick ] ] $ct $+ Voc� foi roubado e perdeu $cc $+ $chr(36) $+ 30,000 $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Info Money %p }
          }
          elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == MAGMA3) {
            var %m = $rini(cadastros,%nick,Info,Money), %n = $calc(%m - 30000), %p = $iif(%n < 0,%m,%n)
            msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Maxie $ct $+ - N�o fique no caminho da minha equipe! Vamos, precisamos desses combust�veis!
            if (%p) { msg = [ $+ [ %nick ] ] $ct $+ Voc� foi roubado e perdeu $cc $+ $chr(36) $+ 30,000 $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Info Money %p }
          }
          else {
            msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Maxie $ct $+ - Achou mesmo que poderia me derrotar?! � melhor n�o voltar aqui de novo!
            msg = [ $+ [ %nick ] ] $ct $+ Voc� foi expulso do $cc $+ Mt Chimney $+ $ct $+ . Bem vindo a $cc $+ Lavaridge Town $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Info Locate Lavaridge Town
          }
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) == Archie) {
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Archie $ct $+ - Eu disse que voc� n�o deveria me atrapalhar. Agora, deixe-me a s�s com o Kyogre!
          msg = [ $+ [ %nick ] ] $ct $+ Voc� foi expulso da $cc $+ Seafloor Cavern $+ $ct $+ . Bem vindo a $cc $+ Silver Bay $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Info Locate Silver Bay
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) == Shelly_Aqua) {
          var %m = $rini(cadastros,%nick,Info,Money), %n = $calc(%m - 30000), %p = $iif(%n < 0,%m,%n)
          if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == AQUA4) {
            msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Shelly $ct $+ (AQUA) - Hahaha, isto foi pela sua intromiss�o no Weather Institute!
          }
          else { msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Shelly $ct $+ (AQUA) - Este pok�mon clim�tico ser� nosso! N�o tente mudar isso! }
          if (%p) { msg = [ $+ [ %nick ] ] $ct $+ Voc� foi roubado e perdeu $cc $+ $chr(36) $+ 30,000 $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Info Money %p }
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) == Matt_Aqua) {
          var %m = $rini(cadastros,%nick,Info,Money), %n = $calc(%m - 30000), %p = $iif(%n < 0,%m,%n)
          if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == AQUA3) {
            msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Matt $ct $+ (AQUA) - Hahaha, n�o tem como evitar!
          }
          else { msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Matt $ct $+ (AQUA) - ??? }
          if (%p) { msg = [ $+ [ %nick ] ] $ct $+ Voc� foi roubado e perdeu $cc $+ $chr(36) $+ 30,000 $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Info Money %p }
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == ROCKET7) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == ROCKET8) {
          var %m = $rini(cadastros,%nick,Info,Money), %n = $calc(%m - 20000), %p = $iif(%n < 0,%m,%n)
          if (%p) { msg $+(=,%nick) $cc $+ $dados(%nick,Info,Nick) $ct $+ foi roubado e perdeu $cc $+ $chr(36) $+ 20,000 $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Info Money %p }
          msg $+(=,%nick) $ct $+ Voc� conseguiu fugir da equipe $cc $+ Rocket $+ $ct $+ .
        }
        elseif ($findtok(Rick_Aqua:Marta_Aqua:Trent_Rocket:Joyce_Rocket,$v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]),0,58)) {
          var %m = $rini(cadastros,%nick,Info,Money), %n = $calc(%m - 20000), %p = $iif(%n < 0,%m,%n)
          if (%p) { msg = [ $+ [ %nick ] ] $ct $+ Voc� foi roubado e perdeu $cc $+ $chr(36) $+ 20,000 $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Info Money %p }
        }
        elseif ($findtok(Glenn_Aqua:Earl_Aqua:Arthur_Rocket:Trevor_Rocket:Chris_Rocket,$v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]),0,58)) {
          var %m = $rini(cadastros,%nick,Info,Money), %n = $calc(%m - 10000), %p = $iif(%n < 0,%m,%n)
          if (%p) { msg = [ $+ [ %nick ] ] $ct $+ Voc� foi roubado e perdeu $cc $+ $chr(36) $+ 10,000 $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Info Money %p }
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) == Wally) { msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Wally $ct $+ - Vou ficar aqui em Evergrande City treinando com meus pok�mon. Periodicamente, vamos batalhar, ok? At� logo, $nick $+ ! Ah, e muita sorte na liga! }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) == Helen) {
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Helen $ct $+ - Deve estar decepcionado! Mas n�o se preocupe, voc� tem potencial. Continue treinando sempre e voc� se tornar� um mestre pok�mon. Eu preciso ir, h� muitos mist�rios em Hoenn dos quais eu ainda n�o descobri! A prop�sito, este lugar � realmente especial! Adeus...
          writeini pkp\cadastros\ $+ %nick $+ .ini Quests Helen No
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) == Bunch) {
          if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == ROCKET3) {
            var %m = $rini(cadastros,%nick,Info,Money), %n = $calc(%m - 25000), %p = $iif(%n < 0,%m,%n)
            if (%p) { msg = [ $+ [ %nick ] ] $ct $+ Voc� foi roubado e perdeu $cc $+ $chr(36) $+ 25,000 $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Info Money %p }
          }
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) == Giovanni) {
          if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == ROCKET3) {
            var %m = $rini(cadastros,%nick,Info,Money), %n = $calc(%m - 35000), %p = $iif(%n < 0,%m,%n)
            if (%p) { msg = [ $+ [ %nick ] ] $ct $+ Voc� foi roubado e perdeu $cc $+ $chr(36) $+ 35,000 $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Info Money %p }
          }
        }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == ROCKET2) { msg $+(=,%nick) $ct $+ Voc� foi expulso do $cc $+ Rocket Hideout $+ $ct $+ . }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == ROCKET3) { msg $+(=,%nick) $ct $+ Voc� foi expulso da $cc $+ Silph Corporation $+ $ct $+ . }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == ROCKET4) { msg $+(=,%nick) $ct $+ Voc� foi expulso da $cc $+ Sprout Tower $+ $ct $+ . }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == ROCKET5) {
          var %m = $rini(cadastros,%nick,Info,Money), %n = $calc(%m - 10000), %p = $iif(%n < 0,%m,%n)
          if (%p) { msg $+(=,%nick) $cc $+ $dados(%nick,Info,Nick) $ct $+ foi roubado e perdeu $cc $+ $chr(36) $+ 10,000 $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Info Money %p }
          msg $+(=,%nick) $ct $+ Voc� foi expulso do $cc $+ Rocket Hideout $+ $ct $+ .
        }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == ROCKET6) {
          var %m = $rini(cadastros,%nick,Info,Money), %n = $calc(%m - 20000), %p = $iif(%n < 0,%m,%n)
          if (%p) { msg $+(=,%nick) $cc $+ $dados(%nick,Info,Nick) $ct $+ foi roubado e perdeu $cc $+ $chr(36) $+ 20,000 $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Info Money %p }
          msg $+(=,%nick) $ct $+ Voc� foi expulso da $cc $+ Radio Tower $+ $ct $+ .
        }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == SILVER) {
          var %item = $iif($dados(%nick,Quests,Rocket6) == 3,Silver,Rainbow) Feather
          msg $+(=,%nick) $chr(160) $cc $+ Silver $ct $+ - Aposta � aposta...
          item.rem %nick %item | msg $+(=,%nick) $cc $+ $dados(%nick,Info,Nick) $ct $+ perdeu o item $cc $+ %item $+ $ct $+ !
          writeini pkp\cadastros\ $+ %nick $+ .ini Quests Silver 1436
        }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == DOJO) { msg $+(=,%nick) $ct $+ Voc� perdeu no desafio ao $cc $+ Fighting Dojo $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Dojo No }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == GIOVANNI) {
          msg $+(=,%nick) $chr(160) $cc $+ Giovanni $ct $+ - Hahahaha, eu sou invenc�vel, eu disse! Vamos, $cc $+ Mewtwo $+ $ct $+ , dominar o mundo! Obede�a ao seu mestre! Hahahaha...
          msg $+(=,%nick) $cc $+ Mewtwo $ct $+ ignora as ordens de $cc $+ Giovanni $+ $ct $+ ... | msg $+(=,%nick) $chr(160) $cc $+ Giovanni $ct $+ - O que? Volte pra sua $cc $+ Master Ball $+ $ct $+ ! | msg $+(=,%nick) $cc $+ Mewtwo $ct $+ destr�i a $cc $+ Master Ball $ct $+ com seu poder ps�quico e desaparece. | msg $+(=,%nick) $chr(160) $cc $+ Giovanni $ct $+ - N�o! Isso � imposs�vel! Por qu�...?! | msg $+(=,%nick) $chr(160) $cc $+ Giovanni $ct $+ - ...
          msg $+(=,%nick) $chr(160) $cc $+ Giovanni $ct $+ - Voc� esteve certo todo esse tempo, $cc $+ %nick $+ $ct $+ ... A forma como eu trato os pok�mon n�o os agrada. Por ser ignorante, perdi o melhor pok�mon do mundo... Obrigado, agora entendo que pok�mon s�o criaturas que merecem aten��o e nosso carinho... Sairei da equipe $cc $+ Rocket $ct $+ e pagarei pelos meus crimes. Adeus! | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Giovanni Ok
        }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == DANCE) {
          msg $+(=,%nick) $chr(160) $cc $+ Nancy $ct $+ - Hahaha, talvez voc� precise de mais ritmo e sincronia!
          if ($dados(%nick,Info,Start) == Hoenn) && (!$dados(%nick,Johto,League)) { writeini pkp\cadastros\ $+ %nick $+ .ini Quests Dancing Ok }
        }
        if ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]),1,58) == REG) { writeini pkp\cadastros\ $+ %nick $+ .ini Quests $gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]),2,58) No }
      }
    }
    else {
      var %l = $gettok(%battle. [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ],2,59), %x = %battle. [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ], %p = $gettok($gettok(%battle. [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ],1,59),%l,58)
      if (%p == Sam_Aqua) { msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ] $chr(160) $cc $+ Sam $ct $+ (AQUA) - Ah, maldito! Vai pagar por isso! }
      elseif (%p == March_Aqua) { msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ] $chr(160) $cc $+ March $ct $+ (AQUA) - N�o acredito! Como voc� p�de estragar tudo?! }
      elseif (%p == Elenna_Magma) { msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ] $chr(160) $cc $+ Elenna $ct $+ (MAGMA) - Queremos expans�o terrestre, pelo bem dos homens e dos pok�mon! Ser� que n�o entende? }
      elseif (%p == Alan_Magma) { msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ] $chr(160) $cc $+ Alan $ct $+ (MAGMA) - Nosso l�der pediu para a equipe cavar o Mt Chimney, mas ficamos chocados com o que encontramos! O que encontramos? N�o vou dizer, � claro! }
      elseif (%p == Elliot_Magma) { msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ] $chr(160) $cc $+ Elliot $ct $+ (MAGMA) - Eu entendo cada palavra que o nosso l�der diz, mas cavar at� um pok�mon lend�rio e acord�-lo e roubar o $cc $+ Meteorite $ct $+ de algu�m j� � ir longe demais... }
      elseif (%p == Ronny_Magma) { msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ] $chr(160) $cc $+ Ronny $ct $+ (MAGMA) - Eu queria ver o Groudon tamb�m, mas eles n�o deixam... Isso me deixa frustrado!! Ah n�o, eu falei do Groudon!! }
      elseif (%p == Tabitha_Magma) {
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == MAGMA2) { msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ] $chr(160) $cc $+ Tabitha $ct $+ (MAGMA) - Sim, Groudon est� dormindo. Nosso l�der Maxie foi at� ele alguns segundos atr�s, Groudon ser� acordado em breve! Hahahahaha! }
        else { msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ] $chr(160) $cc $+ Tabitha $ct $+ (MAGMA) - Vamos, Maxie! Amplifique o poder do $cc $+ Meteorite $+ $ct $+ ! Hahaha... Se pensa que conseguir� derrotar Maxie com isto est� enganado... }
      }
      elseif (%p == Maxie) {
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == MAGMA2) { msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ] $chr(160) $cc $+ Maxie $ct $+ - Groudon... nada p�de acord�-lo do seu sono coberto em magma. Esta $cc $+ Blue Orb $ct $+ � o que � preciso, n�o �? Eu a trouxe, deixe que seu brilho o acorde! E me mostre... mostre todo o seu poder! }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == MAGMA3) { msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ] $chr(160) $cc $+ Maxie $ct $+ - Tudo o que eu quero... � expandir a massa terrestre... }
        else { msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ] $chr(160) $cc $+ Maxie $ct $+ - $nick $+ ! Voc� tem id�ia do que acabou de fazer? Voc� interferiu nos planos da equipe Magma! Mas voc� sofrer� as consequ�ncias! Pensa que esta � a �ltima vez que voc� v� a Equipe Magma? Ainda temos muitos planos, n�o precisamos mais do $cc $+ Meteorite $+ $ct $+ , n�o se tivermos aquela $cc $+ Orb $+ $ct $+ ... Hahaha! }
      }
      elseif (%p == Shelly_Aqua) {
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == AQUA2) { msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ] $chr(160) $cc $+ Shelly $ct $+ (AQUA) - Ent�o voc� insiste em interferir nos planos da Equipe Aqua? J� era um saco quando t�nhamos a Equipe Magma atr�s da gente, agora voc�! }
        else { msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ] $chr(160) $cc $+ Shelly $ct $+ (AQUA) - Hahaha... $nick $+ , voc� � incrivelmente forte. Seria um �timo membro da Equipe Aqua, por que n�o se junta a n�s? Voc� poderia desfrutar do maravilhoso mundo que nosso l�der prometeu a cada um de n�s... }
      }
      elseif (%p == Matt_Aqua) {
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == AQUA3) { msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ] $chr(160) $cc $+ Matt $ct $+ (AQUA) - Hahaha, sinto muito, mas enquanto batalh�vamos, nosso l�der estava fazendo as revis�es finais! Agora est� tudo pronto. }
        else { msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ] $chr(160) $cc $+ Matt $ct $+ (AQUA) - � uma pena que voc� n�o fa�a parte de nosso time... }
      }
      elseif (%p == Archie) { msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ] $chr(160) $cc $+ Archie $ct $+ - Veja, como ele � belo... a forma hibernante do lend�rio Kyogre! Eu esperei tanto tempo por este dia... }
      if ($calc(%l + 1) > $gettok($gettok(%battle. [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ],1,59),0,58)) || (!%x) {
        unset %battle. [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ]
        var %nick = $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ])
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == AQUA1) {
          msg = [ $+ [ %nick ] ] $ct $+ A Equipe $cc $+ Aqua $ct $+ evacuou o museu e voc� recuperou o projeto.
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Stern $ct $+ - Obrigado! N�o sei o que seria de meu futuro se voc� n�o estivesse aqui para me salvar! Muito obrigado mesmo! Receba isto como agradecimento.
          item.add %nick Water Stone | msg = [ $+ [ %nick ] ] $ct $+ Voc� recebeu o item $cc $+ Water Stone $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Stern1 Ok
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == AQUA2) {
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Earl $ct $+ (AQUA) - !!! Temos uma situa��o aqui. Um pequeno grupo de integrantes da Equipe $cc $+ Magma $ct $+ acabou de passar pelo $cc $+ Weather Institute $+ $ct $+ , parecia que iam ao $cc $+ Mt Pyre $+ $ct $+ !
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Shelly $ct $+ (AQUA) - O que?! N�o podemos mais perder tempo aqui, temos que nos apressar para o $cc $+ Mt Pyre $ct $+ tamb�m! Hahaha... Equipe $cc $+ Magma $ct $+ estamos a caminho!
          msg = [ $+ [ %nick ] ] $ct $+ A Equipe $cc $+ Aqua $ct $+ evacuou o Weather Institute. | msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Prof Will $ct $+ - Obrigado por me salvar, %nick $+ . Foi por muito pouco, quase levam meu pequeno Castform! | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Aqua2 Ok
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == AQUA3) {
          msg = [ $+ [ %nick ] ] $ct $+ Agora voc� v� um submarino e os demais membros entraram nele.
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Matt $ct $+ (AQUA) - Agora que obtemos o Submarino Explorer de Stern, poderemos chegar at�... Hahahaha... | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Aqua4 Ok
          msg = [ $+ [ %nick ] ] $ct $+ A Equipe $cc $+ Aqua $ct $+ evacuou $cc $+ Lilycove City $+ $ct $+ .
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == AQUA4) {
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Archie $ct $+ - Com esta $cc $+ Red Orb $+ $ct $+ , eu poderei...
          msg = [ $+ [ %nick ] ] $cc $+ Red Orb $ct $+ come�a a brilhar sozinha.
          msg = [ $+ [ %nick ] ] $ct $+ Pok�mon $cc $+ Kyogre $ct $+ acordou! $cc $+ Kyogre $ct $+ fugiu.
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Archie $ct $+ - O que?! Mas eu n�o fiz nada, por que a $cc $+ Red Orb $+ $ct $+ ... Onde Kyogre foi? Ahn, uma mensagem de um membro do lado de fora...
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Archie $ct $+ - Sim, o que �? Hm, est� chovendo forte? Bom... era o que deveria ter acontecido. � por isso que acordamos Kyogre, para realizar o nosso objetivo de expandir os mares. O que?! Est� chovendo mais do que esper�vamos?! Voc�s est�o em perigo?! N�o pode ser... Isso n�o pode estar acontecendo. Mantenha sua posi��o e monitore a situa��o!
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Archie $ct $+ - Alguma coisa est� errada... $cc $+ Red Orb $ct $+ deveria acordar Kyogre e control�-lo! Mas por qu�? Por que ele desapareceu? Por qu�?
          msg = [ $+ [ %nick ] ] $ct $+ Alguns membros da Equipe $cc $+ Magma $ct $+ aparecem.
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Maxie $ct $+ - Archie, o que voc� fez? Voc� acordou finalmente o Kyogre, certo? O que vai acontecer ao mundo se esta chuva durar toda a eternidade? Toda a terra ser� coberta pelo oceano!
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Archie $ct $+ - O que?! N�o fale assim tamb�m. N�o foram voc�s, Equipe Magma, que enfureceram Groudon? Enquanto eu tivesse esta $cc $+ Red Orb $ct $+ eu deveria poder controlar Kyogre...
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Maxie $ct $+ - N�o temos tempo para discutir a respeito. Vamos para a superf�cie, e veja com seus pr�prios olhos. Veja se este � o mundo que voc� sonhava. %nick $+ , vamos, voc� precisa sair daqui tamb�m! | writeini pkp\cadastros\ $+ %nick $+ .ini Info Locate Silver Bay | msg = [ $+ [ %nick ] ] $ct $+ Voc� voltou a $cc $+ Silver Bay $+ $ct $+ . O clima est� ca�tico.
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Archie $ct $+ - O que aconteceu... Eu cometi um terr�vel erro? Eu... Eu s� queria...
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Maxie $ct $+ - Entendeu agora, Archie? Viu o qu�o desastroso seu sonho se tornou? Temos que nos apressar, temos que fazer algo antes que a situa��o fique completamente fora de controle! %nick $+ , n�o diga nada. Eu sei que n�o tenho o direito de criticar Archie, mas do jeito que as coisas est�o agora, eu me pergunto se n�s humanos seremos capazes de fazer alguma coisa.
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Maxie $ct $+ - N�o podemos esperar e assistir a isto sem fazer nada. A responsabilidade de colocar um fim nisto � minha e de Archie.
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Archie $ct $+ - Aqueles pok�mon... Seu poder � inacredit�vel. Eles conseguiram mudar o equil�brio da natureza... | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Weather Ok
          msg = [ $+ [ %nick ] ] $cc $+ Steve $ct $+ aparece.
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Steve $ct $+ - %nick $+ ! O que est� acontecendo?! Isto � terr�vel... Depois daquela onda de calor, este dil�vio come�ou. Se isto n�o parar, toda Hoenn... n�o, todo o mundo ser� coberto de �gua. Estas nuvens parecem sair de Sootopolis, o que raios est� acontecendo l�? N�o posso ficar aqui, em Sootopolis deve haver respostas. | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Steven3 Ok
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == ROCKET1) {
          msg $+(=,%nick) $chr(160) $cc $+ Track $ct $+ (ROCKET) - Est� certo, ent�o voc� se op�e � Equipe Rocket... Tome cuidado, voc� ter� muitos problemas a partir de agora!
          item.add %nick Moon Stone | msg $+(=,%nick) $ct $+ Voc� recebeu o item $cc $+ Moon Stone $+ $ct $+ ! | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Rocket1 Ok
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == ROCKET2) {
          msg $+(=,%nick) $ct $+ Os membros da equipe $cc $+ Rocket $ct $+ fugiram... Ei, o que � isto?
          msg $+(=,%nick) $ct $+ Voc� encontrou um $cc $+ uniforme $+ $ct $+ ! | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Rocket2 Ok
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == ROCKET3) {
          msg $+(=,%nick) $ct $+ Todos os membros da equipe $cc $+ Rocket $ct $+ evacuaram a $cc $+ Silph Corporation $+ $ct $+ !
          msg $+(=,%nick) $ct $+ Parab�ns, $cc $+ $dados(%nick,Info,Nick) $+ $ct $+ ! Finalmente a cidade est� livre desta amea�a. | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Rocket3 Ok
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == ROCKET4) {
          msg $+(=,%nick) $ct $+ Os membros da equipe $cc $+ Rocket $ct $+ evacuaram a $cc $+ Sprout Tower $+ $ct $+ !
          msg $+(=,%nick) $chr(160) $cc $+ Beck $ct $+ - Obrigado, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , aqueles trapaceiros estavam em busca do segredo desta torre: o porqu� que ela continua em p� mesmo com o mastro central balan�ando... N�o � imposs�vel, estou falando a verdade. Esta torre mant�m-se erguida mesmo nestas condi��es. Bem, como forma de gratific�-lo, fique com esta t�cnica $cc $+ Flash $+ $ct $+ .
          item.add %nick HM05 | msg $+(=,%nick) $ct $+ Parab�ns, voc� ganhou o item $cc $+ HM05 $+ $ct $+ !
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == ROCKET5) {
          msg $+(=,%nick) $chr(160) $cc $+ Sofia $ct $+ (ROCKET) - Nosso esconderijo foi descoberto, mas tudo bem, afinal a experi�ncia da transmiss�o foi um sucesso total. Agora temos planos maiores, hahahaha... Adeus!
          msg $+(=,%nick) $ct $+ Os membros da equipe $cc $+ Rocket $ct $+ evacuaram o $cc $+ Rocket Hideout $+ $ct $+ !
          msg $+(=,%nick) $chr(160) $cc $+ Lance $ct $+ - Obrigado, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ , pela sua ajuda... Tenho que admitir, eles me surpreenderam. N�o sabia que a equipe $cc $+ Rocket $ct $+ tinha um arsenal t�o poderoso. Eu preciso ir agora, receba isto como agradecimento.
          if ($start(%nick)) && ($item(%nick,HM07)) { item.add %nick HM07 | msg $+(=,%nick) $ct $+ Parab�ns, voc� ganhou o item $cc $+ HM07 $+ $ct $+ ! }
          else { item.add %nick Dragon Fang | msg $+(=,%nick) $ct $+ Parab�ns, voc� ganhou o item $cc $+ Dragon Fang $+ $ct $+ ! }
          writeini pkp\cadastros\ $+ %nick $+ .ini Quests Rocket4 Ok | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Rocket5 No
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == ROCKET6) {
          msg $+(=,%nick) $chr(160) $cc $+ Bunch $ct $+ - Falhei... Falhei em suceder o antigo l�der da equipe $cc $+ Rocket $+ $ct $+ ... Por qu�? Por que falhamos?
          msg $+(=,%nick) $ct $+ Os membros da equipe $cc $+ Rocket $ct $+ evacuaram a $cc $+ Radio Tower $+ $ct $+ !
          msg $+(=,%nick) $chr(160) $cc $+ Lance $ct $+ - $cc $+ $dados($nick,Info,Nick) $+ $ct $+ !!! Ent�o voc� foi mais r�pido que eu! Como conseguiu derrot�-los sozinho? N�o, n�o diga. N�o revele seus segredos, pois isso � o que o faz t�o bom treinador. Boa sorte, eu preciso voltar agora. Pegarei o navio no porto. At�!
          writeini pkp\cadastros\ $+ %nick $+ .ini Quests Rocket5 Ok | remini pkp\cadastros\ $+ %nick $+ .ini Quests Lance
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == ROCKET7) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == ROCKET8) {
          msg $+(=,%nick) $chr(160) $cc $+ Bunch $ct $+ - N�o consigo descrever o quanto isto pode ser decepcionante...
          msg $+(=,%nick) $chr(160) $cc $+ Sofia $ct $+ (ROCKET) - N�o temos tempo para isso! Acabamos de detectar a apari��o de um pok�mon colossal! Precisamos captur�-lo!
          msg $+(=,%nick) $chr(160) $cc $+ Bunch $ct $+ - Voc� me convenceu...
          msg $+(=,%nick) $ct $+ Os membros da equipe $cc $+ Rocket $ct $+ fugiram. H� algo reluzente no ch�o.
          var %item = $iif($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == ROCKET7,Silver,Rainbow) Feather
          item.add %nick %item | msg =$nick $ct $+ Parab�ns, $cc $+ $dados(%nick,Info,Nick) $+ $ct $+ ! Voc� encontrou o item $cc $+ %item $+ $ct $+ !
          writeini pkp\cadastros\ $+ %nick $+ .ini Quests Rocket6 $calc($dados(%nick,Quests,Rocket6) + 2)
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == SILVER) {
          msg $+(=,%nick) $chr(160) $cc $+ Silver $ct $+ - Admito que eu estava bastante confiante nesta batalha. Prometo que serei mais modesto da pr�xima vez...
          msg $+(=,%nick) $chr(160) $cc $+ Silver $ct $+ - Fico triste por perder um artefato t�o importante, mas feliz por saber que eu n�o sou o melhor do mundo! At� a pr�xima!
          var %item = $iif($dados(%nick,Quests,Rocket6) == 3,Rainbow,Silver) Feather
          item.add %nick %item | msg $+(=,%nick) $ct $+ Parab�ns, $cc $+ $dados(%nick,Info,Nick) $+ $ct $+ ! Voc� ganhou o item $cc $+ %item $+ $ct $+ !
          writeini pkp\cadastros\ $+ %nick $+ .ini Quests Silver 1437
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == MAY1) {
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ May $ct $+ - Ahh! Que decep��o! Mas n�o estou triste, vou treinar mais e logo n�s batalharemos novamente! Esteja preparado! At� mais, %nick $+ !
          writeini pkp\cadastros\ $+ %nick $+ .ini Quests May2 $iif($v([ [ B. ] $+ [ %ID ] $+ [ .Match ] ]),$calc(($teamleft(%ID,$battle.side(%n)) - $teamleft(%ID,$rvs(%n))) * 100),100)
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == MAY2) {
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ May $ct $+ - Ahh! Que decep��o! Outra derrota! E olha que eu selecionei os meus melhores pok�mon! Mas tudo bem, na pr�xima batalha, voc� ver� meu time completo. Mas, por hora, fique com este Hidden Machine.
          msg = [ $+ [ %nick ] ] $ct $+ Voc� recebeu o item $cc $+ HM02 $+ $ct $+ . | item.add %nick HM02
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ May $ct $+ - Esta t�cnica � $cc $+ Fly $+ $ct $+ . Agora, voc� poder� voar para qualquer cidade j� visitada, mas vai precisar obter a Feather Badge no gin�sio de Fortree City antes. Quando consegui-la, ensine Fly ao seu pok�mon, e digite ' $+ $cc $+ .Fly $+ $ct $+ '. At� mais, $nick $+ !
          writeini pkp\cadastros\ $+ %nick $+ .ini Quests May3 $iif($v([ [ B. ] $+ [ %ID ] $+ [ .Match ] ]),$calc(($teamleft(%ID,$battle.side(%n)) - $teamleft(%ID,$rvs(%n))) * 100),100)
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == MAGMA1) {
          msg = [ $+ [ %nick ] ] $ct $+ A Equipe $cc $+ Magma $ct $+ evacuou o Mt Chimney e voc� recuperou o $cc $+ Meteorite $+ $ct $+ .
          item.add %nick Meteorite
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Archie $ct $+ - Com sua ajuda, n�s acabamos com o plano destrutivo da Equipe Magma. Mas voc�. De que lado est�? Ah, isto n�o importa. Ainda vamos perseguir a Equipe Magma e vigi�-la. $nick $+ , talvez nos encontremos de novo!
          msg = [ $+ [ %nick ] ] $ct $+ A Equipe $cc $+ Aqua $ct $+ evacuou o Mt Chimney. | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Magma1 Ok
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == MAGMA2) {
          msg = [ $+ [ %nick ] ] $cc $+ Maxie $ct $+ usa a $cc $+ Blue Orb $+ $ct $+ . Um forte brilho � lan�ado sobre o ambiente.
          msg = [ $+ [ %nick ] ] $ct $+ Pok�mon $cc $+ Groudon $ct $+ acordou! $cc $+ Groudon $ct $+ fugiu!
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Maxie $ct $+ - Groudon?! O que est� errado? N�o era a $cc $+ Blue Orb $ct $+ a chave? Deve haver alguma raz�o para o desaparecimento de Groudon... era isso que voc� estava tentando me dizer, n�o era? E acha que eu n�o sei! Estou indo atr�s de Groudon, � agora ent�o que partimos!
          msg = [ $+ [ %nick ] ] $ct $+ A Equipe $cc $+ Magma $ct $+ evacuou o $cc $+ Magma Hideout $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Magma2 Ok
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == MAGMA3) {
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Maxie $ct $+ - Falhamos em fazer o Mt Chimney entrar em erup��o...
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Maxie $ct $+ - Falhamos em controlar o Groudon ap�s t�-lo acordado...
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Maxie $ct $+ - Nosso objetivo de expandir a massa terrestre est� errado? Se... Se n�s, Equipe Magma, estamos errados, ent�o o objetivo de expans�o mar�tima da Equipe Aqua deve estar errado tamb�m?
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Maxie $ct $+ - Tudo bem. Vamos desistir do combust�vel, tem coisas mais importantes que preciso examinar...
          msg = [ $+ [ %nick ] ] $ct $+ A Equipe $cc $+ Magma $ct $+ evacuou o $cc $+ Space Center $+ $ct $+ . | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Magma3 Ok
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == WALLY) {
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Wally $ct $+ - �, voc� est� pronto para a liga pok�mon! Mas lembre-se que eles ser�o advers�rios muito experientes em batalhas, ent�o sua estrat�gia precisa ser boa realmente se quiser venc�-los!
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Wally $ct $+ - Vou ficar aqui em Evergrande City treinando com meus pok�mon. Periodicamente, vamos batalhar, ok? At� logo, $nick $+ ! Ah, e muita sorte na liga! Nossa, eu ia me esquecendo...
          msg = [ $+ [ %nick ] ] $ct $+ Voc� recebeu o item $cc $+ TM07 $+ $ct $+ ! | item.add %nick TM07 | msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Wally $ct $+ - TM07 � Hail! Voc� poder� criar chuvas de granizo durante a batalha, e ela vai atrapalhar seu advers�rio! Pode ter certeza! At� mais!
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == HELEN) {
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Helen $ct $+ - Estou impressionada com sua habilidade. Para derrotar a minha estrat�gia, precisa ser muito inteligente! Parab�ns, foi uma �tima batalha. | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Helen Ok
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Helen $ct $+ - Esta $cc $+ Lum Berry $ct $+ � para voc�. Deixe seu pok�mon segurando este item, e quando ele ficar com algum status diferenciado, automaticamente recuperar�. Muito �til, n�o? Eu preciso seguir em frente em minha busca por mist�rios. Nos vemos por ai, $nick $+ !
          item.add %nick Lum Berry | msg = [ $+ [ %nick ] ] $cc $+ Helen $ct $+ saiu andando, e em seguida gritou:
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Helen $ct $+ - AH! ESTE LUGAR � ESPECIAL! ADEUS!
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == GARY) {
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Prof Oak $ct $+ - Nossa, impressionante! Sua primeira batalha, e logo sua primeira vit�ria! Parece que voc� leva jeito, hein? Fique com estas $cc $+ Poke  Ball $+ $ct $+ , elas servem para capturar novos pok�mon. Se n�o souber como faz�-lo, digite ' $+ $cc $+ .cidade $+ $ct $+ ' e procure a �rea de pok�mon selvagem. Para usar sua Poke  Ball, digite ' $+ $cc $+ .Item USE Poke  Ball $+ $ct $+ ' durante a batalha.
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ Prof Oak $ct $+ - Boa sorte, $cc $+ %nick $+ $ct $+ ! | var %x = 0 | while (%x < 5) { inc %x | item.add %nick Poke  Ball }
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == GARY1) { msg $+(=,%nick) $chr(160) $cc $+ Gary $ct $+ - ... | msg $+(=,%nick) $chr(160) $cc $+ Gary $ct $+ - Eu peguei leve com voc�, n�o se engane. Nos veremos depois! | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Gary1 Ok }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == GARY2) { msg $+(=,%nick) $chr(160) $cc $+ Gary $ct $+ - ... | msg $+(=,%nick) $chr(160) $cc $+ Gary $ct $+ - ... Desta vez eu admito... Estava distra�do. Preciso ir r�pido e capturar mais pok�mon. Hahaha, nos vemos! | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Gary2 Ok }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == GARY3) { msg $+(=,%nick) $chr(160) $cc $+ Gary $ct $+ - ... | msg $+(=,%nick) $chr(160) $cc $+ Gary $ct $+ - Achou que eu realmente iria mostrar meu time oficial para voc�? Preciso ir r�pido e derrotar a liga pok�mon! Hahaha, nos vemos! | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Gary3 Ok }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == MAY) {
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ May $ct $+ - Devo confessar que seu desempenho foi muito bom. Bem, agora preciso ensin�-lo a capturar pok�mon. Primeiro, pegue estas $cc $+ Poke  Ball $+ $ct $+ .
          msg = [ $+ [ %nick ] ] $chr(160) $cc $+ May $ct $+ - Para batalhar com pok�mon selvagens e tentar captur�-los, digite ' $+ $cc $+ .cidade $+ $ct $+ ' e veja como iniciar uma batalha com pok�mon $cc $+ selvagem $+ $ct $+ . Durante essa batalha, quando achar que deve usar sua Poke  Ball, digite ' $+ $cc $+ .Item USE Poke  Ball $+ $ct $+ '. Boa sorte! Nos veremos depois! | var %x = 0 | while (%x < 5) { inc %x | item.add %nick Poke  Ball }
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == BRENDAN) { msg $+(=,%nick) $chr(160) $cc $+ Brendan $ct $+ - ... Decepcionante! Mas ainda vou venc�-lo, $cc $+ $dados($nick,Info,Nick) $+ $ct $+ ! Hahaha, nos vemos por ai! | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Brendan1 Ok }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == FUJI) {
          msg $+(=,%nick) $chr(160) $cc $+ $gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $rvs(%n) ] ]),1,95) $ct $+ (ROCKET) - ... Idiota! Mais uma vez atrapalhando nossos planos! Entenda uma coisa: pok�mon s�o apenas ferramentas para a Equipe Rocket! E este velho in�til perde seu tempo ajudando pok�mon...
          msg $+(=,%nick) $chr(160) $cc $+ $gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $rvs(%n) ] ]),1,95) $ct $+ (ROCKET) - Obrigado por n�o colaborar, senhor Fuji. � mesmo uma pessoa de sorte...
          msg $+(=,%nick) $ct $+ Os membros da Equipe Rocket fugiram. Voc� salvou $cc $+ Mr Fuji $ct $+ daqueles ladr�es.
          msg $+(=,%nick) $chr(160) $cc $+ Fuji $ct $+ - Obrigado, $cc $+ %nick $+ $ct $+ ... Sua ajuda veio na hora certa. Aqueles encrenqueiros nunca v�o entender a rela��o entre treinadores e pok�mon. Vejo que voc� entende perfeitamente, seus pok�mon mostram isso no olhar. Por favor, aceite isto.
          item.add %nick Pok� Flute | msg $+(=,%nick) $ct $+ Parab�ns, $cc $+ %nick $ct $+ ganhou o item $cc $+ Pok� Flute $+ $ct $+ ! | msg $+(=,%nick) $chr(160) $cc $+ Fuji $ct $+ - O toque desta flauta � t�o suave que acorda qualquer pok�mon de uma soneca. Eu a esculpi pensando no bem-estar dos pok�mon!
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == DOJO) { writeini pkp\cadastros\ $+ %nick $+ .ini Quests Dojo Ok }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == GIOVANNI) {
          msg $+(=,%nick) $chr(160) $cc $+ Giovanni $ct $+ - Vamos, $cc $+ Mewtwo $+ $ct $+ , levante-se! Obede�a ao seu mestre! Voc� ainda tem energias para derrot�-lo!
          msg $+(=,%nick) $cc $+ Mewtwo $ct $+ ignora as ordens de $cc $+ Giovanni $+ $ct $+ ... | msg $+(=,%nick) $chr(160) $cc $+ Giovanni $ct $+ - O que? Volte pra sua $cc $+ Master Ball $+ $ct $+ ! | msg $+(=,%nick) $cc $+ Mewtwo $ct $+ destr�i a $cc $+ Master Ball $ct $+ com seu poder ps�quico e desaparece. | msg $+(=,%nick) $chr(160) $cc $+ Giovanni $ct $+ - N�o! Isso � imposs�vel! Por qu�...?! | msg $+(=,%nick) $chr(160) $cc $+ Giovanni $ct $+ - ...
          msg $+(=,%nick) $chr(160) $cc $+ Giovanni $ct $+ - Voc� esteve certo todo esse tempo, $cc $+ %nick $+ $ct $+ ... A forma como eu trato os pok�mon n�o os agrada. Por ser ignorante, perdi o melhor pok�mon do mundo... Obrigado, agora entendo que pok�mon s�o criaturas que merecem aten��o e nosso carinho... Sairei da equipe $cc $+ Rocket $ct $+ e pagarei pelos meus crimes. Adeus! | writeini pkp\cadastros\ $+ %nick $+ .ini Quests Giovanni Ok
        }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]) == DANCE) {
          msg $+(=,%nick) $chr(160) $cc $+ Nancy $ct $+ - Hahaha, foi muito divertido mesmo! Adorei!
          if ($dados(%nick,Info,Start) == Hoenn) && (!$dados(%nick,Johto,League)) { writeini pkp\cadastros\ $+ %nick $+ .ini Quests Dancing Ok }
          else {
            if ($dados(%nick,Info,Start) == Johto) && (!$item(%nick,HM03).qnt) {
              msg $+(=,%nick) $chr(160) $cc $+ Nancy $ct $+ - Como pr�mio pela nobre vit�ria, poder� ficar com este HM.
              msg $+(=,%nick) $ct $+ Parab�ns, voc� recebeu o $cc $+ HM03 $+ $ct $+ ! | item.add %nick HM03 | msg $+(=,%nick) $chr(160) $cc $+ Nancy $ct $+ - Com este item, voc� poder� ensinar aos seus pok�mon a t�cnica $cc $+ Surf $ct $+ e poder� finalmente atravessar rios e ba�as!
            }
          }
        }
        elseif ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]),1,58) == REG) { writeini pkp\cadastros\ $+ %nick $+ .ini Quests $gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Quest ] ]),2,58) Ok }
      }
      else { set %confirm. [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ] NXQ | msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ] $ct $+ Para continuar, digite $cc $+ .sim $+ $ct $+ . Se quiser desistir, $cc $+ .nao $+ $ct $+ . }
    }
  }
  if ($v([ [ B. ] $+ [ %ID ] $+ [ .Gym ] ]) == ON) {
    if ($npc($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]))) {
      unset %gym. [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $rvs(%n) ] ]) ] ]
      if ($checknick($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $rvs(%n) ] ])) == Ok!) {
        var %s = $rini(cadastros,$v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $rvs(%n) ] ]),$dados($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $rvs(%n) ] ]),Info,Region),Score) | if (%s) && (%s >= 50) { writeini pkp\cadastros\ $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $rvs(%n) ] ]) $+ .ini $dados($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $rvs(%n) ] ]),Info,Region) Score $calc(%s - 50) }
        msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $rvs(%n) ] ]) ] ] $ct $+ Voc� perdeu o desafio ao gin�sio. Para tentar novamente, utilize o comando ' $+ $cc $+ .Cidade $+ $ct $+ '.
      }
    }
    else {
      var %g = %gym. [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ], %l = $gettok(%g,1,58), %gym = $readini(pkp\gym.ini,$iif($start($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ])),Normal,Advanced),%l), %o = $gettok(%gym,4,172)
      var %score = $calc(( ($battle.total(%ID,$rvs(%n)) - $battle.left(%ID,$rvs(%n))) - ($battle.total(%ID,$battle.side(%n)) - $battle.left(%ID,$battle.side(%n))) ) * 100)
      if ($gettok(%g,2,58) < $gettok(%o,0,58)) {
        set %gym. [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ] $gettok(%g,1-2,58) $+ : $+ $calc($gettok(%g,3,58) + %score)
        set %confirm. [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ] NXT | msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ] $ct $+ Para continuar seu desafio no gin�sio, digite ' $+ $cc $+ .sim $+ $ct $+ '. Se quiser desistir, ' $+ $cc $+ .nao $+ $ct $+ '.
      }
      else {
        var %badge = $gettok(%gym,2,172), %tm = $gettok(%gym,3,172), %reg = $dados($v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]),Info,Region)
        msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ] $ct $+ Parab�ns, $cc $+ $nick $+ $ct $+ ! Voc� recebeu a $cc $+ %badge $+ $ct $+ !
        if ($rini(cadastros,$v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]),%reg,Badges)) { writeini pkp\cadastros\ $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) $+ .ini %reg Badges $rini(cadastros,$v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]),%reg,Badges) $+ : $+ %badge }
        else { writeini pkp\cadastros\ $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) $+ .ini %reg Badges %badge }
        msg = [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ] $ct $+ Voc� tamb�m recebeu o item $cc $+ %tm $+ $ct $+ !
        item.add $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) %tm | writeini pkp\cadastros\ $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) $+ .ini %reg Score $calc($rini(cadastros,$v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]),%reg,Score) + $gettok(%g,3,58) + %score)
        unset %gym. [ $+ [ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]) ] ]
      }
    }
  }
  if ($v([ [ B. ] $+ [ %ID ] $+ [ .League ] ]) == ON) {
    var %n1 = $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %n ] ]), %n2 = $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ $rvs(%n) ] ])
    if ($npc(%n1)) {
      unset %league. [ $+ [ %n2 ] ]
      if (%active.league == %n2) && (%active.league) { var %control = $readini(pkp\status.ini,Active,Control) | if (%confirm. [ $+ [ %control ] ]) { unset %confirm. [ $+ [ %control ] ] | if ($checknick(%control) == Ok!) { msg $+(=,%control) $ct $+ O desafio de $cc $+ %active.league $ct $+ foi cancelado. } } | unset %active.league }
      if ($checknick(%n2) == Ok!) { msg = [ $+ [ %n2 ] ] $ct $+ Voc� perdeu o desafio � liga pok�mon de $cc $+ $dados(%n2,Info,Region) $+ $ct $+ . Para tentar novamente, utilize o comando ' $+ $cc $+ .Cidade $+ $ct $+ '. }
    }
    else {
      var %l = %league. [ $+ [ %n1 ] ], %b = $gettok(%l,1,59), %s = $gettok(%l,2,59), %nadv = $gettok(%l,3,59), %bteam = $gettok(%l,4,59), %region = $dados(%n1,Info,Region)
      var %score = $calc(( ($battle.total(%ID,$rvs(%n)) - $battle.left(%ID,$rvs(%n))) - ($battle.total(%ID,$battle.side(%n)) - $battle.left(%ID,$battle.side(%n))) ) * 100)
      set %league. [ $+ [ %n1 ] ] $calc(%b + 1) $+ ; $+ $calc(%s + %score) $+ ; $+ %nadv $+ $iif(%bteam,; $+ %bteam)
      if ($gettok(%nadv,$calc(%b + 1),58)) {
        var %nadv = $gettok(%nadv,$calc(%b + 1),58)
        if ($calc(%b + 1) == $gettok(%nadv,0,58)) && ($start(%n1)) && (!$dados(%n1,Quests,League)) { var %nadv = ??? }
        else { if (%nadv isnum) { var %t = %nadv } | else { var %t = $rini(npc,npc,ID,%nadv) } | var %nadv = $rini(npc,$int($calc(%t / 100)) $+ 00,%t,Name) }
        set %confirm. [ $+ [ %n1 ] ] LG2 | msg = [ $+ [ %n1 ] ] $cc $+ %n1 $+ $ct $+ , sua pr�xima batalha ser� com $cc $+ %nadv $+ $ct $+ . Para continuar, digite $cc $+ .sim $+ $ct $+ . Se quiser desistir, $cc $+ .nao $+ $ct $+ .
      }
      else {
        if (%bteam) {
          var %b = $rini(cadastros,%n1,%region,Battle)
          while ($gettok(%bteam,1,58)) { var %x = $gettok(%bteam,1,58), %bteam = $deltok(%bteam,1,58) | if (!$findtok(%b,%x,0,58)) { var %b = $iif(%b,%b $+ : $+ %x,%x) } }
          writeini pkp\cadastros\ $+ %n1 $+ .ini %region Battle %b
        }
        var %x = 0
        if ($start(%n1)) { if ($rini(cadastros,%n1,Quests,League)) { var %x = 1 } }
        else { if ($rini(cadastros,%n1,%region,League)) { var %x = 1 } }
        if (%active.league == %n1) && (%active.league) { var %control = $readini(pkp\status.ini,Active,Control) | if (%confirm. [ $+ [ %control ] ]) { unset %confirm. [ $+ [ %control ] ] | if ($checknick(%control) == Ok!) { msg $+(=,%control) $ct $+ O desafio de $cc $+ %active.league $ct $+ foi cancelado. } } | unset %active.league }
        if (%x) { msg = [ $+ [ %n1 ] ] $ct $+ Parab�ns, $cc $+ %n1 $+ $ct $+ ! Voc� derrotou a liga pok�mon de $cc $+ %region $+ $ct $+ ! }
        else {
          sendamsg PkP $ct $+ Parab�ns, $cc $+ %n1 $+ $ct $+ ! Voc� entrou para o $cc $+ Hall of Fame $ct $+ de $cc $+ %region $+ $ct $+ !
          if ($start(%n1)) { writeini pkp\cadastros\ $+ %n1 $+ .ini Quests League Ok: $+ $rini(cadastros,%n1,Info,Online) }
          else { writeini pkp\cadastros\ $+ %n1 $+ .ini %region League $rini(cadastros,%n1,Info,Online) }
          if (%region == Johto) { writeini pkp\cadastros\ $+ %n1 $+ .ini Johto Champ ON }
          if ($start(%n1)) {
            if (%region == Hoenn) {
              msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ May $ct $+ - %n1 $+ , tem uma coisa que eu preciso dizer sobre o campe... O que?! J� acabou?!
              msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ Birch $ct $+ - Viu, May? Eu disse que n�o havia com o que se preocupar! Parab�ns %n1 $+ ! Venha sempre me visitar em Littleroot, para eu dar uma olhada em sua PokeDex!
              msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ May $ct $+ - Que boa not�cia! Nossa! %n1 eu sabia que voc� tinha talento desde o princ�pio! Eu separei meus melhores Technical Machines para present�-lo, %n1 $+ ! Parab�ns!
              item.add %n1 TM13 | item.add %n1 TM24 | item.add %n1 TM35
            }
            elseif (%region == Kanto) {
              msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ Gary $ct $+ - N�o entendo, eu nunca cometi erros treinando meus pok�mon... Droga, agora voc� � o novo campe�o da liga pok�mon!
              msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ Oak $ct $+ - %n1 $+ !
              msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ Oak $ct $+ - Ent�o voc� venceu! Sinceramente, parab�ns! Voc� � o novo campe�o da liga pok�mon! Voc� trabalhou bastante na Pokedex desde que pegou seu primeiro pok�mon no meu laborat�rio. Voc� tem um dom!
              msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ Oak $ct $+ - $cc $+ Gary $+ $ct $+ ... Estou desapontado com voc�. Eu vim quando soube de sua vit�ria na Elite Four. Mas, ao chegar, voc� j� havia perdido! Voc� entendeu por que perdeu? Voc� esqueceu de tratar seu pok�mon com amor e confian�a. Sem isso, voc� nunca voltar� a ser um campe�o!
              msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ Oak $ct $+ - $cc $+ %n1 $+ $ct $+ ... Voc� entendeu que sua vit�ria n�o foi resultante apenas do seu esfor�o, mas tamb�m de seus pok�mon. Este � o meu presente, Technical Machines, para motiv�-lo a continuar seu trabalho!
              item.add %n1 TM13 | item.add %n1 TM24 | item.add %n1 TM35
            }
          }
          else {
            var %start = $dados(%n1,Info,Start)
            if (%region == Hoenn) {
              msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ May $ct $+ - Ahhhhhhh, %n1 $+ ! Perdi a batalha?! Droga, eu vim o mais r�pido que pude...
              var %x = $calc($iif($dados(%n1,Quests,May1) == Ok,1,0) + $iif($dados(%n1,Quests,May2) == Ok,1,0) + $iif($dados(%n1,Quests,May3) == Ok,1,0))
              var %y = $calc($iif($dados(%n1,Quests,Gary1) == Ok,1,0) + $iif($dados(%n1,Quests,Gary2) == Ok,1,0) + $iif($dados(%n1,Quests,Gary3) == Ok,1,0))
              if ($calc(%y + %x) > 4) {
                msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ Gary $ct $+ - %n1 $+ !
                msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ Gary $ct $+ - N�o pude acreditar no que tinha ouvido! Peguei o primeiro navio para $cc $+ %region $ct $+ quando soube que j� tinha pego todas as ins�gneas e estava a caminho da liga pok�mon! Admito que voc� me surpreendeu bastante. Sinceramente, nunca imaginei que chegaria t�o longe!
                msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ Gary $ct $+ - %n1 $+ , gra�as ao seu trabalho duro, escondi meu $cc $+ presente $ct $+ em $cc $+ Celadon City $+ $ct $+ . Hahaha, ser� que consegue encontr�-lo?
                writeini pkp\cadastros\ $+ %n1 $+ .ini Quests Gift No
              }
              if (%x) {
                if (%x == 3) { var %prize = MT $+ $base($rand(1,30),10,10,2) } | elseif (%x == 2) { var %prize = MT18 } | else { var %prize = MT29 }
                msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ May $ct $+ - Eu estou muito feliz por voc�, %n1 $+ ! � sem d�vida um momento para ser celebrado! Pode ficar com $iif(%x > 1,estes,este) $cc $+ Move Tutor $+ $ct $+ $iif(%x > 1,(s)!,!)
                item.add %n1 %prize $+ : $+ %x
              }
              else { msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ May $ct $+ - Hahaha, que incr�vel! Voc� ganhou a liga! N�o consigo acreditar... Parab�ns! }
            }
            elseif (%region == Kanto) {
              msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ Brendan $ct $+ - %n1 $+ !
              msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ Brendan $ct $+ - Sabia que meu pai estava certo. Seu desempenho � realmente formid�vel, seus pok�mon conseguem trabalhar juntos como uma equipe! Esta � mais uma vit�ria!
              var %x = $calc($dados(%n1,Quests,May2) + $dados(%n1,Quests,May3))
              var %y = $calc($iif($dados(%n1,Quests,Brendan1) == Ok,1,0) + $iif($dados(%n1,Quests,Brendan2) == Ok,1,0) + $iif($dados(%n1,Quests,Brendan3) == Ok,1,0))
              if (%x > 600) {
                msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ May $ct $+ - %n1 $+ ! Imagino que n�o cheguei a tempo de ver a batalha... Que mania de chegar atrasada essa minha!
                msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ May $ct $+ - %n1 $+ , sabe... voc� � muito talentoso, sei que n�o � novidade ouvir isso! Bem, antes que eu me esque�a, $cc $+ Steven $ct $+ mandou um recado para voc�. Disse que havia deixado um presente na casa dele. Hahaha, o que ser�? Est� curioso tamb�m?
                writeini pkp\cadastros\ $+ %n1 $+ .ini Quests Gift No
              }
              if (%y) {
                if (%y == 3) { var %prize = MT $+ $base($rand(1,30),10,10,2) } | elseif (%y == 2) { var %prize = MT18 } | else { var %prize = MT29 }
                msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ Brendan $ct $+ - Sabia que conseguiria! Apesar de ter falhado em minha tentativa, vou treinar bastante e ficar t�o bom quanto voc� um dia... � sem d�vida um momento para ser celebrado! Pode ficar com $iif(%y > 1,estes,este) $cc $+ Move Tutor $+ $ct $+ $iif(%y > 1,(s)!,!)
                item.add %n1 %prize $+ : $+ %y
              }
              msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ Brendan $ct $+ - Ahhh, n�o posso esquecer disto! Bem, %n1 $+ , voc� n�o deve saber da exist�ncia de $cc $+ Unknown Dungeon $+ $ct $+ ... Encontrei essa caverna nas proximidades de $cc $+ Cerulean $+ $ct $+ , j� marquei o ponto em seu mapa.
              writeini pkp\cadastros\ $+ %n1 $+ .ini Quests UD Ok
            }
            elseif (%region == Johto) {
              if (%start == Hoenn) {
                remini pkp\cadastros\ $+ %n1 $+ .ini Quests Dancing
                msg $+(=,%n1) $ct $+ De repente, voc� percebe a presen�a de $cc $+ Brendan $+ $ct $+ .
                msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ Brendan $ct $+ - Que batalha! Que batalha! Voc� estava t�o concentrado nesta batalha que nem percebeu a minha presen�a! N�o duvidei de que voc� conseguiria derrotar a liga, depois de ver seu �ltimo desempenho percebi que estava preparado. Huh? Meu celular est� tocando, um momento...
                msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ Brendan $ct $+ - $cc $+ %n1 $+ $ct $+ , acabo de receber uma mensagem do $cc $+ Prof Elm $+ $ct $+ , em $cc $+ New Bark Town $+ $ct $+ . Se voc� ainda n�o o conhece, � bom dar uma passada na cidade para falar com ele. Ele n�o especificou o assunto, mas disse que precisava falar com voc�.
              }
              else {
                msg $+(=,%n1) $ct $+ De repente, voc� percebe a presen�a de $cc $+ May $+ $ct $+ .
                msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ May $ct $+ - Bravo! Bravo! Voc� estava t�o concentrado nesta batalha que nem percebeu a minha presen�a! Hahaha, dessa vez eu n�o me atrasei e finalmente pude assistir a batalha por inteiro! Foi incr�vel! Huh? Acho que meu celular est� tocando, espere ai...
                msg = [ $+ [ %n1 ] ] $chr(160) $cc $+ May $ct $+ - $cc $+ %n1 $+ $ct $+ , acabo de receber uma mensagem do $cc $+ Prof Elm $+ $ct $+ , em $cc $+ New Bark Town $+ $ct $+ . Se voc� ainda n�o o conhece, que falta de educa��o, deveria t�-lo visitado! Hahaha... Ele n�o especificou o assunto, mas disse que precisava falar com voc�. Nossa, at� eu fiquei curiosa! Imagine: eu, curiosa... Imposs�vel...
              }
            }
          }
        }
        var %x = 0 | while (%x < 6) { inc %x | var %y = $rini(cadastros,%n1,Team,%x) | if (%y) && (%y != Egg) { ribbon.add %n1 %y Hall of Fame ( $+ %region $+ ) } }
        var %a = $rini(cadastros,%n1,Info,Access), %b = 0
        if (%a < 4) {
          var %score = $gettok(%league. [ $+ [ %n1 ] ],2,59) | if (%region == Johto) { var %score = $int($calc(%score * 1.5)) }
          var %finalscore = $int($calc($gpoints(%n1) / 10 ^ 3 + $dados(%n1,Score) + %score + (6 - $totalpokes(%n1)) * 1000))
          var %highscore = $readini(pkp\status.ini,Active,HighScore), %highscore = $iif(%highscore,%highscore,0)
          if (%finalscore > %highscore) { var %b = 4 } | elseif (%finalscore > $calc(%highscore * 0.8)) { var %b = 3 } | else { var %b = 2 }
        }
        if (%b > %a) {
          writeini pkp\cadastros\ $+ %n1 $+ .ini Info Access %b | var %c = $calc(%b - %a)
          if (%b == 4) {
            sendamsg PkP $ct $+ Parab�ns, $cc $+ %n1 $+ $ct $+ ! Voc� foi promovido para ' $+ $cc $+ $dados(%n1,Info,Access) $+ $ct $+ '!
            var %master = $readini(pkp\status.ini,Active,Mestre)
            if (%master) {
              writeini pkp\cadastros\ $+ %master $+ .ini Info Access $calc($rini(cadastros,%master,Info,Access) - 1)
              if ($checknick(%master) == Ok!) { msg $+(=,%master) $ct $+ Voc� voltou a ser ' $+ $cc $+ $dados(%master,Info,Access) $+ $ct $+ '. Segundo o regulamento, o novo mestre � $cc $+ %n1 $+ $ct $+ . }
              else { writeini pkp\cadastros\ $+ %master $+ .ini Info Notice $ct $+ Voc� voltou a ser ' $+ $cc $+ $dados(%master,Info,Access) $+ $ct $+ '. Segundo o regulamento, o novo mestre � $cc $+ %n1 $+ $ct $+ . }
            }
            writeini pkp\status.ini Active HighScore %finalscore | writeini pkp\status.ini Active Mestre %n1
          }
          else { msg = [ $+ [ %n1 ] ] $ct $+ Voc� foi promovido para ' $+ $cc $+ $dados(%n1,Info,Access) $+ $ct $+ '! }
          if (%c == 3) { item.add %n1 Master Ball | item.add %n1 TM26 | item.add %n1 TM29 | item.add %n1 TM36 | msg = [ $+ [ %n1 ] ] $ct $+ Voc� recebeu uma $cc $+ Master Ball $+ $ct $+ ! Voc� ganhou tamb�m $cc $+ TM26 $+ $ct $+ , $cc $+ TM29 $ct $+ e $cc $+ TM36 $+ $ct $+ ! }
          elseif (%c == 2) { item.add %n1 Ultra Ball | item.add %n1 Ultra Ball | item.add %n1 Ultra Ball | item.add %n1 Ultra Ball | item.add %n1 Ultra Ball | item.add %n1 TM15 | msg = [ $+ [ %n1 ] ] $ct $+ Voc� recebeu cinco $cc $+ Ultra Balls $+ $ct $+ ! Voc� ganhou tamb�m $cc $+ TM15 $+ $ct $+ ! }
          else { item.add %n1 Great Ball | item.add %n1 Great Ball | item.add %n1 Great Ball | item.add %n1 Great Ball | item.add %n1 Great Ball | item.add %n1 TM15 | msg = [ $+ [ %n1 ] ] $ct $+ Voc� recebeu cinco $cc $+ Great Balls $+ $ct $+ ! Voc� ganhou tamb�m $cc $+ TM15 $+ $ct $+ ! }
        }
        unset %league. [ $+ [ %n1 ] ]
      }
    }
  }

  uset B. $+ %ID $+ *

}


alias battle.order {
  var %ID = $1
  var %w = 1 | while ($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %w ] ])) {
    if ($prop == s) && (!$v([ [ B. ] $+ [ %ID ] $+ [ .Switch. ] $+ [ %w ] ])) { inc %w }
    elseif ($prop == c) && ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %w ] ]),1,59) != Switch) { inc %w }
    else {
      var %m1 = $v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %w ] ])
      if ($gettok(%m1,1,59) == Switch) { var %priority = 5 }
      elseif (%m1 == Helping Hand) { var %priority = 4 }
      elseif (%m1 == Magic Coat) || (%m1 == Snatch) { var %priority = 3 }
      elseif (%m1 == Protect) || (%m1 == Detect) || (%m1 == Endure) || (%m1 == Follow Me) { var %priority = 2 }
      elseif (%m1 == Quick Attack) || (%m1 == Mach Punch) || (%m1 == Extremespeed) || (%m1 == Fake Out) { var %priority = 1 }
      elseif (%m1 == Vital Throw) { var %priority = -1 }
      elseif (%m1 == Focus Punch) || (%m1 == Revenge) { var %priority = -2 }
      elseif (%m1 == Counter) || (%m1 == Mirror Coat) { var %priority = -3 }
      elseif (%m1 == Whirlwind) || (%m1 == Roar) { var %priority = -4 }
      else { var %priority = 0 }
      var %spd = $istat(%ID,%w,SPD)
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %w ] ]) == Quick Claw) { var %x = $rand(1,100) | if (%x <= 24) { var %spd = $calc(%spd * 1000) } }
      if (%r) { var %r = %r $+ ; $+ %priority $+ : $+ $base(%spd,10,10,10) $+ : $+ %w }
      else { var %r = %priority $+ : $+ $base(%spd,10,10,10) $+ : $+ %w }
      inc %w
    }
  }
  var %r = $sorttok(%r,59,r)
  while (%r) {
    var %w = 1, %p = $wildtok(%r,$gettok($gettok(%r,%w,59),1-2,58) $+ :*,0,59)
    if (%p > 1) { var %p = $wildtok(%r,$gettok($gettok(%r,%w,59),1-2,58) $+ :*,$rand(1,%p),59), %w = $findtok(%r,%p,1,59) }
    if (%n) { var %n = %n $+ : $+ $gettok($gettok(%r,%w,59),3,58) }
    else { var %n = $gettok($gettok(%r,%w,59),3,58) }
    var %r = $deltok(%r,%w,59)
  }
  return %n
}

alias battle.show {
  var %ID = $1
  if ($v(B. $+ %ID $+ .2vs2)) {
    if ($battle.team(%ID,1)) { var %pt1 = $cc $+ $v(B. $+ %ID $+ .Player.1) $+ $ct $+ ( $+ $cc $+ $v(B. $+ %ID $+ .Poke.1) $+ $sex($v(B. $+ %ID $+ .Gender.1)) $+ $iif($v(B. $+ %ID $+ .Shiny.1) == ON,4+,$+) $+ $ct $+ / $+ $cc $+ $v(B. $+ %ID $+ .Lvl.1) $+ $ct $+ ) e $cc $+ $v(B. $+ %ID $+ .Player.3) $+ $ct $+ ( $+ $cc $+ $v(B. $+ %ID $+ .Poke.3) $+ $sex($v(B. $+ %ID $+ .Gender.3)) $+ $iif($v(B. $+ %ID $+ .Shiny.3) == ON,4+,$+) $+ $ct $+ / $+ $cc $+ $v(B. $+ %ID $+ .Lvl.3) $+ $ct $+ ) }
    else {
      if ($v(B. $+ %ID $+ .Poke.3)) { var %pt1 = $cc $+ $v(B. $+ %ID $+ .Player.1) $+ $ct $+ ( $+ $cc $+ $v(B. $+ %ID $+ .Poke.1) $+ $sex($v(B. $+ %ID $+ .Gender.1)) $+ $iif($v(B. $+ %ID $+ .Shiny.1) == ON,4+,$+) $+ $ct $+ / $+ $cc $+ $v(B. $+ %ID $+ .Lvl.1) $+ $ct $+ )( $+ $cc $+ $v(B. $+ %ID $+ .Poke.3) $+ $ct $+ $sex($v(B. $+ %ID $+ .Gender.3)) $+ $iif($v(B. $+ %ID $+ .Shiny.3) == ON,4+,$+) $+ $ct $+ / $+ $cc $+ $v(B. $+ %ID $+ .Lvl.3) $+ $ct $+ ) }
      else { var %pt1 = $cc $+ $v(B. $+ %ID $+ .Player.1) $+ $ct $+ ( $+ $cc $+ $v(B. $+ %ID $+ .Poke.1) $+ $sex($v(B. $+ %ID $+ .Gender.1)) $+ $iif($v(B. $+ %ID $+ .Shiny.1) == ON,4+,$+) $+ $ct $+ / $+ $cc $+ $v(B. $+ %ID $+ .Lvl.1) $+ $ct $+ ) }
    }
    if ($battle.team(%ID,2)) { var %pt2 = $cc $+ $v(B. $+ %ID $+ .Player.2) $+ $ct $+ ( $+ $cc $+ $v(B. $+ %ID $+ .Poke.2) $+ $sex($v(B. $+ %ID $+ .Gender.2)) $+ $iif($v(B. $+ %ID $+ .Shiny.2) == ON,4+,$+) $+ $ct $+ / $+ $cc $+ $v(B. $+ %ID $+ .Lvl.2) $+ $ct $+ ) e $cc $+ $v(B. $+ %ID $+ .Player.4) $+ $ct $+ ( $+ $cc $+ $v(B. $+ %ID $+ .Poke.4) $+ $sex($v(B. $+ %ID $+ .Gender.4)) $+ $iif($v(B. $+ %ID $+ .Shiny.4) == ON,4+,$+) $+ $ct $+ / $+ $cc $+ $v(B. $+ %ID $+ .Lvl.4) $+ $ct $+ ) }
    else {
      if ($v(B. $+ %ID $+ .Player.2)) {
        if ($v(B. $+ %ID $+ .Player.4)) { var %pt2 = $cc $+ $v(B. $+ %ID $+ .Player.2) $+ $ct $+ ( $+ $cc $+ $v(B. $+ %ID $+ .Poke.2) $+ $sex($v(B. $+ %ID $+ .Gender.2)) $+ $iif($v(B. $+ %ID $+ .Shiny.2) == ON,4+,$+) $+ $ct $+ / $+ $cc $+ $v(B. $+ %ID $+ .Lvl.2) $+ $ct $+ )( $+ $cc $+ $v(B. $+ %ID $+ .Poke.4) $+ $sex($v(B. $+ %ID $+ .Gender.4)) $+ $iif($v(B. $+ %ID $+ .Shiny.4) == ON,4+,$+) $+ $ct $+ / $+ $cc $+ $v(B. $+ %ID $+ .Lvl.4) $+ $ct $+ ) }
        else { var %pt2 = $cc $+ $v(B. $+ %ID $+ .Player.2) $+ $ct $+ ( $+ $cc $+ $v(B. $+ %ID $+ .Poke.2) $+ $sex($v(B. $+ %ID $+ .Gender.2)) $+ $iif($v(B. $+ %ID $+ .Shiny.2) == ON,4+,$+) $+ $ct $+ / $+ $cc $+ $v(B. $+ %ID $+ .Lvl.2) $+ $ct $+ ) }
      }
    }
  }
  else {
    var %pt1 = $cc $+ $v(B. $+ %ID $+ .Player.1) $+ $ct $+ ( $+ $cc $+ $v(B. $+ %ID $+ .Poke.1) $+ $ct $+ $sex($v(B. $+ %ID $+ .Gender.1)) $+ $iif($v(B. $+ %ID $+ .Shiny.1) == ON,4+,$+) $+ $ct $+ / $+ $cc $+ $v(B. $+ %ID $+ .Lvl.1) $+ $ct $+ )
    if ($v(B. $+ %ID $+ .Player.2)) { var %pt2 = $cc $+ $v(B. $+ %ID $+ .Player.2) $+ $ct $+ ( $+ $cc $+ $v(B. $+ %ID $+ .Poke.2) $+ $sex($v(B. $+ %ID $+ .Gender.2)) $+ $iif($v(B. $+ %ID $+ .Shiny.2) == ON,4+,$+) $+ $ct $+ / $+ $cc $+ $v(B. $+ %ID $+ .Lvl.2) $+ $ct $+ ) }
  }
  return %pt1 $iif(%pt2,/ Advers�rio: %pt2)
}


alias IA {
  var %ID = $1, %n = $2
  :start

  ; Viewing the possible moves the foe can use...
  var %pmoves = $rmoves(%ID,%n), %memory = $v([ [ B. ] $+ [ %ID ] $+ [ .Memory: ] $+ [ %n ] ])
  if (!%pmoves) { var %finalmove = Struggle, %finaltarget = %n | goto end }

  ; Now, let's make a little analyses about ATTACK MOVES and EFFECT MOVES, and check the real situation of the actual player.
  var %x = 1 | while ($gettok(%pmoves,%x,58)) {
    var %a = $gettok(%pmoves,%x,58)
    if (%a == Mirror Move) && ($v([ [ B. ] $+ [ %ID ] $+ [ .MMove. ] $+ [ %n ] ])) {
      if ($gettok($read(pkp\moveslist.txt,s,$gettok($v([ [ B. ] $+ [ %ID ] $+ [ .MMove. ] $+ [ %n ] ]),1,58)),7,58)) { var %effectmoves = $addtok(%effectmoves,%a,58) }
      else { var %attackmoves = $addtok(%attackmoves,%a,58) }
    }
    else {
      if ($gettok($read(pkp\moveslist.txt,s,%a),7,58)) { var %effectmoves = $addtok(%effectmoves,%a,58) }
      else { var %attackmoves = $addtok(%attackmoves,%a,58) }
    }
    inc %x
  }
  ; Wait a second... Should I choose another pok�mon?!
  var %choose = 0
  if ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %n ] ]),1,59) == Sleep) && ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %n ] ]),4,59)) { var %choose = 1 }
  if ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %n ] ]),1,59) == Frozen) { var %choose = 1 }
  if ($v([ [ B. ] $+ [ %ID ] $+ [ .Perish. ] $+ [ %n ] ]) == 1) { var %choose = 2 }
  if (%choose) {
    var %switch = $IA.switch(%ID,%n).n
    if (%switch) {
      var %switch = $rteam.n(%ID,%n,%switch)
      if (%choose == 1) { if ($gettok($gettok(%switch,16,58),1,59) == Sleep) || ($gettok($gettok(%switch,16,58),1,59) == Frozen) { var %choose = 0 } }
    }
    if (%choose) { if ($IA.switch(%ID,%n)) { return } }
  }
  if (%attackmoves) && (%effectmoves) {
    if ($gettok(%memory,1,59) >= $v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ])) { goto attack }
    var %x = 1 | if (%x) { goto attack } | else { goto effect }
  }
  elseif (%attackmoves) { goto attack } | else { goto effect }
  var %finalmove = $randmove(%ID,%n), %finaltarget = $battle.target(%ID,%n).rand | goto end

  :attack
  var %x = 1, %res = 0, %selfko = 0
  while ($gettok(%attackmoves,%x,58)) {
    var %move = $gettok(%attackmoves,%x,58)
    if (%move == Mirror Move) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .MMove. ] $+ [ %n ] ])) { var %move = $gettok($v([ [ B. ] $+ [ %ID ] $+ [ .MMove. ] $+ [ %n ] ]),1,58), %mirror = 1 } }
    var %power = $gettok($read(pkp\moveslist.txt, s, %move),2,58), %type = $gettok($read(pkp\moveslist.txt, s, %move),1,58), %target = $gettok($read(pkp\moveslist.txt, s, %move),5,58), %contact = $gettok($read(pkp\moveslist.txt, s, %move),6,58), %acc = $gettok($read(pkp\moveslist.txt, s, %move),3,58)

    if ($findtok(Self:Team:N/A:Ally,%target,0,58)) { var %foes = %n }
    elseif (%target == BothEnemy) { var %foes = $battle.target(%ID,%n).both }
    elseif (%target == All) { var %foes = $battle.target(%ID,%n).all }
    else { var %foes = $battle.target(%ID,%n) }

    if (%move == Hidden Power) { var %type = $gettok($v([ [ B. ] $+ [ %ID ] $+ [ .HiddenPower. ] $+ [ %n ] ]),1,59), %power = $gettok($v([ [ B. ] $+ [ %ID ] $+ [ .HiddenPower. ] $+ [ %n ] ]),2,59) }
    if (%move == Return) { var %power = $int($calc($v([ [ B. ] $+ [ %ID ] $+ [ .Loyalty. ] $+ [ %n ] ]) / 2.5)) }
    if (%move == Frustration) { var %power = $int($calc((256 - $v([ [ B. ] $+ [ %ID ] $+ [ .Loyalty. ] $+ [ %n ] ])) / 2.5)) }
    if (%move == Flail) || (%move == Reversal) { var %hpat = $v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]), %hpmax = $v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %n ] ]) | if (%hpat >= $int($calc(%hpmax * (33 / 48)))) { var %power = 20 } | elseif (%hpat >= $int($calc(%hpmax * (17 / 48)))) { var %power = 40 } | elseif (%hpat >= $int($calc(%hpmax * (10 / 48)))) { var %power = 80 } | elseif (%hpat >= $int($calc(%hpmax * (5 / 48)))) { var %power = 100 } | elseif (%hpat >= $int($calc(%hpmax * (2 / 48)))) { var %power = 150 } | else { var %power = 200 } }
    if (%move == Water Spout) || (%move == Eruption) { var %power = $int($calc(((100 * $v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ])) / $v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %n ] ])) / 100 * 150)) }
    if (%move == Facade) && ($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %n ] ])) { var %power = $calc(%power * 2) }
    if (%move == Magnitude) { var %power = 70 }
    if (%move == Spit Up) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Stock. ] $+ [ %n ] ])) { var %power = $calc(100 * $v([ [ B. ] $+ [ %ID ] $+ [ .Stock. ] $+ [ %n ] ])) } | else { var %e = 0 } }
    if (%move == Weather Ball) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Weather ] ])) { var %power = $calc(%power * 2) | if ($v([ [ B. ] $+ [ %ID ] $+ [ .Weather ] ]) == Sunny Day) { var %type = Fire } | elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Weather ] ]) == Rain Dance) { var %type = Water } | elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Weather ] ]) == Hail) { var %type = Ice } | else { var %type == Rock } } }
    if (%move == Revenge) { if ($gettok(%memory,1,59)) { var %power = $calc(%power * 2) } }
    if (%move == Fury Cutter) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .FuryCutter. ] $+ [ %n ] ])) && ($v([ [ B. ] $+ [ %ID ] $+ [ .LastMove. ] $+ [ %n ] ]) == Fury Cutter) { var %power = $calc(10 * 2 ^ $v([ [ B. ] $+ [ %ID ] $+ [ .FuryCutter. ] $+ [ %n ] ])) } }
    if (%move == Present) { var %power = 80 }

    var %times = 1, %alvos = $gettok(%foes,0,58), %defeated = 0 | while (%foes) {
      var %alvo = $gettok(%foes,1,58)

      ; Starting to check the following ATTACK moves...
      var %e = $effective(%ID,%type,%alvo)

      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %alvo ] ]) == Levitate) && (%type == Ground) { var %e = 0 }
      if ($findtok($readini(pkp\effectmoves.ini,Distint,Soundmoves),%move,0,58)) { if ($checkfoe.left(%ID,%n,Trait.,Soundproof:Cacophony,p)) { var %e = 0 } }

      ; Each attack move may have a restriction to be used, let's list them...
      if (%move == Fake Out) && ($v([ [ B. ] $+ [ %ID ] $+ [ .Turn. ] $+ [ %n ] ])) { var %e = 0 }
      if (%move == Endeavor) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]) >= $v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %alvo ] ])) { var %e = 0 } }
      if (%move == Dream Eater) { if ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %alvo ] ]),1,59) != Sleep) { var %e = 0 } }
      if (%move == Smellingsalt) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %alvo ] ]) == Paralyz) && (%e) { var %power = $calc(%power * 2) } }
      if (%move == Stomp) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Minimized. ] $+ [ %alvo ] ]) == ON) { var %power = $calc(%power * 2) } }
      if (%move == Pain Split) {
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Substitute. ] $+ [ %alvo ] ])) { var %e = 0 }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]) == $v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %alvo ] ])) { var %e = 0 }
      }
      if (%move == Gust) || (%move == Twister) || (%move == Thunder) || (%move == Sky Uppercut) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Continuos. ] $+ [ %alvo ] ]) == Fly) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Continuos. ] $+ [ %alvo ] ]) == Bounce) { var %power = $calc(%power * 2) } }
      if (%move == Surf) || (%move == Whirlpool) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Continuos. ] $+ [ %alvo ] ]) == Dive) { var %power = $calc(%power * 2) } }
      if (%move == Earthquake) || (%move == Magnitude) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Continuos. ] $+ [ %alvo ] ]) == Dig) { var %power = $calc(%power * 2) } }
      if (%move == Low Kick) { var %weight = $basestat($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %alvo ] ]),Weight) | if (%weight <= 10) { var %power = 20 } | elseif (%weight <= 25) { var %power = 40 } | elseif (%weight <= 50) { var %power = 60 } | elseif (%weight <= 100) { var %power = 80 } | elseif (%weight <= 200) { var %power = 100 } | else { var %power = 120 } }
      if (%move == Pursuit) { if ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %alvo ] ]),1,59) == Switch) { var %power = $calc(%power * 2) } }
      if (%move == Focus Punch) && (!$v([ [ B. ] $+ [ %ID ] $+ [ .Substitute. ] $+ [ %n ] ])) && ($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ $battle.team(%ID,%n).num ] ]) != Follow Me) {
        if ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Reaction. ] $+ [ %n ] ]),2,59)) && (%e) { var %e = $gettok(0 0 0 1,$rand(1,4),32) }
      }
      if ($findtok( $readini(pkp\effectmoves.ini,Distint,SelfKo),%move,0,58)) && ($battle.left(%ID,%n).total == 1) { var %e = 0 }

      var %atk = $v([ [ B. ] $+ [ %ID ] $+ [ .ATK. ] $+ [ %n ] ]), %batk = $v([ [ B. ] $+ [ %ID ] $+ [ .B.Atk. ] $+ [ %n ] ]), %batk = $iif(%move == Rage,$calc(%batk + $gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Rage. ] $+ [ %n ] ]),2,58)),%batk), %batk = $iif(%batk > 6,6,%batk), %atk = $int($calc(%atk * $statstage($iif(!%batk,0,%batk))))
      var %def = $v([ [ B. ] $+ [ %ID ] $+ [ .DEF. ] $+ [ %alvo ] ]), %bdef = $v([ [ B. ] $+ [ %ID ] $+ [ .B.Def. ] $+ [ %alvo ] ]), %def = $int($calc(%def * $statstage($iif(!%bdef,0,%bdef))))
      var %satk = $v([ [ B. ] $+ [ %ID ] $+ [ .SATK. ] $+ [ %n ] ]), %bsatk = $v([ [ B. ] $+ [ %ID ] $+ [ .B.SAtk. ] $+ [ %n ] ]), %satk = $int($calc(%satk * $statstage($iif(!%bsatk,0,%bsatk))))
      var %sdef = $v([ [ B. ] $+ [ %ID ] $+ [ .SDEF. ] $+ [ %alvo ] ]), %bsdef = $v([ [ B. ] $+ [ %ID ] $+ [ .B.SDef. ] $+ [ %alvo ] ]), %sdef = $int($calc(%sdef * $statstage($iif(!%bsdef,0,%bsdef))))
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Deepseascale) && ($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) == Clamperl) { var %sdef = $calc(%sdef * 2) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Deepseatooth) && ($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) == Clamperl) { var %satk = $calc(%satk * 2) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Soul Dew) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) == Latias) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) == Latios) { var %satk = $int($calc(%satk * 1.5)) } }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Minus) && ($battle.team(%ID,%n).left > 1) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ $battle.team(%ID,%n).num ] ]) == Plus) { var %satk = $int($calc(%satk * 1.5)) } }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Plus) && ($battle.team(%ID,%n).left > 1) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ $battle.team(%ID,%n).num ] ]) == Minus) { var %satk = $int($calc(%satk * 1.5)) } }
      if ($type(%type) == Normal) { var %atkstat = $iif(%atk <= 0,1,%atk), %defstat = $iif(%def <= 0,1,%def) | if ($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %n ] ]) == Burn) { var %atkstat = $int($calc(%atkstat / 2)) } | if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Guts) && ($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %n ] ])) { var %atkstat = $int($calc(%atkstat * 1.5)) } | if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Huge Power) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Pure Power) { var %atkstat = $calc(%atkstat * 2) } | if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Hustle) { var %power = $int($calc(%power * 1.5)) } | if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %alvo ] ]) == Marvel Scale) && ($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %alvo ] ])) { var %defstat = $int($calc(%defstat * 1.5)) } }
      else { var %atkstat = $iif(%satk <= 0,1,%satk), %defstat = $iif(%sdef <= 0,1,%sdef) }
      if (%type isin $v([ [ B. ] $+ [ %ID ] $+ [ .Type. ] $+ [ %n ] ])) { var %atkstat = $int($calc(%atkstat * 1.5)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Choice Band) { var %atkstat = $int($calc(%atkstat * $statstage(1))) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Reflect. ] $+ [ $battle.side(%alvo) ] ]) == ON) && ($type(%type) == Normal) { var %defstat = $int($calc(%defstat * 2)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .LightScreen. ] $+ [ $battle.side(%alvo) ] ]) == ON) && ($type(%type) != Normal) { var %defstat = $int($calc(%defstat * 2)) }
      if (%move == Selfdestruct) || (%move == Explosion) { var %defstat = $int($calc(%defstat / 2)) }
      if (%alvos > 1) && (%target != All) { var %power = $int($calc(%power / 2)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .HelpingHand. ] $+ [ %n ] ])) { var %power = $int($calc(%power * 1.5)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Black Belt) && (%type == Fighting) { var %power = $int($calc(%power * 1.1)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Blackglasses) && (%type == Dark) { var %power = $int($calc(%power * 1.1)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Charcoal) && (%type == Fire) { var %power = $int($calc(%power * 1.1)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Dragon Fang) && (%type == Dragon) { var %power = $int($calc(%power * 1.1)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Hard Stone) && (%type == Rock) { var %power = $int($calc(%power * 1.1)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Magnet) && (%type == Electric) { var %power = $int($calc(%power * 1.1)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Metal Coat) && (%type == Steel) { var %power = $int($calc(%power * 1.1)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Miracle Seed) && (%type == Grass) { var %power = $int($calc(%power * 1.1)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Mystic Water) && (%type == Water) { var %power = $int($calc(%power * 1.1)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Nevermeltice) && (%type == Ice) { var %power = $int($calc(%power * 1.1)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Poison Barb) && (%type == Poison) { var %power = $int($calc(%power * 1.1)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Sea Incense) && (%type == Water) { var %power = $int($calc(%power * 1.05)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Sharp Beak) && (%type == Flying) { var %power = $int($calc(%power * 1.1)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Silk Scarf) && (%type == Normal) { var %power = $int($calc(%power * 1.1)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Silverpowder) && (%type == Bug) { var %power = $int($calc(%power * 1.1)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Soft Sand) && (%type == Ground) { var %power = $int($calc(%power * 1.1)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Spell Tag) && (%type == Ghost) { var %power = $int($calc(%power * 1.1)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Twistedspoon) && (%type == Psychic) { var %power = $int($calc(%power * 1.1)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Charged. ] $+ [ %n ] ])) && (%type == Electric) { var %power = $int($calc(%power * 2)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Flashed. ] $+ [ %n ] ]) == ON) && (%type == Fire) { var %power = $int($calc(%power * 1.5)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %alvo ] ]) == Flash Fire) && (%type == Fire) { var %e = 0 }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %alvo ] ]) == Wonder Guard) && (%e < 2) { if (%move != Struggle) { var %e = 0 } }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %alvo ] ]) == Volt Absorb) && (%type == Electric) { var %e = 0 }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %alvo ] ]) == Water Absorb) && (%type == Water) { var %e = 0 }
      var %battleeffect = 10 | if (%power != N/A) { var %battleeffect = $calc(%battleeffect * %e) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Weather ] ]) == Sunny Day) { if (%type == Fire) { var %power = $int($calc(%power * 1.5)) } | if (%type == Water) { var %power = $int($calc(%power * 0.5)) } }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Weather ] ]) == Rain Dance) { if (%type == Fire) { var %power = $int($calc(%power * 0.5)) } | if (%type == Water) { var %power = $int($calc(%power * 1.5)) } | if (%move == Solarbeam) { var %power = $int($calc(%power / 2)) } }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Overgrow) && (%type == Grass) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]) <= $int($calc($v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %n ] ]) / 3))) { var %power = $int($calc(%power * 1.5)) } }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Blaze) && (%type == Fire) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]) <= $int($calc($v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %n ] ]) / 3))) { var %power = $int($calc(%power * 1.5)) } }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Torrent) && (%type == Water) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]) <= $int($calc($v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %n ] ]) / 3))) { var %power = $int($calc(%power * 1.5)) } }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Swarm) && (%type == Bug) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]) <= $int($calc($v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %n ] ]) / 3))) { var %power = $int($calc(%power * 1.5)) } }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %alvo ] ]) == Thick Fat) { if (%type == Fire) || (%type == Ice) { var %power = $int($calc(%power / 2)) } }
      var %rdamage = $calc( (( ((2 * $v([ [ B. ] $+ [ %ID ] $+ [ .Lvl. ] $+ [ %n ] ]) / 5) + 2) * %atkstat * %power / %defstat) / 50) + 2), %fdamage = $int($calc(%rdamage * %e * 236 / 255)), %dano = %fdamage

      if ($v([ [ B. ] $+ [ %ID ] $+ [ .MudSport. ] $+ [ %alvo ] ]) == ON) && (%type == Electric) { var %dano = $int($calc(%dano / 2)) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .WaterSport. ] $+ [ %alvo ] ]) == ON) && (%type == Fire) { var %dano = $int($calc(%dano / 2)) }
      if (%move == Endeavor) { var %dano = $calc($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %alvo ] ]) - $v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ])) }
      if (%move == Super Fang) { var %dano = $int($calc($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %alvo ] ]) / 2)) | if (!%dano) { var %dano = 1 } }
      if (%dano <= 0) { var %dano = 1 } | if ($readini(pkp\effectmoves.ini, Effects, $replace(%move,$chr(32),_))) && (%move != Skull Bash) { var %dano = 0 }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .BideTurn. ] $+ [ %n ] ]) == 2) && ($v([ [ B. ] $+ [ %ID ] $+ [ .Continuos. ] $+ [ %n ] ]) == Bide) {
        uset [ [ B. ] $+ [ %ID ] $+ [ .Continuos. ] $+ [ %n ] ] | uset [ [ B. ] $+ [ %ID ] $+ [ .BideTurn. ] $+ [ %n ] ]
        if (!$v([ [ B. ] $+ [ %ID ] $+ [ .BidePower. ] $+ [ %n ] ])) { msgfight %ID $lb $+ O golpe falhou! | uset [ [ B. ] $+ [ %ID ] $+ [ .BidePower. ] $+ [ %n ] ] | goto end }
        var %dano = $calc($v([ [ B. ] $+ [ %ID ] $+ [ .BidePower. ] $+ [ %n ] ]) * 2) | uset [ [ B. ] $+ [ %ID ] $+ [ .BidePower. ] $+ [ %n ] ]
      }
      if (%move == Night Shade) || (%move == Seismic Toss) { var %dano = $v([ [ B. ] $+ [ %ID ] $+ [ .Lvl. ] $+ [ %n ] ]) }
      if (%move == Dragon Rage) { var %dano = 40 } | if (%move == Sonicboom) { var %dano = 20 }
      if (%move == Psywave) { var %dano = $int($calc($v([ [ B. ] $+ [ %ID ] $+ [ .Lvl. ] $+ [ %n ] ]) * 0.75))) }
      if (%move == Counter) || (%move == Mirror Coat) { var %dano = $calc($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Reaction. ] $+ [ %n ] ]),2,59) * 2) } | var %tmove = %move, %tpower = $int($calc($iif(%power == N/A,0,%power) * %e * $iif(%chit,%chit,1))), %tdano = %dano, %ttype = %type
      if (%move == Pain Split) { var %dano = $int($calc(($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %alvo ] ])) / 2)), %dano = $calc($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %alvo ] ]) - %dano) | if (%dano < 0) { var %dano = 0 } }
      if ($readini(pkp\effectmoves.ini,Effects,$replace(%move,$chr(32),_)) == OHKO) { var %dano = $v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %alvo ] ]) }
      if (%acc) && (%acc isnum) && (!$v([ [ B. ] $+ [ %ID ] $+ [ .LockOn. ] $+ [ %n ] ])) { if (%acc < 50) { var %dano = 0 } | elseif (%acc < 70) { var %dano = $int($calc(%dano * 0.5)) } }
      var %dano = $iif(%dano,%dano,0)

      if ($istok($readini(pkp\effectmoves.ini,Distint,Twice),%move,58)) { var %dano = $calc(%dano * 2) }
      if ($istok($readini(pkp\effectmoves.ini,Distint,Twices),%move,58)) { var %dano = $calc(%dano * 3) }
      if (%move == Triple Kick) { var %dano = $calc(%dano * 5) }

      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Substitute. ] $+ [ %alvo ] ])) { var %dano = $iif(%dano > $v([ [ B. ] $+ [ %ID ] $+ [ .SubstituteHP. ] $+ [ %alvo ] ]),$v([ [ B. ] $+ [ %ID ] $+ [ .SubstituteHP. ] $+ [ %alvo ] ]),%dano) | if (%dano == $v([ [ B. ] $+ [ %ID ] $+ [ .SubstituteHP. ] $+ [ %alvo ] ])) { inc %defeated } }
      else {
        if (%dano >= $round.up($calc($v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %alvo ] ]) / 2))) || (%dano >= $v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %alvo ] ])) { if (%alvo == $battle.team(%ID,%n).num) { if (%defeated) { dec %defeated } } | else { inc %defeated } }
      }
      if (%move == Snore) { if ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %n ] ]),1,59) != Sleep) { var %e = 0 } }

      if (%alvo == $battle.team(%ID,%n).num) || (!%e) { var %dano = 0 }
      if ($findtok( $readini(pkp\effectmoves.ini,Distint,SelfKo),%move,0,58)) { if (%defeated) && (!%selfko) { var %selfko = 1 | dec %defeated } }
      if (%mirror) { var %mirror, %move = Mirror Move }

      if (!$findtok(Self:Team:N/A:Ally:BothEnemy:All,%target,0,58)) {
        if (%times < 2) { var %tm = %defeated $+ ; $+ $base(%dano,10,10,5) $+ ; $+ %alvo }
        else {
          if (%defeated > $gettok(%tm,1,59)) && (%dano) { var %tm = %defeated $+ ; $+ $base(%dano,10,10,5) $+ ; $+ %alvo }
          elseif (%defeated == $gettok(%tm,1,59)) && (%defeated) && (%dano) && ($base($gettok(%tm,2,59),10,10,1)) { var %tm = %tm $+ $chr(46) $+ %defeated $+ ; $+ $base(%dano,10,10,5) $+ ; $+ %alvo, %tm = $gettok(%tm,$rand(1,2),46) }
          elseif (%dano > $gettok(%tm,2,59)) { var %tm = %defeated $+ ; $+ $base(%dano,10,10,5) $+ ; $+ %alvo }
        }
      }
      else {
        if (%tm) { var %tm = %defeated $+ ; $+ $base($calc($gettok(%tm,2,59) + %dano),10,10,5) $+ ; $+ $gettok(%tm,3,59) $+ : $+ %alvo }
        else { var %tm = %defeated $+ ; $+ $base(%dano,10,10,5) $+ ; $+ %alvo }
      }
      var %foes = $remtok(%foes,%alvo,1,58)
      if (!$findtok(Self:Team:N/A:Ally:BothEnemy:All,%target,0,58)) && ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ $battle.target(%ID,%n).partner ] ])) && (%times < $battle.target(%ID,%n).left) { var %foes = $battle.target(%ID,%n).partner, %defeated = 0 }
      inc %times
    }
    if ($findtok(Fly:Bounce:Dive:Dig,%move,0,58)) { if ($findtok(Explosion:Selfdestruct,%ally.move,0,58)) { var %finalmove = %move, %finaltarget = $gettok(%tm,3,59) | goto end } }
    if ($findtok(Selfdestruct:Explosion,%move,0,58)) {
      if (%memory) { var %less.hp = $iif($gettok(%memory,1,59) > $v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]),$v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]),$gettok(%memory,1,59)) } | else { var %less.hp = 0 }
      var %less.damage = $int($calc($base($gettok(%tm,2,59),10,10,1) * ($v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %n ] ]) - ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]) - %less.hp)) / $v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %n ] ]))), %tm = $iif(%less.damage,$gettok(%tm,1,59),0) $+ ; $+ $base(%less.damage,10,10,5) $+ ; $+ $gettok(%tm,3,59)
    }
    if ($base($gettok(%tm,2,59),10,10,1)) {
      if ($gettok(%tm,3,59)) {
        if (%res) { var %res = %res $+ $chr(46) $+ %tm $+ ; $+ %move }
        else { var %res = %tm $+ ; $+ %move } | inc %x
      }
      else { var %attackmoves = $deltok(%attackmoves,%x,58) }
    }
    else { var %attackmoves = $deltok(%attackmoves,%x,58) }

    var %tm = 0
  }
  if (%res) {
    var %res = $sorttok(%res,46,r), %res = $gettok(%res,1,46)
    if ($gettok(%res,1,59)) && ($base($gettok(%res,2,59),10,10,1)) { var %finalmove = $gettok(%res,4,59), %finaltarget = $gettok(%res,3,59) | goto end }
    else { var %temp.move = %res }
  }

  :effect
  var %ally = $battle.team(%ID,%n).num | if ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %ally ] ])) {
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %ally ] ])) {
      var %ally.move = $v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %ally ] ]), %ally.target = $v([ [ B. ] $+ [ %ID ] $+ [ .Target. ] $+ [ %ally ] ]), %ally.effect = $readini(pkp\effectmoves.ini, Effects, $replace(%ally.move,$chr(32),_))
      if (%ally.move == Skull Bash) && ($v([ [ B. ] $+ [ %ID ] $+ [ .Continuos. ] $+ [ %ally ] ])) { var %ally.effect = 0 }
      if (%ally.move == Curse) && (Ghost isin $v([ [ B. ] $+ [ %ID ] $+ [ .Type. ] $+ [ %ally ] ])) { var %ally.effect = 0 }
    }
  }

  var %x = 1, %res = 0
  while ($gettok(%effectmoves,%x,58)) {
    var %move = $gettok(%effectmoves,%x,58)
    if (%move == Mirror Move) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .MMove. ] $+ [ %n ] ])) { var %move = $gettok($v([ [ B. ] $+ [ %ID ] $+ [ .MMove. ] $+ [ %n ] ]),1,58), %mirror = 1 } }
    var %type = $gettok($read(pkp\moveslist.txt, s, %move),1,58), %target = $gettok($read(pkp\moveslist.txt, s, %move),5,58), %contact = $gettok($read(pkp\moveslist.txt, s, %move),6,58)

    ; Finally, checking the EFFECT moves...

    if ($findtok(Self:Team:N/A:Ally,%target,0,58)) { var %foes = %n }
    elseif (%target == BothEnemy) { var %foes = $battle.target(%ID,%n).both }
    elseif (%target == All) { var %foes = $battle.target(%ID,%n).all }
    else { var %foes = $battle.target(%ID,%n) }

    var %times = 1, %alvos = $gettok(%foes,0,58), %defeated = 0 | while (%foes) {
      var %alvo = $gettok(%foes,1,58), %e = $effective(%ID,%type,%alvo)

      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %alvo ] ]) == Levitate) && (%type == Ground) { var %e = 0 }
      if ($findtok(Self:Team,%target,0,58)) { var %e = 1 }
      var %effect = $readini(pkp\effectmoves.ini, Effects, $replace(%move,$chr(32),_)), %did = 0
      if (%move == Skull Bash) && ($v([ [ B. ] $+ [ %ID ] $+ [ .Continuos. ] $+ [ %n ] ])) { var %effect = 0 }
      if (%move == Curse) && (Ghost isin $v([ [ B. ] $+ [ %ID ] $+ [ .Type. ] $+ [ %n ] ])) { var %effect = 0 }
      if (%effect) {
        if ($effect.type(%effect) == Stat) { var %e = 1 }
        var %z = $gettok(%effect,0,32), %y = 1
        while (%y <= %z) {
          var %change = $gettok(%effect,%y,32) $gettok(%effect,$calc(%y + 1),32), %i = 1
          if ($findtok(Sleep:Burn:Frozen:Paralyz:Poison:Confuse,$gettok(%change,1,32),0,58)) && (!$v([ [ B. ] $+ [ %ID ] $+ [ .Substitute. ] $+ [ %alvo ] ])) {
            if (%ally.target == %alvo) && (%ally.effect == %change) { var %i = 0 }
            if ($findtok(Burn Frozen Paralyz Poison,$gettok(%change,1,32),0,32)) {
              if (%e) {
                if (%change == Burn) {
                  if ($v([ [ B. ] $+ [ %ID ] $+ [ .Safeguard. ] $+ [ $battle.side(%alvo) ] ])) || (Fire isin $v([ [ B. ] $+ [ %ID ] $+ [ .Type. ] $+ [ %alvo ] ])) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %alvo ] ]) == Water Veil) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %alvo ] ])) { var %i = 0 }
                }
                if (%change == Frozen) {
                  if ($v([ [ B. ] $+ [ %ID ] $+ [ .Safeguard. ] $+ [ $battle.side(%alvo) ] ])) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %alvo ] ]) == Magma Armor) || (Ice isin $v([ [ B. ] $+ [ %ID ] $+ [ .Type. ] $+ [ %alvo ] ])) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %alvo ] ])) || ($FRZ.clause(%ID,%n)) { var %i = 0 }
                }
                if (%change == Paralyz) {
                  if ($v([ [ B. ] $+ [ %ID ] $+ [ .Safeguard. ] $+ [ $battle.side(%alvo) ] ])) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %alvo ] ]) == Limber) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %alvo ] ])) { var %i = 0 }
                }
                if ($gettok(%change,1,32) == Poison) {
                  if ($v([ [ B. ] $+ [ %ID ] $+ [ .Safeguard. ] $+ [ $battle.side(%alvo) ] ])) || (Poison isin $v([ [ B. ] $+ [ %ID ] $+ [ .Type. ] $+ [ %alvo ] ])) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %alvo ] ]) == Immunity) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %alvo ] ])) { var %i = 0 }
                }
              }
              else { var %i = 0 }
            }
            else {
              if (%change == Sleep) {
                if ($v([ [ B. ] $+ [ %ID ] $+ [ .Safeguard. ] $+ [ $battle.side(%alvo) ] ])) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %alvo ] ]) == Insomnia) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %alvo ] ]) == Vital Spirit) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %alvo ] ])) || ($checkfoe.left(%ID,%n,Uproar.,ON,a)) || ($SLP.clause(%ID,%n)) { var %i = 0 }
              }
              if (%change == Confuse) {
                if ($v([ [ B. ] $+ [ %ID ] $+ [ .Safeguard. ] $+ [ $battle.side(%alvo) ] ])) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %alvo ] ]) == Own Tempo) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Confuse. ] $+ [ %alvo ] ])) { var %i = 0 }
              }
            }
          }
          else {
            if ($gettok(%change,2,32) != self) {
              if (%ally.move) { if (%ally.target == %alvo) && ($gettok(%ally.effect,1,32) == $gettok(%change,1,32)) { var %i = 0 } }
            }
            if (%alvo != %n) {
              if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %alvo ] ]) == Clear Body) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %alvo ] ]) == White Smoke) { var %i = 0 }
              if ($v([ [ B. ] $+ [ %ID ] $+ [ .Substitute. ] $+ [ %alvo ] ])) && (%move != Tickle) { var %i = 0 }
              if ($v([ [ B. ] $+ [ %ID ] $+ [ .Mist. ] $+ [ $battle.side(%alvo) ] ]) == ON) { var %i = 0 }
            }
            if ($gettok(%change,2,32) == self) { var %cstat = %n } | else { var %cstat = %alvo }
            if (+ isin %change) {
              if ($gettok(%change,1,32) == +attack) { if ($calc($v([ [ B. ] $+ [ %ID ] $+ [ .B.Atk. ] $+ [ %cstat ] ]) + 1) > 6) { var %i = 0 } }
              if ($gettok(%change,1,32) == +defense) { if ($calc($v([ [ B. ] $+ [ %ID ] $+ [ .B.Def. ] $+ [ %cstat ] ]) + 1) > 6) { var %i = 0 } }
              if ($gettok(%change,1,32) == +speed) { if ($calc($v([ [ B. ] $+ [ %ID ] $+ [ .B.Spd. ] $+ [ %cstat ] ]) + 1) > 6) { var %i = 0 } }
              if ($gettok(%change,1,32) == +spcattack) { if ($calc($v([ [ B. ] $+ [ %ID ] $+ [ .B.SAtk. ] $+ [ %cstat ] ]) + 1) > 6) { var %i = 0 } }
              if ($gettok(%change,1,32) == +spcdefense) { if ($calc($v([ [ B. ] $+ [ %ID ] $+ [ .B.SDef. ] $+ [ %cstat ] ]) + 1) > 6) { var %i = 0 } }
              if ($gettok(%change,1,32) == +evason) { if ($calc($v([ [ B. ] $+ [ %ID ] $+ [ .B.Evason. ] $+ [ %cstat ] ]) + 1) > 6) { var %i = 0 } }
            }
            else {
              if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %alvo ] ]) == Clear Body) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %alvo ] ]) == White Smoke) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Mist. ] $+ [ $battle.side(%alvo) ] ]) == ON) { if (%alvo != %n) { var %i = 0 } }
              if ($gettok(%change,1,32) == -attack) { if ($calc($v([ [ B. ] $+ [ %ID ] $+ [ .B.Atk. ] $+ [ %cstat ] ]) - 1) < -6) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %cstat ] ]) == Hyper Cutter) { var %i = 0 } }
              if ($gettok(%change,1,32) == -defense) { if ($calc($v([ [ B. ] $+ [ %ID ] $+ [ .B.Def. ] $+ [ %cstat ] ]) - 1) < -6) { var %i = 0 } }
              if ($gettok(%change,1,32) == -speed) { if ($calc($v([ [ B. ] $+ [ %ID ] $+ [ .B.Spd. ] $+ [ %cstat ] ]) - 1) < -6) { var %i = 0 } }
              if ($gettok(%change,1,32) == -spcattack) { if ($calc($v([ [ B. ] $+ [ %ID ] $+ [ .B.SAtk. ] $+ [ %cstat ] ]) - 1) < -6) { var %i = 0 } }
              if ($gettok(%change,1,32) == -spcdefense) { if ($calc($v([ [ B. ] $+ [ %ID ] $+ [ .B.SDef. ] $+ [ %cstat ] ]) - 1) < -6) { var %i = 0 } }
              if ($gettok(%change,1,32) == -accuracy) { if ($calc($v([ [ B. ] $+ [ %ID ] $+ [ .B.Acc. ] $+ [ %cstat ] ]) - 1) < -6) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %cstat ] ]) == Keen Eye) || ($v([ [ B. ] $+ [ %ID ] $+ [ .ProtAcc. ] $+ [ %cstat ] ])) { var %i = 0 } }
              if ($gettok(%change,1,32) == -evason) { if ($calc($v([ [ B. ] $+ [ %ID ] $+ [ .B.Evason. ] $+ [ %cstat ] ]) - 1) < -6) { var %i = 0 } }
            }
          }
          if (%i) { var %did = 1 }
          var %y = $calc(%y + 2)
        }
        if (%did) { var %e = 1 } | else { var %e = 0 }
      }
      else { if (%alvo == %n) { var %e = 1 } }
      if ($findtok(Protect:Detect:Endure,%move,0,58)) {
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .LockOn. ] $+ [ $rvs(%n) ] ])) && ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ $rvs(%n) ] ]) > 0) { var %x1 = 1 }
        if ($battle.team(%ID,$rvs(%n))) && ($v([ [ B. ] $+ [ %ID ] $+ [ .LockOn. ] $+ [ $battle.team(%ID,$rvs(%n)).num ] ])) && ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ $battle.team(%ID,$rvs(%n)).num ] ]) > 0) { var %x1 = 1 }
        if ($findtok(Explosion:Selfdestruct,%ally.move,0,58)) || (%x1) { var %finalmove = %move, %finaltarget = %n | goto end }
        elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Counter. ] $+ [ %n ] ])) { var %e = 0 }
      }
      if ($findtok(Milk Drink:Recover:Rest:Slack Off:Moonlight:Morning Sun:Synthesis:Softboiled,%move,0,58)) {
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]) <= $int($calc($v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %n ] ]) / 2))) || ($findtok(Explosion:Selfdestruct,%ally.move,0,58)) { var %finalmove = %move, %finaltarget = %n | goto end }
        else { var %e = 0 }
      }
      if ($gettok(%memory,1,59) >= $v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ])) {
        if ($findtok(Protect:Detect:Endure,%move,0,58)) { if (!$v([ [ B. ] $+ [ %ID ] $+ [ .Counter. ] $+ [ %n ] ])) || (!$rand(0,1)) { var %finalmove = %move, %finaltarget = %n | goto end } }
        elseif ($findtok(Destiny Bond:Memento:Grudge,%move,0,58)) && ($battle.left(%ID,%n).total > 1) { var %finalmove = %move, %finaltarget = %n | goto end }
        elseif (!$findtok(Leech Seed:Yawn:Wish:Future Sight:Doom Desire:Perish Song:Torment:Encore:Attract:Baton Pass,%move,0,58)) && (!$findtok(Sleep:Paralyz:Poison:Burn:Frozen:Confuse,$gettok(%effect,1,32),0,58)) { var %e = 0 }
      }
      if (%move == Counter) {
        var %c.x = 1, %c.fail = 1
        while ($gettok($gettok(%memory,3,59),%c.x,58)) {
          var %c.type = $gettok($gettok(%memory,3,59),%c.x,58)
          if (Normal == $type(%c.type)) { var %c.fail = 0 }
          inc %c.x
        }
        if (%c.fail) { var %e = 0 }
      }
      if (%move == Mirror Coat) {
        var %c.x = 1, %c.fail = 0
        while ($gettok($gettok(%memory,3,59),%c.x,58)) {
          var %c.type = $gettok($gettok(%memory,3,59),%c.x,58)
          if (Special == $type(%c.type)) { var %finalmove = %move, %finaltarget = %n | goto end }
          else { var %c.fail = 1 }
          inc %c.x
        }
        if (%c.fail) { var %e = 0 }
      }
      if (%move == Sleep Talk) { if ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %n ] ]),1,59) != Sleep) { var %e = 0 } }
      if (%move == Reflect) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Reflect. ] $+ [ $battle.side(%n) ] ])) || (%ally.move == %move) { var %e = 0 } }
      if (%move == Light Screen) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .LightScreen. ] $+ [ $battle.side(%n) ] ])) || (%ally.move == %move) { var %e = 0 } }
      if (%move == Mist) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Mist. ] $+ [ $battle.side(%n) ] ])) || (%ally.move == %move) { var %e = 0 } }
      if (%move == Leech Seed) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Seeded. ] $+ [ %alvo ] ])) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Substitute. ] $+ [ %alvo ] ])) || (Grass isin $v([ [ B. ] $+ [ %ID ] $+ [ .Type. ] $+ [ %alvo ] ])) { var %e = 0 } | if (%ally.move == %move) && (%ally.target == %alvo) { var %e = 0 } }
      if (%move == Focus Energy) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .FocusEnergy. ] $+ [ %n ] ])) { var %e = 0 } }
      if (%move == Yawn) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Yawn. ] $+ [ %alvo ] ])) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %alvo ] ])) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Safeguard. ] $+ [ $battle.side(%alvo) ] ])) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %alvo ] ]) == Insomnia) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %alvo ] ]) == Vital Spirit) { var %e = 0 } | if (%ally.move == %move) && (%ally.target == %alvo) { var %e = 0 } }
      if (%move == Safeguard) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Safeguard. ] $+ [ %n ] ])) { var %e = 0 } }
      if (%move == Wish) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Wish ] $+ [ %n ] ])) { var %e = 0 } }
      if (%move == Future Sight) || (%move == Doom Desire) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Destiny ] $+ [ %alvo ] ])) { var %e = 0 } }
      if (%move == Heal Bell) || (%move == Aromatherapy) { if (!$v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %n ] ])) { var %e = 0 } }
      if (%move == Refresh) { if (!$v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %n ] ])) { var %e = 0 } }
      if (%move == Mimic) {
        var %mimic = $v([ [ B. ] $+ [ %ID ] $+ [ .Mimic. ] $+ [ %alvo ] ]) | if ($v([ [ B. ] $+ [ %ID ] $+ [ .Move1. ] $+ [ %n ] ]) == %mimic) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Move2. ] $+ [ %n ] ]) == %mimic) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Move3. ] $+ [ %n ] ]) == %mimic) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Move4. ] $+ [ %n ] ]) == %mimic) { var %e = 0 }
        if (%mimic == Mimic) || (%mimic == Sketch) || (%mimic == Mirror Move) || (%mimic == Transform) || (%mimic == Metronome) || (%mimic == Struggle) || (!%mimic) { var %e = 0 }
      }
      if (%move == Sketch) {
        var %mimic = $v([ [ B. ] $+ [ %ID ] $+ [ .Sketch. ] $+ [ %alvo ] ]) | if ($v([ [ B. ] $+ [ %ID ] $+ [ .Move1. ] $+ [ %n ] ]) == %mimic) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Move2. ] $+ [ %n ] ]) == %mimic) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Move3. ] $+ [ %n ] ]) == %mimic) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Move4. ] $+ [ %n ] ]) == %mimic) { var %e = 0 }
        if (!%mimic) || (%mimic == Struggle) { var %e = 0 }
      }
      if ($findtok(Sunny Day:Rain Dance:Sandstorm:Hail,%move,0,58)) && ($v([ [ B. ] $+ [ %ID ] $+ [ .Weather ] ]) == %move) { var %e = 0 }
      if (%move == Belly Drum) {
        var %hhp = $round.up($int($calc($v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %n ] ]) / 2))) | if ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]) <= %hhp) || ($v([ [ B. ] $+ [ %ID ] $+ [ .B.Atk. ] $+ [ %n ] ]) == 6) { var %e = 0 }
      }
      if (%move == Curse) && (Ghost isin $v([ [ B. ] $+ [ %ID ] $+ [ .Type. ] $+ [ %n ] ])) {
        var %hhp = $round.up($int($calc($v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %n ] ]) / 2))) | if ($v([ [ B. ] $+ [ %ID ] $+ [ .Cursed. ] $+ [ %alvo ] ])) || ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %alvo ] ]) <= %hhp) { var %e = 0 }
      }
      if (%move == Charge) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Charge. ] $+ [ %n ] ]) == ON) { var %e = 0 } }
      if (%move == Perish Song) {
        var %ps.v = 1, %ps.r = 0 | while ($gettok($battle.target(%ID,%n).both,%ps.v,58)) { if (!$v([ [ B. ] $+ [ %ID ] $+ [ .Perish. ] $+ [ %ps.v ] ])) { if (!$findtok(Soundproof:Cacophony,$v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %ps.v ] ]),0,58)) { inc %ps.r } } | inc %ps.v }
        if (%ps.r) {
          if ($v([ [ B. ] $+ [ %ID ] $+ [ .NoEscape. ] $+ [ %alvo ] ])) || ($v([ [ B. ] $+ [ %ID ] $+ [ .NoEscape. ] $+ [ $battle.team(%ID,%alvo).num ] ])) { var %finalmove = %move, %finaltarget = %n | goto end }
        }
        else { var %e = 0 }
      }
      if (%move == Skill Swap) { var %tr1 = $v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]), %tr2 = $v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %alvo ] ]) | if (%tr1 == Wonder Guard) || (%tr2 == Wonder Guard) { var %e = 0 } }
      if (%move == Role Play) { var %tr = $v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %alvo ] ]) | if (%tr == Wonder Guard) { var %e = 0 } }
      if (%move == Stockpile) { var %stock = $v([ [ B. ] $+ [ %ID ] $+ [ .Stock. ] $+ [ %n ] ]), %stock = $iif(%stock,%stock,0) | if (%stock >= 3) { var %e = 0 } }
      if (%move == Swallow) {
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Stock. ] $+ [ %n ] ])) {
          if ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]) == $v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %n ] ])) { var %e = 0 }
        }
        else { var %e = 0 }
      }
      if (%move == Mud Sport) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .MudSport. ] $+ [ %n ] ])) { var %e = 0 } }
      if (%move == Water Sport) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .WaterSport. ] $+ [ %n ] ])) { var %e = 0 } }
      if (%move == Lock-On) || (%move == Mind Reader) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .LockOn. ] $+ [ %n ] ])) { var %e = 0 } }
      if (%move == Roar) || (%move == Whirlwind) { if (!$v([ [ B. ] $+ [ %ID ] $+ [ .Wild ] ])) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Match ] ]) == 1) || (!$battle.left(%ID,%alvo).total) { var %e = 0 } } }
      if (%move == Encore) {
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Encore. ] $+ [ %alvo ] ])) || (!$v([ [ B. ] $+ [ %ID ] $+ [ .Forbidden. ] $+ [ %alvo ] ])) { var %e = 0 }
        if (!$nmove(%ID,%alvo,$v([ [ B. ] $+ [ %ID ] $+ [ .Forbidden. ] $+ [ %alvo ] ]))) { var %e = 0 }
      }
      if (%move == Torment) {
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Torment. ] $+ [ %alvo ] ])) { var %e = 0 }
      }
      if (%move == Splash) { var %e = 0 }
      if (%move == Psych Up) {
        var %x1 = $calc($v([ [ B. ] $+ [ %ID ] $+ [ .B.Atk. ] $+ [ %n ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.Def. ] $+ [ %n ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.Spd. ] $+ [ %n ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.SAtk. ] $+ [ %n ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.SDef. ] $+ [ %n ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.Evason. ] $+ [ %n ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.Acc. ] $+ [ %n ] ]))
        var %x2 = $calc($v([ [ B. ] $+ [ %ID ] $+ [ .B.Atk. ] $+ [ %alvo ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.Def. ] $+ [ %alvo ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.Spd. ] $+ [ %alvo ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.SAtk. ] $+ [ %alvo ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.SDef. ] $+ [ %alvo ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.Evason. ] $+ [ %alvo ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.Acc. ] $+ [ %alvo ] ]))
        if (%x1 >= %x2) { var %e = 0 }
      }
      if (%move == Haze) {
        var %x1 = $calc($v([ [ B. ] $+ [ %ID ] $+ [ .B.Atk. ] $+ [ %n ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.Def. ] $+ [ %n ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.Spd. ] $+ [ %n ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.SAtk. ] $+ [ %n ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.SDef. ] $+ [ %n ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.Evason. ] $+ [ %n ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.Acc. ] $+ [ %n ] ]))
        var %x2 = $calc($v([ [ B. ] $+ [ %ID ] $+ [ .B.Atk. ] $+ [ %alvo ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.Def. ] $+ [ %alvo ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.Spd. ] $+ [ %alvo ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.SAtk. ] $+ [ %alvo ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.SDef. ] $+ [ %alvo ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.Evason. ] $+ [ %alvo ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.Acc. ] $+ [ %alvo ] ]))
        if (%x2 < %x1) && (%x1 >= 0) { var %e = 0 } | if (!%x1) { var %e = 0 }
      }
      if (%move == Substitute) {
        var %hhp = $int($calc($v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %n ] ]) / 4))
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]) <= %hhp) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Substitute. ] $+ [ %n ] ])) { var %e = 0 }
        if (%e) && ($v([ [ B. ] $+ [ %ID ] $+ [ .LastMove. ] $+ [ %n ] ]) == %move) { var %e = 0 }
      }
      if (%move == Attract) {
        var %female = 0, %male = 0
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Gender. ] $+ [ %n ] ]) == Male) { var %male = 1 } | if ($v([ [ B. ] $+ [ %ID ] $+ [ .Gender. ] $+ [ %n ] ]) == Female) { var %female = 1 }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Gender. ] $+ [ %alvo ] ]) == Male) { var %male = 1 } | if ($v([ [ B. ] $+ [ %ID ] $+ [ .Gender. ] $+ [ %alvo ] ]) == Female) { var %female = 1 }
        if (!%male) || (!%female) { var %e = 0 }
      }
      if (%move == Baton Pass) {
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Match ] ]) == 1) || (!$battle.left(%ID,%n).total) { var %e = 0 }
        var %x1 = $calc($v([ [ B. ] $+ [ %ID ] $+ [ .B.Atk. ] $+ [ %n ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.Def. ] $+ [ %n ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.Spd. ] $+ [ %n ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.SAtk. ] $+ [ %n ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.SDef. ] $+ [ %n ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.Evason. ] $+ [ %n ] ]) + $v([ [ B. ] $+ [ %ID ] $+ [ .B.Acc. ] $+ [ %n ] ])), %x1 = $iif(%x1,%x1,0)
        if (%x1 <= 0) { var %e = 0 }
      }
      if (%move == Spikes) {
        var %spikes = $v([ [ B. ] $+ [ %ID ] $+ [ .Spikes ] $+ [ $battle.side(%alvo) ] ]), %spikes = $iif(%spikes,%spikes,0)
        if (%spikes >= 3) { var %e = 0 }
      }
      if (%move == Recycle) {
        var %t = $iif($battle.team(%ID,%n),$battle.side(%n),%n), %t1 = $v([ [ B. ] $+ [ %ID ] $+ [ .Item: ] $+ [ %t ] ]), %t2 = $wildtok(%t1,$v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) *,1,58)
        if (!%t2) { var %e = 0 }
      }
      if (%move == Block) || (%move == Mean Look) || (%move == Spider Web) {
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Switch ] ])) {
          if ($v([ [ B. ] $+ [ %ID ] $+ [ .NoEscape. ] $+ [ %alvo ] ])) { var %e = 0 }
          elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Perish. ] $+ [ %alvo ] ])) { var %finalmove = %move, %finaltarget = %n | goto end }
        }
        else { var %e = 0 }
      }
      if (%move == Nightmare) {
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Nightmare. ] $+ [ %alvo ] ])) { var %e = 0 }
        elseif ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %alvo ] ]),1,59) != Sleep) { var %e = 0 }
      }
      if (%move == Disable) {
        var %d = $v([ [ B. ] $+ [ %ID ] $+ [ .Disable. ] $+ [ %alvo ] ])
        if ($gettok(%d,0,58) > 0) { var %e = 0 }
        else {
          var %disable = $v([ [ B. ] $+ [ %ID ] $+ [ .Sketch. ] $+ [ %alvo ] ])
          if (!%disable) || (%disable == Struggle) || ($wildtok(%d,%disable $+ $chr(59) $+ *,0,58)) { var %e = 0 }
        }
      }
      if (%move == Grudge) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Grudge. ] $+ [ %n ] ])) { var %e = 0 } }
      if (%move == Taunt) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Taunt. ] $+ [ %alvo ] ])) { var %e = 0 } }
      if (%move == Camouflage) {
        if ($findtok(Grama:Grama Alta:Grama Bem Alta,$v([ [ B. ] $+ [ %ID ] $+ [ .Arena ] ]),0,58)) { var %d = Grass }
        elseif ($findtok(Oceano:Lago:Submerso,$v([ [ B. ] $+ [ %ID ] $+ [ .Arena ] ]),0,58)) { var %d = Water }
        elseif ($findtok(Areia,$v([ [ B. ] $+ [ %ID ] $+ [ .Arena ] ]),0,58)) { var %d = Ground }
        elseif ($findtok(Caverna:Rocha,$v([ [ B. ] $+ [ %ID ] $+ [ .Arena ] ]),0,58)) { var %d = Rock }
        else { var %d = Normal }
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Type. ] $+ [ %n ] ]) == %d) { var %e = 0 }
      }
      if (%move == Spite) {
        var %omove = $v([ [ B. ] $+ [ %ID ] $+ [ .Forbidden. ] $+ [ %alvo ] ]), %m = $findtok($gettok($rteam(%ID,%alvo),17-20,58),%omove,1,58)
        if (%omove) { if (!%m) { var %e = 0 } }
        else { if ($istat(%ID,%n,SPD) > $istat(%ID,%alvo,SPD)) { var %e = 0 } }
      }
      if (%e) {
        if (!$findtok(Self:Team:N/A:Ally:BothEnemy:All,%target,0,58)) {
          if (%times < 2) { var %tm = 1; $+ %move $+ ; $+ %alvo }
          else { if (%tm) { var %tm = %tm $+ $chr(46) $+ 1; $+ %move $+ ; $+ %alvo, %tm = $gettok(%tm,$rand(1,$gettok(%tm,0,46)),46) } | else { var %tm = 1; $+ %move $+ ; $+ %alvo } }
        }
        else {
          if (%tm) { var %tm = $calc($gettok(%tm,1,59) + 1) $+ ; $+ %move $+ ; $+ %alvo }
          else { var %tm = 1; $+ %move $+ ; $+ %alvo }
        }
      }
      var %foes = $remtok(%foes,%alvo,1,58)
      if (!$findtok(Self:Team:N/A:Ally:BothEnemy:All,%target,0,58)) && ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ $battle.team(%ID,%n).num ] ])) && (%times < $battle.target(%ID,%n).left) { var %foes = $battle.target(%ID,%n).partner }
      inc %times
    }
    if (%tm) {
      if (%res) { var %res = %res $+ $chr(46) $+ %tm }
      else { var %res = %tm }
      var %tm = 0 | inc %x
    }
    else { var %effectmoves = $deltok(%effectmoves,%x,58) }
  }

  if (%res) { var %res = $gettok(%res,$rand(1,$gettok(%res,0,46)),46), %finalmove = $gettok(%res,2,59), %finaltarget = $gettok(%res,3,59) | goto end }
  elseif (%temp.move) { var %finalmove = $gettok(%temp.move,4,59), %finaltarget = $gettok(%temp.move,3,59) | goto end }
  elseif (%attackmoves) { var %res = 0 | goto attack }

  if (!%finalmove) || (!%finaltarget) {
    if ($v(B. [ $+ [ %ID ] $+ ] .Switch)) { if ($IA.switch(%ID,%n)) { return } }
    randmove %ID %n | sset [ [ B. ] $+ [ %ID ] $+ [ .Target. ] $+ [ %n ] ] $battle.target(%ID,%n).rand | return
  }

  :end
  sset [ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %n ] ] %finalmove
  sset [ [ B. ] $+ [ %ID ] $+ [ .Target. ] $+ [ %n ] ] %finaltarget
  if ($findtok(Explosion:Selfdestruct,%finalmove,0,58)) {
    if (!%again) && (%n > $battle.side(%n)) { var %n = $battle.side(%n) | if (!$v([ [ B. ] $+ [ %ID ] $+ [ .Continuos. ] $+ [ %n ] ])) && (!$v([ [ B. ] $+ [ %ID ] $+ [ .Encore. ] $+ [ %n ] ])) && ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ])) && ($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %n ] ]) != Struggle) { var %again = 1 | goto start } }
  }
}
; $IA.switch(<ID>,<n� player>) - Retorna $true se o pok�mon for trocado com sucesso, sen�o $false.
; $IA.switch(<ID>,<n� player>).n - Retorna o n�mero do pok�mon que seria trocado, sem faz�-lo realmente.

alias IA.switch {
  var %ID = $1, %n = $2, %team = $battle.player(%ID,%n), %choose

  if (!$v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %n ] ])) {
    if ($checkfoe.left(%ID,%n,Trait.,Arena Trap)) {
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) != Levitate) && (Flying !isin $v([ [ B. ] $+ [ %ID ] $+ [ .Type. ] $+ [ %n ] ])) { return $false }
    }
    if ($checkfoe.left(%ID,%n,Trait.,Magnet Pull)) { if (Steel isin $v([ [ B. ] $+ [ %ID ] $+ [ .Type. ] $+ [ %n ] ])) { return $false } }
    if ($checkfoe.left(%ID,%n,Trait.,Shadow Tag)) { return $false }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Ingrain. ] $+ [ %n ] ])) { return $false }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Vortex. ] $+ [ %n ] ])) { return $false }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .NoEscape. ] $+ [ %n ] ])) { return $false }
  }

  ; Pok�mon:Level:Nature:Sex:Shiny:Trait:Loyalty:Hold:HP:ATK:DEF:SPD:SATK:SDEF:HPAtual:Status:Move1:Move2:Move3:Move4:PP1:PP2:PP3:PP4:HiddenPower
  ; First, let's check the remaning pok�mon at all.
  var %x = 1 | while ($v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %x ] $+ ] : ] $+ [ %team ] ])) {
    var %pk = $v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %x ] $+ ] : ] $+ [ %team ] ]), %hp = $gettok(%pk,15,58), %name = $gettok(%pk,1,58), %ready = 1
    if (%hp <= 0) { var %ready = 0 }
    if (%name == $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %team ] ])) { var %ready = 0 }
    if ($battle.team(%ID,%team)) {
      var %ally = $battle.team(%ID,%team).num
      if (%name == $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %ally ] ])) { var %ready = 0 }
      if ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %ally ] ]),1,59) == Switch) { if ($gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %ally ] ]),2,59) == %x) { var %ready = 0 } }
    }
    if (%ready) { var %choose = $addtok(%choose,%x,58) }
    inc %x
  }
  if (%choose) {
    var %x = 1, %memory = $v([ [ B. ] $+ [ %ID ] $+ [ .Memory: ] $+ [ %n ] ]), %order

    while ($gettok(%choose,%x,58)) {
      var %m = $gettok(%choose,%x,58), %pk = $v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %m ] $+ ] : ] $+ [ %team ] ]), %name = $gettok(%pk,1,58), %hp = $gettok(%pk,15,58), %type = $basestat(%name,type), %status = $gettok($gettok(%pk,16,58),1,59), %trait = $gettok(%pk,6,58), %thp = $gettok(%pk,9,58), %spd =$gettok(%pk,12,58)

      ; This is the time we set the "choosing score". Here the npc take a look on the pok�mon's HP, status, effectiveness, and more stuff.
      ; The less scored pok�mon will be choosed.

      var %y = 1, %total = 0
      while ($gettok($gettok(%memory,3,59),%y,58)) {
        var %e = $effective(%ID,$gettok($gettok(%memory,3,59),%y,58),%type,%trait).n

        var %total = $calc(%total + %e)
        inc %y
      }

      var %e = $round($calc(1 - (%hp / %thp)),2), %total = $calc(%total + %e)
      var %e = $round($calc(1 - (%spd / 500)),2), %total = $calc(%total + %e)
      if (%status == Sleep) { var %total = $calc(%total + 8) }
      if (%status == Frozen) { var %total = $calc(%total + 10) }

      var %order = $addtok(%order,$base($calc(%total * 100),10,10,4) %m,58)

      inc %x
    }

    if (%order) {
      var %order = $sorttok(%order,58,n), %choose = $gettok($gettok(%order,1,58),2,32)
      if ($prop == n) { return %choose }
      sset [ [ B. ] $+ [ %ID ] $+ [ .TPoke. ] $+ [ %n ] ] $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ])
      sset [ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ] $gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Team [ $+ [ %choose ] $+ ] : ] $+ [ %team ] ]),1,58)

      sset [ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %n ] ] Switch; $+ %choose
      sset [ [ B. ] $+ [ %ID ] $+ [ .Target. ] $+ [ %n ] ] $battle.target(%ID,%n).rand
      return $true
    }
    else { return $false }
  }
  else { return $false }
}

alias effect.target {
  var %x = 1, %n = $1, %t = 0
  while ($gettok(%n,%x,32)) {
    var %effect = $gettok(%n,%x,32), %target = $gettok(%n,$calc(%x + 1),32)
    if ($count(%effect,+)) || ($count(%effect,-)) { if (%target != self) { inc %t } }
    else { inc %t }
    var %x = $calc(%x + 2)
  }
  if (%t) { return $true } | else { return $false }
}

alias istat {
  var %ID = $1, %n = $2, %stat = $3, %type = $4, %chit = $5, %move = $v([ [ B. ] $+ [ %ID ] $+ [ .Move. ] $+ [ %n ] ])

  if (%stat == ATK) {
    var %atk = $v([ [ B. ] $+ [ %ID ] $+ [ .ATK. ] $+ [ %n ] ]), %batk = $v([ [ B. ] $+ [ %ID ] $+ [ .B.Atk. ] $+ [ %n ] ])
    if (%chit) && (%batk < 0) { var %batk = 0 }
    var %batk = $iif(%move == Rage,$calc(%batk + $gettok($v([ [ B. ] $+ [ %ID ] $+ [ .Rage. ] $+ [ %n ] ]),2,58)),%batk), %batk = $iif(%batk > 6,6,%batk),%atk = $calc(%atk * $statstage($iif(!%batk,0,%batk)))
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Choice Band) { var %atk = $int($calc(%atk * $statstage(1))) }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Guts) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %n ] ])) { var %atk = $calc(%atk * 1.5) } }
    elseif ($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %n ] ]) == Burn) { var %atk = $calc(%atk / 2) }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Huge Power) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Pure Power) { var %atk = $calc(%atk * 2) }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Hustle) { var %atk = $calc(%atk * 1.5) }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .HelpingHand. ] $+ [ %n ] ])) { var %atk = $calc(%atk * 1.5) }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Thick Club) && ($findtok(Cubone:Marowak,$v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]),0,58)) { var %atk = $calc(%atk * 2) }
    if (%type) && (%move != Struggle) && ($type(%type) == Normal) {
      if (%type isin $v([ [ B. ] $+ [ %ID ] $+ [ .Type. ] $+ [ %n ] ])) { var %atk = $calc(%atk * 1.5) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Black Belt) && (%type == Fighting) { var %atk = $calc(%atk * 1.1) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Hard Stone) && (%type == Rock) { var %atk = $calc(%atk * 1.1) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Metal Coat) && (%type == Steel) { var %atk = $calc(%atk * 1.1) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Poison Barb) && (%type == Poison) { var %atk = $calc(%atk * 1.1) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Sharp Beak) && (%type == Flying) { var %atk = $calc(%atk * 1.1) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Silk Scarf) && (%type == Normal) { var %atk = $calc(%atk * 1.1) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Silverpowder) && (%type == Bug) { var %atk = $calc(%atk * 1.1) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Soft Sand) && (%type == Ground) { var %atk = $calc(%atk * 1.1) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Spell Tag) && (%type == Ghost) { var %atk = $calc(%atk * 1.1) }
    }
    var %r = $int(%atk) | return $iif(%r,%r,1)
  }
  if (%stat == DEF) {
    var %def = $v([ [ B. ] $+ [ %ID ] $+ [ .DEF. ] $+ [ %n ] ]), %bdef = $v([ [ B. ] $+ [ %ID ] $+ [ .B.Def. ] $+ [ %n ] ]), %def = $calc(%def * $statstage($iif(!%bdef,0,%bdef)))
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Marvel Scale) && ($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %n ] ])) { var %def = $calc(%def * 1.5) }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Reflect. ] $+ [ $battle.side(%n) ] ])) { var %def = $calc(%def * 2) }
    var %r = $int(%def) | return $iif(%r,%r,1)
  }
  if (%stat == SATK) {
    var %satk = $v([ [ B. ] $+ [ %ID ] $+ [ .SATK. ] $+ [ %n ] ]), %bsatk = $v([ [ B. ] $+ [ %ID ] $+ [ .B.SAtk. ] $+ [ %n ] ])
    if (%bsatk < 0) && (%chit) { var %bsatk = 0 }
    var %satk = $int($calc(%satk * $statstage($iif(!%bsatk,0,%bsatk))))
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Deepseatooth) && ($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) == Clamperl) { var %satk = $calc(%satk * 2) }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Soul Dew) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) == Latias) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) == Latios) { var %satk = $calc(%satk * 1.5) } }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Light Ball) && ($findtok(Pikachu,$v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]),0,58)) { var %satk = $calc(%satk * 2) }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Minus) && ($battle.team(%ID,%n).left > 1) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ $battle.team(%ID,%n).num ] ]) == Plus) { var %satk = $calc(%satk * 1.5) } }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Plus) && ($battle.team(%ID,%n).left > 1) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ $battle.team(%ID,%n).num ] ]) == Minus) { var %satk = $calc(%satk * 1.5) } }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .HelpingHand. ] $+ [ %n ] ])) { var %satk = $calc(%satk * 1.5) }
    if (%type) && ($type(%type) != Normal) {
      if (%type isin $v([ [ B. ] $+ [ %ID ] $+ [ .Type. ] $+ [ %n ] ])) { var %satk = $calc(%satk * 1.5) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Blackglasses) && (%type == Dark) { var %satk = $calc(%satk * 1.1) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Charcoal) && (%type == Fire) { var %satk = $calc(%satk * 1.1) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Dragon Fang) && (%type == Dragon) { var %satk = $calc(%satk * 1.1) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Magnet) && (%type == Electric) { var %satk = $calc(%satk * 1.1) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Miracle Seed) && (%type == Grass) { var %satk = $calc(%satk * 1.1) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Mystic Water) && (%type == Water) { var %satk = $calc(%satk * 1.1) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Nevermeltice) && (%type == Ice) { var %satk = $calc(%satk * 1.1) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Sea Incense) && (%type == Water) { var %satk = $calc(%satk * 1.1) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Twistedspoon) && (%type == Psychic) { var %satk = $calc(%satk * 1.1) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Charged. ] $+ [ %n ] ])) && (%type == Electric) { var %satk = $calc(%satk * 2) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Flashed. ] $+ [ %n ] ]) == ON) && (%type == Fire) { var %satk = $calc(%satk * 1.5) }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Weather ] ]) == Sunny Day) { if (%type == Fire) { var %power = $calc(%satk * 1.5) } | if (%type == Water) { var %satk = $calc(%satk * 0.5) } }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Weather ] ]) == Rain Dance) { if (%type == Fire) { var %power = $calc(%satk * 0.5) } | if (%type == Water) { var %satk = $calc(%satk * 1.5) } }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Overgrow) && (%type == Grass) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]) <= $int($calc($v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %n ] ]) / 3))) { var %satk = $calc(%satk * 1.5) } }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Blaze) && (%type == Fire) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]) <= $int($calc($v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %n ] ]) / 3))) { var %satk = $calc(%satk * 1.5) } }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Torrent) && (%type == Water) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]) <= $int($calc($v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %n ] ]) / 3))) { var %satk = $calc(%satk * 1.5) } }
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Swarm) && (%type == Bug) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]) <= $int($calc($v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %n ] ]) / 3))) { var %satk = $calc(%satk * 1.5) } }
    }
    var %r = $int(%satk) | return $iif(%r,%r,1)
  }
  if (%stat == SDEF) {
    var %sdef = $v([ [ B. ] $+ [ %ID ] $+ [ .SDEF. ] $+ [ %n ] ]), %bsdef = $v([ [ B. ] $+ [ %ID ] $+ [ .B.SDef. ] $+ [ %n ] ]), %sdef = $int($calc(%sdef * $statstage($iif(!%bsdef,0,%bsdef))))
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Soul Dew) { if ($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) == Latias) || ($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) == Latios) { var %sdef = $calc(%sdef * 1.5) } }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Deepseascale) && ($v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) == Clamperl) { var %sdef = $calc(%sdef * 2) }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .LightScreen. ] $+ [ $battle.side(%n) ] ])) { var %sdef = $calc(%sdef * 2) }
    if (%type) && ($type(%type) != Normal) {
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Thick Fat) { if (%type == Fire) || (%type == Ice) { var %sdef = $calc(%sdef * 2) } }
    }
    var %r = $int(%sdef) | return $iif(%r,%r,1)
  }
  if (%stat == SPD) {
    var %spd = $calc($v([ [ B. ] $+ [ %ID ] $+ [ .SPD. ] $+ [ %n ] ]) * $statstage($v([ [ B. ] $+ [ %ID ] $+ [ .B.Spd. ] $+ [ %n ] ])))
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Status. ] $+ [ %n ] ]) == Paralyz) { var %spd = $calc(%spd * 0.25) }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]) == Macho Brace) { var %spd = $calc(%spd / 2) }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Chlorophyll) && ($v([ [ B. ] $+ [ %ID ] $+ [ .Weather ] ]) == Sunny Day) { var %spd = $calc(%spd * 2) }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Swift Swim) && ($v([ [ B. ] $+ [ %ID ] $+ [ .Weather ] ]) == Rain Dance) { var %spd = $calc(%spd * 2) }
    var %r = $int(%spd) | return $iif(%r,%r,1)
  }
  if (%stat == ACC) {
    var %acc = $accstage($v([ [ B. ] $+ [ %ID ] $+ [ .B.Acc. ] $+ [ %n ] ]))
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Coumpound Eyes) { var %acc = $calc(%acc * 1.3) }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Hustle) { var %acc = $calc(%acc * 0.8) }
    return %acc
  }
  if (%stat == EV) {
    var %ev = $evstage($v([ [ B. ] $+ [ %ID ] $+ [ .B.Evason. ] $+ [ %n ] ]))
    if ($findtok(Lax Incense:Brightpowder,$v([ [ B. ] $+ [ %ID ] $+ [ .Hold. ] $+ [ %n ] ]),0,58)) { var %ev = $calc(%ev * $evstage(1)) }
    return %ev
  }
}


alias battle.switch {
  var %ID = $1, %s = 1 | if ($2) { var %order = $2 } | else { var %order = $battle.order(%ID).s }
  while ($gettok(%order,%s,58)) {
    var %n = $gettok(%order,%s,58), %trait = $v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) | uset [ [ B. ] $+ [ %ID ] $+ [ .Switch. ] $+ [ %n ] ]
    sset [ [ B. ] $+ [ %ID ] $+ [ .SpeedBoost. ] $+ [ %n ] ] 1
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Forecast) { battle.c.weather %ID }
    if ($findtok(Air Lock:Cloud Nine,%trait,0,58)) && (!$v([ [ B. ] $+ [ %ID ] $+ [ .NoWeather ] ])) { sset [ [ B. ] $+ [ %ID ] $+ [ .NoWeather ] ] ON | if ($v([ [ B. ] $+ [ %ID ] $+ [ .Weather ] ])) { msgfight %ID $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Weather ] ]) $lb $+ foi interrompido pelo $bb $+ %trait $+ $lb $+ ! | uset [ [ B. ] $+ [ %ID ] $+ [ .Weather ] ] | battle.c.weather %ID } }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Damp) { sset [ [ B. ] $+ [ %ID ] $+ [ .Damp ] ] ON }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Intimidate) {
      var %tt = $battle.target(%ID,%n).both, %x = 1 | while ($gettok(%tt,%x,58)) {
        var %t = $gettok(%tt,%x,58) | inc %x
        if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %t ] ]) != Clear Body) && ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %t ] ]) != Hyper Focus) && ($calc($v([ [ B. ] $+ [ %ID ] $+ [ .B.Atk. ] $+ [ %t ] ]) - 1) >= -6) { sset [ [ B. ] $+ [ %ID ] $+ [ .B.Atk. ] $+ [ %t ] ] $calc($v([ [ B. ] $+ [ %ID ] $+ [ .B.Atk. ] $+ [ %t ] ]) - 1) | msgfight %ID $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Player. ] $+ [ %t ] ]) $+ 's $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %t ] ]) $lb $+ diminuiu ataque com $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) $+ 's $v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) $+ $lb $+ ! }
      }
    }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Trace) {
      var %t = $battle.target(%ID,%n).rand
      if (%t) {
        msgfight %ID $bb $+ $+(:player,%n,;) $+ 's $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) $lb $+ tra�ou $bb $+ $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %t ] ]) $+ 's $v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %t ] ]) $+ $lb $+ !
        sset [ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ] $v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %t ] ])
      }
    }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Spikes ] $+ [ $battle.side(%n) ] ])) {
      if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) != Levitate) && (Flying !isin $v([ [ B. ] $+ [ %ID ] $+ [ .Type. ] $+ [ %n ] ])) {
        var %spikes = $v([ [ B. ] $+ [ %ID ] $+ [ .Spikes ] $+ [ $battle.side(%n) ] ]), %x = $round.up($calc($v([ [ B. ] $+ [ %ID ] $+ [ .HP. ] $+ [ %n ] ]) / $iif(%spikes == 1,16,$iif(%spikes == 2,8,4))))
        sset [ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ] $calc($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]) - %x) | if ($v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ]) < 0) { sset [ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ] 0 }
        msgfight %ID $bb $+ $+(:player,%n,;) $+ 's $v([ [ B. ] $+ [ %ID ] $+ [ .Poke. ] $+ [ %n ] ]) $lb $+ machucou-se nos espinhos!
        if (!$v([ [ B. ] $+ [ %ID ] $+ [ .HPAtual. ] $+ [ %n ] ])) { var %fnt.spikes = 1 }
      }
    }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Drought) { var %changeweather = Sunny Day }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Drizzle) { var %changeweather = Rain Dance }
    if ($v([ [ B. ] $+ [ %ID ] $+ [ .Trait. ] $+ [ %n ] ]) == Sand Stream) { var %changeweather = Sandstorm }
    inc %s
  }
  if ($v([ [ B. ] $+ [ %ID ] $+ [ .NoWeather ] ])) {
    if (!$checkfoe.left(%ID,%n,Trait.,Cloud Nine,a)) && (!$checkfoe.left(%ID,%n,Trait.,Air Lock,a)) { uset [ [ B. ] $+ [ %ID ] $+ [ .NoWeather ] ] }
  }
  if (%changeweather) && (!$v([ [ B. ] $+ [ %ID ] $+ [ .NoWeather ] ])) {
    if (%changeweather != $v([ [ B. ] $+ [ %ID ] $+ [ .Weather ] ])) {
      if (%changeweather == Sunny Day) { msgfight %ID $lb $+ A luz do sol agora brilha mais forte! }
      elseif (%changeweather == Rain Dance) { msgfight %ID $lb $+ Uma forte chuva acaba de come�ar! }
      elseif (%changeweather == Sandstorm) { msgfight %ID $lb $+ Uma tempestade de areia foi iniciada! }
      battle.c.weather %ID
    }
    sset [ [ B. ] $+ [ %ID ] $+ [ .Weather ] ] %changeweather | sset [ [ B. ] $+ [ %ID ] $+ [ .WeatherTurns ] ] 999
  }
  var %changeweather

  if (%fnt.spikes) { return $true } | else { return $false }
}
