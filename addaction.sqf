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

//Intel Miller
PB_fnc_action_9 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	player createDiaryRecord ["Intel", ["Title", "<img image='media\evidence.paa'/>"]];
	[miller, intel_gathered_9] remoteExec ["BIS_fnc_holdActionRemove", 0, true];
};

//Create post briefing function
PB_fnc_postbriefing = {
	//Add Action to miller
	intel_gathered_9 = [miller, "Add Diary Entry", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "_this distance _target < 5", "_caller distance _target < 5", {}, {}, {[] call PB_fnc_action_9}, {}, [], 7, nil, false, false] call BIS_fnc_holdActionAdd;

	//Add Action to Strategic Map
	[board_map_1, "Open Strategic Map", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "_this distance _target < 3", "_caller distance _target < 3", {}, {}, {[strat_map] spawn BIS_fnc_moduleStrategicMapOpen}, {}, [], 1, nil, false, false] call BIS_fnc_holdActionAdd;
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