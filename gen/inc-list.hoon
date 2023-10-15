|=  l=(list @ud)
^-  (list @ud)
=/  output=(list @ud)  ~
|-  ?:  =(l ~)
  output
%=  $
  l       +:l
  output  (weld output ~[+(-:l)])
==
