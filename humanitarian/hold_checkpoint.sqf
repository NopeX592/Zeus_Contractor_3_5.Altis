_run_1 = true;
_run_2 = false;
task_1_4_skip = false;
task_3_5_done = false;
publicVariableServer "task_1_4_skip";

while {_run_1} do {
	sleep 1;
	if (task_3_5_done) then {
		_run_1 = false;
		_run_2 = true;

		task_1_4 = player createSimpleTask ["Defend the Checkpoint"];
			task_1_4 setSimpleTaskDescription ["Defend the checkpoint at all costs.","Defend the Checkpoint",""];
			task_1_4 setSimpleTaskDestination (getMarkerPos "checkpoint_location");
			task_1_4 setSimpleTaskType "defend";
			task_1_4 setTaskState "Created";
			["TaskCreated",["","Defend the Checkpoint"]] call BIS_fnc_showNotification;

		_marker_defend_checkpoint = createMarker ["_marker_defend_checkpoint", getMarkerPos "checkpoint_location"];
			_marker_defend_checkpoint setMarkerShape "ELLIPSE";
			_marker_defend_checkpoint setMarkerSize [50, 50];

		trg_tsk_1_4 = createTrigger ["EmptyDetector", getMarkerPos "checkpoint_location"];
			trg_tsk_1_4 setTriggerArea [50, 50, 25, false];
			trg_tsk_1_4 setTriggerActivation ["ANYPLAYER", "PRESENT", false];
			trg_tsk_1_4 setTriggerStatements ["this","",""];
			trg_tsk_1_4 setTriggerTimeout [650, 1000, 1200, false];

		while {_run_2} do {
			if ((triggerActivated trg_tsk_1_4) || (task_1_4_skip)) then {
				task_1_4 setTaskState "Succeeded";
				["TaskSucceeded",["","Defend the Checkpoint"]] call BIS_fnc_showNotification;
				_marker_defend_checkpoint setMarkerSize [0, 0];
				deleteVehicle trg_tsk_1_4;
				task_1_4_done = true;
				publicVariableServer "task_1_4_done";
				_run_2 = false;
			};
		};
	};
};