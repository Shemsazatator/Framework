#include "..\..\script_macros.hpp"
/*
    File: fn_craftMenu.sqf
    Author: Shems "Shemsazatator" Shahid

    Description:
    Opens the craft menu.
*/
disableSerialization;

private _craft = param [0,[],[[]]];

private _list = CONTROL(IDD_CRAFTMENU,IDC_CRAFTMENU_CRAFTLIST);
private _mats = CONTROL(IDD_CRAFTMENU,IDC_CRAFTMENU_MATS);
private _struct = "";
private _item = CONTROL_DATA(IDC_CRAFTMENU_CRAFTLIST);
private _itemFilter = CONTROL_DATA(IDC_CRAFTMENU_FILTERLIST);

//Purge List
lbClear _list;

private _craftConfig = missionConfigFile >> "CfgCraft" >> _itemFilter;

{

} foreach _craftConfig;



if((lbCurSel IDC_CRAFTMENU_CRAFTLIST) isEqualTo -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
