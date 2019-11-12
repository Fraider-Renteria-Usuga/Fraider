function [] = Luf_parcial(A,b)
    format long
    [w,r]=size(A);
    if w==r 
    c=[A,b];
    a=[A,b];
    [n,m]=size(a);
    o=(zeros(n));
    u=zeros(n);
    I=(eye(n));
    z=zeros(n,1);
    if n==m-1
        for i=1:n
            mayor=0;
            fila=i;
            for j=i:n
                if mayor<abs(a(j,i))
                    mayor=abs(a(j,i));
                    fila=j;
                end
            end
            if fila~=i
                a([i fila],:)=a([fila i],:);
                I([i fila],:)=I([fila i],:);
                o([i fila],:)=o([fila i],:);
            end
            for l=(i+1):n
                o(l,i)=a(l,i)/a(i,i);
                for g=i:(n)
                    a(l,g)=a(l,g)-(o(l,i)*a(i,g));            
                end
            end
        end
    else
    end
    for q=1:n
        o(q,q)=1;
    end

    for r=1:n
        for w=1:n
            u(w,r)=a(w,r);
        end    
    end
    for i=5:m
        for l=1:n
        z(l,1)=a(l,i);
        end
    end
    Lz=[o,z]; 
    [n,m]=size(Lz);
    for i=1:n
        suma=0;
        for j=1:i-1
            suma=suma+Lz(i,j)*X(j);
        end
        X(i)=(Lz(i,m)-suma);    
    end
    Xt=transpose(X);
    Uz=[u,Xt];
    for i=n:-1:1
        suma=0;
        for p=(i+1):n
            suma = suma + Uz(i,p)*X(p);
        end
        X(i)=(Uz(i,n+1)-suma)/Uz(i,i);
        xlswrite("valores_X.xlsx",X,"Hoja1","A1");
    end
    else 
        ("la matriz no es cuadrada")
        return
    end
    
end