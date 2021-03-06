//	[] execVM "Scripts\OKS_Dynamic\Init.sqf";
//
//	This initializes all the functions for OKS Dynamic Spawns.
//
//	Made by Oksman

// Functions
OKS_Dynamic_Setting = compile preprocessFileLineNumbers "Scripts\OKS_Dynamic\Settings.sqf";
OKS_CreateMarker = compile preprocessFileLineNumbers "Scripts\OKS_Dynamic\OKS_CreateMarker.sqf";
OKS_CreateTrigger = compile preprocessFileLineNumbers "Scripts\OKS_Dynamic\OKS_CreateTrigger.sqf";

//OKS_CreateComposition = compile preprocessFileLineNumbers "Scripts\OKS_Dynamic\OKS_CreateComposition.sqf";
//OKS_GetComposition = compile preprocessFileLineNumbers "Scripts\OKS_Dynamic\OKS_GetComposition.sqf";
OKS_Find_Roadblocks = compile preprocessFileLineNumbers "Scripts\OKS_Dynamic\OKS_Find_Roadblocks.sqf";
OKS_Find_Mortars = compile preprocessFileLineNumbers "Scripts\OKS_Dynamic\OKS_Find_Mortars.sqf";

OKS_Garrison = compile preprocessFileLineNumbers "Scripts\OKS_Dynamic\OKS_Garrison.sqf";
OKS_Vehicle_Waypoints = compile preprocessFileLineNumbers "Scripts\OKS_Dynamic\OKS_Vehicle_Waypoints.sqf";
OKS_Vehicle_Patrol = compile preprocessFileLineNumbers "Scripts\OKS_Dynamic\OKS_Vehicle_Patrol.sqf";
OKS_Patrol_Spawn = compile preprocessFileLineNumbers "Scripts\OKS_Dynamic\OKS_Patrol_Spawn.sqf";
OKS_Populate_Strongpoints = compile preprocessFileLineNumbers "Scripts\OKS_Dynamic\OKS_Populate_Strongpoints.sqf";
OKS_Populate_StaticWeapons = compile preprocessFileLineNumbers "Scripts\OKS_Dynamic\OKS_Populate_StaticWeapons.sqf";
OKS_Populate_Bunkers = compile preprocessFileLineNumbers "Scripts\OKS_Dynamic\OKS_Populate_Bunkers.sqf";
OKS_CreateObjectives = compile preprocessFileLineNumbers "Scripts\OKS_Dynamic\OKS_CreateObjectives.sqf";


OKS_CreateZone = compile preprocessFileLineNumbers "Scripts\OKS_Dynamic\OKS_CreateZone.sqf";
OKS_RoadBlock_Positions = [];
OKS_Mortar_Positions = [];
OKS_Objective_Positions = [];

