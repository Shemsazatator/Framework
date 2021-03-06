#include "..\..\script_macros.hpp"
/*
    File: fn_copInteractionMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Replaces the mass addactions for various cop actions towards another player.
*/

disableSerialization;
private _curTarget = param [0,objNull,[objNull]];
private _seizeRank = LIFE_SETTINGS(getNumber,"seize_minimum_rank");

if (player getVariable ["Escorting", false]) then {
    if (isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
    if (!isPlayer _curTarget && side _curTarget isEqualTo civilian) exitWith {closeDialog 0;}; //Bad side check?
    if (player distance _curTarget > 4 ) exitWith {closeDialog 0;}; // Prevents menu accessing from far distances.
};

if (!dialog) then {
    createDialog "pInteraction_Menu";
};

private _Btn1 = CONTROL(IDD_PINTERACTION,IDC_PINTERACTION_BUTTON1);
private _Btn2 = CONTROL(IDD_PINTERACTION,IDC_PINTERACTION_BUTTON2);
private _Btn3 = CONTROL(IDD_PINTERACTION,IDC_PINTERACTION_BUTTON3);
private _Btn4 = CONTROL(IDD_PINTERACTION,IDC_PINTERACTION_BUTTON4);
private _Btn5 = CONTROL(IDD_PINTERACTION,IDC_PINTERACTION_BUTTON5);
private _Btn6 = CONTROL(IDD_PINTERACTION,IDC_PINTERACTION_BUTTON6);
private _Btn7 = CONTROL(IDD_PINTERACTION,IDC_PINTERACTION_BUTTON7);
private _Btn8 = CONTROL(IDD_PINTERACTION,IDC_PINTERACTION_BUTTON8);
life_pInact_curTarget = _curTarget;

if (player getVariable ["isEscorting",false]) then {
    { _x ctrlShow false; } forEach [_Btn1,_Btn2,_Btn3,_Btn5,_Btn6,_Btn7,_Btn8];
};

//Set Unrestrain Button
_Btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";

//Set Check Licenses Button
_Btn2 ctrlSetText localize "STR_pInAct_checkLicenses";
_Btn2 buttonSetAction "[player] remoteExecCall [""life_fnc_licenseCheck"",life_pInact_curTarget]; closeDialog 0;";

//Set Search Button
_Btn3 ctrlSetText localize "STR_pInAct_SearchPlayer";
_Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_searchAction; closeDialog 0;";

//Set Escort Button
if (player getVariable ["isEscorting",false]) then {
    _Btn4 ctrlSetText localize "STR_pInAct_StopEscort";
    _Btn4 buttonSetAction "[] call life_fnc_stopEscorting; closeDialog 0;";
} else {
    _Btn4 ctrlSetText localize "STR_pInAct_Escort";
    _Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};

//Set Ticket Button
_Btn5 ctrlSetText localize "STR_pInAct_TicketBtn";
_Btn5 buttonSetAction "[life_pInact_curTarget] call life_fnc_ticketAction;";

_Btn6 ctrlSetText localize "STR_pInAct_Arrest";
_Btn6 buttonSetAction "[life_pInact_curTarget] call life_fnc_arrestAction; closeDialog 0;";
_Btn6 ctrlEnable false;

_Btn7 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn7 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar; closeDialog 0;";

//SeizeWeapons Button
_Btn8 ctrlSetText localize "STR_pInAct_Seize";
_Btn8 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_seizePlayerAction; closeDialog 0;";

if (FETCH_CONST(life_coplevel) < _seizeRank) then {_Btn8 ctrlEnable false;};

{
    if ((player distance (getMarkerPos _x) <30)) exitWith { _Btn6 ctrlEnable true;};
} forEach LIFE_SETTINGS(getArray,"sendtoJail_locations");
