/// @description Turn chat on/off

if (!active) {
	// On
	active = true;
	keyboard_string = "";
	chat_text = "";
} else {
	// Off, send message to all players
	active = false;
	
	chat_text = "SERVER: "+chat_text;
	ds_list_insert(global.chat, 0, chat_text);
	ds_list_insert(global.chat_color, 0, ds_map_find_value(con_server.color_map, colors.red));
	
	for(var i = 0; i < ds_list_size(con_server.socket_list); i++) {
				
		var _sock = ds_list_find_value(con_server.socket_list, i);
				
		buffer_seek(con_server.server_buffer, buffer_seek_start, 0);		// Start from top of buffer
		buffer_write(con_server.server_buffer, buffer_u8, network.chat);	// Message ID
		buffer_write(con_server.server_buffer, buffer_string, chat_text);	// Message contents
		buffer_write(con_server.server_buffer, buffer_u8, colors.red);		// Message color
				
		network_send_packet(_sock, con_server.server_buffer, buffer_tell(con_server.server_buffer));
	}
}