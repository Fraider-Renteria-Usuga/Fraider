import math
def Punto_fijo(X,Tolerancia,Nmax):
  if Tolerancia<=0:
    print("No fue posible ejecutar el programa ya que la Tolerancia debe ser mayor a 0")
  elif Nmax%1 != 0:
    print("No fue posible ejecutar el programa ya que el numero maximo de iteracciones debe ser entero")
  elif Nmax <=0:
    print("No fue posible ejecutar el programa ya que el numero maximo de iteracciones debe mayor a 0")
  else:
    Fx=math.exp(X)-6*(X)
    Contador=0
    Error=Tolerancia+1
    while Fx != 0 and Error > Tolerancia and Contador < Nmax:
      Xn=(math.exp(X)/6)
      Fx=math.exp(Xn)-6*(Xn)
      Error=abs(Xn-X)
      X=Xn
      Contador=Contador+1
    if Fx==0:
      print(str(x)+" es raiz")
      print("la raiz se encontro en "+str(Contador)+" iteraciones")
      print("Error: "+str(Error))
    elif Error<Tolerancia:
      print(str(X)+" es una aproximacion con una tolerancia "+str(Tolerancia))
      print("la raiz se encontro en "+str(Contador)+" iteraciones")
      print("Error: "+str(Error))
    else:
      print("la raiz no pudo encontrarse en el numero de iteraciones dado")
Punto_fijo(3,1e-7,100)