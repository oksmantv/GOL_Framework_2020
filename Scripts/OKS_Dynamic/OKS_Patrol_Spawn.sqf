/*
	OKS_Patrol_Spawn
	[Trigger,5,200,EAST,["O_Soldier_F"]] execVM "Scripts\OKS_Dynamic\OKS_Patrol_Spawn.sqf";
*/

 	if(!isServer) exitWith {};

	Params ["_Area","_NumberInfantry","_Range","_Side","_Units"];
	private ["_Spawnpos","_RandomPos"];

		if(typeName _Area == "ARRAY") then {
			_SpawnPos = _Area;
		} else {
			while {true} do {
				_RandomPos = _Area call BIS_fnc_randomPosTrigger;
				_SpawnPos = [_RandomPos, 1, (TriggerArea _Area select 0), 20, 0, 35, 0] call BIS_fnc_findSafePos;
				if(_SpawnPos inArea _Area) exitWith {};
			};
		};

		_Group = CreateGroup _Side;
		for "_i" from 1 to (_NumberInfantry - 1) do
		{
			Private "_Unit";
			if ( (count (units _Group)) == 0 ) then
			{
				_Unit = _Group CreateUnit [(_Units call BIS_FNC_selectRandom), [_SpawnPos select 0,_SpawnPos select 1,0], [], 30, "NONE"];
				_Unit setRank "SERGEANT";
			} else {
				_Unit = _Group CreateUnit [(_Units call BIS_FNC_selectRandom), [_SpawnPos select 0,_SpawnPos select 1,0], [], 30, "NONE"];
			};
			sleep 1;
		};
		_Group setBehaviour "SAFE";
		[_Group, _Spawnpos, _Range] call CBA_fnc_taskPatrol;
