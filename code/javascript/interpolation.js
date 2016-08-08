function lagrange(x, y, p) {
    var value = 0;
    var n = x.length;
    for (var k = 1; k < n; k++) {
        var l = 1;
        for (var j = 1; j < n; j++) {
            if (j != k) {
                l *= (p - x[j]) / (x[k] - x[j]);
            }
        }
        value += l * y[k];
    }
    return value;
}

function neville(x, y, p) {
    var value = 0.;
    var Q = [];
    var n = x.length;
    for (var k = 0; k < n; k++) {
        Q[k] = [y[k]];
    }
    for (var k = 1; k < n; k++) {
        for (var j = 1; j <= k; j++) {
            Q[k][j] = ((p-x[k-j])*Q[k][j-1]-(p-x[k])*Q[k-1][j-1])/(x[k]-x[k-j]);
        }
    }
    value = Q[n-1][n-1];
    return value;
}

function newton(x, y, p) {
    var value = 0.;
    var F = [];
    var n = x.length;
    for (var i = 0; i < n; i++) {
        F[i] = [y[i]];
    }
    for (var i = 1; i < n; i++) {
        for (var j = 1; j <= i; j++) {
            F[i][j] = (F[i][j-1]-F[i-1][j-1])/(x[i]-x[i-j]);
        }
    }
    for (var i = 0; i < n; i++) {
        var prod = F[i][i];
        for (var j = 0; j < i; j++) {
            prod *= (p - x[j]);
        }
        value += prod;
    }
    return value;
}

function hermite(x, y, d, p) {
    var value = 0.;
    var Q = [];
    var z = [];
    var n = x.length;
    for (var i = 0; i < n; i++) {
        z[2*i] = x[i];
        z[2*i+1] = x[i];
        Q[2*i] = [y[i]];
        Q[2*i+1] = [y[i]];
        Q[2*i+1][1] = d[i];
        if (i != 0) {
            Q[2*i][1] = (Q[2*i][0]-Q[2*i-1][0])/(z[2*i]-z[2*i-1]);
        }
    }
    for (var i = 2; i < 2*n; i++) {
        for (var j = 2; j <= i; j++) {
            Q[i][j] = (Q[i][j-1]-Q[i-1][j-1])/(z[i]-z[i-j]);
        }
    }
    console.log(Q);
    for (var i = 0; i < 2*n; i++) {
        var prod = Q[i][i];
        for (var j = 0; j < i; j++) {
            prod *= (p - z[j]);
        }
        value += prod;
    }
    return value;
}

x = [0, 3, 5, 8, 13];
y = [0, 225, 383, 623, 993];
d = [75, 77, 80, 74, 72];
p = 10;

console.log("Lagrange:   ", lagrange(x, y, p));

console.log("Neville:    ", neville(x, y, p));

console.log("Newton:     ", newton(x, y, p));

console.log("Hermite:    ", hermite(x, y, d, p));
