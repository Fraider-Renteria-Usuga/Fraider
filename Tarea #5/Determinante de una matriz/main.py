import numpy
m,n=(int(input("Núm Filas "))),(int(input("Núm columnas ")))
def llenarmatriz(m,n): # llenar la matriz con los coeficientes
  matriz=numpy.zeros((m,n))
  print("Introduce los coeficientes de la matriz ")
  for i in range(0,m):
    for j in range(0,n):
      matriz[i][j]=input("Elemento a["+str(i+1)+","+str(j+1)+"] = ")
  return(matriz)
def solMet(matriz,m,n): # Eliminacion Gaussiana  
  for i in range(0,m):
    for j in range(i+1,m):
      mult=(matriz[j][i])/(matriz[i][i])
      for k in range(0,n):
        matriz[j][k]=matriz[j][k]-(mult*matriz[i][k])
  return(matriz)
matriz=(llenarmatriz(m,n))
matrizReduci=(solMet(matriz,m,n))
det=1
for i in range(n): # Hallar el determinante
  det*=matrizReduci[i][i]
print(det)