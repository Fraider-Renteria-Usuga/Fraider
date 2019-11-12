%No siempre mayor grando brinda mejor aproximaciónError




% Función sym, para asignar una variable
%Funcion Expand, me expande las ecuaciones
%Función length, me calcula la longitud de un vector
%Función simplify
function [] = Lagrange(vectorPx,vectorPy)%Recibe un vector de la manera[x0;x1;...xn] para X y para Y; Retorna el vector L que contiene[L0,L1,...Ln] y tambien el polinomio correspondiente hallado.
    
    x=sym('x'); % Genero la variable x
    f=length(vectorPx);
    polinomio=0;
    for i=1 : f
        numerador=1;
        denomidador=1;
        for j=1 : f
            if j ~= i 
                numerador=numerador*(x-vectorPx(j)); % Calculo el numerador de Lx
                denomidador=denomidador*(vectorPx(i)-vectorPx(j)); % Calculo el denominador de Lx
            end
        end
        L(i)=(numerador/denomidador);%Obtengo el vector L, que contiene las funciones L0.....Ln;
        
        polinomio=polinomio+vectorPy(i)*L(i)
        polinomio=simplify(polinomio)
        xlswrite('Lagrange.xlsx',{'El polinomio esta dado por'},'Lagrange')
        xlswrite('Lagrange.xlsx',{polinomio},'Lagrange','A2')

    end   
    
end