-module(mysrv).
-behaviour(gen_server).

%% API functions
-export([start_link/0,say_hello/1,get_response/1]).

%% Gen_server functions
-export([init/1,handle_call/3,handle_cast/2,handle_info/2,terminate/2,code_change/3]).

start_link() ->
    gen_server:start_link(?MODULE,[],[]).
say_hello(Pid) ->
    gen_server:cast(Pid,"Hello!").
get_response(Pid) ->
    gen_server:call(Pid,"Hello!").

init([]) ->
    io:format("init~n"),
    {ok, []}.
handle_call(Call, From, State) ->
    io:format("got message ~s from ~p~n",[Call, From]),
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
