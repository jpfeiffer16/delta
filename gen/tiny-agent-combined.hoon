/+  ntw=number-to-words
!:
:-  %say
|=  *
:-  %noun
=>
:: Toy core that will add a set of `@ud`s
:: together and compute the sum, setting
:: the result to `com` as a `tape`.
|%
++  tiny-agent
  |_  [state=(set @ud) com=tape]
  +$  mar  ?(%add %remove %re-compute)
  ++  on-init  .(state *(set @ud), com *tape)
  ++  on-poke
    |=  [mar=mar i=?(@ud ~)]
    ?-  mar
      %add     .(state (~(put in state) `@ud`i))
      %remove  .(state (~(del in state) `@ud`i))
      %re-compute  %=  .
        com  (need (to-words:eng-us:ntw (~(rep in state) add)))
      ==
    ==
  ++  on-peek
    [state com]
  --
--
=/  agent  on-init:tiny-agent
=/  agent  (on-poke:agent [%add 3])
=/  agent  (on-poke:agent [%add 4])
=/  agent  (on-poke:agent [%remove 3])
=/  agent  (on-poke:agent [%add 5])
=/  agent  (on-poke:agent [%re-compute ~])
on-peek:agent
