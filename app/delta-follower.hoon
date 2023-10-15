/-  *delta
/+  default-agent, dbug
|%
+$  state-zero
  $:  [%zero numbers=(list @)]
  ==
+$  card  card:agent:gall
--
%-  agent:dbug
=|  state-zero
=*  state  -
^-  agent:gall
|_  =bowl:gall
+*  this     .
    default  ~(. (default-agent this %|) bowl)
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?>  ?=(%noun mark)
  =/  action  !<(?([%sub =@p] [%unsub =@p]) vase)
  ?-    -.action
      %sub
    :_  this
    [%pass /values-wire %agent [p.action %delta] %watch /values]~
  ::
      %unsub
    :_  this
    [%pass /values-wire %agent [p.action %delta] %leave ~]~
  ==
::
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  ?>  ?=([%values-wire ~] wire)
  ?+    -.sign  (on-agent:default wire sign)
      %watch-ack
    ?~  p.sign
      ((slog '%delta-follower: subscribe succeeded!' ~) `this)
    ((slog '%delta-follower: subscribe failed!' ~) `this)
  ::
      %kick
    %-  (slog '%delta-follower: Got kick, resubscribing...' ~)
    :_  this
    [%pass /values-wire %agent [src.bowl %delta] %watch /values]~
  ::
    %fact
    ~&  >>  fact+p.cage.sign
    ?>  ?=(%delta-update p.cage.sign)
    ~&  >>  !<(update q.cage.sign)
    :: `this
    =/  result  !<(update q.cage.sign)
    ?-  -.result
        %init
      [~ this(numbers values.result)]
    ::
        %push
      [~ this(numbers [value.result numbers])]
    ::
        %pop
      :: ?~  numbers  [~ this]

      [~ this(numbers (slag 1 numbers))]
    ==
    :: [~ this(numbers [value.result numbers])]
  ==
++  on-watch  on-watch:default
++  on-peek   on-peek:default
++  on-init   on-init:default
++  on-save   !>(state)
++  on-load
  |=  old=vase
  ^-  (quip card _this)
  `this(state !<(state-zero old))
++  on-arvo   on-arvo:default
++  on-leave  on-leave:default
++  on-fail   on-fail:default
--

