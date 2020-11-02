//	[] execVM "Scripts\OKS_Ambience\Init.sqf";
//
//	This initializes all the functions for OKS Ambience.
//
//	Made by Oksman
if (hasInterface && !isServer) exitWith {false};	// Ensures only server or HC runs this script


// Functions
OKS_Ambient_Settings = compile preprocessFileLineNumbers "Scripts\OKS_Ambience\Settings.sqf";
OKS_ArtyFire = compile preprocessFileLineNumbers "Scripts\OKS_Ambience\OKS_ArtyFire.sqf";
OKS_ScudLaunch = compile preprocessFileLineNumbers "Scripts\OKS_Ambience\OKS_ScudLaunch.sqf";
OKS_TroopDismount = compile preprocessFileLineNumbers "Scripts\OKS_Ambience\OKS_TroopDismount.sqf";
