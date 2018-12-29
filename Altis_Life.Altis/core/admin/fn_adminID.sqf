#include "..\..\script_macros.hpp"
/*
    File: fn_adminID.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Output information received to admin menu.
*/
disableSerialization;
private _ret = _this select 0;
private _text = CONTROL(IDD_ADMINMENU,IDC_ADMINMENU_PLAYERLISTINFO);

_text ctrlSetStructuredText parseText format ["ID: %1",_ret];
