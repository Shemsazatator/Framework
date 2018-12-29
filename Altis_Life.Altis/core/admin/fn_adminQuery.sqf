#include "..\..\script_macros.hpp"
/*
    File: fn_adminQuery.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the query on a player.
*/
private ["_text","_info","_prim","_sec","_vest","_uni","_bp","_attach","_tmp"];
disableSerialization;
if (!isNil "admin_query_ip") exitWith {hint localize "STR_ANOTF_Query_2"};
_text = CONTROL(IDD_ADMINMENU,IDC_ADMINMENU_PLAYERLISTINFO);
_info = CONTROL_DATA(IDC_ADMINMENU_PLAYERLIST);
_info = call compile format ["%1", _info];

if (isNil "_info") exitWith {_text ctrlSetText localize "STR_ANOTF_QueryFail";};
if (isNull _info) exitWith {_text ctrlSetText localize "STR_ANOTF_QueryFail";};
[player] remoteExec ["TON_fnc_player_query",_info];
_text ctrlSetText localize "STR_ANOTF_Query";
