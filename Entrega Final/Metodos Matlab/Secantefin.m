function [] = Secante(funcion,xa,xb,tol,niter)
    if xa==xb
        xlswrite("Secante.xlsx",{"Los números x1 y x2 deben ser diferentes"})
        return
    elseif tol <= 0
        xlswrite("Secante.xlsx",{"La tolerancia de error debe ser mayor a 0"})
        return
    elseif mod(niter,1) ~= 0
        xlswrite("Secante.xlsx",{"El número maximo de iteraciones debe ser un valor entero"})
        return
    elseif niter <= 0
        xlswrite("Secante.xlsx",{"El número maximo de iteraciones debe ser mayor que zero"});
        return
    else
        err= tol+1;
        cont=0;
        
        while err>tol & cont<iter
            
            funa=funcion(xa);
            funb=funcion(xb);
           
            xi=xa-((funa*(xa-xb))/(funa-funb)) ;
            
            err=abs(xi-xa);
            xb=xa;
            xa=xi;
            cont=cont+1;
        end
        xlswrite("Secante.xlsx",{'Raiz cuando x es'},'Secante')
        xlswrite("Secante.xlsx",{xi},'Secante','A2')
        return
    end   

end