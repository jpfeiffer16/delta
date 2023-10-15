/+  ta=tiny-agent
!:
:-  %say
|=  *
:-  %noun
=/  agent  on-init:tiny-agent:ta
=/  agent  (on-poke:agent [%add 3])
=/  agent  (on-poke:agent [%add 4])
=/  agent  (on-poke:agent [%remove 3])
=/  agent  (on-poke:agent [%add 5])
=/  agent  (on-poke:agent [%re-compute ~])
on-peek:agent


=*
=/


=/  test-core
|%
  :: +*  this  123
  +* test -.-
  ++  test-gate
    |= [a=@ud b=@t]
    test
  ==

:: =*  test  -.-

(test-gate:test-core 1 2)
:: (test-gate:test-core |=(~ this))

:: +* this .

:: =* test -.-
:: ++ test-gate
:: |= [a=@ud b=@t]
:: test


:: =* test -.-
:: =/ test-gate |= [a=@ud b=@t] test
:: (test-gate [1 'a'])
