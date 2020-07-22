///@func is_odd(int)
///@desc Tells if an integer is even or odd (or any number since bitwise drops the decimal)
///@arg int

/*
Is 2 odd?
  0010 | 2
& 0001 | 1
  ----
  0000 | false
*/

return argument0 & 1;
