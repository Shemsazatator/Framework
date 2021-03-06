/*
    File: fn_gangDisbanded.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Notifies members that the gang has been disbanded.

    TO DO : Switch playerside need to be tested
*/
private _group = param [0,grpNull,[grpNull]];
if (isNull _group) exitWith {}; //Fail horn please.
if (!isNull (findDisplay IDD_GANGMENU)) then {closeDialog IDD_GANGMENU};

hint localize "STR_GNOTF_DisbandWarn_2";

switch playerSide do {
    case east: {[player] joinSilent (createGroup east);};
    case civilian: {[player] joinSilent (createGroup civilian);};
};

if (units _group isEqualTo []) then {
    deleteGroup _group;
};
