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
        return south
      }
    }
  }
}
end

def tree = "tree" end

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
