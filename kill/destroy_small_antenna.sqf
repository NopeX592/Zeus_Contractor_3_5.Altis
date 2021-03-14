_run = true;
task_3_2_skip = false;
task_3_2_done = false;
publicVariableServer "task_3_2_skip";
publicVariableServer "task_3_2_done";

task_3_2 = player createSimpleTask ["Destroy Small Antenna", task_3_0];
	task_3_2 setSimpleTaskDescription ["Destroy the small antenna tower.","Destroy Small Antenna",""];
	task_3_2 setSimpleTaskDestination (getMarkerPos "antenna_location_1");
	task_3_2 setSimpleTaskType "destroy";
	task_3_2 setTaskState "Created";
	["TaskCreated",["","Destroy Small Antenna"]] call BIS_fnc_showNotification;

_marker_antenna_sml = createMarker ["Destroy Small Antenna", getMarkerPos "antenna_location_1"];
	_marker_antenna_sml setMarkerShape "ELLIPSE";
	_marker_antenna_sml setMarkerSize [250, 250];

while {_run} do {
	if ((!alive antenna_1) || (task_3_2_skip)) then {
		task_3_2 setTaskState "Succeeded";
		["TaskSucceeded",["","Destroy Small Antenna"]] call BIS_fnc_showNotification;
		_marker_antenna_sml setMarkerSize [0, 0];
		task_3_2_done = true;
		_run = false;
	};
};