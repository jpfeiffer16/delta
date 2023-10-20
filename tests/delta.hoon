/-  *delta
/+  *test
/=  delta  /app/delta
|%
++  test-delta-poke-our-ship-push
  :: push
  =^  move1  delta  (~(on-poke delta bowl) %delta-action !>([%push ~zod 10]))
  =^  move2  delta  (~(on-poke delta bowl) %delta-action !>([%push ~zod 20]))
  =+  !<(state1=state on-save:delta)
  :: pop
  =^  move3  delta  (~(on-poke delta bowl) %delta-action !>([%pop ~zod]))
  =+  !<(state2=state on-save:delta)

  ;:  weld
  :: push - state
  %+  expect-eq
    !>  `(list @)`~[20 10]
    !>  values.state1

  :: push - fact
  %+  expect-eq
    !>  ~[`card:agent:gall`[%give %fact ~[/values] %delta-update !>(`update`[%push ~zod 10])]]
    !>  move1

  :: pop - fact
  %+  expect-eq
    !>  ~[`card:agent:gall`[%give %fact ~[/values] %delta-update !>(`update`[%pop ~zod])]]
    !>  move3

  :: pop - state
  %+  expect-eq
    !>  ~[10]
    !>  values.state2
  ==

++  test-delta-poke-other-ship
  =|  run=@ud
  :: push
  =^  move1  delta  (~(on-poke delta bowl) %delta-action !>([%push ~nec 10]))
  =^  move2  delta  (~(on-poke delta bowl) %delta-action !>([%push ~nec 20]))
  =+  !<(state1=state on-save:delta)
  :: pop
  =^  move3  delta  (~(on-poke delta bowl) %delta-action !>([%pop ~nec]))
  =+  !<(state2=state on-save:delta)

  ;:  weld
  :: push - state
  %+  expect-eq
    !>  `(list @)`~
    !>  values.state1

  :: push - pass
  %+  expect-eq
    !>  ~[`card:agent:gall`[%pass /pokes %agent [~nec %delta] %poke %delta-action !>([%push ~nec 10])]]
    !>  move1

  :: pop - pass
  %+  expect-eq
    !>  ~[`card:agent:gall`[%pass /pokes %agent [~nec %delta] %poke %delta-action !>([%pop ~nec])]]
    !>  move3

  :: pop - state
  %+  expect-eq
    !>  `(list @)`~
    !>  values.state2
  ==

++  test-delta-watch-success
  =|  run=@ud
  =^  move1  delta  (~(on-poke delta bowl) %delta-action !>([%push ~zod 20]))
  =^  move2  delta  (~(on-watch delta bowl) /values)
  %+  expect-eq
    !>  ~[`card:agent:gall`[%give %fact ~ %delta-update !>(`update`[%init ~[20]])]]
    !>  move2

:: Re-impl state type here since I don't currently wish to opt
:: to figure out putting it in /sur and doing it correctly.
+$  state
  $:  [%0 values=(list @)]
  ==
:: TODO: Simplify this
++  bowl  *bowl:gall
--

