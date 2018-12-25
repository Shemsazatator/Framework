/*
    File: fn_initEventHandlers.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master eventhandler file
*/
player addEventHandler ["Killed", life_fnc_onKilled];
player addEventHandler ["HandleDamage", life_fnc_onHandleDamage];
player addEventHandler ["Respawn", life_fnc_onRespawn];
player addEventHandler ["Take", life_fnc_onTake];
player addEventHandler ["Fired", life_fnc_onFired];
player addEventHandler ["InventoryClosed", life_fnc_onInventoryClosed];
player addEventHandler ["InventoryOpened", life_fnc_onInventoryOpened];
player addEventHandler ["HandleRating", {0}];
player addEventHandler ["FiredNear", life_fnc_onFiredNear];

addMissionEventHandler ["Map", life_fnc_onMap];
