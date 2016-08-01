TOLERANCE = .000001;

function bisection (f, a, b) {
    var p = a;
    var fa = f(a);
    var fp = fa;
    while (Math.abs(fp) > TOLERANCE) {
        p = (a + b) / 2.0;
        fp = f(p);
        if (fp*fa > 0) {
            a = p;
            fa = f(a);
        } else if (fp*fa < 0) {
            b = p;
        } else {
            break;
        }
    }
    return p;
}

function fixed_point (f, p) {
    var fp = f(p);
    while (Math.abs(fp - p) > TOLERANCE) {
        fp = p;
        p -= f(p);
    }
    return p;
}

function newton(f, d, p) {
    var fp = f(p);
    while (Math.abs(fp - p) > TOLERANCE) {
        fp = p;
        p -= f(p)/d(p);
    }
    return p;
}

var f = function (x) {return Math.cos(x + 1)};
var d = function (x) {return -1*Math.sin(x + 1)};
console.log(bisection(f, -5, 5));
console.log(fixed_point(f, -3));
console.log(newton(f, d, -3));
