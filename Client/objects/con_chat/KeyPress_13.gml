/// @description Turn chat on/off

if (!active) {
	// On
	active = true;
	keyboard_string = "";
	chat_text = "";
} else {
	// Off, send message
	active = false;
	
	buffer_seek(con_client.client_buffer, buffer_seek_start, 0);		// Start from top of buffer
	buffer_write(con_client.client_buffer, buffer_u8, network.chat);	// Message ID
	buffer_write(con_client.client_buffer, buffer_string, chat_text);	// Message contents
	buffer_write(con_client.client_buffer, buffer_u8, client_color_id);	// Message color
	network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));
}