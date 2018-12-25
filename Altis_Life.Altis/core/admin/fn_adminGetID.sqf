#include "..\..\script_macros.hpp"
/*
    File: fn_adminGetID.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Fetches the selected ID of the player.
    Used by in-game admins to issue bans/kicks.
    https://community.bistudio.com/wiki/Multiplayer_Server_Commands
*/
private _unit = CONTROL_DATA(2902);
_unit = call compile format ["%1", _unit];
if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};

[_unit,player] remoteExecCall ["TON_fnc_getID",2];
