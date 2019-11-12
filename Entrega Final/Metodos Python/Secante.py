import math
def secante(X0,X1,Tolerancia,Nmax):
  if X0==X1:
    print("No fue posible ejecutar el programa ya que el valor de X0 debe ser diferente a X1")
  elif Tolerancia<=0:
    print("No fue posible ejecutar el programa ya que la Tolerancia debe ser mayor a 0")
  elif Nmax%1 != 0:
    print("No fue posible ejecutar el programa ya que el numero maximo de iteracciones debe ser entero")
  elif Nmax <=0:
    print("No fue posible ejecutar el programa ya que el numero maximo de iteracciones debe mayor a 0")
  else:
    Fx0=math.exp(X0)-6*(X0)
    if Fx0 ==0:
      print(str(X0)+" es una raiz")
    else:
      Fx1=math.exp(X1)-6*(X1)
      Contador=0
      Error=Tolerancia+1
      den=Fx1-Fx0
    while Error > Tolerancia and Fx1 != 0 and den != 0 and Contador< Nmax:
      X2=X1-(Fx1*((X1-X0)/den))
      Error=abs(X2-X1)
      X0=X1
      Fx0=Fx1
      X1=X2
      Fx1=math.exp(X1)-6*(X1)
      den=Fx1-Fx0
      Contador=Contador+1
    if Fx1 ==0:
      print(str(X)+" es raiz")
      print("la raiz se encontro en "+str(Contador)+" iteraciones")
      print("Error: "+str(Error))
    elif Error < Tolerancia:
      print(str(X1)+" es una aproximacion a una raiz con una tolerancia de "+str(Tolerancia))
      print("la raiz se encontro en "+str(Contador)+" iteraciones")
      print("Error: "+str(Error))
    elif den==0:
      print(str(X1)+" es una posible raiz multiple")
    else:
      print("No fue posible encontrat una raiz en el numero de iteraciones dado")
secante(0,1,1e-7,100)