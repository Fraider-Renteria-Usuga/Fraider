function [] = raices_multiples(f,tolerancia,pi,iter)
    format long
    syms x
    ezplot(f)
    grid on
    d=diff(f);
    d=inline(d);
    f=inline(f);
    ea=100;
    cont=0;
    while ea>tolerancia && iter>cont
        xi=pi-(f(pi)/d(pi));
        ea=abs((xi-pi)/(xi))*100;
        pi=xi;    
        cont=cont+1;        
    end
    xlswrite("raices_multiples.xlsx",cont,"Hoja1","A1");
    xlswrite("raices_multiples.xlsx",pi,"Hoja1","B1");
end