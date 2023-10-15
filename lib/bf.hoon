|_  $:  input=tape
        code=(map @ud @t)
        code-ptr=@ud
        mem-ptr=@ud
        mem=(map @ud @ud)
    ==
:: TODO: Use this
+$  ast-node
  $?
    %hep
    %lus
    %gal
    %gar
    %sel
    %ser
    %com
    %dot
  ==
++  load-program
  |=  [program=tape]
  =/  ci  program
  =/  i   0
  =/  c   *(map @ud @t)
  |-  ?~   program
    .(code c)
  %=  $
    c        (~(put by c) i -:program)
    i        +(i)
    program  +:program
  ==
++  load-input
  |=  [input=tape]
  .(^input input)
++  run
  |=  *
  /=  output  *tape
  /=  len     (lent ~(tap by code))
  |-  ?:  (gth code-ptr len)
    [output .]

++  on-peek  [code in-ptr mem-ptr mem]
--
