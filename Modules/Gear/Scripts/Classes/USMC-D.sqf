

_goggles = "rhsusf_shemagh_tan";
_helmet = selectRandom ["rhsusf_mich_helmet_marpatd_alt_headset","rhsusf_mich_helmet_marpatd_alt","rhsusf_mich_helmet_marpatd_headset","rhsusf_mich_helmet_marpatd"];
_uniform = "rhs_uniform_FROG01_d";
_vest = "CUP_V_B_MTV_noCB";
_backpack = "rhsusf_assault_eagleaiii_coy";

if (GVARMAIN(mod_TFAR)) then {
	_backpackRadio = "tf_anprc155_coyote";
};

if (_role isEqualTo "crew") then {
	_helmet = "rhsusf_cvc_green_helmet";
	_vest = "rhsusf_spc_crewman";
};
if (_role isEqualTo "p") then {
	_helmet = "rhsusf_hgu56p";
	_vest = "rhsusf_spc_crewman";
};
if (_role isEqualTo "uav") then {
	_backpack = "B_UAV_01_backpack_F";
	_gps = "B_UAVTerminal";

};
if (_role isEqualTo "jetp") then {
	_goggles = "G_Aviator";
	_helmet = "H_PilotHelmetFighter_B";
	_uniform = "U_B_PilotCoveralls";
	_vest = "V_Rangemaster_belt";
	_backpack = "B_Parachute";
};

_silencer = "rhsusf_acc_SFMB556";
_pointer = "";
_sight = "rhsusf_acc_T1_high";
_bipod = "rhsusf_acc_grip1";

_rifle = ["rhs_weap_m4a1_carryhandle_mstock", _silencer, _pointer, _sight, _bipod];
_rifleC = ["rhs_weap_m4a1_carryhandle_mstock", _silencer, _pointer, _sight, _bipod];
_rifleGL = ["rhs_weap_m4a1_carryhandle_m203S", _silencer, _pointer, _sight, _bipod];
_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
_rifle_mag_tr = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";

_LMG = ["rhs_weap_m249_light_S", _silencer, _pointer, _sight, "rhsusf_acc_saw_bipod"];
_LMG_mag = "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";

_MMG = ["rhs_weap_m249_light_S", _silencer, _pointer, _sight, "rhsusf_acc_saw_bipod"];
_MMG_mag = "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";

_LAT = ["launch_MRAWS_sand_F", _silencer, _pointer, _sight, _bipod];
_LAT_mag = "MRAWS_HEAT_F";
_LAT_ReUsable = false;

_MAT = ["launch_MRAWS_sand_F", _silencer, _pointer, "CUP_optic_SMAW_Scope", _bipod];
_MAT_mag = "MRAWS_HEAT_F";
_MAT_mag_HE = "MRAWS_HEAT_F";

_pistol = ["CUP_hgun_M9", _silencer, _pointer, _sight, _bipod];
_pistol_mag = "CUP_15Rnd_9x19_M9";

_silencer = "muzzle_snds_B";
_pointer = "";
_sight = "optic_LRPS";
_bipod = "CUP_bipod_Harris_1A2_L";

_rifleMarksman = ["CUP_srifle_M14_DMR", _silencer, _pointer, _sight, _bipod];
_rifleMarksman_mag = "CUP_20Rnd_762x51_DMR";
_rifleMarksman_mag_tr = "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR";
