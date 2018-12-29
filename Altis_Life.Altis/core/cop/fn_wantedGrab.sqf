#include "..\..\script_macros.hpp"
/*
    File: fn_wantedGrab.sqf
    Author: ColinM

    Description:
    Prepare the array to query the crimes.
*/
private ["_tab","_criminal"];
disableSerialization;
_tab = CONTROL(IDD_WANTEDMENU,IDC_WANTEDMENU_WANTEDDETAILS);
_criminal = CONTROL_DATA(IDC_WANTEDMENU_WANTEDLIST);
_criminal = call compile format ["%1", _criminal];
if (isNil "_criminal") exitWith {};

if (life_HC_isActive) then {
    [player,_criminal] remoteExec ["HC_fnc_wantedCrimes",HC_Life];
} else {
    [player,_criminal] remoteExec ["life_fnc_wantedCrimes",RSERV];
};
