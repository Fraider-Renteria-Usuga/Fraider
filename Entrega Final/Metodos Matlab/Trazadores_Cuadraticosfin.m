function [] = Trazadores_Cuadraticos(x,puntosY)%El programa me retorna el vector sol, que esta dado de la manera[a1 b1 a2 b2 ...... an bn]siendo n la cantidad de polinomios;Ademas retorna la matriz A, la cual es la base principal del metodo
    
    f=length(x);   %Calculo la cantidad de puntos que ingreso el usuario 
    matrizA=zeros((f*3)-3); %Creo la matriz A inicialmente llena de zeros     
    
    matrizA(1,1)=x(1)^2;%Para facilidad del primer paso asigno esto en la primera parte de la matriz
    matrizA(1,2)=x(1);
    matrizA(1,3)=1;
     
    k=2;
    for j=1 : 3 : (f*3)-3 % En esta parte lleno la parte de la matriz correspondiente a la interpolación
        matrizA(k,j)=x(k)^2;
        matrizA(k,j+1)=x(k);%El valor de b siempre sera 1 en la matriz
        matrizA(k,j+2)=1;
        k=k+1;     
    end
    
    r=1;   %Creo contadores que me ayudaran a recorrer la matriz de la manera en la que necesito
    t=2;
    for i=f+1 : 1 : (f*3)-(f+2)%En esta parte lleno la matriz con la parte correspondiente a la continuidad
         
        for j=r : r+2       
            matrizA(i,j)=matrizA(t,j);%Se copia la parte superior de la matriz que queda igual
            matrizA(i,j+3)=-matrizA(i,j);%Con esto pongo sus negativos que         
        end
        r=r+3;
        t=t+1;
    u=2;%Creo contadores que me ayudaran a llenar la matriz en la zona correspondiente a la suavidad   
    s=1; 
    m=2;
    end
    for i=((f*3)-(f+1)) : (f*3)-4 %Empiezo la suavidad
        
        for j=s : s     
            matrizA(i,j)=x(u)*2;
            matrizA(i,j+1)=1;
            matrizA(i,j+2)=0;
            
            matrizA(i,j+3)=-matrizA(i,j);
            matrizA(i,j+4)=-matrizA(i,j+1);
            matrizA(i,j+5)=-matrizA(i,j+2);          
        end
        u=u+1;
        s=s+3;
        m=m+1;      
    end
    matrizA(((f*3)-3),1)=2;%Queda faltando un fila, en la cual le asigno 2 a a1
    puntosY(((f*3)-3))=0; %Lleno el vector de puntos Y para que quede del mismo tamaño que la matriz y poderle aplicar el metodo de Lu parcial
    
    vectotSol=Luf_parcial(matrizA,puntosY);%Llamo la función Lu y la aplico
    xlswrite('Trazador_Cuadratico.xlsx',{'Coeficientes de los polinomios hallados'},'Trazador_Cuadratico')
    xlswrite('Trazador_Cuadratico.xlsx',vectorSol,'Trazador_Cuadratico','A2')
    
        
end