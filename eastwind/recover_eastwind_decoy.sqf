_run = true;
task_3_7_skip = false;
publicVariableServer "task_3_7_skip";

task_3_7 = player createSimpleTask ["Recapture Eastwind Device"];
	task_3_7 setSimpleTaskDescription ["Recover the Eastwind Device from the hands of Miller.","Recapture Eastwind Device",""];
	task_3_7 setSimpleTaskDestination (getMarkerPos "eastwind_decoy");
	task_3_7 setSimpleTaskType "getin";
	task_3_7 setTaskState "Created";
	["TaskCreated",["","Recapture Eastwind Device"]] call BIS_fnc_showNotification;

_marker_eastwind_decoy = createMarker ["Recapture Eastwind Device", getMarkerPos "eastwind_decoy"];
	_marker_eastwind_decoy setMarkerShape "ELLIPSE";
	_marker_eastwind_decoy setMarkerSize [150, 150];

while {_run} do {
	if (task_3_7_skip) then {
		task_3_7 setTaskState "Canceled";
		["TaskCanceled",["","Recapture Eastwind Device"]] call BIS_fnc_showNotification;
		_marker_eastwind_decoy setMarkerSize [0, 0];
		_run = false;
	};
};