function [] = Newtonfin(funcion,x0,tol,niter)
    
    if tol <= 0
        xlswrite("Newton.xlsx",{"La tolerancia de error debe ser mayor a 0"});
        return
    elseif mod(niter,1) ~= 0;
        xlswrite("Newton.xlsx",{"El número maximo de iteraciones debe ser un valor entero"});
        return
    elseif niter <= 0
        xlswrite("Newton.xlsx",{"El número maximo de iteraciones debe ser mayor que zero"});
        return
    else
        syms x
        fx=funcion(x0);
        fp=diff(funcion(x)); 
        dfx=subs(fp,x,x0);
        cont=0;
        err=tol+1;
        while err > tol & fx ~= 0 & dfx ~= 0 & cont < niter;
            x1=x0-(fx/dfx);
            fx=funcion(x1);
            dfx=subs(fp,x,x1);
            err=abs(x1-x0);
            x0=x1;
            cont=cont+1;
        end
        if fx == 0
            text='Hay una raiz en ';
            text=[text x0];
            xlswrite('Newton.xlsx',{text});
            return
        elseif err < tol
            text1='Hay una raiz en ';
            text1=[text1 str2num(x1) ' con una tolerancia ' str2num(err)];
            xlswrite('Newton.xlsx',{text1});
            return
        elseif dfx == 0
            text='Hay una posible raiz en ';
            text=[text (x1)];
            xlswrite('Newton.xlsx',{text});
            return
        else
            
            xlswrite('Newton.xlsx',{'Alcanzo el número maximo de iteraciones'});
            return
        end
    end

end