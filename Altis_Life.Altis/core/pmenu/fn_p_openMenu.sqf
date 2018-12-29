#include "..\..\script_macros.hpp"
/*
    File: fn_p_openMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens the players virtual inventory menu
*/
if (!alive player or dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "playerSettings";
disableSerialization;

switch playerSide do {
    case west: {
        ctrlShow[IDC_PLAYERMENU_BUTTONMYGANG,false];
    };

    case east: {
        ctrlShow[IDC_PLAYERMENU_GANGLIST,false];
    };

    case independent: {
        ctrlShow[IDC_PLAYERMENU_GANGLIST,false];
        ctrlShow[IDC_PLAYERMENU_BUTTONMYGANG,false];
    };

    case civilian: {
        ctrlShow[IDC_PLAYERMENU_GANGLIST,false];
    };
};

if (LIFE_SETTINGS(getNumber,"enable_craft") isEqualTo 0) then {
	ctrlShow[IDC_PLAYERMENU_BUTTONCRAFT,false]; //--- craft button
};

if (FETCH_CONST(life_adminlevel) < 1) then {
    ctrlShow[IDC_PLAYERMENU_BUTTONADMINMENU,false];
};

[] call life_fnc_p_updateMenu;
