#include "..\..\script_macros.hpp"
/*
    File: fn_addPrestige.sqf
    Author: Shems "Shemsazatator" Shahid

    Description:
    Add prestige if necessary and control if the player has enough prestige and if he is good side.
*/
params [
  ["_prestige", 0, [0]]
];

if (life_prestige >= LIFE_SETTINGS(getNumber,"prestige_max")) exitWith {life_notoriety = LIFE_SETTINGS(getNumber,"prestige_max")};
if !(playerSide in [west,independent]) exitwith {};

life_prestige = life_prestige + _prestige;

if (life_prestige > LIFE_SETTINGS(getNumber,"prestige_max")) then {life_prestige = LIFE_SETTINGS(getNumber,"prestige_max")};
