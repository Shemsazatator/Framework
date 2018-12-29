#include "..\..\script_macros.hpp"
/*
    File: fn_keyGive.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Gives a copy of the key for the selected vehicle to the selected player.
    Player must be within range.
*/
private ["_list","_plist","_sel","_vehicle","_owners","_index","_unit","_uid"];
disableSerialization;

_list = CONTROL(IDD_KEYCHAINMENU,IDC_KEYCHAINMENU_KEYCHAINLIST);
_plist = CONTROL(IDD_KEYCHAINMENU,IDC_KEYCHAINMENU_NEARPLAYERS);

_sel = lbCurSel _list;
if ((_list lbData _sel) isEqualTo "") exitWith {hint localize "STR_NOTF_didNotSelectVehicle";};
_vehicle = CONTROL_DATAI(_list,_sel);
_vehicle = life_vehicles select parseNumber(_vehicle);

if ((lbCurSel IDC_KEYCHAINMENU_NEARPLAYERS) isEqualTo -1) exitWith {hint localize "STR_NOTF_didNotSelectPlayer";};
_sel = lbCurSel _plist;
_unit = CONTROL_DATAI(_plist,_sel);
_unit = call compile format ["%1", _unit];
if (isNull _unit || isNil "_unit") exitWith {};
if (_unit isEqualTo player) exitWith {};

_uid = getPlayerUID _unit;
_owners = _vehicle getVariable "vehicle_info_owners";
_index = [_uid,_owners] call TON_fnc_index;
if (_index isEqualTo -1) then  {
    _owners pushBack [_uid,_unit getVariable ["realname",name _unit]];
    _vehicle setVariable ["vehicle_info_owners",_owners,true];
};

hint format [localize "STR_NOTF_givenKeysTo",_unit getVariable ["realname",name _unit],typeOf _vehicle];
[_vehicle,_unit,profileName] remoteExecCAll ["TON_fnc_clientGetKey",_unit];
