function [] = Vandermonde(vectorx,y) %Ingrese los vectores X y Y, separando los valores por;
    
    if length(vectorx) ~= length(y)
        xlswrite("Vandermonde.xlsx",{"ERROR","La cantidad de punto ingresados en el vector x no son equivalentes a la cantidad de n�meros ingresados en el vector y"},"Vandermonde");
        return
    end
    
    for i=1 : length(vectorx)-1
        for j=i+1 :  length(vectorx)
            if vectorx(i)==vectorx(j)
                xlswrite("Vandermonde.xlsx",{"ERROR Debe ingresar valores de x diferentes"})
                return
            end
        end
    end
                
    f=length(vectorx);%Leo el tamaño de la matriz para hazi saber el tamaño de los ciclos que debo formar
    
    for i=1 : f %Para recorrer y llenar las filas de la matriz A
        for j=1 :f;%Para recorrer las columnas y llenar las filas de la matriz A
           matrizA(i,j)=vectorx(i)^(f-j); %La base corresponde al vector X, y con (f-j) obtengo la potencia, esta disminuye en cada paso y regresa a su valor inicial cual baja a la siguiente fila
        end
    end
    
    
    vectorXsol=Cholesky(matrizA,y);% Teniendo la matriz A y el Vector B, solo resta resolver la matriz
    A='A';
    pos=[A num2str(f+4)];
    pos1=[A num2str(f+5)];
    
    
    
    xlswrite("Vandermonde.xlsx",{'Matriz de Vandermonde'},"Vandermonde");
    xlswrite("Vandermonde.xlsx",matrizA,"Vandermonde",'A2';
    xlswrite("Vandermonde.xlsx",{"Coeficientes del Polinomio"},"Vandermonde",pos);
    xlswrite("Vandermonde.xlsx",vectorXsol,"Vandermonde",pos1);
   
end