// resources
def tree = "tree" end
def branch = "branch" end
def log_ = "log" end
def branch_predictor = "branch predictor" end
def wooden_gear = "wooden gear" end
def box = "box" end
def harvester = "harvester" end
def board = "board" end
def sand = "sand" end
def wavy_water = "wavy water" end
def water = "water" end
def cotton = "cotton" end
def bit_0 = "bit (0)" end
def bit_1 = "bit (1)" end
def boulder = "boulder" end
def flower = "flower" end
def copper_ore = "copper ore" end
def mountain = "mountain" end
def lodetone = "lodestone" end
def lambda = "lambda" end
def latex = "LaTeX" end
def pixel = "pixel" end
def rock = "rock" end
def ifC : forall a. cmd bool -> cmd a -> cmd a -> cmd a =
  \test. \thn. \els. b <- test; if b {thn} {els}
end

def loop : int -> cmd exec -> int -> cmd unit  = \times. \exec. \index.
  if (index == times) {
    noop;
  } {
    exec;
    loop times exec  (index + 1);
  }
end

def get_opos_dir : dir -> cmd dir = \direction.
  if (direction == south) {
  return north
} {
  if (direction == north) {
    return south
  } {
    if (direction == east) {
      return west
    } {
      if (direction == west) {
        return east
      } {
        if (direction == forward) {
          return back
        } {
          if (direction == left) {
            return right
          } {
            if (direction == right) {
              return left
            } {
              return forward
            }
          }
        }
      }
    }
  }
}
end

def sf = scan forward end

def m2 = move; move end
def m3 = m2; move end
def m4 = m3; move end
def m5 = m4; move end
def m6 = m5; move end
def m7 = m6; move end
def m8 = m7; move end
def m9 = m8; move end
def m10 = m9; move end

def mr = turn right; move end
def ml = turn left; move end
def mb = turn back; move end
def if_tree_grab =
  t <- ishere(tree);
  if t {
    grab;
    return ()
  } {};
  move
end

def grab_trees_to : dir -> int -> cmd unit = \direction. \x.
  turn direction;
  loop x if_tree_grab 0;
  op_dir <- get_opos_dir direction;
  turn op_dir;
  loop x move 0;
  noop
end
def craft_branch_predictor =
  make branch;
  make branch;
  make branch_predictor;
  equip branch_predictor
end

def craft_boards =
  make board;
  log "4 boards crafted"
end

def craft_wooden_gear =
  make wooden_gear;
  log "wooden gear crafted"
end

def craft_box =
  make box;
  log "box crafted"
end

def craft_harvester =
  make harvester;
  log "harvester crafted"
end

def craft_log =
  make log_;
  log "log crafted"
end

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
