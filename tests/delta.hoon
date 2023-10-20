/-  *delta
/+  *test
/=  delta  /app/delta
|%
++  test-delta-poke-our-ship-push
  =|  run=@ud
  :: push
  =^  move1  delta  (~(on-poke delta (bowl run)) %delta-action !>([%push ~zod 10]))
  =^  move2  delta  (~(on-poke delta (bowl run)) %delta-action !>([%push ~zod 20]))
  =+  !<(state1=state on-save:delta)
  :: pop
  =^  move3  delta  (~(on-poke delta (bowl run)) %delta-action !>([%pop ~zod]))
  =+  !<(state2=state on-save:delta)

  ;:  weld
  %+  expect-eq
    !>  `(list @)`~[20 10]
    !>  values.state1

  %+  expect-eq
    !>  ~[`card:agent:gall`[%give %fact ~[/values] %delta-update !>(`update`[%push ~zod 10])]]
    !>  move1

  %+  expect-eq
    !>  ~[10]
    !>  values.state2
  ==
++  test-delta-poke-other-ship
  =|  run=@ud
  =^  move  delta  (~(on-poke delta (bowl run)) %delta-action !>([%push ~nec 20]))
  =+  !<(=state on-save:delta)
  ;:  weld
  %+  expect-eq
    !>  `(list @)`~
    !>  values.state
  ==

++  test-delta-watch-success
  =|  run=@ud
  =^  move1  delta  (~(on-poke delta (bowl run)) %delta-action !>([%push ~zod 20.000]))
  =^  move2  delta  (~(on-watch delta (bowl run)) /values)
  :: ~&  move2
  ~&  `(list card)`~[[%give %fact ~ %delta-update ~]]
  %+  expect-eq
    !>  %|  !>  %|
    :: !>  `(list card)`~[[%give %fact ~ %delta-update !>(`update`[%init `(list @)`~[20.000]])]]
    :: !>  move2

:: Re-impl state type here since I don't currently wish to opt
:: to figure out putting it in /sur and doing it correctly.
+$  state
  $:  [%0 values=(list @)]
  ==
:: ++  bowl
::   |=  run=@ud
::   ^-  bowl:gall
::   :*  [~zod ~zod %hark-store]
::     [~ ~]
::     [run `@uvJ`(shax run) (add (mul run ~s1) *time) [~zod %your-desk ud+run]]
::   ==
++  bowl   |=  run=@ud  *bowl:gall
:: ++  bowl  *bowl:gall
--

