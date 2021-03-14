_run = true;
task_3_1_skip = false;
task_3_1_done = false;
publicVariableServer "task_3_1_skip";
publicVariableServer "task_3_1_done";

task_3_1 = player createSimpleTask ["Destroy Large Antenna", task_3_0];
	task_3_1 setSimpleTaskDescription ["Destroy the large antenna tower.","Destroy Large Antenna",""];
	task_3_1 setSimpleTaskDestination (getMarkerPos "antenna_location_2");
	task_3_1 setSimpleTaskType "destroy";
	task_3_1 setTaskState "Created";
	["TaskCreated",["","Destroy Large Antenna"]] call BIS_fnc_showNotification;

_marker_artillery_lrg = createMarker ["Destroy Large Antenna", getMarkerPos "antenna_location_2"];
	_marker_artillery_lrg setMarkerShape "ELLIPSE";
	_marker_artillery_lrg setMarkerSize [250, 250];

while {_run} do {
	if ((!alive antenna_2) || (task_3_1_skip)) then {
		task_3_1 setTaskState "Succeeded";
		["TaskSucceeded",["","Destroy Large Antenna"]] call BIS_fnc_showNotification;
		_marker_artillery_lrg setMarkerSize [0, 0];
		task_3_1_done = true;
		_run = false;
	};
};