|%
++  factorial
  |:  n=`@ud`1
  ^-  @ud
  ?:  ?|(=(n 0) =(n 1))
    1
  (roll (gulf 1 n) mul)
--
