///@desc ease(function,start,change,duration,time);
///@param function
///@param start
///@param change
///@param duration
///@param time
//Credits: Code lifted from http://www.davetech.co.uk/gamemakereasingandtweeningfunctions and http://gizma.com/easing/ but all the work to make it script compatible was done by me.
//t = time
//b = start
//c = change
//d = duration
//argument0 = time
//argument1 = start
//argument2 = change
//argument3 = duration

var function,start,change,duration,time;
function = argument0;
start = argument1;
change = argument2;
duration = argument3;
time = argument4;

switch(function)
{
case "linear":
{
return change*time/duration + start;
}
case "easeinquad":
{
time /= duration;
return change*time*time + start;
}
case "easeoutquad":
{
time /= duration;
return -change * time *(time-2) + start;
}
case "easeinoutquad":
{
time /= duration/2;
if (time < 1)
return change/2*time*time + start;
time--;
return -change/2 * (time*(time-2) - 1) + start;
}
case "easeincubic":
{
time /= duration;
return change*time*time*time + start;
}
case "easeoutcubic":
{
time /= duration;
time--;
return change*(time*time*time + 1) + start;
}
case "easeinoutcubic":
{
time /= duration/2;
if (time < 1)
return change/2*time*time*time + start;
time -= 2;
return change/2*(time*time*time + 2) + start;
}
case "easeinquart":
{
time /= duration;
return change*time*time*time*time + start;
}
case "easeoutquart":
{
time /= duration;
time--;
return -change * (time*time*time*time - 1) + start;
}
case "easeinoutquart":
{
time /= duration/2;
if (time < 1)
return change/2*time*time*time*time + start;
time -= 2;
return -change/2 * (time*time*time*time - 2) + start;
}
case "easeinquint":
{
time /= duration;
return change*time*time*time*time*time + start;
}
case "easeoutquint":
{
time /= duration;
time--;
return change*(time*time*time*time*time + 1) + start;
}
case "easeinoutquint":
{
time /= duration/2;
if (time < 1)
return change/2*time*time*time*time*time + start;
time -= 2;
return change/2*(time*time*time*time*time + 2) + start;
}
case "easeinsine":
{
return -change * cos(time/duration * (pi/2)) + change + start;
}
case "easeoutsine":
{
return change * sin(time/duration * (pi/2)) + start;
}
case "easeinoutsine":
{
return -change/2 * (cos(pi*time/duration) - 1) + start;
}
case "easeinexpo":
{
return change * power( 2, 10 * (time/duration - 1) ) + start;
}
case "easeoutexpo":
{
return change * ( -power( 2, -10 * time/duration ) + 1 ) + start;
}
case "easeinoutexpo":
{
time /= duration/2;
if (time < 1)
return change/2 * power( 2, 10 * (time - 1) ) + start;
time--;
return change/2 * ( -power( 2, -10 * time) + 2 ) + start;
}
case "easeincirc":
{
time /= duration;
return -change * (sqrt(1 - time*time) - 1) + start;
}
case "easeoutcirc":
{
time /= duration;
time--;
return change * sqrt(1 - time*time) + start;
}
case "easeinoutcirc":
{
time /= duration/2;
if (time < 1)
return -change/2 * (sqrt(1 - time*time) - 1) + start;
time -= 2;
return change/2 * (sqrt(1 - time*time) + 1) + start;
}
//I should point out that from this point I consider the easing to be "Expert" functions
case "easeinelastic":
{
var _s = 1.70158;
var _p = 0;
var _a = change;

if(time == 0 || _a == 0)
return start;

time /= duration;

if(time == 1)
return start+change;
if(_p == 0)
_p = duration*0.3;
if(_a < abs(change))
{
_a = change;
_s = _p*0.25;
}
else
{
_s = _p / (2 * pi) * arcsin (change / _a);
}

return -(_a * power(2,10 * (--time)) * sin((time * duration - _s) * (2 * pi) / _p)) + start;
}
case "easeoutelastic":
{
var _s = 1.70158;
var _p = 0;
var _a = change;

if (time == 0 || _a == 0)
    return start;

time /= duration;

if (time == 1)
    return start + change;
if (_p == 0)
    _p = duration * 0.3;
if (_a < abs(change)) 
{ 
    _a = change;
    _s = _p * 0.25; 
}
else 
{
    _s = _p / (2 * pi) * arcsin (change / _a);
}

return _a * power(2, -10 * time) * sin((time * duration - _s) * (2 * pi) / _p ) + change + start;
}
case "easeinoutelastic":
{
var _s = 1.70158;
var _p = 0;
var _a = change;

if (time == 0 || _a == 0)
    return start;

time /= duration*0.5;

if (time == 2)
    return start+change;
if (_p == 0)
    _p = duration * (0.3 * 1.5);
if (_a < abs(change))
{ 
    _a = change; 
    _s = _p * 0.25; 
}
else
{
    _s = _p / (2 * pi) * arcsin (change / _a);
}

if (time < 1)
    return -0.5 * (_a * power(2, 10 * (--time)) * sin((time * duration - _s) * (2 * pi) / _p)) + start;

return _a * power(2, -10 * (--time)) * sin((time * duration - _s) * (2 * pi) / _p) * 0.5 + change + start;
}
case "easeinback":
{
var _s = 1.70158;

time /= duration;
return change * time * time * ((_s + 1) * time - _s) + start;
}
case "easeoutback":
{
var _s = 1.70158;

time = time/duration - 1;
return change * (time * time * ((_s + 1) * time + _s) + 1) + start;
}
case "easeinoutback":
{
var _s = 1.70158;

time = time/duration*2

if (time < 1)
{
    _s *= 1.525;
    return change * 0.5 * (time * time * ((_s + 1) * time - _s)) + start;
}

time -= 2;
_s *= 1.525

return change * 0.5 * (time * time * ((_s + 1) * time + _s) + 2) + start;
}
case "easeinbounce":
{
return change - ease("easeoutbounce",0,change,duration,(duration - time)) + start;
}
case "easeoutbounce":
{
time /= duration;

if (time < 1/2.75)
{
    return change * 7.5625 * time * time + start;
}
else if (time < 2/2.75)
{
    time -= 1.5/2.75;
    return change * (7.5625 * time * time + 0.75) + start;
}
else if (time < 2.5/2.75)
{
    time -= 2.25/2.75;
    return change * (7.5625 * time * time + 0.9375) + start;
}
else
{
    time -= 2.625/2.75;
    return change * (7.5625 * time * time + 0.984375) + start;
}
}
case "easeinoutbounce":
{
if (time < duration*0.5) 
{
    return (ease("easeinbounce",0,change,duration,time*2)*0.5 + start);
}

return (ease("easeoutbounce",0,change,duration,time*2 - duration)*0.5 + change*0.5 + start);
}
default:
return "418";
}
