-module(graph).

-export([test/0]).

test() ->
    G = digraph:new(),
    V1 = digraph:add_vertex(G, v1),
    V2 = digraph:add_vertex(G, v2),
    V3 = digraph:add_vertex(G, v3),
    V4 = digraph:add_vertex(G, v4),
    _V5 = digraph:add_vertex(G, v5),
    _E1 = digraph:add_edge(G, V1, V2),
    _E2 = digraph:add_edge(G, V2, V3),
    _E3 = digraph:add_edge(G, V2, V4),
    Path = digraph:get_path(G, V1, V4),
    Sorted = digraph_utils:topsort(G),
    io:format("path: ~p\n", [Path]),
    io:format("sorted: ~p\n", [Sorted]),
    {ok, {digraph, Path}}.

