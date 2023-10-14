def loop_4 = \v. v; v; v; v end
def loop_6 = \v. v; v; v; v; v; v end
def move_4 = loop_4(move) end
def go_up = turn north; move; move end
def go_down = turn south; move; move end
def go_right = turn east; move_4 end
def go_left = turn west; move_4 end

def up_right_seg = go_right; go_up end
def up_left_seg = go_left; go_up end
def up_seg = up_right_seg; up_left_seg; log "upSeg end" end
def up_col = loop_4(up_seg); log "upCol end" end
def go_top_east = turn east; loop_6(move) end
def all_down = turn south; move; move; move; move; move; move; move; move; move; move; move; move; move; move; move; move end
def end_col = turn east; move; move end
def complete_col = up_col; go_top_east; all_down; end_col end

def prog = loop_4(complete_col); grab end
