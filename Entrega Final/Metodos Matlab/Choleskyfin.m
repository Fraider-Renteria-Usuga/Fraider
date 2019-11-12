%Para correr la función la debo llamar desde el comando, ingresandole los
%valores de entrada.

%Si quiero obtener todos los valores que retorna la función se los debo
%especificar de la manera [X L U]=Cholesky(matrizA,vectorB)

function [] = Cholesky(matrizA,vectorB)%[Valor de salida]-(Valores de entrada)
    [f,c]=size(matrizA);
    L=zeros(f);
    U=zeros(f);
    
    for k=1:f
        for i=1:f
            suma0=0;
            suma1=0;
            for p=1:k-1
                suma0=suma0+L(i,p)*U(p,k);
                suma1=suma1+L(k,p)*U(p,k);
            end
            L(k,k)=sqrt(matrizA(k,k)-suma1);
            U(k,k)=L(k,k);
            if U(k,k)==0 | L(k,k)==0
                xlswrite('Cholasky',{"Error,se genero en error en la diagonal devido a un divisor = 0"})
                return
            else
            L(i,k)=(matrizA(i,k)-suma0)/U(k,k);
            end
        end
            
        for j=k+1:f
            suma3=0; 
            for p=1:k
                suma3=suma3+L(k,p)*U(p,j);
            end
            U(k,j)=(matrizA(k,j)-suma3)/L(k,k);
        end
  
    end   


    vectorZ=sustProgresiva(L,vectorB,f);%Hallo el vector z con la matriz L y el vector B mediante sustitución Progresiva
    vectorX=sustRegresiva(U,vectorZ,f);%Hallo el vector X con la matriz U y el vector Z mediante sustitución Progresiva
    xlswrite("Cholasky.xlsx",{'Vector solución'},'Doolitle')
    xlswrite("Cholasky.xlsx",vectorX,'Doolitle','A2')


end


