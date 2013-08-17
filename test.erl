-module(test).

-export([test/0]).

test() ->
    io:format("testing proplist"),
    Proplist = proplist(),
    Orddict = orddicttest(),
    {ok, {prop, Proplist}, {orddict, Orddict}}.

proplist() ->
    ProplistInit = [{key1, value1}, {key2, value2}],
    Val = proplists:get_value(key2, ProplistInit),
    io:format("value: ~s\n", [Val]),
    {ok, Val}.

orddicttest() ->
    Dic = orddict:new(),
    Dic2 = orddict:store(key1, value1, Dic),
    Dic3 = orddict:store(key2, value2, Dic2),
    {ok,Val} = orddict:find(key2, Dic3),
    error = orddict:find(unknown, Dic3),
    io:format("value: ~s~n", [Val]),
    Size = orddict:size(Dic3),
    {ok, Val, Size}.
