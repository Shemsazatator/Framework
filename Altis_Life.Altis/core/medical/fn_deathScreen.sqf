#include "..\..\script_macros.hpp"
/*
    File: fn_deathScreen.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Handles stuff being displayed on the death screen while
    it is currently active.
*/
disableSerialization;

private _medicsOnline = CONTROL(7300,7304);
private _medicsNear = CONTROL(7300,7305);

waitUntil {
    _nearby = if (([independent,getPosATL player,120] call life_fnc_nearUnits)) then {localize "STR_Global_Yes"} else {localize "STR_Global_No"};
    _medicsOnline ctrlSetText format [localize "STR_Medic_Online",independent countSide playableUnits];
    _medicsNear ctrlSetText format [localize "STR_Medic_Near",_nearby];
    sleep 1;
    (isNull (findDisplay 7300))
};
