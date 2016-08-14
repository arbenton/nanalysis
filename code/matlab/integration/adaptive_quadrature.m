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
