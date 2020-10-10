/// @description Determine what to do based on data recieved
function scr_recieved_packet(buffer){
	msgid = buffer_read(buffer, buffer_u8);
	
	switch(msgid) {
		case 1: // Change image
			// For if the message ID is 1
			obj_player.image_index = 2;
			break;
	}
}