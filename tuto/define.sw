def mega_move = move; move; move; move; move; move; move; move; move; move; move; move; move; move; move; move end
def go_up = turn north; move; move end
def go_down = turn south; move; move end
def first_path = turn east; mega_move; go_up; turn west; mega_move; go_up; turn east; mega_move; grab end
def second_path = turn west; mega_move; go_down; turn east; mega_move; go_down; turn west; mega_move; give base "flower" end
def prog = first_path; second_path end
