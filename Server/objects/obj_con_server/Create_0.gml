/// @description Set up server

// Depending on our router, ports may be blocked. We may have to unblock them in order to have people connect.
port = 64198;

max_clients = 12;

// TCP, UDP, and WS type servers have pros and cons. Look 'em up.
// TCP is slower & more reliable
// UDP is faster but packets can get lost
// WS is intended for browser-based games
network_create_server(network_socket_tcp, port, max_clients);

server_buffer = buffer_create(1024, buffer_fixed, 1);

// List of connected clients
socket_list = ds_list_create();