#include "..\..\script_macros.hpp"
/*
    File: fn_addNotoriety.sqf
    Author: Shems "Shemsazatator" Shahid

    Description:
    Add notoriety if necessary and control if the player has enough prestige and if he is good side.
*/
params [
  ["_notoriety", 0, [0]]
];

if (life_notoriety >= LIFE_SETTINGS(getNumber,"notoriety_max")) exitWith {life_notoriety = LIFE_SETTINGS(getNumber,"notoriety_max")};
if !(playerSide in [east,civilian]) exitwith {};

life_prestige = life_prestige + _notoriety;

if (life_notoriety > LIFE_SETTINGS(getNumber,"notoriety_max")) then {life_notoriety = LIFE_SETTINGS(getNumber,"notoriety_max")};
