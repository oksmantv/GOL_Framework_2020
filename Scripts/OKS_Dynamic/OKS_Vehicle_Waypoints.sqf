	//	OKS_Vehicle_Waypoints
	if(HasInterface && !isServer) exitWith {};

	Params["_Area","_Group","_NumberOfWaypoints"];
	Private ["_WP","_WPCount","_LastWP"];
	Private _Waypoints = [];
	For [{_i = 0}, {_i < _NumberOfWaypoints}, {_i = _i + 1}] do {
		_Waypoints append [_i];
	};

	{
		_Location = _Area call BIS_fnc_randomPosTrigger;
		//systemChat str _Location;
		_Road = [(_Area call BIS_fnc_randomPosTrigger), 800] call BIS_fnc_nearestRoad;
		//systemChat str GetPos _Road;
		sleep 5;
		//_Road = [_nearRoads,[],{_Area distance _x},"ASCEND"] call BIS_fnc_sortBy;
		//SystemChat str [_Road,_Road select 0];

		If(isNil "_Road" || isNull _Road) then {
			_Road = _Location;
			SystemChat "Could not find road, using Location";
		};
		_WP = _Group addWaypoint [_Road, 0];
		_WP setWaypointCompletionRadius 50;
		_WP setWaypointSpeed "LIMITED";
		_WP setWaypointBehaviour "SAFE";
		_WP setWaypointType "MOVE";

	} foreach _Waypoints;

	_WPCount = count waypoints _Group;
	[_Group,(_WPCount - 1)] setWaypointType "CYCLE";



