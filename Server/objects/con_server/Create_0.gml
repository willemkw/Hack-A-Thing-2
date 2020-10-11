/// @description Set up server

enum network {
	player_establish,	// 
	player_connect,		// For managing a player connecting
	player_joined,		// For when an additional player joins
	player_disconnect,	// For removing a player when they disconnect
	move,				// For when a player moves
	chat,				// For managing chat messages
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

// Map sockets to instance IDs of players.
socket_to_instanceid = ds_map_create();

player_spawn_x = 100;
player_spawn_y = 100;