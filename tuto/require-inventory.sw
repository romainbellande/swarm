def require_rocks = require 16 "rock" end
def move_and_place_rock = place "rock"; move end
def loop_3 = \v. v; v; v end
def fill_row = loop_3(move_and_place_rock) end
def sub_prog = \direction. turn direction; fill_row; place "rock"; turn south; move end
def init_position = turn south; move; turn east; move end

def prog = require_rocks; init_position; sub_prog(east); sub_prog(west); sub_prog(east); turn west; fill_row; place "rock" end
