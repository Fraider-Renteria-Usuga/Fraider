%Condición, que todos los valores de x sean diferentes
%Polinomio de grado n-1, siendo n la cantidad de puntos ingresados
%Se obtendra un sistema con n+1 incognitas

%p(x) es un polinomio lineal, definido pj (x), sobre el intervalo [xj−1, xj ] para cada j = 1, . . . , n
%pj (xj−1) = f(xj−1) y pj (xj ) = f(xj ) para cada j = 1, . . . , n
%pj+1(xj ) = pj (xj ) para cada j = 1, . . . , n − 1

%Recordar los dedos de la mano, tengo 4 puntos pero tres funciones
%fun=(n-1)
%Tamaño de la matriz=fun*2

function [] = Trazadores_Lineales(puntosX,puntosY)%El programa me retorna el vector sol, que esta dado de la manera[a1 b1 a2 b2 ...... an bn]siendo n la cantidad de polinomios;Ademas retorna la matriz A, la cual es la base principal del metodo
    
    f=length(puntosX);   %Calculo la cantidad de puntos que ingreso el usuario 
    matrizA=zeros((f*2)-2); %Creo la matriz A inicialmente llena de zeros     
    
    matrizA(1,1)=puntosX(1);%Para facilidad del primer paso asigno esto en la primera parte de la matriz
    matrizA(1,2)=1;% Y tambien esto
    k=2;
    for j=1 : 2 : (f*2)-2 % En esta parte lleno la parte de la matriz correspondiente a la interpolación
        matrizA(k,j)=puntosX(k);
        matrizA(k,j+1)=1;%El valor de b siempre sera 1 en la matriz
        k=k+1;     
    end    
    r=1;   %Creo contadores que me ayudaran a recorrer la matriz de la manera en la que necesito
    t=2;
    for i=f+1 : 1 : (f*2)-2%En esta parte lleno la matriz con la parte correspondiente a la continuidad
        puntosY(i)=0;    
        for j=r : r+1         
            matrizA(i,j)=matrizA(t,j);%Se copia la parte superior de la matriz que queda igual
            matrizA(i,j+2)=-matrizA(i,j);%Con esto pongo sus negativos que 
        end
        r=r+2;
        t=t+1;  %Los contadores avanzan de la manera en que los necesito     
    end
    vectorSol=Luf_parcial(matrizA,puntosY)%Llamo a la fúncion LU Parcial para resolver la matriz obtenida
    xlswrite('Trazador_Lineal.xlsx',{'Coeficientes de los polinomios hallados'},'Trazador_Lineal')
    xlswrite('Trazador_Lineal.xlsx',vectorSol,'Trazador_Lineal','A2')
end