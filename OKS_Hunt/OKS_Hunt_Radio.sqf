OKS_EnemyFaction = _this select 0;


if (!isServer) exitWith {false};	// Ensures only server or HC runs this script - Tack Neky


OKS_Loop_Radio = {

	_Corpse = _this select 0;

	while {!(isNull _Corpse) && OKS_Detected} do
	{

		if( {_Corpse distance _X < 30} count AllPlayers > 0 ) then {
			SystemChat "Playing Radios";
			playSound3D [MISSION_ROOT + "Scripts\OKS_HUNT\Radio\Radio1.ogg", _Corpse, false, getPosASL _Corpse, 3, 1, 17];
			sleep 30+(Random 30);

			playSound3D [MISSION_ROOT + "Scripts\OKS_HUNT\Radio\Radio2.ogg", _Corpse, false, getPosASL _Corpse, 3, 1, 17];
			sleep 30+(Random 30);

			playSound3D [MISSION_ROOT + "Scripts\OKS_HUNT\Radio\Radio3.ogg", _Corpse, false, getPosASL _Corpse, 3, 1, 17];
			sleep 30+(Random 30);

			playSound3D [MISSION_ROOT + "Scripts\OKS_HUNT\Radio\Radio4.ogg", _Corpse, false, getPosASL _Corpse, 3, 1, 17];
			sleep 30+(Random 30);

			playSound3D [MISSION_ROOT + "Scripts\OKS_HUNT\Radio\Radio5.ogg", _Corpse, false, getPosASL _Corpse, 3, 1, 17];
			sleep 60;
		};

		sleep 20;

	};

};


if (oks_hunted) then
{
	SystemChat "Radio Code Started";
			{

				if(!(_X getVariable["OKS_Transmit",false])) then
				{

					if (([_X] call GW_Common_Fnc_getSide) == OKS_EnemyFaction) then {
						_X setVariable ["OKS_Transmit",true];
						_Radio = [_X] spawn OKS_Loop_Radio;
						};
				};
				sleep 1;
			} forEach allDeadMen;
};


