/*
Author: HallyG
Modified by: Nope.X
Example:
[
	"CargoNet_01_box_F",
	position player,
	125,
	750,
	1000,
	200,
	4,
	[0,0,-1.2]
] call AD_fnc_airDrop;
__________________________________________________________________*/
params [
	["_object", "C_IDAP_CargoNet_01_supplies_F", [""]],
	["_centre", [0, 0, 0], ["", objNull, taskNull, locationNull, [], grpNull], [3]],
	["_drop_distance", 125, [0]],
	["_height", 300, [0]],
	["_distance", 750, [0]],
	["_direction_s", 35, [0]],
	["_repetitions", 4, [0]],
	["_attachTo", [0, 0, -1.2], [[]], [3]]
];

//Create Flyby
_direction_e = _direction_s + 180;

_flyby_start = dropsite_logic getRelPos [_distance, _direction_s];
_flyby_end = dropsite_logic getRelPos [_distance, _direction_e];

[_flyby_start, _flyby_end, _height, "NORMAL", "B_T_VTOL_01_vehicle_F", west] call BIS_fnc_ambientFlyby;


_centre = _centre call {
	if (_this isEqualType objNull) exitWith {getPosASL _this};
	if (_this isEqualType grpNull) exitWith {getPosASL (leader _this)};
	if (_this isEqualType "") exitWith {getMarkerPos _this};
	if (_this isEqualType locationNull) exitWith {locationPosition _this};
	if (_this isEqualType taskNull) exitWith {taskDestination  _this};
	if (_this isEqualType []) exitWith {_this};
	[0, 0, 0]
};

if (!(isClass (configfile >> "cfgVehicles" >> _object)) || _centre isEqualTo [0, 0, 0]) exitWith {
	objNull
};

//Delay drops
[_object, _centre, _drop_distance, _height, _distance, _direction_s, _repetitions, _attachTo, _direction_e] spawn {

	params ["_object", "_centre", "_drop_distance", "_height", "_distance", "_direction_s", "_repetitions", "_attachTo", "_direction_e"];

	sleep 9.75;

	//Repeat
	_objArray = [];

	for "_i" from 1 to _repetitions step 1 do {
		//Space out drops
		_centre_distance = dropsite_logic getRelPos [_drop_distance, _direction_e];
		_objArray pushBack createVehicle [_object, _centre_distance vectorAdd [0, 0, _height], [], 0, "NONE"]; 
		_drop_distance = _drop_distance + 62.5;
	}; 

	//Set Variables
	_count = 0;
	_unload_pos_1 = 6;
	_unload_pos_2 = 6;
	_load_pos_1 = 0;
	_load_pos_2 = 0;
	_qrf_amount = 0;
	boxes_loaded = 0;
	boxes_unloaded = 0;
	_repetitions = _repetitions - 2;
	_qrf_spawns = ["qrf_spawn_1","qrf_spawn_2","qrf_spawn_3","qrf_spawn_4"];
	publicVariable "boxes_loaded";
	publicVariable "boxes_unloaded";
	_playerArray = allPlayers;
	_boxes_preset = [hemtt_cargo_1, hemtt_cargo_2, hemtt_cargo_3, hemtt_cargo_4, hemtt_cargo_5, hemtt_cargo_6];

	//Create Airdrops
	{
		_para = createVehicle ["B_parachute_02_F", [0,0,0], [], 0, "FLY"];

		_para setDir getDir _x;
		_para setPos getPos _x;
		_x lock false;
		_x attachTo [_para, _attachTo];

		        [_x, _para, _count, _boxes_preset] spawn {
            params ["_x","_para", "_count", "_boxes_preset"];
                
            waitUntil {
                sleep 0.01;
                ((position _x) select 2) < 2 
                || 
                isNull _para 
                || 
                (count (lineIntersectsWith [getPosASL _x, (getPosASL _x) vectorAdd [0, 0, -0.5], _x, _para])) > 0
            };
                
            _para disableCollisionWith _x;
            _x setVectorUp [0,0,1];
            _x setVelocity [0,0,0];
            detach _x;
                
            if (!isNull _para) then {deleteVehicle _para};

            //Attach Smoke
            _smoke = "Orange";
            _smoke = createVehicle ["SmokeShell"+_smoke, [0,0,0], [], 0 , ""];
            _smoke attachTo [_x, [0,0,0]];

			//Set Box Positions
            _position = getPosASL _x;
			deleteVehicle _x;
            _boxes_preset select _count setPosASL _position
        };
            
        _count = _count + 1;

		/*
		//Add Action
		_box = _x;

		PB_fnc_action_load = {
			params ["_hemtt", "_box", "_load_pos", "_unload_pos", "_box_loaded"];
			player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
			_box attachTo [_hemtt, [0, _load_pos, -0.18]];
			boxes_loaded = boxes_loaded + 1;
			publicVariable "boxes_loaded";
			[_box, _unload_pos] remoteExec ["AD_fnc_createUnLoad", 0, true];
			[_box, _box_loaded] remoteExec ["removeAction", 0, true];
		};

		PB_fnc_action_unload = {
			params ["_box", "_unload_pos", "_box_unloaded"];
			player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
			detach _box;
			_unload_box = _box getRelPos [_unload_pos, 180];
			_box setPos _unload_box;
			boxes_unloaded = boxes_unloaded + 1;
			publicVariable "boxes_unloaded";
			[_box, _box_unloaded] remoteExec ["removeAction", 0, true];
		};

		AD_fnc_createLoad = {
			params ["_hemtt", "_box", "_load_pos", "_unload_pos"];
			_box_loaded = _box addAction ["Load Goods onto HEMTT","
				params ['_box', 'player', '_box_loaded', '_arguments'];
				_arguments params ['_hemtt', '_load_pos', '_unload_pos'];
				[_hemtt, _box, _load_pos, _unload_pos, _box_loaded] call PB_fnc_action_load;
			",[_hemtt, _load_pos, _unload_pos],1,true,false,"","true",3,false,"",""];
		};

		AD_fnc_createUnLoad = {
			params ['_box', '_unload_pos'];
			_box_unloaded = _box addAction ["Unload Goods","
				params ['_box', 'player', '_box_unloaded', '_arguments'];
				_arguments params ['_unload_pos'];
				[_box, _unload_pos, _box_unloaded] call PB_fnc_action_unload;
			",_unload_pos,1,true,false,"","true",5,false,"",""];
		};

		if (_count mod 2 == 0) then {
			[hemtt_collect_1, _box, _load_pos_1, _unload_pos_1, _x] remoteExec ["AD_fnc_createLoad", 0, true];
			_load_pos_1 = _load_pos_1 - 1.5;
			_unload_pos_1 = _unload_pos_1 + 0.75;
		} else {
			[hemtt_collect_2, _box, _load_pos_2, _unload_pos_2, _x] remoteExec ["AD_fnc_createLoad", 0, true];
			_load_pos_2 = _load_pos_2 - 1.5;
			_unload_pos_2 = _unload_pos_2 + 0.75;
		};

		//Cycle HEMTT
		_count = _count + 1;
		*/

		//Spawn QRF
		if (_qrf_amount < _repetitions) then {
			_qrf_amount = _qrf_amount + 1;
			_randomStarting = selectRandom _qrf_spawns;
			_randomUnits = selectRandomWeighted [6,0.15,7,0.15,8,0.35,9,0.1,10,0.1,11,0.1,12,0.05];

			//Get target position
			_position_target_air = position _x;
			_position_target_air set [2, 0];
			[
				getMarkerPos _randomStarting,
				_position_target_air,
				_randomUnits,
				1,
				independent
			] call SU_fnc_spawnOPFOR;
			_newArray = [];
			{ if (_x != _randomStarting) then {_newArray pushBack _x}; } forEach _qrf_spawns;
			_qrf_spawns = _newArray;
		};
	} forEach _objArray;
};