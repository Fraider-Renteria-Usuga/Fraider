function [] = Gauss_Seidel_Matricial(A,b,x,tol,niter)

    [f,c]=size(A);
    
    if f ~= c   %Condición para saber si la matriz es cuadrada
        xlswrite("Gauss_Seidel_Matricial.xlsx",{"ERROR", "La Matriz que ingreso no es cuadrada"});
        return
    end
    
    if length(b) ~= f   %Condición para saber si el tamaño del vector b coincide con el de la Matriz
        
        xlswrite("Gauss_Seidel_Matricial.xlsx",{"ERROR", "El tamaño del vector B no coincide con el tamaño de la matriz A"});
        return
    end
    
    if tol < 0 %Condición de que la toleracia no sea negativa
        xlswrite("Gauss_Seidel_Matricial.xlsx",{"ERROR, La tolerancia ingresada es negativa"});
        return
    end
    
    if niter < 0 %Condición de que el número de iteraciones no sea negativo
        xlswrite("Gauss_Seidel_Matricial.xlsx",{"ERROR,El número de iteraciones es negativa"});
        return
    end
    
    if niter < 0 %Condición de que el número de iteraciones no sea negativo
        xlswrite("Gauss_Seidel_Matricial.xlsx",{"ERROR,El numero de iteraciones es negativa"});
        return
    end
    
    if niter < 0 %Condición de que el número de iteraciones no sea negativo
        xlswrite("Gauss_Seidel_Matricial.xlsx",{"ERROR,El numero de iteraciones debe ser un numero entero"});
        return
    end
    
    L=zeros(f);
    U=zeros(f);
    r=diag(A);
    for i=1 : length(r)
        if r(i) == 0 %Condición de que en la diagonal no hayan zeros para que el procedimiento tenga exito
           xlswrite("Gauss_Seidel_Matricial.xlsx",{"ERROR","Hay zeros en la diagonal de la matriz A, esto no permite que el procedimiento tenga Exito"});
           return
        else
          D(i,i)=r(i);%Lleno la matriz D con los valores de la diagonal
        end
        for j=1 : f
            if j < i
                L(i,j)=-A(i,j);%Lleno la matriz L
            elseif j > i
                U(i,j)=-A(i,j);%Lleno la matriz U
            end
        end
     
    end
    T=inv(D-L)*U;
    C=inv(D-L)*b;
    err=1;
    cont=0;
    while err > tol & cont < niter
        xi=T*x+C;
        for i=1 : f  
            del(i)=abs(xi(i)-x(i));
        end
        err=max(del);
        cont=cont+1;
        x=xi;
  
    end
    xlswrite("Gauss_Seidel_Matricial",{"Vector Solucion"},"Gauss_Seidel","A1");
    xlswrite("Gauss_Seidel_Matricial",xi,"Gauss_Seidel","A2");
end

