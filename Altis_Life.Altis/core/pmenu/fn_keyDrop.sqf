#include "..\..\script_macros.hpp"
/*
    File: fn_keyDrop.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Drops a key to a vehicle (Excluding houses).
*/
disableSerialization;

private _list = CONTROL(IDD_KEYCHAINMENU,IDC_KEYCHAINMENU_KEYCHAINLIST);
private _sel = lbCurSel _list;

if (_sel isEqualTo -1) exitWith {
    hint localize "STR_NOTF_noDataSelected"
};

if (_list lbData _sel isEqualTo "") exitWith {
    hint localize "STR_NOTF_didNotSelectVehicle"
};

private _index = parseNumber (_list lbData _sel);
private _vehicle = life_vehicles param [_index, objNull, [objNull]];
if isNull _vehicle exitWith {};

// Do not let them drop the key to a house
if (_vehicle isKindOf "House_F") exitWith {
    hint localize "STR_NOTF_cannotRemoveHouseKeys"
};

// Solve stupidness
if (objectParent player isEqualTo _vehicle && {locked _vehicle isEqualTo 2}) exitWith {
    hint localize "STR_NOTF_cannotDropKeys"
};

life_vehicles = life_vehicles - [_vehicle];

// Update vehicle owners
private _owners = _vehicle getVariable ["vehicle_info_owners", []];
_owners deleteAt _index;
_vehicle setVariable ["vehicle_info_owners", _owners, true];

// Reload
call life_fnc_keyMenu
