_run = true;
task_Opt_1_skip = false;
publicVariableServer "task_Opt_1_skip";

task_Opt_1 = player createSimpleTask ["Destroy Mortars"];
	task_Opt_1 setSimpleTaskDescription ["Destroy the enemy Mortars.","Destroy Mortars",""];
	task_Opt_1 setSimpleTaskDestination (getMarkerPos "mortar_location");
	task_Opt_1 setSimpleTaskType "destroy";
	task_Opt_1 setTaskState "Created";

_marker_artillery = createMarker ["Destroy Mortars", getMarkerPos "mortar_location"];
	_marker_artillery setMarkerShape "ELLIPSE";
	_marker_artillery setMarkerSize [250, 250];

while {_run} do {
	if (((!alive mortar_1) && (!alive mortar_2) && (!alive mortar_3)) || (task_Opt_1_skip)) then {
		task_Opt_1 setTaskState "Succeeded";
		["TaskSucceeded",["","Destroy Mortars"]] call BIS_fnc_showNotification;
		_marker_artillery setMarkerSize [0, 0];
		_run = false;

		//Spawn QRF
		_randomUnits = selectRandom [5];
		[
			getMarkerPos "qrf_spawn_11",
			getMarkerPos "qrf_target_6",
			_randomUnits,
			1,
			independent
		] call SU_fnc_spawnOPFOR;

		_randomUnits = selectRandom [5,6];
		[
			getMarkerPos "qrf_spawn_12",
			getMarkerPos "qrf_target_6",
			_randomUnits,
			1,
			independent
		] call SU_fnc_spawnOPFOR;
	};
};