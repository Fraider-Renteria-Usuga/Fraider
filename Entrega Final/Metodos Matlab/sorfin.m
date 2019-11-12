%Para correr el programa se debe llamar en la tabla de comandos, de la
%manera Gauss_Seidel(matrizA,vector_b,vectorX0,tolerancia,iteraciones),
%habiendo asignado con anterioridad todas las variables y poniendolas en el
%orden correcto


function [vectorXsol] = sor(matrizA,vector_b,vectorX0,tolerancia,iteraciones,w)
    format long
    [f,c]=size(matrizA);
    cont=0;
    error=1;
    z=zeros(0);
    while error > tolerancia & cont < iteraciones
        vectorAux=vectorX0; %Guardo los valores con los que inicie la etapa
        for i=1 : f
            
            suma=0;
            vectorPro=vectorX0; %El vector Pro me ayuda en el despeje, para evitar Xp=X1+X2..+(Xp).
            vectorPro(i)=0; %Porque si estoy despejando a X1, no lo puedo usar al otro lado del igual.
            
            for j=1 : f   
                cont=cont+1;
                suma=suma+vectorPro(j)*matrizA(i,j); %Sumatoria de valores que van a pasar al otro lado al despejar
            end
     
            vectorXsol(i)=(vector_b(i)-suma)/matrizA(i,i);
            vectorX0(i)=vectorXsol(i);
        end
  
        del=abs(vectorXsol-vectorAux); %del es un vector con todos los errores
        error=max(del); %Obtengo el mayor error que haya en del
        vectorX0=vectorXsol; %El vector X0 toma el valor actual y se vuelve a iniciar el proceso de ser necesario
        vectorAux=vectorXsol; %El vectorAux que ayuda en el proceso 
        z=[z;vectorAux];
        
    end
    [n,m]=size(z);
    sln=zeros(1,m);
    valw=w;
    for i=n:n
        for j=1:m
        sln(1,j)=(valw*z(i,j)+(1-valw)*z(i-1,j));
        end
    end
    xlswrite("sor.xlsx","W=","Hoja1","A1");
    xlswrite("sor.xlsx",w,"Hoja1","B1");
    xlswrite("sor.xlsx","X=","Hoja1","A3");
    xlswrite("sor.xlsx",sln,"Hoja1","C3");
end