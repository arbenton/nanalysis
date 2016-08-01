f = @(x) cos(x-1);
p = 5;
iterations = 50;

for i=1:iterations

    p = p - f(p);

    fprintf('Iteration %3.0d: p = %4.9f, f(p) = %4.9f \n', i, p, f(p));

end