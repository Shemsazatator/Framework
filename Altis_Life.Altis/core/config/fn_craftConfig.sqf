#include "..\..\script_macros.hpp"
/*
	File: fn_craftConfig.sqf
	Author: EdgeKiller

	Description:
	Master configuration file for the crafting menu.

*/
private["_craft","_return"];
private _craft = param [0,"",[""]];
if(_craft isEqualTo "") exitWith {closeDialog 0}; //Bad shop type passed.
_return = [];

_craftConfig = missionConfigFile >> "CfgCraft" >> _craft;

for[{_i = 0},{_i < count(_craftConfig)},{_i = _i + 1}] do {
  _tempConfig = [];
	_curConfig = (_craftConfig select _i);
  _condition = getText(_curConfig >> "condition");
  if(call compile _condition) then {
	  _tempConfig pushBack getText(_curConfig >> "result");
	  _tempConfig pushBack getText(_curConfig >> "displayName");
	  _tempConfig pushBack getText(_curConfig >> "MaterialsReq");
    _tempConfig pushBack getNumber(_curConfig >> "experience");
    _return pushBack _tempConfig;
  };
};

switch _craft do
{
	case "weapon":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				["hgun_P07_F", ["life_inv_goldbar",2,"life_inv_copperr",1]]

			];
	};

	case "uniform":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				["U_IG_Guerilla1_1", ["life_inv_goldbar",1]]
			];
	};

	case "backpack":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				["B_Carryall_oli", ["life_inv_goldbar",1]]
			];
	};

	case "item":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				["life_inv_pickaxe", ["life_inv_goldbar",1]],
				["life_inv_goldbar", ["life_inv_goldbar",1,"life_inv_copperr",1]]
		];
	};
};

_return
