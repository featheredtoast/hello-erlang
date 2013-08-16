-module(test).

-export([test/0]).

test() ->
    io:format("testing proplist"),
    proplist(),
    ok.

proplist() ->
    ProplistInit = [{key1, value1}, {key2, value2}],
    Val = proplists:get_value(key2, ProplistInit),
    io:format("value: ~s\n", [Val]),
    {ok, Val}.
