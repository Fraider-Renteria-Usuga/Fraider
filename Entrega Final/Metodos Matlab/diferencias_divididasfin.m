function [] = diferencias_divididas(x,y)%se debe ingresar los puntos X y Y
    format rat
    z=length(x);
    v=length(y);
    if z==v
        a=zeros(z,z+1);
        a(:,1)=x;
        a(:,2)=y;
        [m,n]=size(a);
    
        cont=0;
        for i=2:m
            cont=cont+1;
            for j=i:m
                y=1;
                p=(a(j,i));
                p1=(a((j-1),i));
                u=a(j,(i-cont));
                u1=a((j-cont),(y));
                a(j,(i+1))=(p-p1)/(u-u1);
            end
        end
    else
        ("Esta ingresando una cantidad distinta de valores para x y y")
        return
    end
    xlswrite("tabla_diferencias divididas.xlsx",a,"Hoja1","A1");
end