_run_1 = true;
_run_2 = false;
task_4_0_skip = false;
task_3_0_done = false;
task_3_5_done = false;
task_3_6_skip = false;
publicVariable "task_4_0_skip";
publicVariableServer "task_3_5_skip";
publicVariableServer "task_3_5_done";
publicVariableServer "task_3_6_skip";

while {_run_1} do {
	if (((task_3_5_done) && (task_3_0_done)) || (task_4_0_skip)) then {
		_run_1 = false;
		_run_2 = true;

		task_3_6 = player createSimpleTask ["Return to FOB to get CBRN suits and Briefing"];
			task_3_6 setSimpleTaskDescription ["Return to the FOB to get CBRN suits and Briefing.","Return to FOB to get CBRN suits and Briefing",""];
			task_3_6 setSimpleTaskDestination (getMarkerPos "FOB_Contractor_E");
			task_3_6 setSimpleTaskType "meet";
			task_3_6 setTaskState "Assigned";
			["TaskAssigned",["","Return to FOB to get CBRN suits and Briefing"]] call BIS_fnc_showNotification;
			
		trg_tsk_3_6 = createTrigger ["EmptyDetector", getMarkerPos "FOB_Contractor_E"];
			trg_tsk_3_6 setTriggerArea [15, 15, 15, false];
			trg_tsk_3_6 setTriggerActivation ["ANYPLAYER", "PRESENT", false];
			trg_tsk_3_6 setTriggerStatements ["this","",""];

		while {_run_2} do {
			if ((triggerActivated trg_tsk_3_6) || (task_3_6_skip)) then {
				task_3_5 setTaskState "Succeeded";
				["TaskSucceeded",["","Return to FOB to get CBRN suits and Briefing"]] call BIS_fnc_showNotification;
				deletevehicle trg_tsk_3_6;
				[]execVM "eastwind\kill_miller.sqf";
				[]execVM "eastwind\recover_eastwind_actual.sqf";
				[]execVM "eastwind\recover_eastwind_decoy.sqf";
				_run_2 = false;
			};
		};
	};
	sleep 1;
};
		
		
