function [] = Lu_simple(a,b)
    t=length(a);
    v=[a,b];
    [n,m]=size(v);
    u=zeros(n);
    o=zeros(n);
    x=zeros(n,1);
    z=zeros(n,1);
    for i=1:t
        if a(i,i)~=0
        elseif 
            for f=1:n
                for c=(f+1):n
                    o(c,f)=v(c,f)/v(f,f);
                    for k=1:(n+1)
                        v(c,k)=v(c,k)-(o(c,f)*v(f,k));
                    end
                end
            end
            for j=1:n
                o(j,j)=o(j,j)+1;
            end
            for i=1:n
                for g=1:n
                    u(i,g)=v(i,g);
                end
            end
        else
            ("hay ceros en la diagonal principal de la matriz de coeficientes por lo tanto no es posible desarrollar el metodo")
            return
        end
    end
        
    xlswrite("Lu_simple.xlsx",v,"Hoja1","A1");
    xlswrite("Lu_simple.xlsx",o,"Hoja2","A1");
    xlswrite("Lu_simple.xlsx",u,"Hoja3","A1");
    for i=n:-1:1
        suma=0;
        for p=(i+1):n
            suma = suma + v(i,p)*X(p);
        end
        X(i)=(v(i,n+1)-suma)/v(i,i);
    end
    xlswrite("Lu_simple.xlsx",X,"Hoja4","A1");
end