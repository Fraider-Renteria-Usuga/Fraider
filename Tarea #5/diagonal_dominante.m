format short
A=input("ingrese la matriz A: ");
n=length(A);
cf=0;
cc=0;
for i=1:n
    sf=sum(abs(A(i,:)));
    if(2*abs(A(i,i))>sf)
        cf=cf+1;
    end
    sc=sum(abs(A(:,i)));
    if(2*abs(A(i,i))>sc)
        cc=cc+1;
    end
end
if(cf==n)
    disp("A es estrictamente diagonal dominante por filas")
else
    disp("A es estrictamente diagonal dominante por filas")
end
if(cc==n)
    disp("A es estrictamente diagonal dominante por filas")
else
    disp("A es estrictamente diagonal dominante por filas")
end