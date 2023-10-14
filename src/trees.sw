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
