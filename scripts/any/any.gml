///@func any(val,var...)
///@desc Returns true if any variable is equal to the value
///@arg val
///@arg var...

for(var i=1; i<argument_count; i++) {
    if(argument[i] == argument[0]) { return true; }
}

return false;
