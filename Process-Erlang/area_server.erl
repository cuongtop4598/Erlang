%%%-------------------------------------------------------------------
%%% @author cuongtop
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Sep 2021 3:47 PM
%%%-------------------------------------------------------------------
-module(area_server).
-author("cuongtop").

%% API
-export([loop/0]).

%% Function
loop() ->
  receive
    {rectangle, Width, Ht} ->
      io:format("Area of rectangle is ~p~n",[Width * Ht]),
      loop();
    {square, Side} ->
      io:format("Area of square is ~p~n", [Side*Side]),
      loop()
  end.
