/*
    File: fn_animSync.sqf
    Author:

    Description:

*/
params [
    ["_unit",objNull,[objNull]],
    ["_anim","",[""]],
    ["_cancelOwner",false,[true]]
];
if (isNull _unit or {(local _unit and _cancelOwner)}) exitWith {};
_unit switchMove _anim;
