function [] = Biseccionfin(funcion,xa,xb,tol,niter)
    if xa==xb
        xlswrite("Bisección.xlsx",{"Los números x1 y x2 deben ser diferentes"});
        return
    elseif tol <= 0
        xlswrite("Bisección.xlsx",{"La tolerancia de error debe ser mayor a 0"});
        return
    elseif niter <= 0
        xlswrite("Bisección.xlsx",{"El número maximo de iteraciones debe ser mayor que zero"});
        return
    elseif mod(niter,1) ~= 0
        xlswrite("Busqueda_Incremental.xlxs",{"El numero maximo de iteraciones debe ser entero"});
        return
    else
        fa=funcion(xa); %Evalulo la función en los dos valores iniciales para comprobar si hay una raiz 
        fb=funcion(xb);
        if fa == 0
            xlswrite('Biseccion.xlsx',{'Hay una raiz en Xa'});
            return
        elseif fb == 0
            xlswrite('Biseccion.xlsx',{'Hay una raiz en Xb'});
            return
        elseif fa*fb < 0
            xm=(xa+xb)/2;
            fm=funcion(xm);
            cont=1;
            err=tol+1;
            while err > tol & fm ~=0 & cont < niter
                if fa*fm < 0
                    xb=xm;
                    fb=fm;
                else
                    xa=xm;
                    fa=fm;         
                end
                xaux=xm;
                xm=(xa+xb)/2;
                fm=funcion(xm);
                err=abs(xm-xaux);
                cont=cont+1;  
            end
            if fm==0
                text='Hay una raiz en ';
                xlswrite('Biseccion.xlsx',{[text num2str(xm)]});
                return
            elseif err < tol
                text='Hay una raiz en ';
                xlswrite('Biseccion.xlsx',{[text num2str(xm)]},'Biseccion');
                text1='Con error de ';
                xlswrite('Biseccion.xlsx',{[text1 num2str(err)]},'Biseccion','A2');
                return
            else
                xlswrite('Biseccion.xlsx',{'Se alcanzo el numero maximo de iteracciones'});
                return
            end
        else
            xlswrite('Biseccion.xlsx',{'El intervalo ingresado no es un intervalo adecuado'});
            return     
        end
    end
end
