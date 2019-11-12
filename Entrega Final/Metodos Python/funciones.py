import numpy as np
from math import exp
def llenarMyb(n):
    matriz=np.zeros((n,n))
    vectorSol=np.zeros(n)
    print("Introduce los coeficientes de la matriz ")
    for i in range(0,n):
      for j in range(0,n):
        matriz[i][j]=input("Elemento a["+str(i+1)+","+str(j+1)+"] = ")
      vectorSol[(i)]=input("b["+str(i+1)+"] = ")
    return(matriz,vectorSol)
def llenarMatriz_nxn(n):
    matriz=np.zeros((n,n))
    print("Introduce los coeficientes de la matriz ")
    for i in range(0,n):
      for j in range(0,n):
        matriz[i][j]=input("Elemento a["+str(i+1)+","+str(j+1)+"] = ")
    return(matriz)
def sustRegre(matriz,vectorSol):
    n=len(matriz)
    sln=np.zeros(n)
    if matriz[n-1][n-1]!=0:
        sln[n-1]=vectorSol[n-1]/matriz[n-1][n-1]
    for i in range(n-2,-1,-1):
        cont=0
        for j in range(n):
            cont =cont+matriz[i][j]*sln[j]
        if matriz[i][i]!=0:
            sln[i]=(vectorSol[i]-cont) / matriz[i][i]
    return (sln)
def sustProgre(matriz,vectorSol):
    n=len(matriz)
    sln=np.zeros(n)
    sln[0]=vectorSol[0]/matriz[0][0]
    for i in range(1,n):
        cont=0
        for j in range(i):
            cont+=matriz[i][j]*sln[j]
        sln[i]=((vectorSol[i]-cont)/(matriz[i][i]))
    return(sln)
def f(x): #Escribir la funcion que necesite y luego solo la llama
    y=(3*x)+6
    #y=exp(x)-6*x
    return(y)
def PivParcial(matriz,vectorSol):
  n=len(matriz)
  for i in range(n):
    if matriz[i][i]==0:#Si hay un cero en la diagonal
      for p in range(i+1,n):
        if matriz[p][i]!=0:
          matriz[[p,i]]=matriz[[i,p]]
          vectorSol[p],vectorSol[i]=vectorSol[i],vectorSol[p]
          break
    lis=[]
    for h in range(i,n):
      lis.append(abs(matriz[h][i]))
    for maxicol in range(i,n):
      if abs(matriz[maxicol][i])==(max(lis)):
        matriz[[i,maxicol]]=matriz[[maxicol,i]]
        vectorSol[maxicol],vectorSol[i]=vectorSol[i],vectorSol[maxicol]
    for j in range(i+1,n):
      mult=(matriz[j][i])/(matriz[i][i])
      vectorSol[j]=vectorSol[j]-(mult*vectorSol[i])
      for k in range(0,n):
        matriz[j][k]=matriz[j][k]-(mult*matriz[i][k])
  return(matriz,vectorSol)
def PivTotal(matriz,vectorSol):
  n=len(matriz)
  for i in range(n):
    if matriz[i][i]==0:#Si hay un cero en la diagonal
      for p in range(i+1,n):
        if matriz[p][i]!=0:
          matriz[[p,i]]=matriz[[i,p]]
          vectorSol[p],vectorSol[i]=vectorSol[i],vectorSol[p]
          break
    lis=[]
    for h in range(i,n):
      for t in range(i,n):
        lis.append(matriz[h][t])
    for j in range(i,n):
      for s in range(i,n):
        if matriz[j][s]==(max(lis)):
          matriz[[i,j]]=matriz[[j,i]]
          vectorSol[j],vectorSol[i]=vectorSol[i],vectorSol[j]
          for r in range(i,n):
            matriz[r][i],matriz[r][s]=matriz[r][s],matriz[r][i]
    for j in range(i+1,n):
      mult=(matriz[j][i])/(matriz[i][i])
      vectorSol[j]=vectorSol[j]-(mult*vectorSol[i])
      for k in range(0,n):
        matriz[j][k]=matriz[j][k]-(mult*matriz[i][k])
  return(matriz,vectorSol)
def GauSimple(matriz,vectorSol):
  n=len(matriz)
  for i in range(n):
    if matriz[i][i]==0:
      for p in range(i+1,n):
        if matriz[p][i]!=0:
          matriz[[p,i]]=matriz[[i,p]]
          vectorSol[p],vectorSol[i]=vectorSol[i],vectorSol[p]
          break
    for j in range(i+1,n):
      mult=(matriz[j][i])/(matriz[i][i])
      vectorSol[j]=vectorSol[j]-(mult*vectorSol[i])
      for k in range(0,n):
        matriz[j][k]=matriz[j][k]-(mult*matriz[i][k])
  return(matriz,vectorSol)
