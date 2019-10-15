   format long
    A=input("ingrese la matriz A: ");
    t=input("tamaño de la matriz par(1)o impar (-1): ");
    n=length(A); 
    p=zeros(1,n); 
    s=zeros(n,1);
    B=zeros(n);
    for i=1:n
        B=A^i; 
        s(i)=trace(B);
    end
    p(1)=-s(1);
    for i=2:n
        p(i)=-s(i)/i;
        for j=1:i-1
            p(i)=p(i)-p(j)*s(i-j)/i;
        end
    end
    raiz=roots([1 p]); 
    D=diag(raiz);
    C=-1.*A(2:n,1);
    V=zeros(n);
    S=zeros(n,1); 
    for i=1:length(D)
        B=A(2:n,2:n)-D(i,i)*eye(n-1);
        S=[1 (B\C)'];
        V(1:n,i)=S/norm(S); 
    end
    disp(V*t)
    disp(D)