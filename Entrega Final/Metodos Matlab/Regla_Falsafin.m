%Ejemplo para correr el programa Regla_Falsafin(@(x) exp(x)-6*x,2,3,1*10^-7,100)

function [] = Regla_Falsafin(funcion,xa,xb,tol,niter) 
    
    if xa==xb
        xlswrite("Regla_Falsa.xlsx",{"Los números x1 y x2 deben ser diferentes"})
        return
    elseif tol <= 0
        xlswrite("Regla_Falsa.xlsx",{"La tolerancia de error debe ser mayor a 0"})
        return
    elseif mod(niter,1) ~= 0
        xlswrite("Regla_Falsa.xlsx",{"El número maximo de iteraciones debe ser un valor entero"})
        return
    elseif niter <= 0
        xlswrite("Regla_Falsa.xlsx",{"El número maximo de iteraciones debe ser mayor que zero"})
        return
    else       
        cont=0;
        err=tol+1;
        
        while err > tol & cont < niter
            fa=funcion(xa);
            fb=funcion(xb);
            xc=xa-((fa*(xb-xa))/(fb-fa))
            fc=funcion(xc);
  
            if fa*fc<0
                xb=xc;
            else
                xa=xc; 
            end
            xaux=xc;
            xc=(xa+xb)/2;
            err=abs(xc-xaux);
            cont=cont+1;
        end
        text='Aproximacion de x a la raiz con el error exigido '
        text1=[text num2str(xc) ' en la iteración ' num2str(cont)]
        xlswrite('Regla_Falsa',{text1})
        
    end  
end