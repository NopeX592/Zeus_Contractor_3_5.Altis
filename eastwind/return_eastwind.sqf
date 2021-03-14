_run = true;
task_3_8_skip = false;
publicVariableServer "task_3_8_skip";

task_3_8 = player createSimpleTask ["Return the Eastwind Device to the FOB"];
	task_3_8 setSimpleTaskDescription ["Return the Eastwind Device to the FOB and to receive debrief.","Return the Eastwind Device to the FOB",""];
	task_3_8 setSimpleTaskDestination (getMarkerPos "FOB_Contractor_E");
	task_3_8 setSimpleTaskType "meet";
	task_3_8 setTaskState "Assigned";
	["TaskAssigned",["","Return the Eastwind Device to the FOB"]] call BIS_fnc_showNotification;
	
trg_tsk_3_8 = createTrigger ["EmptyDetector", getMarkerPos "FOB_Contractor_E"];
	trg_tsk_3_8 setTriggerArea [15, 15, 15, false];
	trg_tsk_3_8 setTriggerActivation ["VEHICLE", "PRESENT", false];
	trg_tsk_3_8 setTriggerStatements ["this","",""];
	trg_tsk_3_8 triggerAttachVehicle [eastwind_device];


while {_run} do {
	if ((triggerActivated trg_tsk_3_8) || (task_3_8_skip)) then {
		task_3_8 setTaskState "Succeeded";
		["TaskSucceeded",["","Return the Eastwind Device to the FOB"]] call BIS_fnc_showNotification;
		deletevehicle trg_tsk_3_8;
		_run = false;
	};
};