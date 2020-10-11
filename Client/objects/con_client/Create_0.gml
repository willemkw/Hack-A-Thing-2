/// @description Set up client

// Enums: network.move = 0, because move is at index 0 of this enumerator.
// Server should have same enum.
enum network {
	player_establish,	//
	player_connect,		// For managing a player connecting
	player_joined,		// For when an additional player joins
	player_disconnect,	// For removing a player when they disconnect
	move				// For when a player moves
}




// Connection type has to be the same for client & server
client = network_create_socket(network_socket_tcp);

// 127.0.0.1 is localhost
// To get your IP address, open command prompt, type ipconfig. IPv4 address
// Only people on your network would be able to connect to your local IP address
// Same port for client & server (64198)
network_connect(client, "127.0.0.1", 64198);

client_buffer = buffer_create(1024, buffer_fixed, 1);

socket_to_instanceid = ds_map_create();