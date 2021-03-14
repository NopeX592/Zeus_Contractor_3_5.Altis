_run = true;
task_3_8_skip = false;
publicVariableServer "task_3_6_skip";

task_3_8 = player createSimpleTask ["Recapture Eastwind Device"];
	task_3_8 setSimpleTaskDescription ["Recover the Eastwind Device from the hands of Miller.","Recapture Eastwind Device",""];
	task_3_8 setSimpleTaskDestination (getMarkerPos "eastwind_actual");
	task_3_8 setSimpleTaskType "getin";
	task_3_8 setTaskState "Created";
	["TaskCreated",["","Recapture Eastwind Device"]] call BIS_fnc_showNotification;

_marker_eastwind_actual = createMarker ["Recapture Eastwind Device", getMarkerPos "eastwind_actual"];
	_marker_eastwind_actual setMarkerShape "ELLIPSE";
	_marker_eastwind_actual setMarkerSize [150, 150];

while {_run} do {
	if ((player in eastwind_device) || (task_3_8_skip)) then {
		task_3_8 setTaskState "Succeeded";
		["TaskSucceeded",["","Recapture Eastwind Device"]] call BIS_fnc_showNotification;
		[]execVM "eastwind\return_eastwind.sqf";
		_marker_eastwind_actual setMarkerSize [0, 0];
		_run = false;

		//Cancel Eastwind Decoy
		if (task_3_7_done) then {
			task_3_7 setTaskState "Canceled";
			["TaskCanceled",["","Get Boat (Optional)"]] call BIS_fnc_showNotification;
		};
	};
};