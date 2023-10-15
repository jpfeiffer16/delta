!:
:-  %say
|=  $:  [* eny=@uv *]
        [sides=@ud ~]
        [dice=@ud ~]
    ==
:-  %noun
?:  =(dice *@ud)  $(dice 1)
:: TODO: Do this with a turn
=/  list=(list @ud)  *(list @ud)
=/  rng              ~(. og eny)
|-
^-  (^list @ud)
?:  =(dice 0)  list
=^  die-roll=@ud  rng  (rads:rng sides)
=^  die-roll  +(die-roll) :: TODO: Be better...
%=  $
  rng   rng
  list  [die-roll list]
  dice  (dec dice)
==
