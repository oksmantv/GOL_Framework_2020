_ArrayofNCO = [
["76561198005972885","LIEUTENANT","Pilgrim"], // Pilgrim
["76561198014971848","SERGEANT","Filth"], // Filthy
["76561198013929549","SERGEANT","Oksman"], // Oksman
["76561198030991949","CORPORAL","ThecMaster"], // ThecMaster
["76561198054322437","CORPORAL","Chroma"], // Chroma
["76561198110128838","CORPORAL","Joe Malley"], // Joe Malley
["76561198086056020","SERGEANT","Blu"], // Blu.
["76561198024730389","CORPORAL","Falseprophet"]  // Falseprophet
];

{
// _Unit = ((_ArrayofNCO select _x) select 0) call BIS_fnc_getUnitByUID;
If ((getPlayerUID player) == ((_ArrayofNCO select _x) select 0)) Then {player setrank (_ArrayofNCO select _x select 1)};
} ForEach _ArrayofNCO;
