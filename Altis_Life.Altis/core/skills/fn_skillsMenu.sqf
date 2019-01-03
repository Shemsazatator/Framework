#include "..\..\script_macros.hpp"
/*
    File: fn_adminMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens the skills menu.
*/
disableSerialization;

waitUntil {!isNull (findDisplay IDD_SKILLSMENU)};

private _list = CONTROL(IDD_SKILLSMENU,IDC_SKILLSMENU_SKILLSLIST);
lbClear _list;
