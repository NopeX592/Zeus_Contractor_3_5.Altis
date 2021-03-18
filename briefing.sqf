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
    • Since your last deployment three days tensions rose further<br/>
        • More CSAT activity<br/>
    • Enemy Types to expect:<br/>
        • Mostly infantry<br/>
        • Some Technicals<br/>
        • Less armour than last deployment<br/>
            • Will most likely be found in cities<br/>
        • Some ManPADs<br/>
        • Mine fields are marked on map<br/>
    • Front line markings only accurate for CSAT<br/>
        • Past front line expect CSAT and IND<br/>
        • Within should only be IND<br/>
    • Virus Outbreak<br/>
        • Orange Markings are infected areas<br/>
        • Do not enter without consulting with me<br/>
        • Do not enter without CBRN Suits<br/>
    • Relocated to new FOB<br/>
    • All intel you gather is sent back to me immediately<br/>
    • Additional assets found at aircraft carrier or FOB Alpha<br/>
    • Enemy is more reactive<br/>
        • More QRFs<br/>
<br/>
Kill:<br/>
    • Destroy Mortars<br/>
        • High Priority<br/>
    • Destroy Tank (Optional)<br/>
        • It can be found roaming the swamp of Limni<br/>
    • Sweep town of Chalkeia<br/>
        • Tank spotted in vicinity<br/>
    • Destroy stationed Helicopters nearby<br/>
        • Expect MRAPs<br/>
    • Destroy the nearby comms towers<br/>
        • You'll need charges<br/>
        • Light defenses<br/>
<br/>
• Eastwind:<br/>
    • We have analysed the intel you gathered<br/>
    • Miller has defected from NATO<br/>
    • Miller is now allied to IND<br/>
    • He took the Eastwind device he captured a week ago<br/>
    • You escorted the device in the convoy<br/>
    • Expect more armor than usual<br/>
    • Your tasks are<br/>
        • Assasinate Miller<br/>
            • Confirm the kill<br/>
            • Search surrounding area for intel<br/>
        • Recapture the Eastwind device<br/>
            • We have 2 locations<br/>
            • Marked on map<br/>
            • The site closer to the front line is more likely as easier defendable<br/>
            • Return Eastwind device to this FOB<br/>
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
player createDiaryRecord ["Diary", ["Briefing",_roles]];
player createDiaryRecord ["Diary", [_mission, _diary_text]];