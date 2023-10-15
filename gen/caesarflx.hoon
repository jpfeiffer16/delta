!:
|=  [msg=tape steps=@ud]
=<
=/  msg  (cass msg)
(shift msg steps)
:: :-  (shift msg steps)
::     (unshift msg steps)
::
|%

::  Shift a message to the right.
::
++  shift
  |=  [message=tape steps=@ud]
  ^-  tape
  (operate message steps)

::  Shift a message to the left.
::
:: ++  unshift
::   |=  [message=tape steps=@ud]
::   ^-  tape
::   (operate message (decoder steps))

++  operate
  |=  [message=tape steps=@ud]
  ^-  tape
  %+  turn  message
  |=  c=@t
  ?:  =(c ' ')  c
  `@t`+(`@ud`c)
--
