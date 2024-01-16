/// @description Global pause

if !global.pause {
	global.pause = true;
	event_perform(ev_alarm, 0);
}
else if global.pause {
	global.pause = false;
	event_perform(ev_alarm, 1);
}





