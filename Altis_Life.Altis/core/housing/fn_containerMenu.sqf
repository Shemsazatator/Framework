#include "..\..\script_macros.hpp"
/*
    File: fn_containerMenu.sqf
    Author: NiiRoZz

    Description:
    Container interaction menu.
*/

disableSerialization;
private _container = param [0,objNull,[objNull]];
if (isNull _container) exitWith {}; //Bad target

if (!dialog) then {
    createDialog "pInteraction_Menu";
};

private _Btn1 = CONTROL(IDD_VINTERACTION,IDC_VINTERACTION_BUTTON1);
private _Btn2 = CONTROL(IDD_VINTERACTION,IDC_VINTERACTION_BUTTON2);
private _Btn3 = CONTROL(IDD_VINTERACTION,IDC_VINTERACTION_BUTTON3);
private _Btn4 = CONTROL(IDD_VINTERACTION,IDC_VINTERACTION_BUTTON4);
private _Btn5 = CONTROL(IDD_VINTERACTION,IDC_VINTERACTION_BUTTON5);
private _Btn6 = CONTROL(IDD_VINTERACTION,IDC_VINTERACTION_BUTTON6);
private _Btn7 = CONTROL(IDD_VINTERACTION,IDC_VINTERACTION_BUTTON7);
private _Btn8 = CONTROL(IDD_VINTERACTION,IDC_VINTERACTION_BUTTON8);
{_x ctrlShow false;} forEach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8];

life_pInact_container = _container;
if (playerSide isEqualTo west) then {
    _Btn1 ctrlSetText localize "STR_vInAct_SearchContainer";
    _Btn1 buttonSetAction "[life_pInact_container] spawn life_fnc_containerInvSearch; closeDialog 0;";
    _Btn1 ctrlShow true;
} else {
    _Btn1 ctrlSetText localize "STR_pInAct_RemoveContainer";
    _Btn1 buttonSetAction "[life_pInact_container] spawn life_fnc_removeContainer; closeDialog 0;";
    _Btn1 ctrlShow true;
};
