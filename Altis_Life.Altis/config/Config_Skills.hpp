/*
*    class:
*        name = name show in the menu
*        description = description allowed of the perk in the menu
*        descriptionRanks = new value for each upgrade
*        rank = how many rank can we upgrade the perk ?
*        level = level required to see the perk
*        cost = skillPoints necessary to upgrade the perk
*/
class CfgSkills {
  class genius {
    name = "Genius";
    description = "Experience gained is increased by %1.";
    descriptionRanks[] = {"0%", "1%", "3%", "5%", "10%"};
    ranks = 4;
    level = 1;
    cost = 1;
  };
  class ingenior {
    name = "Ingenior";
    description = "Increase the speed of processing by %1.";
    descriptionRanks[] = {"0%", "1%", "3%", "5%", "10%"};
    ranks = 4;
    level = 1;
    cost = 1;
  };
};
