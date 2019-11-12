import math
def B_inclemental(X0,Delta,Nmax):
  if Delta==0:
    print("No fue posible ejecutar el programa ya que el incremento debe ser diferente de 0")
  elif Nmax<=0:
    print("No fue posible ejecutar el programa ya que el numero maximo de iteraciones debe ser mayor a 0")
  elif Nmax%1 !=0:
    print("No fue posible ejecutar el programa ya que el numero maximo de iteracciones debe ser entero")
  else:
    Fx0=math.exp(X0)-6*(X0)
    if Fx0 == 0:
      print("el valor de x ingresado es una raiz")
    else:
      X1=X0+Delta
      contador=1
      Fx1=math.exp(X1)-6*(X1)
      while (Fx0*Fx1)>0 and contador< Nmax:
        X0=X1
        Fx0=Fx1
        X1=X0+Delta
        Fx1=math.exp(X1)-6*(X1)
        contador=contador+1
      if Fx1 ==0:
        print(str(x1)+"es raiz")
        print("La raiz se encontro en "+str(contador)+" iteraciones")
      else:
        if (Fx0*Fx1)<0:
          print("hay una raiz entre "+str(X0)+" y "+str(X1))
          print("La raiz se encontro en "+str(contador)+" iteraciones")
        else:
          print("No fue posible encontrar la raiz en el numero de iteraciones dado")

B_inclemental(0,1,0.2)



