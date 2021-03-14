_run = true;
task_1_0_skip = false;
task_1_0_done = false;
task_1_2_done = false;
task_1_3_done = false;
publicVariableServer "task_1_0_skip";
publicVariableServer "task_1_0_done";

[] execVM "humanitarian\dropoff_food_medical.sqf";
[] execVM "humanitarian\recapture_town.sqf";

while {_run} do {
	if (((task_1_2_done) && (task_1_3_done)) || (task_1_0_skip)) then {
		task_1_0_done = true;
		_run = false;
		sleep 1;
	};
};