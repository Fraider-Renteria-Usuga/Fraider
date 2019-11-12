import math
def Newton(X,Tolerancia,Nmax):
  if Tolerancia<=0:
    print("No fue posible ejecutar el programa ya que la Tolerancia debe ser mayor a 0")
  elif Nmax%1 != 0:
    print("No fue posible ejecutar el programa ya que el numero maximo de iteracciones debe ser entero")
  elif Nmax <=0:
    print("No fue posible ejecutar el programa ya que el numero maximo de iteracciones debe mayor a 0")
  else:
    Fx=math.exp(X)-6*(X)
    dfx=math.exp(X)-6
    Contador=0
    Error=Tolerancia+1
    while Error > Tolerancia and Fx != 0 and dfx != 0 and Contador < Nmax:
      X1=X-((Fx)/dfx)
      Fx=math.exp(X1)-6*(X1)
      dfx=math.exp(X1)-6
      Error=abs(X1-X)
      X=X1
      Contador=Contador+1
    if Fx ==0:
      print(str(X)+" es raiz")
      print("la raiz se encontro en "+str(Contador)+" iteraciones")
      print("Error: "+str(Error))
    elif Error < Tolerancia:
      print(str(X1)+" es una aproximacion a una raiz con una tolerancia de "+str(Tolerancia))
      print("la raiz se encontro en "+str(Contador)+" iteraciones")
      print("Error: "+str(Error))
    elif dfx==0:
      print(str(X1)+" es una posible raiz multiple")
    else:
      print("No fue posible encontrar una raiz en el numero de iteraciones dado")
Newton(1.83,1e-7,100)