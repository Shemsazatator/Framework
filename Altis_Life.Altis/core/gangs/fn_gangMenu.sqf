#include "..\..\script_macros.hpp"
/*
    File: fn_gangMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    31 hours of no sleep screw your description.
*/
private ["_ownerID","_gangBank","_gangMax","_gangName","_members","_allUnits","_ctrl"];
disableSerialization;
if (isNull (findDisplay IDD_GANGMENU)) then {
    if (!(createDialog "Life_My_Gang_Diag")) exitWith {}; //NOOOOOOOOOOOOOOOOOOOOOOOoooooooooooooOOOOOOOOOOOOOOOOOOOOOOOOOOO00000000000000oooooo
};

_ownerID = group player getVariable ["gang_owner",""];
if (_ownerID isEqualTo "") exitWith {closeDialog 0;}; //Bad juju

_gangName = group player getVariable "gang_name";
_gangBank = GANG_FUNDS;
_gangMax = group player getVariable "gang_maxMembers";

if !(_ownerID isEqualTo getPlayerUID player) then {
    (CONTROL(IDD_GANGMENU,IDC_GANGMENU_GANGLOCK)) ctrlEnable false; //Upgrade
    (CONTROL(IDD_GANGMENU,IDC_GANGMENU_GANGKICK)) ctrlEnable false; // Kick
    (CONTROL(IDD_GANGMENU,IDC_GANGMENU_GANGLEADER)) ctrlEnable false; //Set New Leader
    (CONTROL(IDD_GANGMENU,IDC_GANGMENU_INVITEMEMBER)) ctrlEnable false; //Invite Player
    (CONTROL(IDD_GANGMENU,IDC_GANGMENU_DISABLEGANG)) ctrlEnable false; //Disband Gang
};

(CONTROL(IDD_GANGMENU,IDC_GANGMENU_TITLE)) ctrlSetText _gangName;
(CONTROL(IDD_GANGMENU,IDC_GANGMENU_GANGBANK)) ctrlSetText format [(localize "STR_GNOTF_Funds")+ " $%1",[_gangBank] call life_fnc_numberText];

//Loop through the players.
_members = CONTROL(IDD_GANGMENU,IDC_GANGMENU_GANGMEMBERLIST);
lbClear _members;
{
    if ((getPlayerUID _x) == _ownerID) then {
        _members lbAdd format ["%1 " +(localize "STR_GNOTF_GangLeader"),(_x getVariable ["realname",name _x])];
        _members lbSetData [(lbSize _members)-1,str(_x)];
    } else {
        _members lbAdd format ["%1",(_x getVariable ["realname",name _x])];
        _members lbSetData [(lbSize _members)-1,str(_x)];
    };
} forEach (units group player);

_grpMembers = units group player;
_allUnits = playableUnits;

//Clear out the list..
{
    if (_x in _grpMembers || !(side _x isEqualTo civilian) && isNil {(group _x) getVariable "gang_id"}) then {
        _allUnits deleteAt _forEachIndex;
    };
} forEach _allUnits;

_ctrl = CONTROL(IDD_GANGMENU,IDC_GANGMENU_COLORLIST);
lbClear _ctrl; //Purge the list
{
    _ctrl lbAdd format ["%1",_x getVariable ["realname",name _x]];
    _ctrl lbSetData [(lbSize _ctrl)-1,str(_x)];
} forEach _allUnits;
