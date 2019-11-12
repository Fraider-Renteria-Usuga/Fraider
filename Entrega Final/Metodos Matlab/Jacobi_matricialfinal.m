function [] = Jacobi_matricial(matrizA,vectorB,x,tol,niter)
    [f,c]=size(matrizA);
    
    if f ~= c   %Condici贸n para saber si la matriz es cuadrada
        xlswrite("Jacobi_Matricial.xlsx",{"ERROR", "La Matriz que ingreso no es cuadrada"});
        return
    end
    
    if length(vectorB) ~= f   %Condici贸n para saber si el tama帽o del vector b coincide con el de la Matriz
        xlswrite("Jacobi_Matricial.xlsx",{"ERROR", "El tama駉 del vector B no coincide con el tama駉 de la matriz A"});
        return
    end
    
    if tol < 0 %Condici贸n de que la toleracia no sea negativa
        xlswrite("Jacobi_Matricial.xlsx",{"ERROR", "La tolerancia ingresada es negativa"});
        return
    end
    
    if niter < 0 %Condici贸n de que el n煤mero de iteraciones no sea negativo
        xlswrite("Jacobi_Matricial.xlsx",{"ERROR","El n鷐ero de iteraciones es negativa"});
        return
    end
    
    if mod(niter,1) ~= 0 %Condici贸n de que el n煤mero de iteraciones no sea negativo
        xlswrite("Jacobi_Matricial.xlsx",{"ERROR","El n鷐ero de iteraciones debe ser un n鷐ero entero"});
        return
    end
    L=zeros(f);
    U=zeros(f);
    r=diag(matrizA);
    for i=1 : length(r)
        if r(i) == 0 %Condici贸n de que en la diagonal no hayan zeros para que el procedimiento tenga exito
           xlswrite("Jacobi_Matricial.xlsx",{"ERROR","Hay zeros en la diagonal de la matriz A, esto no permite que el procedimiento tenga Exito"});
           return
        else
          D(i,i)=r(i);%Lleno la matriz D con los valores de la diagonal
          Dinv(i,i)=1/r(i);%Lleno la matriz D inversa
        end
        for j=1 : f
            if j < i
                L(i,j)=-matrizA(i,j);%Lleno la matriz L
            elseif j > i
                U(i,j)=-matrizA(i,j);%Lleno la matriz U
            end
        end
     
    end
    T=Dinv*(L+U);
    C=Dinv*vectorB;
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
    xlswrite("Jacobi_Matricial",{"Vector Solucion"},"Jacobi","A1");
    xlswrite("Jacobi_Matricial",xi,"Jacobi","A2");
    
end

