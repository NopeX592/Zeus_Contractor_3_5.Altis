_run = true;
task_1_3_skip = false;
task_1_3_done = false;
publicVariableServer "task_1_3_skip";
publicVariableServer "task_1_3_done";

task_1_3 = player createSimpleTask ["Recapture Kalithea"];
	task_1_3 setSimpleTaskDescription ["Recapture the town of Kalithea.","Recapture Kalithea",""];
	task_1_3 setSimpleTaskDestination (getMarkerPos "dropoff_idap");
	task_1_3 setSimpleTaskType "attack";
	task_1_3 setTaskState "Assigned";
	["TaskAssigned",["","Recapture Kalithea"]] call BIS_fnc_showNotification;
	
trg_tsk_1_3 = createTrigger ["EmptyDetector", getMarkerPos "dropoff_idap"];
	trg_tsk_1_3 setTriggerArea [250, 250, 250, false];
	trg_tsk_1_3 setTriggerActivation ["GUER", "NOT PRESENT", false];
	trg_tsk_1_3 setTriggerStatements ["this","",""];
	
_marker_kalithea = createMarker ["Recapture Kalithea", getMarkerPos "dropoff_idap"];
	_marker_kalithea setMarkerShape "ELLIPSE";
	_marker_kalithea setMarkerSize [250, 250];

while {_run} do {
	if ((triggerActivated trg_tsk_1_3) || (task_1_3_skip)) then {
		task_1_3 setTaskState "Succeeded";
		["TaskSucceeded",["","Recapture Kalithea"]] call BIS_fnc_showNotification;
		deletevehicle trg_tsk_1_3;
		deleteMarker _marker_kalithea;
		task_1_3_done = true;
		publicVariableServer "task_1_3_done";
		_run = false;
	};
};