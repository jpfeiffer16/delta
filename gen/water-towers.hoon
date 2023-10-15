::  water-towers.hoon
::  Your code goes here
::
!:
|=  input=(list @ud)
=/  len  (lent input)
?:  (lte len 2)  0  :: If you only have two, you can't hold any water
=/  index  0
=/  tower-list  |-  ?~  input  ~
[i=[index i.input] t=$(input t.input, index +(index))]

:: NOTE: possibly use ++fand here?
=/  towers  %-  malt  tower-list :: create a (map @ud @ud) where it is (map <postion> <height>)

:: assume that leftmost and rightmost towers are bounds
:: for each tower:
::  * find the highest tower to the left
::  * find the highest tower to the right
::  * fill to the top of the smaller of the two
::    if it is greater than the current tower
=/  i       1  :: start from tower 2
=/  filled  0
|-
?:  =(i (sub len 1))  filled:: stop at tower n-1
=/  tower  (need (~(get by towers) i))

=/  left  %+  skim  tower-list  |=  [k=@ud *]  (lth k i)
=/  highest-left
%-  head
  %+  sort
    %+  turn  left  |=(t=[* v=@ud] v.t)
  gth

=/  right  %+  skim  tower-list  |=  [k=@ud *]  (gth k i)
=/  highest-right
%-  head
  %+  sort
    %+  turn  right  |=(t=[* v=@ud] v.t)
  gth

?:  ?&((gth highest-left tower) (gth highest-right tower))
  =/  biggest-bank  %-  head
    %+  sort  ~[highest-left highest-right]  lth
  %=  $
    filled  %+  add
              %+  sub
                biggest-bank
              tower
            filled
    i       +(i)
  ==
$(i +(i))
