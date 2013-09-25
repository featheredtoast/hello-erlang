-module(graph).

-export([test/0]).

test() ->
    G = digraph:new(),
    V1 = digraph:add_vertex(G, v1),
    V2 = digraph:add_vertex(G, v2),
    V3 = digraph:add_vertex(G, v3),
    _E1 = digraph:add_edge(G, V1, V2),
    _E2 = digraph:add_edge(G, V2, V3),
    Path = digraph:get_path(G, V1, V3),
    io:format("path: ~p\n", [Path]),
    {ok, {digraph, Path}}.

