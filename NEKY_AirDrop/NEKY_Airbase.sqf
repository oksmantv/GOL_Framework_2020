
///  _null = [BaseObject,AirSpawn,AirZone,EAST,"O_Heli_Light_02_unarmed_F","Unload",[2,1]] execVM "Scripts\NEKY_AirDrop\NEKY_Airbase.sqf";

if (!isServer) exitWith {false};		// Ensures only server

_Object = _this select 0; // Base Object that can be destroyed to stop reinforcements
_SpawnPos = _this select 1; // Helipad at Airbase that spawns helicopters
_ReinforcementZone = _this select 2; // Zone that AI will reinforce if contested by players
_OKS_Side = _this select 3; // Side of Helicopter Reinforcements
_Classname = _this select 4; // Helicopter Classname
_Type = _this select 5; // "Unload" or "Drop"
_Troops = _this select 6; // [2,1] - [ProcentageofCargoSpace,NumberOfTeamsToSplitInto]
_PlayerTarget = objNull;

Private ["_AirbaseRespawnTimer","_AirbaseRandomDistanceLZ","_AirbaseRefreshRate","_AirbaseRespawnCount","_EgressPos","_playerHunted","_OKS_Side"];
Private _Side = _OKS_Side;

#include "NEKY_Settings.sqf"


While {Alive _Object && _AirbaseRespawnCount > 0 } do {

	///_TriggerReinforcements = { [_ReinforcementZone, _x] call BIS_fnc_inTrigger; && _Side knowsAbout _x > 3.5} count AllPlayers != 0;
	_playerHunted = [];

	{
		if (([_ReinforcementZone, _x] call BIS_fnc_inTrigger) && (_OKS_Side knowsAbout _X > 3.5 || _OKS_Side knowsAbout vehicle _X > 3.5) && (isTouchingGround (vehicle _X)))
		then
		{
			//SystemChat str [_OKS_Side,_OKS_Side knowsAbout _X, _OKS_Side knowsAbout _X > 3.5,isTouchingGround(vehicle _X)];
			//sleep 10;
			//SystemChat str ([_ReinforcementZone, _x] call BIS_fnc_inTrigger) && (_OKS_Side knowsAbout _X > 3.5 || _OKS_Side knowsAbout vehicle _X > 3.5) && (isTouchingGround (vehicle _X));
			_playerHunted pushBackUnique _X; sleep 0.5;
		};
	} foreach (AllPlayers - (Entities "HeadlessClient_F"));

	sleep 2;
	//SystemChat str _playerHunted;

	if (count _playerHunted != 0) then {

		sleep (Random _AirbaseRespawnTimer);

		_AirbaseRespawnCount = _AirbaseRespawnCount - 1;
		_PlayerTarget = _playerHunted call BIS_fnc_selectRandom;
		_CalculatedIngress = _PlayerTarget getPos [Random 360,_AirbaseRandomDistanceLZ+(Random _AirbaseRandomDistanceLZ)];
		sleep 5;
		//SystemChat str _EgressPos;
		null = [_OKS_Side, _Classname, False, _Type, _SpawnPos, _CalculatedIngress, _EgressPos, _Troops, [_CalculatedIngress],False,False,_ReinforcementZone] execVM "Scripts\NEKY_AirDrop\NEKY_AirDrop.sqf";
		SystemChat "Helicopter Spawned...";
		_Time = _AirbaseRespawnTimer + (Random _AirbaseRespawnTimer);
		sleep _Time;
		//SystemChat format ["%1 Airbase Cooldown Ended...",_Time];
	}
	else
	{
		sleep _AirbaseRefreshRate;
		//SystemChat "Airbase Rotation Ended...";
	};

};

if(!alive _Object) then {
	SystemChat format["%1 Base Destroyed - Script Ending",_Object];
};

if(alive _Object) then {
	SystemChat format["Enemy Respawns Left: %1 - Script Ending.",_AirbaseRespawnCount];
};



/*
_TriggerAreas = [ <positions> ];
_LZs = [ [<pos>,<WPs>] ];
_Viable = [];
For "_i" from 0 to (Count _TriggerAreas -1) step 1 do
{
_Area = _TriggerAreas select _i;
_LZ = _LZs select _i;
_TriggerAir = { _x distance2D _Area < 500 } count AllPlayers != 0;
_NoPlayerAtLZ = { _x distance2D _LZ#0 < 150 } count allPlayers == 0;
if (_TriggerAir && _NoPLayerAtLZ) then { _Viable pushBack [_LZ] };
};

if (Count _Viable != 0) then
{
// Viable == [ [LZPos, [WPs]] ......]
_LZ = selectRandom _Viable;

};

