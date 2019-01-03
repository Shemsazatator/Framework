class Life_skills_menu {
	idd = IDD_SKILLSMENU;
	name = "Life_skills_menu";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};
	};

	class controls {

		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "SKILLS";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		//Skills list
		class skillsList : life_RscListBox
		{
			idc = IDC_SKILLSMENU_SKILLSLIST;
			sizeEx = 0.030;
			onLBSelChanged = "[] spawn life_fnc_skills_update";
			x = 0.105;
			y = 0.31;
			w = 0.275;
      h = 0.44;
		};

		//Description
		class descriptionPerk : Life_RscControlsGroup
		{
			idc = IDC_SKILLSMENU_DESCRIPTIONLIST;
			w = 0.275;
			h = 0.44;
			x = 0.395;
			y = 0.30;

			class Controls
			{
				class mats : Life_RscStructuredText
				{
					idc = IDC_SKILLSMENU_DESCRIPTION;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.27;
          h = 0.44;
				};
			};
		};

		//Upgrade button
		class upgradePerk : Life_RscButtonMenu {
			idc = IDC_SKILLSMENU_BUTTONUPGRADE;
			text = "+";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "if(!(life_is_processing and life_action_inUse)) then {[] spawn life_fnc_addPerkRank};";
			x = 0.69;
			y = 0.26;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		//Downgrade button
		class downgradePerk : Life_RscButtonMenu {
			idc = IDC_SKILLSMENU_BUTTONDOWNGRADE;
			text = "-";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "if(!(life_is_processing and life_action_inUse)) then {[] spawn life_fnc_deletePerkRank};";
			x = 0.80;
			y = 0.26;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};
