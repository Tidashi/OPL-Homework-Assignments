%Assignment Name: Program 5
%Course and semeseter : Fall 2023 OPL
%Instructor's name: Richard Churchill
%Due Date and time: November 4th 2023 by 11:59 p.m
%Date and time submitted:  November 4th 2023 10:00p.m
%Your Name and csx user ID: Christopher Tjahjo (ctjahjo)

-module(chat_server). %declaration of module
-compile([export_all]).

%starts the chat server
start_link() ->
    spawn_link(fun init/0).

%initializes function for the chat
init() ->
    ClientPids = [],
    register(chat_server, self()),
    loop(ClientPids).


loop(ClientPids) ->
    receive
	%handles the conection between clients
        {From, "Connect"} ->
            NewClientPids = [From | ClientPids],
            io:format("Client connected: ~p~n", [From]),
            loop(NewClientPids);
        {From, Message} ->
	%Handles the messages for the from the chat_client script
            io:format("Received: ~s~n", [Message]),
            From ! {chat_server, "Server received your message: " ++ Message},
            loop(ClientPids);
        stop ->
            io:format("Chat Server is stopping.~n");
        _ ->
            loop(ClientPids)
    end.

stop() ->
    chat_server ! stop.

send_message(Client, Message) ->
    Client ! {self(), Message}.
