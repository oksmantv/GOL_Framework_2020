//	[] execVM "Scripts\OKS_TASK\Init.sqf";
//
//	This initializes all the functions for OKS TASK.
//
//	Made by Oksman

if (hasInterface && !isServer) exitWith {false};	// Ensures only server or HC runs this script

// Functions
OKS_TASK = compile preprocessFileLineNumbers "Scripts\OKS_TASK\OKS_Task.sqf";
OKS_TASKSTATE = compile preprocessFileLineNumbers "Scripts\OKS_TASK\OKS_TaskState.sqf";
OKS_TASKSETUP = compile preprocessFileLineNumbers "Scripts\OKS_TASK\OKS_TaskSetup.sqf";
