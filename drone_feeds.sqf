//Create Feed A - Humanitarian
[
	screen_lrg_3,
	uav_target_1,
	uav_recon_1
] spawn {
	params [
		["_taget_screen", screen_lrg_3, []],
		["_target_uav", uav_target_1, []],
		["_uav_1", uav_recon_1, []]
	];

	uav_1 = _uav_1;

	//Select screen
	[_taget_screen, 2] call BIS_fnc_DataTerminalAnimate;   
	_taget_screen setObjectTexture [0, "#(argb,512,512,1)r2t(uavrtt1,1)"];

	//Create camera
	cam_1 = "camera" camCreate [0,0,0];
	cam_1 cameraEffect ["Internal", "Back", "uavrtt1"];
	cam_1 camSetFov 0.3;
	cam_1 attachTo [uav_1, [0,0,0], "PiP0_pos"];
	"uavrtt1" setPiPEffect [2];

	//Line up camera
	addMissionEventHandler ["Draw3D", {
		_dir =
			(uav_1 selectionPosition "PiP0_pos")
				vectorFromTo
			(uav_1 selectionPosition "PiP0_dir");
		cam_1 setVectorDirAndUp [
			_dir,
			_dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]
		];    
	}];

	//Target UAV camera
	cam_1 camPrepareTarget getpos _target_uav;
	cam_1 camSetTarget _target_uav;
	cam_1 lockCameraTo [_target_uav, [0]];
	cam_1 camCommit 1;
};

sleep 5;

//Create Feed B - Investigate
[
	screen_lrg_4,
	uav_target_2,
	uav_recon_2
] spawn {
	params [
		["_taget_screen", screen_lrg_4, []],
		["_target_uav", uav_target_2, []],
		["_uav_2", uav_recon_2, []]
	];

	uav_2 = _uav_2;

	//Select screen
	[_taget_screen, 2] call BIS_fnc_DataTerminalAnimate;   
	_taget_screen setObjectTexture [0, "#(argb,512,512,1)r2t(uavrtt2,1)"];

	//Create camera
	cam_2 = "camera" camCreate [0,0,0];
	cam_2 cameraEffect ["Internal", "Back", "uavrtt2"];
	cam_2 camSetFov 0.3;
	cam_2 attachTo [uav_2, [0,0,0], "PiP0_pos"];
	"uavrtt2" setPiPEffect [2];

	//Line up camera
	addMissionEventHandler ["Draw3D", {
		_dir =
			(uav_2 selectionPosition "PiP0_pos")
				vectorFromTo
			(uav_2 selectionPosition "PiP0_dir");
		cam_2 setVectorDirAndUp [
			_dir,
			_dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]
		];    
	}];

	//Target UAV camera
	cam_2 camPrepareTarget getpos _target_uav;
	cam_2 camSetTarget _target_uav;
	cam_2 lockCameraTo [_target_uav, [0]];
	cam_2 camCommit 1;
};

sleep 5;

//Create Feed C - Kill
[
	screen_lrg_5,
	uav_target_3,
	uav_recon_3
] spawn {
	params [
		["_taget_screen", screen_lrg_5, []],
		["_target_uav", uav_target_3, []],
		["_uav_3", uav_recon_3, []]
	];

	uav_3 = _uav_3;

	//Select screen
	[_taget_screen, 2] call BIS_fnc_DataTerminalAnimate;   
	_taget_screen setObjectTexture [0, "#(argb,512,512,1)r2t(uavrtt3,1)"];

	//Create camera
	cam_3 = "camera" camCreate [0,0,0];
	cam_3 cameraEffect ["Internal", "Back", "uavrtt3"];
	cam_3 camSetFov 0.3;
	cam_3 attachTo [uav_3, [0,0,0], "PiP0_pos"];
	"uavrtt3" setPiPEffect [2];

	//Line up camera
	addMissionEventHandler ["Draw3D", {
		_dir =
			(uav_3 selectionPosition "PiP0_pos")
				vectorFromTo
			(uav_3 selectionPosition "PiP0_dir");
		cam_3 setVectorDirAndUp [
			_dir,
			_dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]
		];    
	}];

	//Target UAV camera
	cam_3 camPrepareTarget getpos _target_uav;
	cam_3 camSetTarget _target_uav;
	cam_3 lockCameraTo [_target_uav, [0]];
	cam_3 camCommit 1;
};

sleep 5;

//Create Feed D - Kill
[
	screen_lrg_6,
	uav_target_4,
	uav_recon_4
] spawn {
	params [
		["_taget_screen", screen_lrg_6, []],
		["_target_uav", uav_target_4, []],
		["_uav_4", uav_recon_4, []]
	];

	uav_4 = _uav_4;

	//Select screen
	[_taget_screen, 2] call BIS_fnc_DataTerminalAnimate;   
	_taget_screen setObjectTexture [0, "#(argb,512,512,1)r2t(uavrtt4,1)"];

	//Create camera
	cam_4 = "camera" camCreate [0,0,0];
	cam_4 cameraEffect ["Internal", "Back", "uavrtt4"];
	cam_4 camSetFov 0.3;
	cam_4 attachTo [uav_4, [0,0,0], "PiP0_pos"];
	"uavrtt4" setPiPEffect [2];

	//Line up camera
	addMissionEventHandler ["Draw3D", {
		_dir =
			(uav_4 selectionPosition "PiP0_pos")
				vectorFromTo
			(uav_4 selectionPosition "PiP0_dir");
		cam_4 setVectorDirAndUp [
			_dir,
			_dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]
		];    
	}];

	//Target UAV camera
	cam_4 camPrepareTarget getpos _target_uav;
	cam_4 camSetTarget _target_uav;
	cam_4 lockCameraTo [_target_uav, [0]];
	cam_4 camCommit 1;
};

sleep 5;

//Create Feed E - Kill
[
	screen_lrg_7,
	helicopter_2,
	uav_recon_5
] spawn {
	params [
		["_taget_screen", screen_lrg_7, []],
		["_target_uav", helicopter_2, []],
		["_uav_5", uav_recon_5, []]
	];

	uav_5 = _uav_5;

	//Select screen
	[_taget_screen, 2] call BIS_fnc_DataTerminalAnimate;   
	_taget_screen setObjectTexture [0, "#(argb,512,512,1)r2t(uavrtt5,1)"];

	//Create camera
	cam_5 = "camera" camCreate [0,0,0];
	cam_5 cameraEffect ["Internal", "Back", "uavrtt5"];
	cam_5 camSetFov 0.3;
	cam_5 attachTo [uav_5, [0,0,0], "PiP0_pos"];
	"uavrtt5" setPiPEffect [2];

	//Line up camera
	addMissionEventHandler ["Draw3D", {
		_dir =
			(uav_5 selectionPosition "PiP0_pos")
				vectorFromTo
			(uav_5 selectionPosition "PiP0_dir");
		cam_5 setVectorDirAndUp [
			_dir,
			_dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]
		];    
	}];

	//Target UAV camera
	cam_5 camPrepareTarget getpos _target_uav;
	cam_5 camSetTarget _target_uav;
	cam_5 lockCameraTo [_target_uav, [0]];
	cam_5 camCommit 1;
};