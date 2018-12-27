#include "..\..\script_macros.hpp"
/*
    File: fn_onFiredNear.sqf
    Author: Is there really an author for that ?

    Description:

*/
params [
  ["_unit",objNull,[objNull]],
  ["_vehicle",objNull,[objNull]],
  ["_distance",0,[0]],
  ["_weapon","",[""]],
  ["_muzzle","",[""]],
  ["_mode","",[""]],
  ["_ammo","",[""]],
  ["_gunner",objNull,[objNull]]
];

if (LIFE_SETTINGS(getNumber,"enable_fight_mode") isEqualTo 1) then {
	//--- Go to 1st person
	[] call life_fnc_firstViewCombat;
};
