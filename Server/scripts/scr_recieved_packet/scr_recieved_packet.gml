/// @description Determine what to do based on data recieved
function scr_recieved_packet(buffer, socket){
	msgid = buffer_read(buffer, buffer_u8);
	
	// All the possible things we may need the server to do should be in here
	switch (msgid) {
		case 1: // Change image
			// Make sure your reads & writes match. Write string -> read string.
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, 1);				// message ID
			
			network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
			break;
	}
}