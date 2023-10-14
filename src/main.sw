// import "constants.sw"
// import "utils.sw"
// import "trees.sw"
// import "crafting.sw"

def base_dir = "/home/naimor/dev/swarm/src/" end

def run_file = \file.
  run(base_dir ++ file)
end

def GM =
  grab;
  move;
  log "grabbed"
end

def HM =
  harvest;
  move;
  log "harvested"
end

def PHM =
  place tree;
  harvest;
  move;
  log "harvested"
end


def main =
  equip "treads";

  turn back;

  move;
  move;

  GM;
  GM;

  craft_branch_predictor;

  log "branch predictor crafter";

  GM;
  GM;
  GM;
  GM;
  GM;
  turn left;
  GM;
  turn left;
  GM;

  craft_log;
  craft_log;
  craft_log;
  craft_log;

  craft_boards;
  craft_boards;
  craft_boards;
  craft_wooden_gear;
  craft_wooden_gear;
  craft_box;
  craft_harvester;

  equip harvester;

  HM;
  HM;
  HM;
  HM;
  HM;
  HM;
  HM;

  turn left;
  HM;
  turn left;

  PHM;
  PHM;
  PHM;
  PHM;
  PHM;
  PHM;
  PHM;
  PHM;

  turn right;
  PHM;

  turn right;
  PHM;
  PHM;
  PHM;
  PHM;
  PHM;
  PHM;
  PHM;
  PHM;
end
