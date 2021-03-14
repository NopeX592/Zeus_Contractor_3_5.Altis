[]execVM "main_script.sqf";
[]execVM "briefing_1.sqf";
[]execVM "briefing_2.sqf";
[]execVM "addaction.sqf";
[]execVM "humanitarian\hold_checkpoint.sqf";

if (hasInterface) then {
	[] spawn {
		waitUntil {alive player};
		player setVariable ["loadout", getUnitLoadout player, false];
		player addEventHandler ["Respawn", {
			player setUnitLoadout (player getVariable "loadout");
		}];
	};
};

//Create Functions
AD_fnc_supplyDrop = compile preprocessFileLineNumbers "functions\supplydrop.sqf";
AD_fnc_airDrop = compile preprocessFileLineNumbers "functions\airdrop.sqf";
SU_fnc_spawnOPFOR = compile preprocessFileLineNumbers "functions\spawn_qrf_opfor.sqf";
SU_fnc_spawnIDAP = compile preprocessFileLineNumbers "functions\spawn_qrf_idap.sqf";
BT_fnc_createTable = compile preprocessFileLineNumbers "functions\createTable.sqf";
BT_fnc_clearTable = compile preprocessFileLineNumbers "functions\clearTable.sqf";