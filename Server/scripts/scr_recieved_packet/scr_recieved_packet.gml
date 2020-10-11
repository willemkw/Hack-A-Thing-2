/// @description Determine what to do based on data recieved
function scr_recieved_packet(buffer, socket){
	msgid = buffer_read(buffer, buffer_u8);
	
	// All the possible things we may need the server to do should be in here
	switch (msgid) {
		case network.player_establish:
			var _username = buffer_read(buffer, buffer_string);
			scr_network_player_join(_username);
			break;
		
		case network.move: // ID 0, move
			// Make sure your reads & writes match. Write string -> read string.
			var move_x = buffer_read(buffer, buffer_u16);
			var move_y = buffer_read(buffer, buffer_u16);
			
			var _player = ds_map_find_value(socket_to_instanceid, socket)
			_player.x = move_x;
			_player.y = move_y;
			
			for(var i = 0; i < ds_list_size(socket_list); i++) {
				
				var _sock = ds_list_find_value(socket_list, i);
				
				buffer_seek(server_buffer, buffer_seek_start, 0);		// Start from top of buffer
				buffer_write(server_buffer, buffer_u8, network.move);	// Message ID
				
				buffer_write(server_buffer, buffer_u8, socket);			// Socket of the moving player
				
				buffer_write(server_buffer, buffer_u16, move_x);		// X
				buffer_write(server_buffer, buffer_u16, move_y);		// Y
				
				network_send_packet(_sock, server_buffer, buffer_tell(server_buffer));
			}
			
			
			break;
	}
}