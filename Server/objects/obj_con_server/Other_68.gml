/// @description Parse client information

// Async makes a ds_map w/ a bunch of info in it
type_event = ds_map_find_value(async_load, "type");

switch(type_event) {
	
	case network_type_connect:
		// When you get a connect message, add the client to the list
		socket = ds_map_find_value(async_load, "socket");
		ds_list_add(socket_list, socket);
		break;
		
	case network_type_disconnect:
		// When you get a disconnect message, remove the client from the list
		socket = ds_map_find_value(async_load, "socket");
		ds_list_delete(socket_list, ds_list_find_index(socket_list, socket));
		break;
		
	case network_type_data:
		// When you get data, send out the appropriate messages
		buffer = ds_map_find_value(async_load, "buffer");
		socket = ds_map_find_value(async_load, "id");
		buffer_seek(buffer, buffer_seek_start, 0); // Go to start of buffer
		scr_recieved_packet(buffer, socket);
		break;
}