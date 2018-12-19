/*
    File: fn_updateRequest.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Updates ALL player information in the database.
    Information gets passed here from the client side file: core\session\fn_updateRequest.sqf
*/
private ["_uid","_side","_cash","_bank","_level","_experience","_licenses","_gear","_stats","_name","_alive","_position","_query","_thread"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_side = [_this,2,sideUnknown,[civilian]] call BIS_fnc_param;
_cash = [_this,3,0,[0]] call BIS_fnc_param;
_bank = [_this,4,5000,[0]] call BIS_fnc_param;
_level = [_this,5,1,[0]] call BIS_fnc_param;
_experience = [_this,6,0,[0]] call BIS_fnc_param;
_licenses = [_this,7,[],[[]]] call BIS_fnc_param;
_gear = [_this,8,[],[[]]] call BIS_fnc_param;
_stats = [_this,9,[100,100],[[]]] call BIS_fnc_param;
_alive = [_this,10,false,[true]] call BIS_fnc_param;
_position = [_this,11,[],[[]]] call BIS_fnc_param;

//Get to those error checks.
if ((_uid isEqualTo "") || (_name isEqualTo "")) exitWith {};

//Parse and setup some data.
_name = [_name] call DB_fnc_mresString;
_gear = [_gear] call DB_fnc_mresArray;
_stats = [_stats] call DB_fnc_mresArray;
_cash = [_cash] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;
_level = [_level] call DB_fnc_numberSafe;
_experience = [_experience] call DB_fnc_numberSafe;
_position = if (_side in [east,civilian]) then {[_position] call DB_fnc_mresArray} else {[]};

//Does something license related but I can't remember I only know it's important?
for "_i" from 0 to count(_licenses)-1 do {
    _bool = [(_licenses select _i) select 1] call DB_fnc_bool;
    _licenses set[_i,[(_licenses select _i) select 0,_bool]];
};

_licenses = [_licenses] call DB_fnc_mresArray;

//PLAYTIME
_playtime = [_uid] call TON_fnc_getPlayTime;
_playtime_update = [];
{
    if ((_x select 0) isEqualTo _uid) exitWith
    {
        _playtime_update pushBack [_x select 1];
    };
} forEach TON_fnc_playtime_values_request;
_playtime_update = (_playtime_update select 0) select 0;
switch _side do {
    case west: {_playtime_update set[0,_playtime];};
    case east: {_playtime_update set[2,_playtime];};
    case independent: {_playtime_update set[1,_playtime];};
    case civilian: {_playtime_update set[2,_playtime];};
};
_playtime_update = [_playtime_update] call DB_fnc_mresArray;

switch _side do {
    case west: {_query = format ["UPDATE players SET name='%1', cash='%2', bankacc='%3', level='%4', experience='%5', cop_gear='%6', cop_licenses='%7', cop_stats='%8', playtime='%9' WHERE pid='%10'",_name,_cash,_bank,_level,_experience,_gear,_licenses,_stats,_playtime_update,_uid];};
    case east: {_query = format ["UPDATE players SET name='%1', cash='%2', bankacc='%3', level='%4', experience='%5', civ_licenses='%6', civ_gear='%7', arrested='%8', civ_stats='%9', civ_alive='%10', civ_position='%11', playtime='%12' WHERE pid='%13'",_name,_cash,_bank,_level,_experience,_licenses,_gear,[_this select 8] call DB_fnc_bool,_stats,[_alive] call DB_fnc_bool,_position,_playtime_update,_uid];};
    case independent: {_query = format ["UPDATE players SET name='%1', cash='%2', bankacc='%3', level='%4', experience='%5', med_licenses='%6', med_gear='%7', med_stats='%8', playtime='%9' WHERE pid='%10'",_name,_cash,_bank,_level,_experience,_licenses,_gear,_stats,_playtime_update,_uid];};
    case civilian: {_query = format ["UPDATE players SET name='%1', cash='%2', bankacc='%3', level='%4', experience='%5', civ_licenses='%6', civ_gear='%7', arrested='%8', civ_stats='%9', civ_alive='%10', civ_position='%11', playtime='%12' WHERE pid='%13'",_name,_cash,_bank,_level,_experience,_licenses,_gear,[_this select 8] call DB_fnc_bool,_stats,[_alive] call DB_fnc_bool,_position,_playtime_update,_uid];};
};


_queryResult = [_query,1] call DB_fnc_asyncCall;
