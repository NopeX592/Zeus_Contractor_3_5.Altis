_run = true;
task_2_2_skip = false;
task_2_2_done = false;
publicVariableServer "task_2_2_skip";
publicVariableServer "task_2_2_done";

task_2_2 = player createSimpleTask ["Investigate Dead Squad", task_2_0];
	task_2_2 setSimpleTaskDescription ["Investigate the killed soldiers you may find it in the estimated area.","Investigate Dead Squad",""];
	task_2_2 setSimpleTaskDestination (getMarkerPos "intel_squad");
	task_2_2 setSimpleTaskType "upload";
	task_2_2 setTaskState "Created";

_marker_intel = createMarker ["Investigate Dead Squad", getMarkerPos "intel_squad"];
	_marker_intel setMarkerShape "ELLIPSE";
	_marker_intel setMarkerSize [50, 50];

while {_run} do {
	if ((gathered_squad == 4) || (task_2_2_skip)) then {
		task_2_2 setTaskState "Succeeded";
		["TaskSucceeded",["","Investigate Dead Squad"]] call BIS_fnc_showNotification;
		_marker_intel setMarkerSize [0, 0];
		task_2_2_done = true;
		publicVariableServer "task_2_2_done";
		_run = false;
	};
};