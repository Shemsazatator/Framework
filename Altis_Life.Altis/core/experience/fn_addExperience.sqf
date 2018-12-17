#include "..\..\script_macros.hpp"
/*
    File: fn_addExperience.sqf
    Author: Shems "Shemsazatator" Shahid

    Description:
    Add experience and control if the player has enough experience to add a level.
*/
params [
  ["_experience", 0, [0]]
];

if (life_level >= LIFE_SETTINGS(getNumber,"max_level")) exitWith {};

//--- Add experience (note : if experience which is added is 2.25, floor add 2, if it's -5.25, floor add -6)
life_experience = life_experience + floor _experience;

if (life_experience >= life_level * LIFE_SETTINGS(getNumber,"experience_upgrade_level")) then {
  //--- Set new values
	life_experience = life_experience - (life_level * LIFE_SETTINGS(getNumber,"experience_upgrade_level"));
  life_level = life_level + 1;
};

//--- Sync only level and experience data on the database
[8] call SOCK_fnc_updatePartial;
