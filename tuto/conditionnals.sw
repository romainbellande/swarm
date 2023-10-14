def loop_2 = \v. v; v; end
def loop_3 = \v. v; v; v; end
def loop_4 = \v. v; v; v; v end

def vsr = "very small rock" end
def cond_grab = t <- ishere vsr; if t { grab; return () } {} end
def move_grab = cond_grab; move end;

def right_row = turn east; loop_3(move_grab); turn south; move_grab end;
def left_row = turn west; loop_3(move_grab); turn south; move_grab end;

def move_to_beggining = turn south; move; turn left; move end
def grab_arr = right_row; left_row; right_row; turn west; loop_3(move_grab); cond_grab end;
def return_base = move; turn north; loop_4(move); loop_4(give base vsr) end

def prog = move_to_beggining; grab_arr; return_base end
