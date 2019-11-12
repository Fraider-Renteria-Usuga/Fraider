function [] = Trazadores_Cubicos(puntosX,puntosY)%El programa me retorna el vector sol, que esta dado de la manera[a1 b1 a2 b2 ...... an bn]siendo n la cantidad de polinomios;Ademas retorna la matriz A, la cual es la base principal del metodo
    
    f=length(puntosX);   %Calculo la cantidad de puntos que ingreso el usuario 
    matrizA=zeros((f*4)-4); %Creo la matriz A inicialmente llena de zeros 
    
    for i=4 : -1 : 1
        matrizA(1,(5-i))=puntosX(1)^(i-1);%Lleno la primera fila de la matriz
    end
    
    k=2;
    for j=1 : 4 : (f*4)-4 % En esta parte lleno la parte de la matriz correspondiente a la interpolación
        
        h=3;
        for i=0 : 3    
            matrizA(k,j+i)=puntosX(k)^h;       
            h=h-1;
        end
        k=k+1;
    end
    b=0;
    r=1;   %Creo contadores que me ayudaran a recorrer la matriz de la manera en la que necesito
    t=2;
    for i=f+1 : 1 :((f*3)-(f+2))%En esta parte lleno la matriz con la parte correspondiente a la continuidad
        
        for j=r : r+3       
            matrizA(i,j)=matrizA(t,j);%Se copia la parte superior de la matriz que queda igual
            matrizA(i,j+4)=-matrizA(i,j)%Con esto pongo sus negativos que 
            
        end
        r=r+4;
        t=t+1;
        b=b+1;
    end
    
    u=2;%Creo contadores que me ayudaran a llenar la matriz en la zona correspondiente a la suavidad   
    s=1; 
    
    for i=((f*3)-(f+1)) :((f*3)-(f+2))+b  %Empiezo la suavidad      
        for j=s : s     
            matrizA(i,j)=puntosX(u)^2*3;
            matrizA(i,j+1)=puntosX(u)*2;
            matrizA(i,j+2)=1;
            matrizA(i,j+3)=0;
            
            matrizA(i,j+4)=-matrizA(i,j);
            matrizA(i,j+5)=-matrizA(i,j+1);
            matrizA(i,j+6)=-matrizA(i,j+2); 
            matrizA(i,j+7)=-matrizA(i,j+3);
        end
        u=u+1
        s=s+4; 
    end
    
    w=1;
    z=2;
    for i=((f*3)-(f+1))+b :((f*3)-(f+2))+b*2  %Empiezo la suavidad      
        for j=w : w     
            matrizA(i,j)=puntosX(z)*6;
            matrizA(i,j+1)=2;
            matrizA(i,j+2)=0;
            matrizA(i,j+3)=0;
            
            matrizA(i,j+4)=-matrizA(i,j);
            matrizA(i,j+5)=-matrizA(i,j+1);
            matrizA(i,j+6)=-matrizA(i,j+2); 
            matrizA(i,j+7)=-matrizA(i,j+3);
        end
        z=z+1;
        w=w+4; 
    end
    
        
    matrizA(((f*4)-4)-1,1)=puntosX(2)*6; %Agrego dos filas mas probando la primera derivada en el primer y ultimo punto
    matrizA((((f*4)-4)-1),2)=2;
    
    matrizA(((f*4)-4),(((f*4)-4)-4))=puntosX(f)*6;
    matrizA(((f*4)-4),(((f*4)-4)-3))=2;
            
    puntosY(((f*4)-4),1)=0;
    vectorSol=Luf_parcial(matrizA,puntosY);
    xlswrite('Trazador_Cubico.xlsx',{'Coeficientes de los polinomios hallados'},'Trazador_Cubico')
    xlswrite('Trazador_Cubico.xlsx',vectorSol,'Trazador_Cubico','A2')
    
end  
   
    

