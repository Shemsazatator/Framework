#include "..\..\script_macros.hpp"
/*
	File: fn_craft_updateFilter.sqf
	Description: Crafting System
	Created by EdgeKiller
    Coder: EdgeKiller
*/

disableSerialization;
private["_list","_filter","_inv","_mats","_filterBox","_item","_itemFilter"];
_inv = CONTROL(666,669); //find the listbox of items can be created
_mats = CONTROL(666,672);
_filterBox = CONTROL(666,673);
_itemFilter = CONTROL_DATA(673);

lbClear _inv;
_struct = "";
_config = [_itemFilter] call life_fnc_craftConfig;

{
	if (_itemFilter isEqualTo "item") then {
		_str = localize M_CONFIG(getText,"VirtualItems",(_x select 0),"displayName");
		_inv lbAdd format["%1",_str]; //add a gun to the listbox
		_inv lbSetData[(lbSize _inv)-1,_x select 0]; //set the data of the gun
	} else {
		_itemInfo = [_x select 0] call life_fnc_fetchCfgDetails;
		_inv lbAdd format["%1",_itemInfo select 1]; //add a gun to the listbox
		_inv lbSetData[(lbSize _inv)-1,_itemInfo select 0]; //set the data of the gun
		_inv lbSetPicture[(lbSize _inv)-1,_itemInfo select 2];
	};
} foreach (_config);

_inv lbSetCurSel 0;
_item = CONTROL_DATA(669);
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
