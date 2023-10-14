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
