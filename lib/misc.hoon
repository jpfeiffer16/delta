=/  outunit  (list $?(@ud tape))
|%
++  fizz
  |=  count=@ud
  ^-  outunit
  =/  n  1
  =/  output=outunit  ~
  |-  ?:  =(count 0)
    output
  %=  $
    output  (snoc output ?:(=((mod n 3) 0) "fizz" n))
    n       +(n)
    count   (sub count 1)
  ==
++  buzz
  |=  count=@ud
  ^-  outunit
  =/  n  1
  =/  output=outunit  ~
  |-  ?:  =(count 0)
    output
  %=  $
    output  (snoc output ?:(=((mod n 5) 0) "buzz" n))
    n       +(n)
    count   (sub count 1)
  ==
++  fizzbuzz
  |=  count=@ud
  ^-  outunit
  =/  n  1
  =/  output=outunit  ~
  |-  ?:  =(count 0)
    output
  =/  tp
    ?:  ?&(=((mod n 5) 0) =((mod n 3) 0))
      "fizzbuzz"
    ?:  =((mod n 3) 0)
      "fizz"
    ?:  =((mod n 5) 0)
      "buzz"
    n
  %=  $
    output  (snoc output tp)
    n       +(n)
    count   (sub count 1)
  ==
--
