import math
def R_falsa(X1,X2,Tolerancia,Nmax):
  if X1==X2:
    print("No fue posible ejecutar el programa ya que el valor de X1 debe ser diferente a X2")
  elif Tolerancia<=0:
    print("No fue posible ejecutar el programa ya que la Tolerancia debe ser mayor a 0")
  elif Nmax%1 != 0:
    print("No fue posible ejecutar el programa ya que el numero maximo de iteracciones debe ser entero")
  elif Nmax <=0:
    print("No fue posible ejecutar el programa ya que el numero maximo de iteracciones debe mayor a 0")
  else:
    Fx1=math.exp(X1)-6*(X1)
    Fx2=math.exp(X2)-6*(X2)
    if Fx1==0:
      print(str(x1)+" es raiz")
    elif Fx2==0:
        print(str(x2)+" es raiz")
    elif (Fx1*Fx2)<0:
      Xm=X1-((Fx1*(X2-X1))/(Fx2-Fx1))
      Fxm=math.exp(Xm)-6*(Xm)
      Contador=1
      Error=Tolerancia+1
      while Error > Tolerancia and Fxm != 0 and Contador < Nmax:
        if (Fx1*Fxm) < 0:
          X2=Xm
          Fx2=Fxm
        else:
          X1=Xm
          Fx1=Fxm
        Xaux=Xm
        Xm=(X1+X2)/2
        Fxm=math.exp(Xm)-6*(Xm)
        Error=abs(Xm-Xaux)
        Contador=Contador+1
        
      if Fxm==0:
        print("la raiz es: "+str(Xm))
        print("la raiz se encontro en "+str(Contador)+" iteraciones")
        print(Error)
      elif Error< Tolerancia:
        print(str(Xm)+"es una aproximacion a una raiz con una tolerancia de "+str(Tolerancia))
        print("la raiz se encontro en "+str(Contador)+" iteraciones")
        print("Error: "+str(Error))
      else:
        print("No fue posible encontrar la raiz en el numero de iteraciones dado")
    else:
      print("el intervalo es inadecuado")
R_falsa(2.8,3,1e-7,100)