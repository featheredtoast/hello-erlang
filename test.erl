-module(test).

-export([test/0]).

test() ->
    io:format("----------~n"),
    io:format("testing proplist~n"),
    Proplist = proplist(),
    io:format("----------~n"),
    io:format("testing orddict~n"),
    Orddict = orddicttest(),
    io:format("----------~n"),
    io:format("testing dict~n"),
    Dict = dicttest(),
    io:format("----------~n"),
    io:format("testing gb_trees, naive~n"),
    Gbtree = gbtreetest_naive(),
    io:format("----------~n"),
    io:format("testing gb_trees, smart~n"),
    Gbtree_smart = gbtreetest_smart(),
    {ok, {prop, Proplist}, {orddict, Orddict}, {dict, Dict}, {gb_tree_naive, Gbtree}, {gb_tree_smart, Gbtree_smart}}.

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
    {ok, Val, Size, {raw, Dic3}}.

dicttest() ->
    Dic = dict:new(),
    Dic2 = dict:store(key1, value1, Dic),
    Dic3 = dict:store(key2, value2, Dic2),
    {ok,Val} = dict:find(key2, Dic3),
    error = dict:find(unknown, Dic3),
    io:format("value: ~s~n", [Val]),
    Size = dict:size(Dic3),
    {ok, Val, Size, {raw, Dic3}}.

gbtreetest_naive() ->
    Tree = gb_trees:empty(),
    Tree2 = gb_trees:enter(key1, val1, Tree),
    Tree3 = gb_trees:enter(key2, val2, Tree2),
    {value, Val} = gb_trees:lookup(key2, Tree3),
    none = gb_trees:lookup(key3, Tree3),
    io:format("value: ~s~n", [Val]),
    Size = gb_trees:size(Tree3),
    {ok, Val, Size, {raw, Tree3}}.

gbtreetest_smart() ->
    Tree = gb_trees:empty(),
    Tree2 = gb_trees:insert(key1, val1, Tree),
    Tree3 = gb_trees:insert(key2, val2, Tree2),
    Val = gb_trees:get(key2, Tree3),
    %% gb_trees:get(key3, Tree3), %% this would send an error, this assumes we know that there is a value in there.
    io:format("value: ~s~n", [Val]),
    Size = gb_trees:size(Tree3),
    {ok, Val, Size, {raw, Tree3}}.
