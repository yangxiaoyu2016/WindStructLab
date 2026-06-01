%TEST_CALC_BASIC_STATS Test calc_basic_stats.

tol = 1e-12;

x = [-1; 0; 1];
stats = calc_basic_stats(x);

assert(abs(stats.mean - 0) < tol);
assert(abs(stats.std - 1) < tol);
assert(abs(stats.rms - sqrt(2 / 3)) < tol);
assert(abs(stats.max - 1) < tol);
assert(abs(stats.min + 1) < tol);
assert(abs(stats.abs_max - 1) < tol);
assert(abs(stats.skewness - 0) < tol);
assert(abs(stats.peak_factor - (1 / sqrt(2 / 3))) < tol);

zero_stats = calc_basic_stats([0; 0; 0]);
assert(zero_stats.rms == 0);
assert(zero_stats.skewness == 0);
assert(isnan(zero_stats.peak_factor));
