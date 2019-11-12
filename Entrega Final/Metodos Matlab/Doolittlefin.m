%Para correr la función la debo llamar desde el comando, ingresandole los
%valores de entrada.

function [] = Dootittle(A,vectorB)%[Valor de salida]-(Valores de entrada)
    [f,c]=size(A);
    
    L=eye(f); % En Dootittle L tiene su diagonal llena de 1, por eso uso la función eye
    U=zeros(f);  % Creo la Matriz U llena de zeros
    
    
    for k=1 : f       
        suma=0;
        for p=1 : k-1;
            suma=suma+L(k,p)*U(p,k);
        end
        U(k,k)=A(k,k)-suma;
        if U(k,k)==0
            xlswrite("Doolitle.xlsx",{"Error,se genero en error en la diagonal devido a un divisor = 0"})%Condición para evitar errores en el procedimiento
            return
        else
            for i=k+1 : f
                suma1=0;
                
                for p=1 : k-1
                    suma1=suma1+L(i,p)*U(p,k);
                end
                
                L(i,k)=(A(i,k)-suma1)/U(k,k);          
            end
            for j=k+1 : f
                suma2=0;
                for p=1 : k-1
                    suma2=suma2+L(k,p)*U(p,j);              
                end
                U(k,j)=(A(k,j)-suma2);
            end
        
    vectorZ=sustProgresiva(L,vectorB,f);%Hallo el vector z con la matriz L y el vector B mediante sustitución Progresiva
    vectorX=sustRegresiva(U,vectorZ,f);%Hallo el vector X con la matriz U y el vector Z mediante sustitución Progresiva
    xlswrite("Doolitle.xlsx",{'Vector solución'},'Doolitle')
    xlswrite("Doolitle.xlsx",vectorX,'Doolitle','A2')
        end
    end
end
