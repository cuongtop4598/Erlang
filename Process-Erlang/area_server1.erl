%%%-------------------------------------------------------------------
%%% @author top
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Sep 2021 4:35 PM
%%%-------------------------------------------------------------------
-module(area_server1).

%% API
-export([loop/0,rpc/2]).

%% Function

rpc(Pid, Request) ->
  Pid ! {self(), Request},  %% self() == Pid of client process = Pid of client who call this function
  receive
    Response ->
      Response
  end.
loop() ->
  receive
    %% {Pid_client, data } -> block
    {From, {rectangle, Width, Ht}} ->
      From ! Width * Ht, %% sent to PId = From
      loop();
    {From, {circle, R}} ->
      From ! 3.14159 * R * R,
      loop();
    {From, Other} ->
      From ! {error, Other},
      loop()
  end.


