_run = true;
task_Opt_1_skip = false;
publicVariableServer "task_Opt_1_skip";

task_Opt_1 = player createSimpleTask ["Destroy Artillery"];
	task_Opt_1 setSimpleTaskDescription ["Destroy the enemy Artillery.","Destroy Artillery",""];
	task_Opt_1 setSimpleTaskDestination (getMarkerPos "artillery_location");
	task_Opt_1 setSimpleTaskType "destroy";
	task_Opt_1 setTaskState "Created";

_marker_artillery = createMarker ["Takeout Artillery", getMarkerPos "artillery_location"];
	_marker_artillery setMarkerShape "ELLIPSE";
	_marker_artillery setMarkerSize [250, 250];

while {_run} do {
	if ((!alive sochor_1) && (!alive sochor_2) || (task_Opt_1_skip)) then {
		task_Opt_1 setTaskState "Succeeded";
		["TaskSucceeded",["","Destroy Artillery"]] call BIS_fnc_showNotification;
		_marker_artillery setMarkerSize [0, 0];
		_run = false;

		//Spawn QRF
		_randomUnits = selectRandom [5,6,7,8];
		[
			getMarkerPos "qrf_spawn_6",
			getMarkerPos "qrf_target_2",
			_randomUnits,
			1,
			EAST
		] call SU_fnc_spawnOPFOR;

		_randomUnits = selectRandom [3,4,5,6];
		[
			getMarkerPos "qrf_spawn_14",
			getMarkerPos "qrf_target_2",
			_randomUnits,
			1,
			EAST
		] call SU_fnc_spawnOPFOR;
	};
};