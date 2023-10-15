:: library for doing some stuff on tapes
|%
++  split-tape
  |=  [input=tape]
  ^-  wall
  ?:  =((lent input) 0)
    ~&  >>>  "To short!"
    !!
  =/  output=(list tape)  ~
  =/  prev=cord           ''
  =/  result=(list tape)
    |-  ?:  =((lent input) 0)
      output
    =/  char=cord             -:input
    =/  is-space=$?(%.y %.n)  =(char ' ')
    %=  $
      input   +:input
      output  ?:  ?&(?!(is-space) ?|(=(prev ' ') =(output ~)))
                [(trip char) output]
              ?:  is-space
                output
              [(snoc `tape`-:output char) `wall`+:output]
      prev    char
    ==
  (flop result)
/-  ta=tiny-agent

++  count-elements
  |=  input=tape
  ^-  @ud
  (lent (split-tape input))
--
