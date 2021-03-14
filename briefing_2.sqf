_run = true;
task_3_5_done = false;

while {_run} do {
    sleep 1;
    if (task_3_5_done) then {
        _run = false;

        private ["_mission_2", "_roles_2"];
        _mission_2 = toUpper (format ["%1",getText (missionconfigfile >> "onLoadName")]);

        _roles_2 = "<br/>"+
        "
Hold checkpoint<br/>
    • Man checkpoint at the Airflied of Almyra<br/>
    • Earlier Team had no CBRN and is infected<br/>
    • Pitch in temporarily<br/>
    • Attacks expected<br/>
    • Kill everyone not leaving the immediate area of the checkpoint<br/>
        • IND controlled area<br/>
        • IND has to keep their people Within<br/>
    • Wait unitl new units arrive<br/>
    <br/>
Eastwind:<br/>
    • We have analysed the intel you gathered<br/>
    • Miller has defected from NATO<br/>
    • Miller is now allied to IND<br/>
    • He took the Eastwind device he captured a week ago<br/>
    • You escorted the device in the convoy<br/>
    • Expect more armor than usual<br/>
    • Your tasks are<br/>
        • Assasinate Miller<br/>
            • Confirm the kill<br/>
            • Search him from intel<br/>
        • Recapture the Eastwind device<br/>
            • We have 2 locations<br/>
            • Marked on map<br/>
            • The site closer to the front line is more likely as easier defendable<br/>
            • Return Eastwind device to this FOB<br/>
            <br/>"+
        "";

        waitUntil {!isNull player};
        player createDiaryRecord ["Diary", ["Briefing 2",_roles_2]];
    };
};