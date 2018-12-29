#include "..\..\script_macros.hpp"
/*
    File: fn_pardon.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Pardons the selected player.
*/
disableSerialization;
if !(playerSide isEqualTo west) exitWith {};

private _list = CONTROL(IDD_WANTEDMENU,IDC_WANTEDMENU_WANTEDDETAILS);
_data = CONTROL_DATA(IDC_WANTEDMENU_WANTEDLIST);
_data = call compile format ["%1", _data];
if (isNil "_data") exitWith {};
if (!(_data isEqualType [])) exitWith {};
if (_data isEqualTo []) exitWith {};

if (life_HC_isActive) then {
    [(_data select 0)] remoteExecCall ["HC_fnc_wantedRemove",HC_Life];
} else {
    [(_data select 0)] remoteExecCall ["life_fnc_wantedRemove",RSERV];
};
