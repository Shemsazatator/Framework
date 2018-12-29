/*
    File: fn_spawnPointSelected.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sorts out the spawn point selected and does a map zoom.
*/
disableSerialization;
private ["_control","_selection","_spCfg","_sp"];
_control = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_selection = [_this,1,0,[0]] call BIS_fnc_param;

_spCfg = [playerSide] call life_fnc_spawnPointCfg;
_sp = _spCfg select _selection;
[CONTROL(IDD_SPAWNMENU,IDC_SPAWNMENU_MAPVIEW),1,0.1,getMarkerPos (_sp select 0)] call life_fnc_setMapPosition;
life_spawn_point = _sp;

ctrlSetText[IDC_SPAWNMENU_TITLE,format ["%2: %1",_sp select 1,localize "STR_Spawn_CSP"]];
