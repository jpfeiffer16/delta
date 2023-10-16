/+  *test
/=  delta  /app/delta
|%
++  test-delta
  =|  run=@ud
  =^  move  delta  (~(on-poke delta (bowl run)) %delta-action !>([%push ~zod 10.000]))
  =+  !<(=state on-save:delta)
  ;:  weld
  %+  expect-eq
    !>  `(list @)`~[10.000]
    !>  values.state
  ==

:: Re-impl state type here since I don't currently wish to opt
:: to figure out putting it in /sur and doing it correctly.
+$  state
  $:  [%0 values=(list @)]
  ==
++  bowl
  |=  run=@ud
  ^-  bowl:gall
  :*  [~zod ~zod %hark-store]
    [~ ~]
    [run `@uvJ`(shax run) (add (mul run ~s1) *time) [~zod %your-desk ud+run]]
  ==
--
