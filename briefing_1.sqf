_run_1 = true;
_run_2 = true;
drone_feed_on = false;
drone_feed_off = false;
publicVariable "drone_feed_on";
publicVariable "drone_feed_off";

private ["_mission", "_diary_text", "_roles"];
_mission = toUpper (format ["%1",getText (missionconfigfile >> "onLoadName")]);

_diary_text = _mission + "<br/>" + 
format [" Date: %3.%2.%1<br/>",date select 0,date select 1,date select 2]+
format [" Location: %1<br/>",worldName]+
format [" Type: %1<br/>",getText (missionconfigfile >> "Header" >> "gameType")]+
format [" Players: %1-%2<br/>",getNumber (missionconfigfile >> "Header" >> "minPlayers"),getNumber (missionconfigfile >> "Header" >> "maxPlayers")]+
format [" Authors: %1<br/><br/>",getText (missionconfigfile >> "author")]+
"<br/>"+
"FEATURES:<br/>"+
"• Virtual Arsenal<br/>"+
"• Artillery Support<br/>"+
"• Mortar Support<br/>"+
"• V-44X Blackfish Support<br/>"+
"• Supply Drop<br/>"+
"<br/>"+
"THANKS:<br/>"+
"• Oskar for playtesting<br/>"+
"• Oskar for bearing with my expressions of frustration<br/>"+
"• Alex for helping me with programming<br/>"+
"";

_roles = "<br/>"+
"General:<br/>
    • Since your last deployment a week ago tensions rose<br/>
        • More CSAT activity<br/>
        • Tried evacuate all civilians<br/>
            • Still high civilian activity<br/>
    • Enemy Types to expect:<br/>
        • Mostly infantry<br/>
        • Some Technicals<br/>
        • Expect some armour<br/>
        • More ManPADs<br/>
        • Mine fields are marked on map<br/>
    • Front line markings only accurate for CSAT<br/>
        • Past front line expect CSAT and IND<br/>
        • Within should only be IND<br/>
    • Virus Outbreak<br/>
        • Orange Markings are infected areas<br/>
        • Do not enter without consulting with me<br/>
        • Do not enter without CBRN Suits<br/>
    • All intel you gather is sent back to me immediately<br/>
    • Enemy is more reactive<br/>
        • More QRFs<br/>
<br/>
Humanitarian:<br/>
    • Collect Food and Medical supplies<br/>
    • Load supplies on to HEMTTs<br/>
    • Dropoff supplies in Kalithea<br/>
    • Recapture Kalithea from IND<br/>
    • Enemies will let off once IDAP arrives<br/>
    • Air Drop can be called in via the radio in the marked area<br/>
<br/>
Investigation:<br/>
    • Lost contact to squad<br/>
        • Investigate their deaths<br/>
        • Search them for Intel<br/>
    • Lost contact to Blackfish<br/>
        • Search for Blackbox and upload Datais<br/>
        • Search for flight log<br/>
    • Lost contact to Tank<br/>
        • Investigate Debris<br/>
    • Intel is for my eyes only<br/>
    • Datais transferred automatically<br/>
<br/>
Kill:<br/>
    • Kill Artillery<br/>
            • High Priority<br/>
    • After done with investigation:<br/>
        • Sweep town of Chalkeia<br/>
        • Destroy stationed Helicopters nearby<br/>
        • Destroy the nearby comms towers<br/>
            • You'll need charges<br/>
            • RTB if necessary<br/>
<br/>
Support:<br/>
    • Artillery Strikes possible<br/>
        • Use only if no other way<br/>
    • Mortar Support possible<br/>
    • Supply drop<br/>
        • If called in IND will most likely respond<br/>
<br/>"+
"";

waitUntil {!isNull player};
player createDiaryRecord ["Diary", ["Briefing 1",_roles]];
player createDiaryRecord ["Diary", [_mission, _diary_text]];

//Create Drone Feeds
while {_run_1} do {
    sleep 1;

    if (drone_feed_on) then {
        _run_1 = false;
        _run_2 = true;

        //Start Feeds
        []execVM "drone_feeds.sqf";
    };
};

while {_run_2} do {
    sleep 1;

    if (drone_feed_off) then {
        _run_2 = false;
        
        //Remove event handler Draw3D
        removeAllMissionEventHandlers "Draw3D";
    };
};