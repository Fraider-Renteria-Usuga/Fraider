format long
A=input("ingrese la matriz A: ");
T=transpose(A);
n=length(A);
for i=1:n
    B=(A([1:i],[1:i]))
    if (det(B)>0)
    else
        disp("el determinante es <= 0 ")
        break
        for j=1:n
            Z=A(j,j)
            if Z>0
            else
                disp("hay valores <=0 en la diagonal principal")
                break
                if A==T
                else
                    disp("A no es simetrica")
                end
            end
        end
    end
end

if A==T 
    disp ("La matriz es definida positiva")
else
    disp("La matriz A no es definida positiva")
end
 