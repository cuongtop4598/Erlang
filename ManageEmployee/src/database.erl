-module(database).
-export([example_tables/0]).
-export([do_this_once/0]).
-export([demo/1]).
-export([reset_tables/0]).
-record(shop, {item, quantity, cost}).
-record(cost, {name, price}).

example_tables() ->
  [% The shop table
    {shop, apple, 20, 2.3},
    {shop, orange, 100, 3.8},
    {shop, pear, 10, 10},
    {shop, potato, 10, 10},
    % The cost table
    {cost, apple, 1.4},
    {cost, orange, 1.6},
    {cost, pear, 2},
    {cost, potato, 10}
  ].

reset_tables() ->
  mnesia:clear_table(shop),
  mnesia:clear_table(cost),
  F = fun() ->
            foreach(fun mnesia:write/1, example_tables())
      end,
  mnesia:transaction(F).

do_this_once() ->
  mnesia:create_schema([node()]),
  mnesia:start(),
  mnesia:create_table(shop, [{attributes, record_info(fields,shop)}]),
  mnesia:create_table(cost,[{attributes, record_info(fields,cost)}]),
  mnesia:create_table(design, [{attributes}]),
  mnesia:stop().

demo(select_shop) ->
  do(qlc:q([X || X <- mnesia:table(shop)])).