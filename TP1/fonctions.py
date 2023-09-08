def puissance(a, b):
  if not type(a) is int:
    raise TypeError("Only integers are allowed")
  elif not type(b) is int:
    raise TypeError("Only integers are allowed")
  else:
    resultat = a ** b
    return resultat
