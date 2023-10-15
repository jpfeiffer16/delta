:: boxcar.hoon - implements a boxcar
:: function
|=  [x=@ud]
^-  @ud
?:  ?&((lte x 5) (gth x 3))
  1
0
