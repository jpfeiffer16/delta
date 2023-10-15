::  abc-blocks.hoon
::
!:
|=  [blocks=(list (pair @t @t)) w=@t]

:: Helper functions
:: TODO: Use compose ops to do this
=/  ll  |=(a=@ ?.(&((gte a 'A') (lte a 'Z')) a (add 32 a)))

=/  check-letter
|=  [list=(list (pair @t @t)) letter=@t]
^-  (^list (pair @t @t))
=/  result
  %+  skim  `(^list (pair @t @t))`list
  |=  s=(pair @t @t)
  ?|(=(p.s letter) =(q.s letter))
?~  result
  ~
:~((head result))


=/  word  (cass (trip w))
:: No spaces
?.  .=
  ~
%+  skim  word  |=  a=@t  !|(&((gte a 'A') (lte a 'Z')) &((gte a 'a') (lte a 'z')))
  !!
=/  blocks  ^-  (list (pair @t @t))
(turn blocks |=(p=[i=@t t=@t] [p=(ll i.p) q=(ll t.p)]))
=/  letters  ^-  (list @t)  %-  zing
  (turn blocks |=(p=(pair @t @t) ~[p.p q.p]))
:: Make sure there is a full alphabet
?:  (lth ~(wyt in (silt letters)) 26)  !!
|-  ?~  word  %&
=/  i  %+  find  (check-letter blocks -:word)  blocks
?~  i  %|
%=  $
  blocks  (oust [(need i) 1] blocks)
  word     +:word
==
