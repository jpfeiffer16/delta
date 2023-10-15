:: /-    sole
:: :: /+    mal
:: =,  [sole]
::
:: :-  %ask
:: |=  *
:: ^-  (sole-result (cask tang))
::
:: |-
::
:: %+  sole-lo  [%.y %show "user> "]
:: %+  sole-go  (most (easy ~) qit)
:: |=  tape
:: =/  res  1
:: %+  sole-yo  leaf+res
:: ^$  ::  recurse



:: /-  sole
:: /+  generators
:: !:
:: :-  %say
:: |=  *
:: :: :-  %noun
:: :: ^-  (sole-result.sole (cask tang))
:: %+  print.generators  leaf+"test print"
:: :: %+  prompt.generators  [%& %prompt "test: "]
:: :: |=  t=tape
:: :: %+  produce.generators  %tang
:: :~(leaf+"test")



/-  sole
/+  generators
=,  [sole generators]
:-  %ask
|=  [[* eny=@uv *] * *]
^-  (sole-result (cask tang))
|-
%+  print  leaf+"Guess a number from 1-100"
%+  prompt  [%& %prompt "number: "]
|=  t=tape
%+  produce  %tang
=/  guess-this  +((~(rad og eny) 100))
=/  num         (rust t dim:ag)
?~  num
  :~(leaf+"Error: could not parse number. Try again.")
=/  num  (need num)
?:  =(num guess-this)
  :~(leaf+"You got it!")
  :: 1
?:  (gth guess-this num)
  %+  print  leaf+"To low"
  ^$
  :: :~(leaf+"To low")
  :: 2
:: :~(leaf+"To high")
%+  print  leaf+"To high"
^$
:: 3
