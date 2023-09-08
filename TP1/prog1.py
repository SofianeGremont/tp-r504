print("partie 1 :")
print("")
while True:
  try:
    nombre = int(input("Entrez un nombre : "))
    carre = nombre ** 2
    print(f"Le carré de {nombre} est : {carre}")
  except KeyboardInterrupt:
    break

print("")
print("")
print("partie 2")
print("")
while True:
  try:
    import fonctions as f
    try :
      a = int(input("Entrez un nombre : "))
    except ValueError :
      raise TypeError("Only integers are allowed")
    try :
      b= int(input("Entrez une puissance : "))
    except ValueError :
      raise TypeError("Only integers are allowed")
    res = f.puissance(a, b)
    print(f"Le nombre {a} élevé à la puissance {b} est égal à {res}")
  except KeyboardInterrupt:
    break
