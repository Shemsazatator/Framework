#include "..\..\script_macros.hpp"
/*
	File: fn_craftAction.sqf
	Author: EdgeKiller

	Description:
	Master handling for crafting an item.
*/
private["_item","_itemInfo","_oldItem","_newItem","_upp","_itemName","_ui","_progress","_pgText","_cP","_allMaterial","_matsNeed","_invSize","_handledItem","_itemFilter","_backpackOldItems","_weight"];

disableSerialization;

if ((lbCurSel IDC_CRAFTMENU_CRAFTLIST) isEqualTo -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};

_item = CONTROL_DATA(IDC_CRAFTMENU_CRAFTLIST);
_allMaterial = true;
_itemFilter = CONTROL_DATA(IDC_CRAFTMENU_FILTERLIST);
_matsNeed = 0;
_config = [_itemFilter] call life_fnc_craftConfig;
life_action_inUse = true; //Lock out other actions during processing.

{
	if (_item isEqualTo _x select 0) then {
		_matsNeed = _x select 1;
		_invSize = count _matsNeed;

		for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
			_matsNum = _matsNeed select _i+1;
    	if ((ITEM_VALUE(_matsNeed select _i)) < _matsNum) then {_allMaterial = false;};
		};
	};
} foreach (_config);

if (!_allMaterial) exitWith {hint localize "STR_PM_NoMaterial"; life_action_inUse = false;};

//Some checks
if ((count _matsNeed) isEqualTo 0) exitWith {life_action_inUse = false;};

if (_itemFilter isEqualTo "backpack" and backpack player != "") exitWith {
		hint localize "STR_CRAFT_AR_Backpack";
  	life_action_inUse = false;
};

if (_itemFilter isEqualTo "uniform" and uniform player != "") exitWith {
		hint localize "STR_CRAFT_AR_Uniform";
  	life_action_inUse = false;
};

if (_itemFilter isEqualTo "weapon" and !(player canAdd _newItem) || currentWeapon player != "") exitWith {
	hint localize "STR_NOTF_NoRoom";
   life_action_inUse = false;
};
/*
if (_itemFilter == "item") then {
	_weight = [_item] call life_fnc_itemWeight;
	_weightUsedItems = 0;
	for [{_i=0},{_i<(count _matsNeed)-1},{_i=_i+2}] do {
    _matsNum = _matsNeed select _i+1;
	  _weightUsedItems = _weightUsedItems + (([(_matsNeed select _i)] call life_fnc_itemWeight) * _matsNum);
    diag_log format ["%1 - %2",(_matsNeed select _i),_weightUsedItems];
	};

  if ((life_carryWeight - _weightUsedItems + _weight) > life_maxWeight) exitWith {
  	hint localize "STR_NOTF_NoRoom";
  	life_action_inUse = false;
  };
};
*/
if (_itemFilter isEqualTo "item") then {
	_weight = ([_item] call life_fnc_itemWeight);
};
if (_itemFilter isEqualTo "item" && (life_carryWeight + _weight) > life_maxWeight) exitWith {
	hint localize "STR_NOTF_NoRoom";
  life_action_inUse = false;
};

_oldItem = _matsNeed;
_newItem = _item;

if (_itemFilter isEqualTo "item") then {
	_itemName = localize M_CONFIG(getText,"VirtualItems",_newItem,"displayName");
} else {
	_itemInfo = [_newItem] call life_fnc_fetchCfgDetails;
	_itemName = _itemInfo select 1;
};

_upp = format["Crafting %1",_itemName];
closeDialog 0;

//Setup our progress bar.
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl IDC_PROGRESSBAR_BAR;
_pgText = _ui displayCtrl IDC_PROGRESSBAR_TEXT;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

_removeItemSuccess = true;
_invSize = count _oldItem;

for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
  _handledItem = (_oldItem select _i);
	if (!([false,_handledItem,_oldItem select _i+1] call life_fnc_handleInv)) exitWith {_removeItemSuccess = false;};
};

if (!_removeItemSuccess) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false; life_action_inUse = false;};

/*
for "_i" from 0 to 1 step 0 do {
  sleep 0.3;
  _cP = _cP + 0.01;
  _progress progressSetPosition _cP;
  _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
  if(_cP >= 1) exitWith {};
};
*/

[] call life_fnc_p_updateMenu;

life_is_processing = true;

while {true} do {
	sleep  0.3;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if (_cP >= 1) exitWith {};
};

if (_itemFilter isEqualTo "backpack") then {
	if (backpack player isEqualTo "") then {
		player addBackpack _newItem;
	} else {
		hint localize "STR_CRAFT_AR_Backpack";
		life_is_processing = false;
	  life_action_inUse = false;
	};
};

if (_itemFilter isEqualTo "item") then {
	_handledItem = _newItem;
	[true,_handledItem,1] call life_fnc_handleInv;
};

if (_itemFilter isEqualTo "uniform") then {
	if (uniform player isEqualTo "") then {
		player addUniform _newItem;
	}else{
		hint localize "STR_CRAFT_AR_Uniform";
		life_is_processing = false;
	  life_action_inUse = false;
	};
};

if (_itemFilter isEqualTo "weapon") then {

	if (player canAdd _newItem) then {
		player addItem _newItem;
	} else {
		if (currentWeapon player isEqualTo "") then {
			player addWeapon _newItem;
		} else {
			5 cutText ["","PLAIN"];
			for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
  	   _handledItem = (_oldItem select _i);
				[true,_handledItem,_oldItem select _i+1] call life_fnc_handleInv;
			};
			life_is_processing = false;
  	  life_action_inUse = false;
		};
	};
};

5 cutText ["","PLAIN"];
titleText[format[localize "STR_CRAFT_Process",_itemName],"PLAIN"];
life_is_processing = false;
life_action_inUse = false;
