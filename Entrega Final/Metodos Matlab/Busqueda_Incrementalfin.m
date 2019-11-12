%Busqueda_Incrementalfin(@(x) exp(x)-6*x,2,0.1,100)
%Recibe una funci�n en terminos de la variable x, consultar el lenguaje
%matematico de MATLAB para recurrir a constantes tales como euler o pi

%El valor h que es el deltaX, no puede ser 0

%niter es el n�mero maximo de iteraciones, este no debe ser negativo ni 0,
%y debe ser un n�mero entero

%Recuerde poner @(x) antes de empezar a escribir la función y usar la variable x


function [] = Busqueda_Incrementalfin(funcion,x0,h,niter)%Ingrese esta función Ej  (@(x) exp(x)-6*x)
    
    if h == 0
        xlswrite("Busqueda_Incremental.xlxs",{"El valor h debe ser mayor diferente de 0"})
        return
    
    elseif niter == 0 
        xlswrite("Busqueda_Incremental.xlxs",{"El n�mero maximo de iteraciones no puede ser 0"})
        return
       
    elseif mod(niter,1) ~= 0
        xlswrite("Busqueda_Incremental.xlxs",{"El n�mero maximo de iteraciones debe ser entero"})
        return
        
    else  
        fun=funcion(x0);
        
        if fun==0 %Compruebo que el valor inicial no sea una raiz
            xlswrite("Busqueda_Incremental.xlxs",{"Hay una raiz en X0"})
            return
        else %Genero el segundo valor con el que empezara la comparaci�n
            x1=x0+h;
            cont=1;
            fun1=funcion(x0);         
            while fun*fun1 > 0 & cont < niter % Ciclo para comprobar, que cuando haya cambio de signo el c�digo se detendra o lo hara cuando s�pere las iteracciones fijadas
                x0=x1;
                fun=fun1;
                x1=x0+h;
                fun1=funcion(x1);
                cont=cont+1;
            end
            
            if fun1==0
                text="Hay una raiz en" 
                xlswrite("Busqueda_Incremental.xlxs",{[text num2str(x1)]});
                return
                
            elseif fun*fun1 < 0
                text='Hay una raiz entre '
                text1=[text num2str(x0) ' y ' num2str(x1) ]
                xlswrite('Busqueda_Incremental.xlsx',{text1})
                return                  
            else
                xlswrite("Busqueda_Incremental.xlxs",{"Logro el num max de iteracciones"});
                return         
            end
        end
    end
end