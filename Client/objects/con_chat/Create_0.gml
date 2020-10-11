/// @description Set up the chat

global.chat = ds_list_create();
global.chat_color = ds_list_create();



active = false;		// Turn chat on/off. Default to false.

chat_size = 5;		// # of visible chat messages
repeat(chat_size) {
	ds_list_add(global.chat,"");
	ds_list_add(global.chat_color, ds_map_find_value(con_client.color_map, colors.fuchsia));
}

chat_text = "";		// Current chat message