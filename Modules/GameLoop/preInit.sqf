#include "script_Component.hpp"

PREP(startText);
PREP(weaponLock);

GVAR(Timer) = -1;	// useType == false

GVAR(CiviKillCount) = 0;

GVAR(SafeMode_Enabled) = true;
GVAR(SafeMode_Count) = -1;	// useType == false
GVAR(SafeZoneMarkers) = [];

[
	QGVAR(event), "LIST",
	["Mission Event Sync", "How often the mission event will trigger depending on how long the mission has progressed"],
	[QUOTE(ADDON), ""], [[0.5,1,1.5,2,5], ["30 Sec","60 Sec","90 Sec","2 Min","5 Min"], 1],
	CBA_SERVEROVERWRITE, {}, CBA_NEEDRESTART
] call CBA_settings_fnc_init;

[QGVAR(civiKillTracker), "CHECKBOX", ["Display Civilians Killed", "Globaly displays a chat message when a civilian is killed"], QUOTE(ADDON), false, CBA_SERVEROVERWRITE, {}, CBA_NEEDRESTART] call CBA_settings_fnc_init;

[
	QGVAR(SafeMode_useType), "LIST",
	["Safe Start Mode", ""],
	[QUOTE(ADDON), "SafeMode"], [[0,1,2], ["Disabled", "Countdown", "Admin Only"], 0],
	CBA_SERVEROVERWRITE, {}, CBA_NEEDRESTART
] call CBA_settings_fnc_init;

[
	QGVAR(SafeMode_Timer), "LIST",
	["Starting Protection", "Disables all weapons during the first minutes of the mission"],
	[QUOTE(ADDON), "SafeMode"], [[-1,1,3,5,10,15,20], ["Disabled","1 Min","3 Min","5 Min","10 Min","15 Min","20 Min"], 3],
	CBA_SERVEROVERWRITE, {}, CBA_NEEDRESTART
] call CBA_settings_fnc_init;
