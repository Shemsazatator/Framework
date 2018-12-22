/*
    File: fn_setupEVH.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master eventhandler file
*/
player addEventHandler ["Killed", life_fnc_onPlayerKilled];
player addEventHandler ["HandleDamage", life_fnc_handleDamage];
player addEventHandler ["Respawn", life_fnc_onPlayerRespawn];
player addEventHandler ["Take", life_fnc_onTakeItem];
player addEventHandler ["Fired", life_fnc_onFired];
player addEventHandler ["InventoryClosed", life_fnc_inventoryClosed];
player addEventHandler ["InventoryOpened", life_fnc_inventoryOpened];
player addEventHandler ["HandleRating", {0}];

addMissionEventHandler ["Map", life_fnc_checkMap];
