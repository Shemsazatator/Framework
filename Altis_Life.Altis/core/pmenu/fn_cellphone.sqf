#include "..\..\script_macros.hpp"
/*
    File: fn_cellphone.sqf
    Author: Alan

    Description:
    Opens the cellphone menu?
*/
disableSerialization;
waitUntil {!isNull findDisplay IDD_CELLPHONEMENU};
private _units = CONTROL(IDD_CELLPHONEMENU,IDC_CELLPHONEMENU_PLAYERLIST);

ctrlSetText [IDC_CELLPHONEMENU_TEXTEDIT, ""];
lbClear _units;

if (FETCH_CONST(life_adminlevel) < 1) then {
    ctrlShow[IDC_CELLPHONEMENU_ADMINMSG,false];
    ctrlShow[IDC_CELLPHONEMENU_ADMINMSGALL,false];
};
{
    if (alive _x && !(_x isEqualTo player)) then {
        private _type = switch (side _x) do {
            case west: {"Cop"};
            case east: {"Civ"};
            case independent: {"Med"};
            case civilian: {"Civ"};
        };
        _units lbAdd format ["%1 (%2)",_x getVariable ["realname",name _x],_type];
        _units lbSetData [(lbSize _units)-1,str(_x)];
    };
} forEach playableUnits;

lbSetCurSel [IDC_CELLPHONEMENU_PLAYERLIST,0];
