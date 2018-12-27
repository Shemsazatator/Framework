/*
    File: fn_firstViewCombat.sqf
    Author: Lyeed

    Description:
    Timer for the duration of the combat mode
*/
life_combatTime = time;
if (!life_firstCombatActive) then {
	[] spawn {
		life_firstCombatActive = true;
		playMusic "EventTrack03_F_EPB";
		while {(life_combatTime > (time - 60))} do {
			if ((cameraView isEqualTo "EXTERNAL") and ((vehicle player) isEqualTo player)) then {
				player switchCamera "INTERNAL";
			};
			sleep 0.2;
		};
		life_firstCombatActive = false;

		player switchCamera "EXTERNAL";
	};
};
