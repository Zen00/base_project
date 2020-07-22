///@description 

//I exist to create objects in the init room in the order listed
instance_create_layer(x,y,"Instances",obj_input);
instance_create_layer(x,y,"Instances",obj_camera);
instance_create_layer(x,y,"Instances",obj_transition_manager);
instance_create_layer(x,y,"Instances",obj_stats);
instance_create_layer(x,y,"Instances",obj_music_manager); //Create last because this object will initiate the move to the next room, once the music is loaded
//No need to explicitly destroy myself, as I am not persistent
