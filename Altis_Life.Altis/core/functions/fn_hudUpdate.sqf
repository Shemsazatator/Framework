#include "..\..\script_macros.hpp"
/*
    File: fn_hudUpdate.sqf
    Author: Daniel Stuart

    Description:
    Updates the HUD when it needs to.

    TO DO:
    localize text of prestige and notoriety
*/
disableSerialization;

if (isNull LIFEdisplay) then {[] call life_fnc_hudSetup;};
LIFEctrl(IDC_HUDSTATS_PROGRESSFOOD) progressSetPosition (life_hunger / 100);
LIFEctrl(IDC_HUDSTATS_PROGRESSHEALTH) progressSetPosition (1 - (damage player));
LIFEctrl(IDC_HUDSTATS_PROGRESSWATER) progressSetPosition (life_thirst / 100);
LIFEctrl(IDC_HUDSTATS_PROGRESSEXPERIENCE) progressSetPosition (life_experience / (life_level * LIFE_SETTINGS(getNumber,"experience_upgrade_level")));
LIFEctrl(IDC_HUDSTATS_TEXTEXPERIENCE) ctrlSetText format ["%1 / %2", [life_experience] call life_fnc_numberText, [(life_level * LIFE_SETTINGS(getNumber,"experience_upgrade_level"))] call life_fnc_numberText];

switch playerSide do {
    case west: {
      LIFEctrl(IDC_HUDSTATS_PROGRESSNOTOPREST) progressSetPosition (life_prestige / 2);
      LIFEctrl(IDC_HUDSTATS_TEXTNOTOPREST) ctrlSetText format ["Prestige x%1", [1 +life_prestige] call life_fnc_numberText];
    };
    case east: {
      LIFEctrl(IDC_HUDSTATS_PROGRESSNOTOPREST) progressSetPosition (life_notoriety / 2);
      LIFEctrl(IDC_HUDSTATS_TEXTNOTOPREST) ctrlSetText format ["Notoriety x%1", [1 + life_notoriety] call life_fnc_numberText];
    };
    case independent: {
      LIFEctrl(IDC_HUDSTATS_PROGRESSNOTOPREST) progressSetPosition (life_prestige / 2);
      LIFEctrl(IDC_HUDSTATS_TEXTNOTOPREST) ctrlSetText format ["Prestige x%1", [1 + life_prestige] call life_fnc_numberText];
    };
    case civilian: {
      LIFEctrl(IDC_HUDSTATS_PROGRESSNOTOPREST) progressSetPosition (life_notoriety / 2);
      LIFEctrl(IDC_HUDSTATS_TEXTNOTOPREST) ctrlSetText format ["Notoriety x%1", [1 + life_notoriety] call life_fnc_numberText];
    };
};
