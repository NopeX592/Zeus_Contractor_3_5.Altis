_run = true;
gathered_squad = 0;
gathered_tank = 0;
boxes_loaded = 0;
boxes_unloaded = 0;
sent_data_blackfish = false;
publicVariable "gathered_squad";
publicVariable "gathered_tank";
publicVariable "sent_data_blackfish";
publicVariable "boxes_loaded";
publicVariable "boxes_unloaded";

PB_fnc_hardbass = {
	blyat_mobile say3D "Hardbass";
};

//Intel Squad
PB_fnc_action_1 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	gathered_squad = gathered_squad + 1;
	publicVariable "gathered_squad";
	[squad_intel_1, intel_gathered_1] remoteExec ["BIS_fnc_holdActionRemove", 0, true];
};

PB_fnc_action_2 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	gathered_squad = gathered_squad + 1;
	publicVariable "gathered_squad";
	[squad_intel_2, intel_gathered_2] remoteExec ["BIS_fnc_holdActionRemove", 0, true];
};

PB_fnc_action_3 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	gathered_squad = gathered_squad + 1;
	publicVariable "gathered_squad";
	[squad_intel_3, intel_gathered_3] remoteExec ["BIS_fnc_holdActionRemove", 0, true];
};

PB_fnc_action_4 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	gathered_squad = gathered_squad + 1;
	publicVariable "gathered_squad";
	[squad_intel_4, intel_gathered_4] remoteExec ["BIS_fnc_holdActionRemove", 0, true];
};

//Intel Blackfish
PB_fnc_action_5 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	[black_box, intel_gathered_5] remoteExec ["BIS_fnc_holdActionRemove", 0, true];
	
	[]spawn {
		for "_i" from 5 to 100 step 5 do { 
			hint str format ["Uploading Data.\n %1%/100%",str _i];
			//["Uploading Data.\n %1%/100%",str _i] remoteExec ["hint str format", 0, true];
			sleep 9;
		};

	sent_data_blackfish = true;
	publicVariable "sent_data_blackfish";
	publicVariableServer "sent_data_blackfish";
	};

	//Spawn response
	_randomUnits = selectRandom [5,6,7,8];

	[
		getMarkerPos "qrf_spawn_11",
		getMarkerPos "qrf_target_6",
		_randomUnits,
		1,
		independent
	] call SU_fnc_spawnOPFOR;
	[
		getMarkerPos "qrf_spawn_12",
		getMarkerPos "qrf_target_6",
		_randomUnits,
		1,
		east
	] call SU_fnc_spawnOPFOR;
};

//Intel Tank
PB_fnc_action_6 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	gathered_tank = gathered_tank + 1;
	publicVariable "gathered_tank";
	[tank_intel_1, intel_gathered_6] remoteExec ["BIS_fnc_holdActionRemove", 0, true];
};

PB_fnc_action_7 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	gathered_tank = gathered_tank + 1;
	publicVariable "gathered_tank";
	[tank_intel_2, intel_gathered_7] remoteExec ["BIS_fnc_holdActionRemove", 0, true];
};

PB_fnc_action_8 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	gathered_tank = gathered_tank + 1;
	publicVariable "gathered_tank";
	[tank_intel_3, intel_gathered_8] remoteExec ["BIS_fnc_holdActionRemove", 0, true];
};

//Intel Miller
PB_fnc_action_9 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	player createDiaryRecord ["Intel", ["Title", "<img image='media\evidence.paa'/>"]];
	[miller, intel_gathered_9] remoteExec ["BIS_fnc_holdActionRemove", 0, true];
};

//Add Actions to Boxen
AD_fnc_action_load_1 = {
	hemtt_cargo_1 attachTo [hemtt_collect_1, [0, 0, -0.18]];
	player playMove 'AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon';
	boxes_loaded = boxes_loaded + 1;
	publicVariable 'boxes_loaded';
	[hemtt_cargo_1, box_loaded_1] remoteExec ['removeAction', 0, true];
	[] remoteExec ["AD_fnc_unload_action_1", 0, true]
};
AD_fnc_unload_action_1 = {
	box_unloaded_1 = hemtt_cargo_1 addAction ["Unload Goods","[]spawn AD_fnc_action_unload_1;",nil,1,true,false,"","true",5,false,"",""];
};

AD_fnc_action_unload_1 = {
	player playMove 'AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon';
	detach hemtt_cargo_1;
	_unload_box = hemtt_cargo_1 getRelPos [6, 180];
	hemtt_cargo_1 setPos _unload_box;
	boxes_unloaded = boxes_unloaded + 1;
	publicVariable 'boxes_unloaded';
	[hemtt_cargo_1, box_unloaded_1] remoteExec ['removeAction', 0, true]
};

AD_fnc_action_load_2 = {
	hemtt_cargo_2 attachTo [hemtt_collect_1, [0, -1.5, -0.18]];
	player playMove 'AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon';
	boxes_loaded = boxes_loaded + 1;
	publicVariable 'boxes_loaded';
	[hemtt_cargo_2, box_loaded_2] remoteExec ['removeAction', 0, true];
	[] remoteExec ["AD_fnc_unload_action_2", 0, true]
};
AD_fnc_unload_action_2 = {
	box_unloaded_2 = hemtt_cargo_2 addAction ["Unload Goods","[]spawn AD_fnc_action_unload_2;",nil,1,true,false,"","true",5,false,"",""];
};

AD_fnc_action_unload_2 = {
	player playMove 'AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon';
	detach hemtt_cargo_2;
	_unload_box = hemtt_cargo_2 getRelPos [6.75, 180];
	hemtt_cargo_2 setPos _unload_box;
	boxes_unloaded = boxes_unloaded + 1;
	publicVariable 'boxes_unloaded';
	[hemtt_cargo_2, box_unloaded_2] remoteExec ['removeAction', 0, true]
};

AD_fnc_action_load_3 = {
	hemtt_cargo_3 attachTo [hemtt_collect_1, [0, -3, -0.18]];
	player playMove 'AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon';
	boxes_loaded = boxes_loaded + 1;
	publicVariable 'boxes_loaded';
	[hemtt_cargo_3, box_loaded_3] remoteExec ['removeAction', 0, true];
	[] remoteExec ["AD_fnc_unload_action_3", 0, true]
};
AD_fnc_unload_action_3 = {
	box_unloaded_3 = hemtt_cargo_3 addAction ["Unload Goods","[]spawn AD_fnc_action_unload_3;",nil,1,true,false,"","true",5,false,"",""];
};

AD_fnc_action_unload_3 = {
	player playMove 'AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon';
	detach hemtt_cargo_3;
	_unload_box = hemtt_cargo_3 getRelPos [7.5, 180];
	hemtt_cargo_3 setPos _unload_box;
	boxes_unloaded = boxes_unloaded + 1;
	publicVariable 'boxes_unloaded';
	[hemtt_cargo_3, box_unloaded_3] remoteExec ['removeAction', 0, true]
};

AD_fnc_action_load_4 = {
	hemtt_cargo_4 attachTo [hemtt_collect_2, [0, 0, -0.18]];
	player playMove 'AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon';
	boxes_loaded = boxes_loaded + 1;
	publicVariable 'boxes_loaded';
	[hemtt_cargo_4, box_loaded_4] remoteExec ['removeAction', 0, true];
	[] remoteExec ["AD_fnc_unload_action_4", 0, true]
};
AD_fnc_unload_action_4 = {
	box_unloaded_4 = hemtt_cargo_4 addAction ["Unload Goods","[]spawn AD_fnc_action_unload_4;",nil,1,true,false,"","true",5,false,"",""];
};

AD_fnc_action_unload_4 = {
	player playMove 'AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon';
	detach hemtt_cargo_4;
	_unload_box = hemtt_cargo_4 getRelPos [6, 180];
	hemtt_cargo_4 setPos _unload_box;
	boxes_unloaded = boxes_unloaded + 1;
	publicVariable 'boxes_unloaded';
	[hemtt_cargo_4, box_unloaded_4] remoteExec ['removeAction', 0, true]
};

AD_fnc_action_load_5 = {
	hemtt_cargo_5 attachTo [hemtt_collect_2, [0, -1.5, -0.18]];
	player playMove 'AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon';
	boxes_loaded = boxes_loaded + 1;
	publicVariable 'boxes_loaded';
	[hemtt_cargo_5, box_loaded_5] remoteExec ['removeAction', 0, true];
	[] remoteExec ["AD_fnc_unload_action_5", 0, true]
};
AD_fnc_unload_action_5 = {
	box_unloaded_5 = hemtt_cargo_5 addAction ["Unload Goods","[]spawn AD_fnc_action_unload_5;",nil,1,true,false,"","true",5,false,"",""];
};

AD_fnc_action_unload_5 = {
	player playMove 'AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon';
	detach hemtt_cargo_5;
	_unload_box = hemtt_cargo_5 getRelPos [6.75, 180];
	hemtt_cargo_5 setPos _unload_box;
	boxes_unloaded = boxes_unloaded + 1;
	publicVariable 'boxes_unloaded';
	[hemtt_cargo_5, box_unloaded_1] remoteExec ['removeAction', 0, true]
};

AD_fnc_action_load_6 = {
	hemtt_cargo_6 attachTo [hemtt_collect_2, [0, -3, -0.18]];
	player playMove 'AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon';
	boxes_loaded = boxes_loaded + 1;
	publicVariable 'boxes_loaded';
	[hemtt_cargo_6, box_loaded_6] remoteExec ['removeAction', 0, true];
	[] remoteExec ["AD_fnc_unload_action_6", 0, true]
};
AD_fnc_unload_action_6 = {
	box_unloaded_6 = hemtt_cargo_6 addAction ["Unload Goods","[]spawn AD_fnc_action_unload_6;",nil,1,true,false,"","true",5,false,"",""];
};

AD_fnc_action_unload_6 = {
	player playMove 'AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon';
	detach hemtt_cargo_6;
	_unload_box = hemtt_cargo_6 getRelPos [7.5, 180];
	hemtt_cargo_6 setPos _unload_box;
	boxes_unloaded = boxes_unloaded + 1;
	publicVariable 'boxes_unloaded';
	[hemtt_cargo_6, box_unloaded_6] remoteExec ['removeAction', 0, true]
};

//Create post briefing function
PB_fnc_postbriefing = {
	//Add Action to squad
	intel_gathered_1 = [squad_intel_1, "Pickup Intel", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "_this distance _target < 3", "_caller distance _target < 3", {}, {}, {[] call PB_fnc_action_1}, {}, [], 1.5, nil, false, false] call BIS_fnc_holdActionAdd;
	intel_gathered_2 = [squad_intel_2, "Pickup Intel", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "_this distance _target < 3", "_caller distance _target < 3", {}, {}, {[] call PB_fnc_action_2}, {}, [], 1.5, nil, false, false] call BIS_fnc_holdActionAdd;
	intel_gathered_3 = [squad_intel_3, "Pickup Intel", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "_this distance _target < 3", "_caller distance _target < 3", {}, {}, {[] call PB_fnc_action_3}, {}, [], 1.5, nil, false, false] call BIS_fnc_holdActionAdd;
	intel_gathered_4 = [squad_intel_4, "Pickup Intel", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "_this distance _target < 3", "_caller distance _target < 3", {}, {}, {[] call PB_fnc_action_4}, {}, [], 1.5, nil, false, false] call BIS_fnc_holdActionAdd;

	//Add Action to blackfish
	[flight_log, "Pickup Intel", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "_this distance _target < 5", "_caller distance _target < 5", {}, {}, {deleteVehicle flight_log}, {}, [], 1, nil, false, false] call BIS_fnc_holdActionAdd;
	intel_gathered_5 = [black_box, "Send Data", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "_this distance _target < 3", "_caller distance _target < 3", {}, {}, {[] call PB_fnc_action_5}, {}, [], 3, nil, false, false] call BIS_fnc_holdActionAdd;

	//Add Action to tank
	intel_gathered_6 = [tank_intel_1, "Gather Data", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "_this distance _target < 5", "_caller distance _target < 5", {}, {}, {[] call PB_fnc_action_6}, {}, [], 3, nil, false, false] call BIS_fnc_holdActionAdd;
	intel_gathered_7 = [tank_intel_2, "Gather Data", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "_this distance _target < 5", "_caller distance _target < 5", {}, {}, {[] call PB_fnc_action_7}, {}, [], 3, nil, false, false] call BIS_fnc_holdActionAdd;
	intel_gathered_8 = [tank_intel_3, "Gather Data", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "_this distance _target < 5", "_caller distance _target < 5", {}, {}, {[] call PB_fnc_action_8}, {}, [], 3, nil, false, false] call BIS_fnc_holdActionAdd;

	//Add Action to miller
	intel_gathered_9 = [miller, "Add Diary Entry", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "_this distance _target < 5", "_caller distance _target < 5", {}, {}, {[] call PB_fnc_action_9}, {}, [], 7, nil, false, false] call BIS_fnc_holdActionAdd;

	//Add Sites to screens
	[screen_lrg_3, "Dropoff Food and Medical Supplies", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "_this distance _target < 3", "_caller distance _target < 3", {}, {}, {[strat_map_1] spawn BIS_fnc_moduleStrategicMapOpen}, {}, [], 1, nil, false, false] call BIS_fnc_holdActionAdd;
	[screen_lrg_4, "Investigate Destroyed Tank", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "_this distance _target < 3", "_caller distance _target < 3", {}, {}, {[strat_map_2] spawn BIS_fnc_moduleStrategicMapOpen}, {}, [], 1, nil, false, false] call BIS_fnc_holdActionAdd;
	[screen_lrg_5, "Destroy Artillery", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "_this distance _target < 3", "_caller distance _target < 3", {}, {}, {[strat_map_3] spawn BIS_fnc_moduleStrategicMapOpen}, {}, [], 1, nil, false, false] call BIS_fnc_holdActionAdd;
	[screen_lrg_6, "Sweep Town Held by Enemies", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "_this distance _target < 3", "_caller distance _target < 3", {}, {}, {[strat_map_4] spawn BIS_fnc_moduleStrategicMapOpen}, {}, [], 1, nil, false, false] call BIS_fnc_holdActionAdd;
	[screen_lrg_7, "Destroy Enemy Helicopters", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "_this distance _target < 3", "_caller distance _target < 3", {}, {}, {[strat_map_5] spawn BIS_fnc_moduleStrategicMapOpen}, {}, [], 1, nil, false, false] call BIS_fnc_holdActionAdd;

	//Add Action to Strategic Map
	[board_map_1, "Open Strategic Map", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "_this distance _target < 3", "_caller distance _target < 3", {}, {}, {[strat_map] spawn BIS_fnc_moduleStrategicMapOpen}, {}, [], 1, nil, false, false] call BIS_fnc_holdActionAdd;

	//Add Action to Boxes
	box_loaded_1 = hemtt_cargo_1 addAction ["Load Goods onto HEMTT","[]spawn AD_fnc_action_load_1;",nil,1,true,false,"","true",3,false,"",""];
	box_loaded_2 = hemtt_cargo_2 addAction ["Load Goods onto HEMTT","[]spawn AD_fnc_action_load_2;",nil,1,true,false,"","true",3,false,"",""];
	box_loaded_3 = hemtt_cargo_3 addAction ["Load Goods onto HEMTT","[]spawn AD_fnc_action_load_3;",nil,1,true,false,"","true",3,false,"",""];
	box_loaded_4 = hemtt_cargo_4 addAction ["Load Goods onto HEMTT","[]spawn AD_fnc_action_load_4;",nil,1,true,false,"","true",3,false,"",""];
	box_loaded_5 = hemtt_cargo_5 addAction ["Load Goods onto HEMTT","[]spawn AD_fnc_action_load_5;",nil,1,true,false,"","true",3,false,"",""];
	box_loaded_6 = hemtt_cargo_6 addAction ["Load Goods onto HEMTT","[]spawn AD_fnc_action_load_6;",nil,1,true,false,"","true",3,false,"",""];
};

sleep 1;

if (isServer) then {
	//Add Actions
	[] remoteExec ["PB_fnc_postbriefing", 0, true];

	sleep 1;

	while {true} do {
		//Play Hardbass
		[] remoteExec ["PB_fnc_hardbass", 0, true];
		sleep 75;
	};
};