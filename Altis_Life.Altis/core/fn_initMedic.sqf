#include "..\script_macros.hpp"
/*
    File: fn_initMedic.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initializes the medic..
*/
if ((FETCH_CONST(life_medicLevel)) < 1 && (FETCH_CONST(life_adminlevel) isEqualTo 0)) exitWith {
    ["Notwhitelisted",false,true] call BIS_fnc_endMission;
    sleep 35;
};

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay IDD_SPAWNMENU)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay IDD_SPAWNMENU)}; //Wait for the spawn selection to be done.
