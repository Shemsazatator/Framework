#include "..\..\script_macros.hpp"
/*
	File: fn_craft_update.sqf
	Description: Crafting System
	Created by EdgeKiller
    Coder: EdgeKiller
*/
private["_inv","_mats","_item","_struct","_str","_invSize","_matsNeed","_matsNum","_config","_itemFilter"]; //Declare all private variables
disableSerialization; //Disable Serialization

_inv = CONTROL(666,669); //find the listbox of items can be created
_mats = CONTROL(666,672);
_struct = "";
if((lbCurSel 669) isEqualTo -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = CONTROL_DATA(669);
_itemFilter = CONTROL_DATA(673);

_config = [_itemFilter] call life_fnc_craftConfig;

{
	if (_item isEqualTo _x select 0) then {
		_matsNeed = _x select 1;
		_invSize = count _matsNeed;
		for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {
			_str = M_CONFIG(getText,"VirtualItems",(_matsNeed select _i),"displayName");
			_matsNum = _matsNeed select _i+1;
			_struct = _struct + format["%1x %2<br/>",_matsNum,(localize _str)];

		};
	};
} foreach (_config);

_mats ctrlSetStructuredText parseText format["<t size='0.8px'>%1</t>",_struct];
