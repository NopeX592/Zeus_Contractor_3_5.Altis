_run = true;
task_3_6_skip = false;
publicVariableServer "task_3_6_skip";

task_3_6 = player createSimpleTask ["Assassinate Miller"];
	task_3_6 setSimpleTaskDescription ["Assasinate the traitor Miller.","Assassinate Miller",""];
	task_3_6 setSimpleTaskDestination (getMarkerPos "miller_location");
	task_3_6 setSimpleTaskType "kill";
	task_3_6 setTaskState "Created";
	["TaskCreated",["","Assassinate Miller"]] call BIS_fnc_showNotification;

_marker_miller = createMarker ["Assassinate Miller", getMarkerPos "miller_location"];
	_marker_miller setMarkerShape "ELLIPSE";
	_marker_miller setMarkerSize [250, 250];

while {_run} do {
	if ((!alive miller) || (task_3_6_skip)) then {
		task_3_6 setTaskState "Succeeded";
		["TaskSucceeded",["","Assassinate Miller"]] call BIS_fnc_showNotification;
		_marker_miller setMarkerSize [0, 0];
		_run = false;

		//Spawn QRF
		_randomUnits = selectRandom [6,7];
		[
			getMarkerPos "qrf_spawn_9",
			getMarkerPos "qrf_target_4",
			_randomUnits,
			1,
			independent
		] call SU_fnc_spawnOPFOR;
		
		_randomUnits = selectRandom [5,6,7,8];
		[
			getMarkerPos "qrf_spawn_10",
			getMarkerPos "qrf_target_4",
			_randomUnits,
			1,
			independent
		] call SU_fnc_spawnOPFOR;
	};
};