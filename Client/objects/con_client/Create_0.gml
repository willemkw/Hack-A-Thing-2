/// @description Set up client

// Enums: network.move = 0, because move is at index 0 of this enumerator.
// Server should have same enum.
enum network {
	player_establish,	//
	player_connect,		// For managing a player connecting
	player_joined,		// For when an additional player joins
	player_disconnect,	// For removing a player when they disconnect
	move,				// For when a player moves
	chat,				// For handling chat messages being sent
}

#region An enum & ds map for colors, makes it easier to send color IDs across the internet
enum colors {
	aqua,		// 0
	black,		// 1
	blue,		// 2
	dkgray,		// 3
	fuchsia,	// 4
	gray,		// 5
	green,		// 6
	lime,		// 7
	ltgray,		// 8
	maroon,		// 9
	navy,		// 10
	olive,		// 11
	orange,		// 12
	purple,		// 13
	red,		// 14
	silver,		// 15
	teal,		// 16
	white,		// 17
	yellow		// 18
}

color_map = ds_map_create();
ds_map_add(color_map, colors.aqua, c_aqua);
ds_map_add(color_map, colors.black, c_black);
ds_map_add(color_map, colors.blue, c_blue);
ds_map_add(color_map, colors.dkgray, c_dkgray);
ds_map_add(color_map, colors.fuchsia, c_fuchsia);
ds_map_add(color_map, colors.gray, c_gray);
ds_map_add(color_map, colors.green, c_green);
ds_map_add(color_map, colors.lime, c_lime);
ds_map_add(color_map, colors.ltgray, c_ltgray);
ds_map_add(color_map, colors.maroon, c_maroon);
ds_map_add(color_map, colors.navy, c_navy);
ds_map_add(color_map, colors.olive, c_olive);
ds_map_add(color_map, colors.orange, c_orange);
ds_map_add(color_map, colors.purple, c_purple);
ds_map_add(color_map, colors.red, c_red);
ds_map_add(color_map, colors.silver, c_silver);
ds_map_add(color_map, colors.teal, c_teal);
ds_map_add(color_map, colors.white, c_white);
ds_map_add(color_map, colors.yellow, c_yellow);
#endregion


// Connection type has to be the same for client & server
client = network_create_socket(network_socket_tcp);

// 127.0.0.1 is localhost
// To get your IP address, open command prompt, type ipconfig. IPv4 address
// Only people on your network would be able to connect to your local IP address
// Same port for client & server (64198)
network_connect(client, "127.0.0.1", 64198);

client_buffer = buffer_create(1024, buffer_fixed, 1);

socket_to_instanceid = ds_map_create();