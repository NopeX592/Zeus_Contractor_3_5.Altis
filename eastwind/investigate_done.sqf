_run = true;
task_2_0_skip = false;
publicVariableServer "task_2_0_skip";

task_2_0 = player createSimpleTask ["Investigation"];
	task_2_0 setSimpleTaskDescription ["Investigate the downed blackfish and the killed squad.","Investigation",""];
	task_2_0 setSimpleTaskType "upload";
	task_2_0 setTaskState "Created";

[]execVM "eastwind\investigate_blackfish.sqf";
[]execVM "eastwind\investigate_squad.sqf";
[]execVM "eastwind\investigate_tank.sqf";

sleep 10;

while {_run} do {
	if (((task_2_1_done) && (task_2_2_done) && (task_2_3_done)) || (task_2_0_skip)) then {
		task_2_0 setTaskState "Succeeded";
		["TaskSucceeded",["","Investigation"]] call BIS_fnc_showNotification;
		[] execVM "kill\kill_done.sqf";
		_run = false;
	};
};