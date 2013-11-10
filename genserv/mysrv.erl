-module(mysrv).
-behaviour(gen_server).

%% API functions
-export([init/0]).

%% Gen_server functions
-export([init/1,handle_call/3,handle_cast/2,handle_info/2,terminate/2,code_change/3]).

init() ->
    ok.

init([]) ->
    io:format("init~n"),
    {ok, []}.
handle_call(Call, From, State) ->
    io:format("got message ~s from ~s~n",[Call, From]),
    {reply, called, State}.
handle_cast(Msg, State) ->
    io:format("got message ~s~n",[Msg]),
    {noreply, State}.
handle_info(Msg, State) ->
    io:format("got message ~s~n",[Msg]),
    {noreply, State}.
terminate(TermType, _State) ->
    io:format("Terminated with ~s",[TermType]),
    ok.
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
