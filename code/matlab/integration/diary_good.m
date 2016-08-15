>> % 4.3
>> h = .2255;
>> n = 10;
>> f = @(x) 1/sqrt(2*pi) * exp(-1/2 * x.^2);
>> a = -1;
>> b = 1;
>> type composite_simpsons
composite_simpsons is the user-defined function defined from: /home/andrew/Documents/school/numerical-analysis/code/matlab/integration/composite_simpsons.m

function [v] = composite_simpsons(f, a, b, n)

    h = (b - a)/n;
    xi0 = f(a) + f(b);
    xi1 = 0;
    xi2 = 0;

    for i=1:n-1
        x = a+i*h;
        if mod(i, 2)
            xi1 = xi1 + f(x);
        else
            xi2 = xi2 + f(x);
        end
    end

    v = h*(xi0 + 2*xi2 + 4*xi1)/3;

end

>> composite_simpsons(f, a, b, n)
ans =  0.68270
>> % 4.4
>> f = @(x) exp(-x.^2);
>> a = 0;
>> b = 1;
>> type romberg
romberg is the user-defined function defined from: /home/andrew/Documents/school/numerical-analysis/code/matlab/integration/romberg.m

function [v] = romberg(f, a, b, n)

    h = b-a;
    R = zeros(2, n);
    R(1,1) = (h/2)*(f(a) + f(b));

    for i=2:n
        s = 0;
        for k=1:2.^(i-2)
            s = s + f(a + (k-.5)*h);
        end
        R(2,1) = 1/2 * (R(1,1) + h*s);

        for j=2:i
            R(2,j) = R(2,j-1) + (R(2,j-1)-R(1,j-1))/(4^(j-1)-1);
        end

        h = h/2;

        for j=1:i
            R(1,j) = R(2,j);
        end

    end

    v = R(2, n);

end

>> format long
>> romberg(f, a, b, 5)
ans =  0.746824133095094
>> romberg(f, a, b, 10)
ans =  0.746824132812427
>> ans * 2 / sqrt(pi)
ans =  0.842700793268671
>> erf(1)
ans =  0.842700792949715
>> f = @(x) sqrt(1 + cos(x).^2);
>> a = 0;
>> b = 48;
>> romberg(f, a, b, 5)
ans =  56.2040623861080
>> romberg(f, a, b, 10)
ans =  58.4704690528802
>> a = 10;
>> b = 5;
>> f = @(u) 10 / (-u * sqrt(u));
>> romberg(f, a, b, 4)
ans =  2.61972034734938
>> % 4.6
>> f = @(x) sin(1./x);
>> a = 0.1;
>> b = 2.0;
>> plot(x, f(x))
>> type adaptive_quadrature
adaptive_quadrature is the user-defined function defined from: /home/andrew/Documents/school/numerical-analysis/code/matlab/integration/adaptive_quadrature.m

function [v] = adaptive_quadrature(f, a, b, tol, n)

    fa = f(a);
    fc = f((a+b)/2);
    fb = f(b);
    sab = (b-a)*(fa + 4*fc + fb)/6;
    [approx eest nfunc] = as (sab, fa, fc, fb, f, a, b, tol);
    v = approx;
end

function [app, est, nf] = as (sab, fa, fc, fb, f, a, b, tol)

    c = (a+b)/2;
    fd = f((a+c)/2);
    fe = f((c+b)/2);
    sac = (c-a)*(fa + 4*fd + fc)/6;
    scb = (b-c)*(fc + 4*fe + fb)/6;

    errest = abs (sab - sac - scb);
    if errest < (10.0*tol)
        app = sac+scb;
        est = errest / 10.0;
        nf = 2;
    else
        [a1 e1 n1] = as (sac, fa, fd, fc, f, a, c, tol/2.0);
        [a2 e2 n2] = as (scb, fc, fe, fb, f, c, b, tol/2.0);
        app = a1 + a2;
        est = e1 + e2;
        nf = n1 + n2 + 2;
    end
end

>> adaptive_quadrature(f, a, b, 1e-3, 4)
ans =  1.14544664221175
>> m = 1;
>> k =  9;
>> F0 = 1;
>> w = 2;
>> a = 0
a = 0
>> b = 2*pi;
>> t = a:.001:b;
>> w0 = sqrt(k/m);
>> u = @(t) (F0 / (m*(w0^2-w^2))) * (cos(w*t) - cos(w0*t));
>> plot(t, u(t))
>> adaptive_quadrature(u, a, b, 1e-4, 4)
ans =   -1.66533453693773e-16
>> % 4.7
>> h = .2255;
>> n = 10;
>> f = @(x) 1/sqrt(2*pi) * exp(-1/2 * x.^2);
>> a = -1;
>> b = 1;
>> type composite_simpsons
composite_simpsons is the user-defined function defined from: /home/andrew/Documents/school/numerical-analysis/code/matlab/integration/composite_simpsons.m

function [v] = composite_simpsons(f, a, b, n)

    h = (b - a)/n;
    xi0 = f(a) + f(b);
    xi1 = 0;
    xi2 = 0;

    for i=1:n-1
        x = a+i*h;
        if mod(i, 2)
            xi1 = xi1 + f(x);
        else
            xi2 = xi2 + f(x);
        end
    end>> diary

    v = h*(xi0 + 2*xi2 + 4*xi1)/3;

end

>> composite_simpsons(f, a, b, n)
ans =  0.68270
>> [x, c] = gaussian_quadrature(4, 0, pi/4);
>> c' * f(x)
ans = .6470
>> f = @(x) sqrt(1+cos(x).^2);
>> a = 0;
>> b = 48;
>> h = b / 16;
>> s = 0;
>> for i=0:15
    [x, c] = gaussian_quadrature(5, a+i*h, b+(i+1)*h);
    s = s + c' * f(x);
end
>> s
s = 58.438
