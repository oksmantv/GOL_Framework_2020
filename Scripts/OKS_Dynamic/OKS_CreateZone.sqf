
/*
	[TriggerName,SplitTriggerBool,NumberofInfantry,_Side,NumberOfWheeled,NumberOfAPC,NumberofTank,CompositionCount,MortarPitCount,ObjectiveCount]
	[Trigger_1,true,50,EAST,1,1,1,2,1,3] execVM "Scripts\OKS_Dynamic\CreateZone.sqf";

*/

if(!isServer) exitWith {};

Params ["_MainTrigger","_SplitTrigger","_InfantryNumber","_Side","_WheeledCount","_apcCount","_tankCount","_CompositionCount","_MortarCount","_Objectives"];

Private ["_MainTriggerArea","_Section_N","_Section_E","_Section_S","_Section_W","_MainTriggerSizeA","_MainTriggerSizeB","_MainTriggerAngle","_MainTriggerIsRectangle","_Section_N_Marker","_Section_E_Marker","_Section_S_Marker","_Section_W_Marker","_CountStrongpoints","_GarrisonNumber","_Section_N_Trigger","_Section_E_Trigger","_Section_S_Trigger","_Section_W_Trigger","_marker","_MainMarker","_WheeledPerTrigger","_APCPerTrigger","_TankPerTrigger","_SpawnTriggers"];

// ,"_Units","_Leaders","_SideMarker","_SideColor"

Private _Debug_Variable = false;
_SpawnTriggers = [];
_Settings = [_Side] call OKS_Dynamic_Setting;
_Settings Params ["_Units","_SideMarker","_SideColor","_Vehicles"];

/* Create Sub-Triggers based on the Main trigger */

_MainTriggerArea = triggerArea _MainTrigger;
_MainTriggerSizeA = _MainTriggerArea select 0;
_MainTriggerSizeB = _MainTriggerArea select 1;

_MainTriggerAngle = 0;
_MainTriggerAngle = _MainTriggerArea select 2;
_MainTriggerIsRectangle = _MainTriggerArea select 3;

	_MainMarker = createMarker [format ["oks_MainMarker_%1",str round(random 80000 + random 9999)], getPos _MainTrigger];
	if(_Debug_Variable) then {
		_MainMarker setMarkerBrush "SolidBorder";
		_MainMarker setMarkerColor "ColorWhite";
		_MainMarker setMarkerAlpha 0.3;
	} else {
		_MainMarker setMarkerAlpha 0;
	};

_MainMarker setMarkerDir _MainTriggerAngle;
_MainMarker setMarkerSize [_MainTriggerSizeA,_MainTriggerSizeB];
	if(!_SplitTrigger) then {
		_SpawnTriggers pushBack _MainTrigger;
	};

	if(_MainTriggerIsRectangle) then {
		_MainMarker setMarkerShape "RECTANGLE";
		if(_SplitTrigger) then {


			_Section_NE_Marker = [_MainTrigger,_MainTriggerSizeA,_MainTriggerSizeB,45,_MainTriggerAngle,"colorGreen",[0.7,0.5,0.5],"RECTANGLE"] call OKS_CreateMarker;
			_Section_NE_Trigger = [_MainTrigger,_MainTriggerSizeA,_MainTriggerSizeB,45,_MainTriggerAngle,[0.7,0.25,1],_MainTriggerIsRectangle] call OKS_CreateTrigger;

			_Section_SE_Marker = [_MainTrigger,_MainTriggerSizeA,_MainTriggerSizeB,135,_MainTriggerAngle,"colorRed",[0.7,0.5,0.5],"RECTANGLE"] call OKS_CreateMarker;
			_Section_SE_Trigger = [_MainTrigger,_MainTriggerSizeA,_MainTriggerSizeB,135,_MainTriggerAngle,[0.7,0.25,1],_MainTriggerIsRectangle] call OKS_CreateTrigger;

			_Section_SW_Marker = [_MainTrigger,_MainTriggerSizeA,_MainTriggerSizeB,225,_MainTriggerAngle,"colorYellow",[0.7,0.5,0.5],"RECTANGLE"] call OKS_CreateMarker;
			_Section_SW_Trigger = [_MainTrigger,_MainTriggerSizeA,_MainTriggerSizeB,225,_MainTriggerAngle,[0.7,0.25,1],_MainTriggerIsRectangle] call OKS_CreateTrigger;

			_Section_NW_Marker = [_MainTrigger,_MainTriggerSizeA,_MainTriggerSizeB,315,_MainTriggerAngle,"colorBlue",[0.7,0.5,0.5],"RECTANGLE"] call OKS_CreateMarker;
			_Section_NW_Trigger = [_MainTrigger,_MainTriggerSizeA,_MainTriggerSizeB,315,_MainTriggerAngle,[0.7,0.5,0.5],_MainTriggerIsRectangle] call OKS_CreateTrigger;


			_SpawnTriggers pushBack _Section_NE_Trigger;
			_SpawnTriggers pushBack _Section_SE_Trigger;
			_SpawnTriggers pushBack _Section_SW_Trigger;
			_SpawnTriggers pushBack _Section_SW_Trigger;
		};
	} else {
		_MainMarker setMarkerShape "ELLIPSE";
		if(_SplitTrigger) then {


			_Section_NE_Marker = [_MainTrigger,_MainTriggerSizeA,_MainTriggerSizeB,45,_MainTriggerAngle,"colorGreen",[0.7,0.5,0.5],"ELLIPSE"] call OKS_CreateMarker;
			_Section_NE_Trigger = [_MainTrigger,_MainTriggerSizeA,_MainTriggerSizeB,45,_MainTriggerAngle,[0.7,0.5,0.5],_MainTriggerIsRectangle] call OKS_CreateTrigger;

			_Section_SE_Marker = [_MainTrigger,_MainTriggerSizeA,_MainTriggerSizeB,135,_MainTriggerAngle,"colorRed",[0.7,0.5,0.5],"ELLIPSE"] call OKS_CreateMarker;
			_Section_SE_Trigger = [_MainTrigger,_MainTriggerSizeA,_MainTriggerSizeB,135,_MainTriggerAngle,[0.7,0.5,0.5],_MainTriggerIsRectangle] call OKS_CreateTrigger;

			_Section_SW_Marker = [_MainTrigger,_MainTriggerSizeA,_MainTriggerSizeB,225,_MainTriggerAngle,"colorYellow",[0.7,0.5,0.5],"ELLIPSE"] call OKS_CreateMarker;
			_Section_SW_Trigger = [_MainTrigger,_MainTriggerSizeA,_MainTriggerSizeB,225,_MainTriggerAngle,[0.7,0.5,0.5],_MainTriggerIsRectangle] call OKS_CreateTrigger;

			_Section_NW_Marker = [_MainTrigger,_MainTriggerSizeA,_MainTriggerSizeB,315,_MainTriggerAngle,"colorBlue",[0.7,0.5,0.5],"ELLIPSE"] call OKS_CreateMarker;
			_Section_NW_Trigger = [_MainTrigger,_MainTriggerSizeA,_MainTriggerSizeB,315,_MainTriggerAngle,[0.7,0.5,0.5],_MainTriggerIsRectangle] call OKS_CreateTrigger;


			_SpawnTriggers pushBack _Section_NE_Trigger;
			_SpawnTriggers pushBack _Section_SE_Trigger;
			_SpawnTriggers pushBack _Section_SW_Trigger;
			_SpawnTriggers pushBack _Section_SW_Trigger;
		};

	};

		/* Create Compositions for each area */

		if(_CompositionCount > 0) then {
			[_MainTrigger,_CompositionCount,_Side,_Units,_SideColor] spawn OKS_Find_RoadBlocks;
		};

		/* Create Mortar Pits */

		if(_MortarCount > 0) then {
			For "_i" to (_MortarCount - 1) do {
				[_MainTrigger,35,10,_Side] spawn OKS_Find_Mortars;
				sleep 10;
			};
		};

		/* Create Objective */

		if(_Objectives > 0) then {
			Private ["_RandomObjective"];
			For "_i" to (_Objectives - 1) do {
				_RandomObjective = selectRandom ["ammotruck","cache","artillery"];
				//[Trigger_1,"cache",300,independent,[independent] call OKS_Dynamic_Setting] remoteExec ["OKS_CreateObjectives",0];
				//[_MainTrigger,_RandomObjective,300,_Side,_Settings] remoteExec ["OKS_CreateObjectives",0];
				[_MainTrigger,_RandomObjective,300,_Side,_Settings] spawn OKS_CreateObjectives;
				sleep 15;
			};
			sleep 20;
		};

	/* Check if there's Infantry */
	if(_InfantryNumber > 0) then {

		/* Create Infantry Strongpoints */

		[_MainTrigger,_Side,round(_InfantryNumber * 0.5),_Units,_SideMarker,_SideColor,_Settings] spawn OKS_Populate_Strongpoints;

		/* Create Infantry Patrols for each sub-trigger */

		Private ["_PatrolInfantry","_PatrolNumber","_GroupPerTrigger"];

		_PatrolInfantry = round(_InfantryNumber * 0.5);
		_PatrolNumber = _PatrolInfantry / 4;
		_GroupPerTrigger = round(_PatrolNumber / (count _SpawnTriggers));

		_PatrolCount = [];
		For [{_i = 0}, {_i < _GroupPerTrigger}, {_i = _i + 1}] do {
			_PatrolCount append [_i];
		};

		if(_Debug_Variable) then {
			SystemChat format ["Patrols Total %1 - Per Trigger %2 of %3",_PatrolNumber,_GroupPerTrigger,_PatrolInfantry];
		};

		for "_i" to (_GroupPerTrigger - 1) do {
			{[_X,5,_MainTriggerSizeA * 0.5,_Side,_Units] spawn OKS_Patrol_Spawn; sleep 10;} foreach _SpawnTriggers
		};


	};

	/* Create Vehicle Patrols for each sub-trigger */
	if(_Debug_Variable) then {
		SystemChat format ["Total %1 Wheeled",_WheeledCount];
	};
	if(_WheeledCount > 0 ) then {
		_WheeledPerTrigger = round(_WheeledCount / (count _SpawnTriggers));
		if(_Debug_Variable) then {
			SystemChat format ["Wheeled Per Trigger: %1",_WheeledPerTrigger];
		};
		if (_WheeledPerTrigger isEqualTo 0) then { _WheeledPerTrigger = 1 };
		{[_X,_WheeledPerTrigger,_MainTriggerSizeA,"WHEELED",_Vehicles,_Units] spawn OKS_Vehicle_Patrol; sleep 10;} foreach _SpawnTriggers;
		sleep 30;
	};
	if(_Debug_Variable) then {
		SystemChat format ["Total %1 APC",_apcCount];
	};
	if(_APCCount > 0 ) then {
		_APCPerTrigger = round(_apcCount / (count _SpawnTriggers));
		if(_Debug_Variable) then {
			SystemChat format ["APC Per Trigger: %1",_APCPerTrigger];
		};
		if (_APCPerTrigger isEqualTo 0) then { _APCPerTrigger = 1 };
		{[_X,_APCPerTrigger,_MainTriggerSizeA,"APC",_Vehicles,_Units] spawn OKS_Vehicle_Patrol; sleep 10;} foreach _SpawnTriggers;
		sleep 30;
	};
	if(_Debug_Variable) then {
		SystemChat format ["Total %1 Tank",_TankCount];
	};
	if(_TankCount > 0 ) then {

		_TankPerTrigger = round(_tankCount / (count _SpawnTriggers));
		if(_Debug_Variable) then {
			SystemChat format ["Tank Per Trigger: %1",_TankPerTrigger];
		};
		if (_TankPerTrigger isEqualTo 0) then { _TankPerTrigger = 1 };
		{[_X,_TankPerTrigger,_MainTriggerSizeA,"TANK",_Vehicles,_Units] spawn OKS_Vehicle_Patrol; sleep 10;} foreach _SpawnTriggers;

	};



