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

%The Following script was provided in canvas.

-module(chat_script).

-export([start/0]).

start() ->

    ChatServer = chat_server:start_link(),

    ChatClient1 = chat_client:start_link(),

    ChatClient2 = chat_client:start_link(),

    chat_client:connect(ChatServer),

    chat_client:connect(ChatServer),

    chat_client:send_message(ChatClient1, "Hello from client 1!"),

    chat_client:send_message(ChatClient2, "Hello from client 2!").

