/// @description Send "Hello, World!"

// Go t start of buffer
buffer_seek(obj_con_client.client_buffer, buffer_seek_start, 0);

// Write to buffer (message ID)
buffer_write(obj_con_client.client_buffer, buffer_u8, 1);

// Send the packet
network_send_packet(obj_con_client.client, obj_con_client.client_buffer, buffer_tell(obj_con_client.client_buffer));