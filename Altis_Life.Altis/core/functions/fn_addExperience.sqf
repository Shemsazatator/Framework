#include "..\..\script_macros.hpp"
/*
    File: fn_addExperience.sqf
    Author: Shems "Shemsazatator" Shahid

    Description:
    Add experience and control if the player has enough experience to add a level.

    TO DO : Test duration of the Music and try fadeMusic command
*/
params [
  ["_experience", 0, [0]]
];

if (life_level >= LIFE_SETTINGS(getNumber,"max_level")) exitWith {};

private _streaks = switch playerSide do {
  case west: {life_prestige};
  case east: {life_notoriety};
  case independent: {life_prestige};
  case civilian: {life_notoriety};
};

//--- Add experience (note : if experience which is added is 2.25, floor add 2, if it's -5.25, floor add -6)
life_experience = life_experience + floor(_experience * _streaks);

if (life_experience >= life_level * LIFE_SETTINGS(getNumber,"experience_upgrade_level")) then {
  //--- Set new values
	life_experience = life_experience - (life_level * LIFE_SETTINGS(getNumber,"experience_upgrade_level"));
  life_level = life_level + 1;
  life_skillPoints = life_skillPoints + 1;
  playMusic "EventTrack03_F_Curator";
  systemChat [localize "STR_LEVEL_Upgrade", life_level];
};

//--- Sync only level and experience data on the database
[8] call SOCK_fnc_updatePartial;
