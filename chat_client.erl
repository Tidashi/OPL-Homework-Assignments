%Assignment Name: Program 5
%Course and semeseter : Fall 2023 OPL
%Instructor's name: Richard Churchill
%Due Date and time: November 4th 2023 by 11:59 p.m
%Date and time submitted:  November 4th 2023 10:00p.m
%Your Name and csx user ID: Christopher Tjahjo (ctjahjo)

%To run the file please type in erl <enter>
%Go ahead and compile the files my doing c(chat_server). <enter> c(chat_client). <enter> c(chat_script> <enter>
%once compiled please run the chat_script by doing chat_script:start().

%The following code was made using assitance found at https://github.com/luisgabriel/erl-chat-server

-module(chat_client). %declares module
-compile([export_all]).

%Starts chat client
start_link() ->
    spawn_link(fun init/0).

%initializes the chat client
init() ->
    loop().


loop() ->
    receive
        {chat_server, Message} ->
	%Recieves the message
            io:format("Received from server: ~s~n", [Message]);
        {From, Message} ->
	%Sends a confirmation
            io:format("Received: ~s~n", [Message]),
            From ! {chat_client, "Client received your message: " ++ Message},
            loop();
        stop ->
            io:format("Chat Client is stopping.~n");
        _ ->
            loop()
    end.

stop() ->
    chat_client ! stop.

connect(Server) ->
    Server ! {self(), "Connect"}.

send_message(Server, Message) ->
    Server ! {self(), Message}.
