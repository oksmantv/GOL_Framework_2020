MISSION_ROOT = call {
    private "_arr";
    _arr = toArray __FILE__;
    _arr resize (count _arr - 8);
    toString _arr
};
[] execVM "Scripts\HeadlessClient\HeadlessClient.sqf";
[] execVM "Scripts\NEKY_ServiceStation\Init.sqf";
execVM "Scripts\NEKY_Supply\Ace_Resupply.sqf";
execVM "Scripts\NEKY_Supply\Ace_Med.sqf";
// Do not remove these scripts ^
// Adds backup supply lines if AAC is not playing (Luke's Script)
// Sets up working Service Station

//Uncomment if you want to use Neky_HuntBase / AirBase
//[] execVM "Scripts\NEKY_AirDrop\Init.sqf";
//[] execVM "Scripts\NEKY_Hunt\Init.sqf";


/// Use this if you want AAC to be able to switch seats in their helicopters and get better doorgunners - uncomment and it will run
//[] execVM "Scripts\OKS_AAC\Init.sqf";

// Use this if you want the automatic hunt code, this takes all moving units and makes them attack the player if they are within range
// Uncomment both lines and adjust the parameters below (Side,MinRange,MaxRange,RefreshRate)
//[] execVM "Scripts\OKS_HUNT\Init.sqf";
//[EAST,500,1000,90] spawn OKS_Dynamic_Hunt;

// Use this if you want to use in-game intel tasks, you assign the details in the script below, find it at "Scripts\OKS_TASK\Init.sqf"
// Below is an example, parameters: [originObject,numberID,Position,Side,ParentTask]
//[] execVM "Scripts\OKS_TASK\Init.sqf";
//[Task_Object_1,1,GetMarkerPos "Task_1",west,O_Task] spawn OKS_TASKSETUP;

// Use this if you want to use OKS Ambience scripts, this initiates them, look into the specific functions to learn more on how to use.
//[] execVM "Scripts\OKS_Ambience\Init.sqf";

sleep 10;





