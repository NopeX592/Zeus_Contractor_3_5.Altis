_run = true;
task_3_4_skip = false;
task_3_4_done = false;
publicVariableServer "task_3_4_skip";
publicVariableServer "task_3_4_done";

task_3_4 = player createSimpleTask ["Sweep Town Held by Enemies", task_3_0];
	task_3_4 setSimpleTaskDescription ["Sweep the town of Chalkeia clean of enemies.","Sweep Town Held by Enemies",""];
	task_3_4 setSimpleTaskDestination (getMarkerPos "sweep_town");
	task_3_4 setSimpleTaskType "attack";
	task_3_4 setTaskState "Created";
	["TaskAssigned",["","Sweep Town Held by Enemies"]] call BIS_fnc_showNotification;
	
trg_tsk_3_4 = createTrigger ["EmptyDetector", getMarkerPos "sweep_town"];
	trg_tsk_3_4 setTriggerArea [300, 300, 300, false];
	trg_tsk_3_4 setTriggerActivation ["GUER", "NOT PRESENT", false];
	trg_tsk_3_4 setTriggerStatements ["this","",""];
	
_marker_sweep_town = createMarker ["Takeout or Capture Source", getMarkerPos "sweep_town"];
	_marker_sweep_town setMarkerShape "ELLIPSE";
	_marker_sweep_town setMarkerSize [300, 300];

while {_run} do {
	if ((triggerActivated trg_tsk_3_4) || (task_3_4_skip)) then {
		task_3_4 setTaskState "Succeeded";
		["TaskSucceeded",["","Sweep Town Held by Enemies"]] call BIS_fnc_showNotification;
		deletevehicle trg_tsk_3_4;
		_marker_sweep_town setMarkerSize [0, 0];
		task_3_4_done = true;
		_run = false;

		//Spawn QRF
		_randomUnits = selectRandom [3,4];
		[
			getMarkerPos "qrf_spawn_8",
			getMarkerPos "qrf_target_3",
			_randomUnits,
			1,
			independent
		] call SU_fnc_spawnOPFOR;
		
		_randomUnits = selectRandom [3,4,5,6];
		[
			getMarkerPos "qrf_spawn_15",
			getMarkerPos "qrf_target_3",
			_randomUnits,
			1,
			independent
		] call SU_fnc_spawnOPFOR;
	};
};