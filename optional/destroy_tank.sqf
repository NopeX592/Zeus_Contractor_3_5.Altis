_run = true;
task_opt_2_skip = false;
publicVariableServer "task_opt_1_skip";

task_opt_2 = player createSimpleTask ["Destroy Tank"];
	task_opt_2 setSimpleTaskDescription ["Destroy the enemy Tank.","Destroy Tank",""];
	task_opt_2 setSimpleTaskDestination (getMarkerPos "tank_location");
	task_opt_2 setSimpleTaskType "destroy";
	task_opt_2 setTaskState "Created";

_marker_tank = createMarker ["Destroy Tank", getMarkerPos "tank_location"];
	_marker_tank setMarkerShape "ELLIPSE";
	_marker_tank setMarkerSize [250, 250];

while {_run} do {
	if ((!alive tank_1) || (task_opt_1_skip)) then {
		task_opt_2 setTaskState "Succeeded";
		["TaskSucceeded",["","Destroy Tank"]] call BIS_fnc_showNotification;
		_marker_tank setMarkerSize [0, 0];
		_run = false;
	};
};