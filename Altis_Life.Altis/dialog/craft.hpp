/*
	File: craft.hpp
	Description: Crafting System
	Created by EdgeKiller
    Coder: EdgeKiller
*/
class Life_craft {
	idd = IDD_CRAFTMENU;
	name= "life_craft";
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
			idc = IDC_CRAFTMENU_TITLE;
			text = "$STR_CRAFT_Title";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class craftListHeader : Life_RscText
		{
			idc = IDC_CRAFTMENU_CRAFTLISTHEADER;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_CraftStats";
			sizeEx = 0.04;
			x = 0.105; y = 0.26;
			w = 0.275; h = 0.04;
		};

		//Craft list
		class craftList : life_RscListBox
		{
			idc = IDC_CRAFTMENU_CRAFTLIST;
			sizeEx = 0.030;
			onLBSelChanged = "[] spawn life_fnc_craft_update";
			x = 0.105;
			y = 0.31;
			w = 0.275; h = 0.44;
		};

		//Materials list header
		class materialListHeader : Life_RscText
		{
			idc = IDC_CRAFTMENU_MATERIALLISTHEADER;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_PM_CraftMaterials";
			sizeEx = 0.04;
			x = 0.395; y = 0.26;
			w = 0.275; h = 0.04;
		};

		//Materials list
		class materialList : Life_RscControlsGroup
		{
			idc = IDC_CRAFTMENU_MATERIEALLIST;
			w = 0.275;
			h = 0.44;
			x = 0.395;
			y = 0.30;

			class Controls
			{
				class mats : Life_RscStructuredText
				{
					idc = IDC_CRAFTMENU_MATS;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.27; h = 0.44;
				};
			};
		};

		//FILTER
		class FilterList : Life_RscCombo
		{
			idc = IDC_CRAFTMENU_FILTERLIST;
			colorBackground[] = {0,0,0,0.7};
			onLBSelChanged  = "[] call life_fnc_craft_updateFilter";
			x = 0.69;
			y = 0.32;
			w = (6.25 / 30);
			h = (1 / 25);
		};

		//Craft button
		class ButtonCraft : Life_RscButtonMenu {
			idc = IDC_CRAFTMENU_BUTTONCRAFT;
			text = "$STR_CRAFT_Button";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "if(!(life_is_processing and life_action_inUse)) then {[] spawn life_fnc_craftAction};";
			x = 0.69;
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
