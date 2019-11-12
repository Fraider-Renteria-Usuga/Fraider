function [X]= crout(a,b)
    format short
    [n,m]=size(a);
    l=zeros(n);
    u=zeros(n);
    if n==m
        for i=1:n 
            l(i,1)=a(i,1);
            u(1,i)=a(1,i)/a(1);
            u(i,i)=1;
        end
        for i=2:n
            cont=0;
            for j=i:n
                l(j,i)=a(j,i)-l(j,:)*u(:,i);
            end
            for k=i:n-1 
                u(i,k+1)=(a(i,k+1)-l(k,:)*u(:,k+1))/(l(i,i));
            end
        end
    end
    detu=1; 
    detL=1; 
    for i=1:n
        detL=detL*l(i,i);
    end
    producto=detL*detu;

    if producto~=0
        for i=1:n
            suma=0;
            for p=1:i-1
                suma=suma+l(i,p)*z(p);
            end
            z(i)=(b(i)-suma)/l(i,i);
        end
        for i=n:-1:1
            suma=0;
            for p=(i+1):n
                suma = suma+u(i,p)*x(p);
            end
            x(i)=(z(i)-suma)/u(i,i);
        end
    else
        fprintf('\nEl determinante es igual a cero, por lo tanto el sistema tiene infinita o ninguna solucion\n')
    end
    xlswrite("crout.xlsx",u,"Hoja1","A1");
    xlswrite("crout.xlsx",l,"Hoja2","A1");
    xlswrite("crout.xlsx",x,"Hoja3","A1");
end