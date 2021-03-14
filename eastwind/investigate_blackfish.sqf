_run = true;
task_2_1_skip = false;
task_2_1_done = false;
publicVariableServer "task_2_1_skip";
publicVariableServer "task_2_1_done";

task_2_1 = player createSimpleTask ["Investigate Downed Blackfish", task_2_0];
	task_2_1 setSimpleTaskDescription ["Investigate the downed Blackfish you may find it in the estimated area.","Investigate Downed Blackfish",""];
	task_2_1 setSimpleTaskDestination (getMarkerPos "intel_blackfish");
	task_2_1 setSimpleTaskType "upload";
	task_2_1 setTaskState "Created";

_marker_intel = createMarker ["Investigate Downed Blackfish", getMarkerPos "intel_blackfish"];
	_marker_intel setMarkerShape "ELLIPSE";
	_marker_intel setMarkerSize [175, 175];

while {_run} do {
	if (((isNull flight_log) && (sent_data_blackfish)) || (task_2_1_skip)) then {
		task_2_1 setTaskState "Succeeded";
		["TaskSucceeded",["","Investigate Downed Blackfish"]] call BIS_fnc_showNotification;
		_marker_intel setMarkerSize [0, 0];
		task_2_1_done = true;
		publicVariableServer "task_2_1_done";
		_run = false;
	};
};