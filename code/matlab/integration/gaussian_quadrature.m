function [v]=gaussian_quadrature(f,a,b,n)

    n=n-1;
    n1=n+1; n2=n+2;
    xu=linspace(-1,1,n1)';
    y=cos((2*(0:n)'+1)*pi/(2*n+2))+(0.27/n1)*sin(pi*xu*n/n2);
    L=zeros(n1,n2);
    Lp=zeros(n1,n2);
    y0=2;

    while max(abs(y-y0))>eps

        L(:,1)=1;
        Lp(:,1)=0;
        L(:,2)=y;
        Lp(:,2)=1;

        for k=2:n1
            L(:,k+1)=( (2*k-1)*y.*L(:,k)-(k-1)*L(:,k-1) )/k;
        end
        Lp=(n2)*( L(:,n1)-y.*L(:,n2) )./(1-y.^2);
        y0=y;
        y=y0-L(:,n2)./Lp;

    end

    x=(a*(1-y)+b*(1+y))/2;
    w=(b-a)./((1-y.^2).*Lp.^2)*(n2/n1)^2;

    v = w' * f(x);

end
