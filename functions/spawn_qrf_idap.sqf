/*
Example:
[
	getMarkerPos "qrf_spawn_4",
	getMarkerPos "qrf_target_1",
	2,
	120,
	CIVILIAN
] call SU_fnc_spawnIDAP;
__________________________________________________________________*/
params [
	["_location_start", [0, 0, 0], ["", objNull, taskNull, locationNull, [], grpNull], [3]],
	["_location_end", [0, 0, 0], ["", objNull, taskNull, locationNull, [], grpNull], [3]],
	["_amount", 2, [0]],
	["_delay", 90, [0]],
	["_side", CIVILIAN, []]
];

//Delay QRF
[_location_start, _location_end, _amount, _delay, _side] spawn {

	params ["_location_start", "_location_end", "_amount", "_delay", "_side"];

	sleep _delay;

	//Create Group
	private _idap_group = createGroup [_side, false];

	//Spawn IDAP

	for "_i" from 1 to _amount step 1 do {
	rifle_man = "C_IDAP_Man_AidWorker_08_F" createUnit [_location_start, _idap_group];
	};

	//Spawn Vehicle
	vehicleSpawn = "C_IDAP_Van_02_vehicle_F" createVehicle _location_start;

	//Order Get In
	_wp_getIn = _idap_group addWaypoint [_location_start, 0];
		_wp_getIn waypointAttachVehicle vehicleSpawn;
		_wp_getIn setWaypointType "GETIN";
		_wp_getIn setWaypointSpeed "FULL";

	//Order to Target
	_wp_move = _idap_group addWaypoint [_location_end, 1];
		_wp_move setWaypointType "MOVE";
		_wp_move setWaypointSpeed "FULL";
		[_idap_group, 1] setWaypointCompletionRadius 75;

	//Order Get Out
	_wp_getOut = _idap_group addWaypoint [_location_end, 2];
		_wp_getOut setWaypointType "GETOUT";
		_wp_getOut setWaypointSpeed "FULL";
		_wp_getOut setWaypointStatements ["true", "waypoint_2_done = true;"];
};