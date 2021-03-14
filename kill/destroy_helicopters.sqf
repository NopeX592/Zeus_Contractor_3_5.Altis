_run = true;
task_3_3_skip = false;
task_3_3_done = false;
publicVariableServer "task_3_3_skip";
publicVariableServer "task_3_3_done";

task_3_3 = player createSimpleTask ["Destroy Enemy Helicopters", task_3_0];
	task_3_3 setSimpleTaskDescription ["Destroy the enemy helicopters.","Destroy Enemy Helicopters",""];
	task_3_3 setSimpleTaskDestination (getMarkerPos "helicopter_location");
	task_3_3 setSimpleTaskType "destroy";
	task_3_3 setTaskState "Created";
	["TaskCreated",["","Destroy Enemy Helicopters"]] call BIS_fnc_showNotification;

_marker_helicopters = createMarker ["Destroy Enemy Helicopters", getMarkerPos "helicopter_location"];
	_marker_helicopters setMarkerShape "ELLIPSE";
	_marker_helicopters setMarkerSize [250, 250];

while {_run} do {
	if (((!alive helicopter_1) && (!alive helicopter_2) && (!alive helicopter_3)) || (task_3_3_skip)) then {
		task_3_3 setTaskState "Succeeded";
		["TaskSucceeded",["","Destroy Enemy Helicopters"]] call BIS_fnc_showNotification;
		_marker_helicopters setMarkerSize [0, 0];
		task_3_3_done = true;
		_run = false;

		//Spawn QRF
		_randomUnits = selectRandom [5,6];
		[
			getMarkerPos "qrf_spawn_8",
			getMarkerPos "qrf_target_5",
			_randomUnits,
			1,
			independent
		] call SU_fnc_spawnOPFOR;
		
		_randomUnits = selectRandom [5,6,7];
		[
			getMarkerPos "qrf_spawn_15",
			getMarkerPos "qrf_target_5",
			_randomUnits,
			1,
			independent
		] call SU_fnc_spawnOPFOR;
	};
};