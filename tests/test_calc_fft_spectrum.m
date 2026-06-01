%TEST_CALC_FFT_SPECTRUM Test calc_fft_spectrum.

tol = 1e-10;

fs = 100;
t = (0:999)' / fs;
x = 2 * sin(2 * pi * 5 * t);

[f, amp] = calc_fft_spectrum(x, fs);
[~, idx] = min(abs(f - 5));

assert(length(f) == 501);
assert(length(amp) == 501);
assert(abs(f(idx) - 5) < tol);
assert(abs(amp(idx) - 2) < tol);
assert(abs(amp(1)) < tol);
