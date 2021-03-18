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

//Create post briefing function
PB_fnc_postbriefing = {
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