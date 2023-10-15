|=  l=(list @ud)
^-  @ud
?.  =((lent l) 7)  !!
:: ?:  (not =((lent l) 7))  !!
=/  sum  0
|-
~&  l
?:  =(l ~)
  sum
%=  $
  l    +:l
  sum  (add sum -:l)
==
