class CfgCraft {
  class weapons {

  };
  class uniform {

  };
  class backpack {

  };
  class items {
    class water {
      displayName = "STR_Item_WaterBottle";
      MaterialsReq[] = {"pickaxe"};
      result[] = {"waterBottle"};
      experience = 1;
      conditions = "call life_level >= 2 and {playerSide in [east,civilian]}";
    };
  };
};
