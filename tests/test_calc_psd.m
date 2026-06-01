%TEST_CALC_PSD Test calc_psd.

tol = 1e-10;

fs = 100;
t = (0:999)' / fs;
x = 2 * sin(2 * pi * 5 * t);

[f, psd] = calc_psd(x, fs);
df = f(2) - f(1);
power_from_psd = sum(psd) * df;
variance_direct = mean((x - mean(x)).^2);

assert(length(f) == 501);
assert(length(psd) == 501);
assert(all(psd >= -tol));
assert(abs(power_from_psd - variance_direct) < tol);
