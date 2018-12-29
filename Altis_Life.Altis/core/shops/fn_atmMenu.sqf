#include "..\..\script_macros.hpp"
/*
    File: fn_atmMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens and manages the bank menu.
*/
private ["_units","_type"];

if (!life_use_atm) exitWith {
    hint format [localize "STR_Shop_ATMRobbed",(LIFE_SETTINGS(getNumber,"noatm_timer"))];
};

if (!dialog) then {
    if (!(createDialog "Life_atm_management")) exitWith {};
};

disableSerialization;
_units = CONTROL(IDD_BANKMENU,IDC_BANKMENU_PLAYERLIST);

lbClear _units;
CONTROL(IDD_BANKMENU,IDC_BANKMENU_CASHTITLE) ctrlSetStructuredText parseText format ["<img size='1.7' image='icons\ico_bank.paa'/> $%1<br/><img size='1.6' image='icons\ico_money.paa'/> $%2",[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];

{
    _name = _x getVariable ["realname",name _x];
    if (alive _x and (!(_name isEqualTo profileName))) then {
        switch (side _x) do {
            case west: {_type = "Cop"};
            case east: {_type = "Civ"};
            case independent: {_type = "EMS"};
            case civilian: {_type = "Civ"};
        };
        _units lbAdd format ["%1 (%2)",_x getVariable ["realname",name _x],_type];
        _units lbSetData [(lbSize _units)-1,str(_x)];
    };
} forEach playableUnits;

lbSetCurSel [IDC_BANKMENU_PLAYERLIST,0];

if (isNil {(group player getVariable "gang_bank")}) then {
    (CONTROL(IDD_BANKMENU,IDC_BANKMENU_GANGWITHDRAW)) ctrlEnable false;
    (CONTROL(IDD_BANKMENU,IDC_BANKMENU_GANGDEPOSIT)) ctrlEnable false;
};
