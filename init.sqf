MISSION_ROOT = call {
    private "_arr";
    _arr = toArray __FILE__;
    _arr resize (count _arr - 8);
    toString _arr
};

[] execVM "Scripts\NEKY_AirDrop\Init.sqf";
[] execVM "Scripts\NEKY_Hunt\Init.sqf";
[] execVM "Scripts\NEKY_ServiceStation\Init.sqf";
[] execVM "Scripts\OKS_AAC\Init.sqf";
[] execVM "Scripts\OKS_TASK\Init.sqf";
[] execVM "Scripts\OKS_Ambience\Init.sqf";
