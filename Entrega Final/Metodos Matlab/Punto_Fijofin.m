function [] = Punto_Fijofin(funcion,g,xa,tol,niter)
  
    if tol <= 0
        xlswrite("Punto_Fijo.xlsx",{"La tolerancia de error debe ser mayor a 0"})
        return
    elseif mod(niter,1) ~= 0
        xlswrite("Punto_Fijo.xlsx",{"El número maximo de iteraciones debe ser un valor entero"})
        return
    elseif niter <= 0
        xlswrite("Punto_Fijo.xlsx",{"El número maximo de iteraciones debe ser mayor que zero"})
        return
    else
        fx=funcion(xa)
        cont=0
        err=tol+1
        while fx ~= 0 & err > tol & cont < niter
            xn=g(xa)
            fx=funcion(xn)
            err=abs(xn-xa)
            xa=xn
            cont=cont+1
        end
        if fx == 0
            text='Hay una raiz en '
            text=[text num2str(xa)]
            xlswrite('Punto_Fijo.xlsx',{text})
            return
        elseif err < tol
            text=' es una aproximación a una tolerancia de '
            text=[num2str(xa) text num2str(err)]
            xlswrite('Punto_Fijo.xlsx',{text})
            return
        else
            xlswrite('Punto_Fijo.xlsx',{'El metodo alcanzo su maximo número de iteraciones'})
            return
        end
    end
end

