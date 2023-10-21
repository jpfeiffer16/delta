/-  *delta
/+  *test
/=  delta-follower  /app/delta-follower
|%
++  bowl  *bowl:gall
--
|%
++  each  |=  ~
  =^  move1  delta-follower  (~(on-poke delta-follower bowl) %noun !>([%sub ~nec]))
  =^  move2  delta-follower  (~(on-poke delta-follower bowl) %noun !>([%unsub ~nec]))
  [sub=move1 unsub=move2]
++  test-poke-sub
  :: TODO: How to destructure these? In JS something like this:
  :: ```
  :: let { move1, move2 } = each();
  :: ```
  =/  cards  (each)
  ;:  weld
  %+  expect-eq
    !>(~[[%pass /values-wire %agent [~nec %delta] %watch /values]])
    !>(sub.cards)
  ==
++  test-poke-unsub
  :: TODO: How to destructure these? In JS something like this:
  :: ```
  :: let { move1, move2 } = each();
  :: ```
  =/  cards  (each)
  ;:  weld
  %+  expect-eq
    !>(~[[%pass /values-wire %agent [~nec %delta] %leave ~]])
    !>(unsub.cards)
  ==
++  test-agent-default
  ;:  weld
  %-  expect-fail
    |.((~(on-agent delta-follower bowl) /values-wire *sign:agent:gall))
  ==
++  test-agent-kick
  =^  move1  delta-follower  (~(on-agent delta-follower bowl) /values-wire [%kick ~])
  ;:  weld
  %+  expect-eq
    !>(~[[%pass /values-wire %agent [~zod %delta] %watch /values]])
    !>(move1)
  ==
--
