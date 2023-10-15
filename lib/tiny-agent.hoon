/+  ntw=number-to-words
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


/+  ntw=number-to-words
ntw
