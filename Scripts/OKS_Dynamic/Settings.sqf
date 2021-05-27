//	[Side] Call OKS_Dynamic_Settings;
//
//	Settings for OKS Dynamic.
//
//	Returns: [Settings]

Params["_Side"];
Private ["_Units","_SideMarker","_SideColor","_Vehicles","_Wheeled","_APC","_Tank","_Artillery","_Supply"];

Switch (_Side) do
{
	case BLUFOR:	// BLUFOR settings
	{
		// Unit classes are compatible with multiple class names, will select randomly. Example: ["B_Pilot_F","B_Crewman_F"];
		_Leaders = ["B_Soldier_TL_F","B_Soldier_TL_F"];	// Squad/Team leader classes.
		_Units = ["B_Soldier_LAT_F","B_Soldier_GL_F","B_medic_F","B_Soldier_AR_F","B_Soldier_A_F"]; // Class names for infantry units.
		_Wheeled = ["rhsusf_m1025_w_s_m2","CUP_B_UAZ_MG_CDF","CUP_B_UAZ_SPG9_CDF","CUP_B_UAZ_Unarmed_CDF","CUP_B_Kamaz_CDF","CUP_B_UAZ_Open_CDF"];
		_APC = ["CUP_B_BTR80_CDF","CUP_B_BTR60_CDF","CUP_B_BRDM2_CDF","rhsusf_m113_usarmy"];
		_Tank = ["CUP_B_T72_CDF"];
		_Artillery = ["CUP_B_D30_CDF"];
		_Supply = ["CUP_B_BMP2_AMB_CDF","CUP_B_Kamaz_Reammo_CDF","CUP_B_Kamaz_Refuel_CDF","CUP_B_Kamaz_Repair_CDF","CUP_B_CDF_Soldier_MNT"];
		_Vehicles = [_Wheeled,_APC,_Tank,_Artillery,_Supply];
		_SideMarker = "b_inf";
		_SideColor = "ColorBlufor";
	};
	case OPFOR:		// OPFOR settings
	{
		_Leaders = ["O_Soldier_TL_F","O_Soldier_TL_F"];
		_Units = ["O_Soldier_LAT_F","O_Soldier_GL_F","O_medic_F","O_Soldier_AR_F","O_Soldier_A_F"];
		_Wheeled = ["O_LSV_02_unarmed_F","rhs_gaz66_msv","rhs_gaz66_zu23_msv","rhs_uaz_vdv","rhs_uaz_open_vdv"];
		_APC = ["rhs_btr60_vdv","rhs_btr70_vdv","rhs_btr80_vdv","rhs_bmd1k","rhs_bmp1_vdv"];
		_Tank = ["rhs_t72ba_tv","rhs_bmp3_msv","rhs_bmp2e_msv"];
		_Artillery = ["O_MBT_02_arty_F"];
		_Supply = ["O_Truck_02_Ammo_F","O_Truck_02_fuel_F","O_Truck_02_medical_F","O_Truck_02_box_F"];
		_Vehicles = [_Wheeled,_APC,_Tank,_Artillery,_Supply];
		_SideMarker = "o_inf";
		_SideColor = "ColorOpfor";
	};
	case INDEPENDENT:	// INDEPENDENT Settings
	{
		_Leaders = ["I_Soldier_TL_F","I_Soldier_TL_F"];
		_Units = ["I_Soldier_LAT_F","I_Soldier_GL_F","I_medic_F","I_Soldier_AR_F","I_Soldier_A_F"];
		_Wheeled = ["CUP_I_Hilux_DSHKM_IND_G_F","I_G_Offroad_01_armed_F","CUP_I_Datsun_PK_TK","CUP_I_Datsun_4seat_TK","CUP_I_V3S_Covered_TKG","CUP_I_Datsun_4seat_TK","CUP_I_V3S_Covered_TKG"];
		_APC = ["CUP_I_BRDM2_NAPA","CUP_I_BMP2_NAPA","CUP_I_Hilux_btr60_TK"];
		_Tank = ["CUP_I_T34_NAPA","CUP_I_T55_NAPA"];
		_Artillery = ["CUP_I_D30_TK_GUE"];
		_Supply = ["I_Truck_02_ammo_F","I_Truck_02_medical_F","I_Truck_02_fuel_F","I_Truck_02_box_F"];
		_Vehicles = [_Wheeled,_APC,_Tank,_Artillery,_Supply];
		_SideMarker = "n_inf";
		_SideColor = "ColorIndependent";
	};

	// DO NOT EDIT ANYTHING BELOW \\
	default
	{
		_SkillVariables = "";
		_Skill = "";
		_Leaders = "";
		_Units = "";
	};
};

// DO NOT EDIT ANYTHING BELOW \\
[_Units,_SideMarker,_SideColor,_Vehicles]