import pytest
import fonctions as f

def test_1 ():
  assert f.puissance(2, 3) == 8
  assert f.puissance(2, 2) == 4

def test_2 ():
  assert f.puissance(-2, 3) == -8
  assert f.puissance(-5, 5) == -3125

test_1 ()
test_2 ()
