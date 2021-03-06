#include "..\..\script_macros.hpp"
/*
    File: fn_giveMoney.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Gives the selected amount of money to the selected player.
*/
private ["_unit","_amount"];
_amount = ctrlText IDC_PLAYERMENU_MONEYEDIT;
ctrlShow[IDC_PLAYERMENU_MONEYDROP,false];
if ((lbCurSel IDC_PLAYERMENU_NEARPLAYERS) isEqualTo -1) exitWith {hint localize "STR_NOTF_noOneSelected";ctrlShow[IDC_PLAYERMENU_MONEYDROP,true];};
_unit = CONTROL_DATA(IDC_PLAYERMENU_NEARPLAYERS);
_unit = call compile format ["%1",_unit];
if (isNil "_unit") exitWith {ctrlShow[IDC_PLAYERMENU_MONEYDROP,true];};
if (_unit == player) exitWith {ctrlShow[IDC_PLAYERMENU_MONEYDROP,true];};
if (isNull _unit) exitWith {ctrlShow[IDC_PLAYERMENU_MONEYDROP,true];};

//A series of checks *ugh*
if (!life_use_atm) exitWith {hint localize "STR_NOTF_recentlyRobbedBank";ctrlShow[IDC_PLAYERMENU_MONEYDROP,true];};
if (!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_NOTF_notNumberFormat";ctrlShow[IDC_PLAYERMENU_MONEYDROP,true];};
if (parseNumber(_amount) <= 0) exitWith {hint localize "STR_NOTF_enterAmount";ctrlShow[IDC_PLAYERMENU_MONEYDROP,true];};
if (parseNumber(_amount) > CASH) exitWith {hint localize "STR_NOTF_notEnoughtToGive";ctrlShow[IDC_PLAYERMENU_MONEYDROP,true];};
if (isNull _unit) exitWith {ctrlShow[IDC_PLAYERMENU_MONEYDROP,true];};
if (isNil "_unit") exitWith {ctrlShow[IDC_PLAYERMENU_MONEYDROP,true]; hint localize "STR_NOTF_notWithinRange";};

hint format [localize "STR_NOTF_youGaveMoney",[(parseNumber(_amount))] call life_fnc_numberText,_unit getVariable ["realname",name _unit]];
CASH = CASH - (parseNumber(_amount));
[0] call SOCK_fnc_updatePartial;

[_unit,_amount,player] remoteExecCall ["life_fnc_receiveMoney",_unit];
[] call life_fnc_p_updateMenu;

ctrlShow[IDC_PLAYERMENU_MONEYDROP,true];
