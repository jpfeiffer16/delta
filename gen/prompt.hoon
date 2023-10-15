/-  sole
/+  generators
=,  [sole generators]
:-  %ask
|=  *
:: ^-  (sole-result (cask tang))
=/  msg=tape  ~
%+  print  leaf+?~(msg "this is prompt" msg)
=/  out  %+  prompt  [%& %prompt "prompt: "]
|=  i=tape
:: =/  out  "test"
%+  produce  %tang
:~(leaf+i)
:: ?:  =(i "exit")  :~(leaf+"You got it!")
:: %=  $
::   msg  "try again"
:: ==
:: :~([%leaf i])


:: !!
:: out
%+  produce  %tang
:~(leaf+<out>)
