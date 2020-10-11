/// @description Move on left click

// Go to start of buffer
buffer_seek(con_client.client_buffer, buffer_seek_start, 0);

// Write to buffer (message ID)
buffer_write(con_client.client_buffer, buffer_u8, network.move);

// Send (x,y) coordinates of where you want to move
buffer_write(con_client.client_buffer, buffer_u16, mouse_x);
buffer_write(con_client.client_buffer, buffer_u16, mouse_y);

// Send the packet
network_send_packet(con_client.client, con_client.client_buffer, buffer_tell(con_client.client_buffer));