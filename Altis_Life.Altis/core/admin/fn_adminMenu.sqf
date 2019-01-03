#include "..\..\script_macros.hpp"
/*
    File: fn_adminMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens the admin menu and hides buttons based on life_adminlevel.
*/
private ["_display","_list","_side","_godmode","_markers"];
if (FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};

disableSerialization;

waitUntil {!isNull (findDisplay IDD_ADMINMENU)};
_list = CONTROL(IDD_ADMINMENU,IDC_ADMINMENU_PLAYERLIST);
if (FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};

switch (FETCH_CONST(life_adminlevel)) do
{
    case 1: {ctrlShow [IDC_ADMINMENU_COMPENSATE,false];ctrlShow [IDC_ADMINMENU_SPECTATE,false];ctrlShow [IDC_ADMINMENU_TELEPORT,false];ctrlShow [IDC_ADMINMENU_TPHERE,false];ctrlShow [IDC_ADMINMENU_GODMODE,false];ctrlShow [IDC_ADMINMENU_FREEZE,false];ctrlShow [IDC_ADMINMENU_MARKERS,false];ctrlShow [IDC_ADMINMENU_DEBUGCON,false];};
    case 2: {ctrlShow [IDC_ADMINMENU_SPECTATE,false];ctrlShow [IDC_ADMINMENU_TELEPORT,false];ctrlShow [IDC_ADMINMENU_TPHERE,false];ctrlShow [IDC_ADMINMENU_GODMODE,false];ctrlShow [IDC_ADMINMENU_FREEZE,false];ctrlShow [IDC_ADMINMENU_MARKERS,false];ctrlShow [IDC_ADMINMENU_DEBUGCON,false];};
    case 3: {ctrlShow [IDC_ADMINMENU_TPHERE,false];ctrlShow [IDC_ADMINMENU_GODMODE,false];ctrlShow [IDC_ADMINMENU_FREEZE,false];ctrlShow [IDC_ADMINMENU_MARKERS,false];ctrlShow [IDC_ADMINMENU_DEBUGCON,false];};
    case 4: {ctrlShow [IDC_ADMINMENU_DEBUGCON,false];};
};

//Purge List
lbClear _list;

{
    _side = switch (side _x) do {case west: {"Cop"}; case east: {"East Civ"}; case independent: {"Medic"}; case civilian: {"West Civ"}; default {"Unknown"};};
    _list lbAdd format ["%1 - %2", _x getVariable ["realname",name _x],_side];
    _list lbSetdata [(lbSize _list)-1,str(_x)];
} forEach playableUnits;
if (FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};

if (life_god) then {
    _godmode = CONTROL(IDD_ADMINMENU,IDC_ADMINMENU_GODMODE);
    _godmode ctrlSetTextColor [0, 255, 0, 1];    // green
};
if (life_markers) then {
    _markers = CONTROL(IDD_ADMINMENU,IDC_ADMINMENU_MARKERS);
    _markers ctrlSetTextColor [0, 255, 0, 1];    // green
};
