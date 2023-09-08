def puissance(a, b):
  if not type(a) is int:
    raise TypeError("Only integers are allowed")
  elif not type(b) is int:
    raise TypeError("Only integers are allowed")
  else:
    if a < 0:
      resultat = -1
    resultat = 1
    for _ in range(b):
      resultat *= a
    if a < 0 and b == 0:
      resultat = -1
    if a == 0 and b == 0:
      raise ValueError("Impossible")
    if b < 0:
      raise ValueError("L'exposant doit être positif ou nul.")
    return resultat
