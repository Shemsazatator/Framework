#include "..\..\script_macros.hpp"
/*
    File: fn_wantedAddP.sqf
    Author:

    Description:

*/
if !(playerSide isEqualTo west) exitWith {hint localize "STR_Cop_wantedList_notCop";};
if ((lbCurSel IDC_WANTEDMENU_PLAYERLIST) isEqualTo -1) exitWith {hint localize "STR_Cop_wantedList_noPlayerSelected";};
if ((lbCurSel IDC_WANTEDMENU_WANTEDADDL) isEqualTo -1) exitWith {hint localize "STR_Cop_wantedList_noCrimeSelected";};
private _unit = CONTROL_DATA(IDC_WANTEDMENU_PLAYERLIST);
_unit = call compile format ["%1",_unit];
private _amount = CONTROL_DATA(IDC_WANTEDMENU_WANTEDADDL);
if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};

[1,"STR_Wanted_AddP",true,[_unit getVariable ["realname",name _unit],_amount,getPlayerUID _unit]] remoteExecCall ["life_fnc_broadcast",RCLIENT];

if (life_HC_isActive) then {
    [getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
} else {
    [getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
};
