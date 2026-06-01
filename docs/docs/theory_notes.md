# Theory Notes

These notes summarize the simple formulas used in the initial WindStructLab functions.

## RMS

The root-mean-square value is:

```text
rms = sqrt(mean(x.^2))
```

It is useful for measuring response intensity.

## Standard Deviation

The standard deviation measures spread around the mean. WindStructLab uses the sample standard deviation:

```text
std = sqrt(sum((x - mean(x)).^2) / (N - 1))
```

For a single value, the function returns zero.

## Skewness

Skewness measures asymmetry:

```text
skewness = mean((x - mean(x)).^3) / std^3
```

If the standard deviation is zero, skewness is returned as zero.

## Peak Factor

Peak factor compares the largest absolute response with RMS:

```text
peak_factor = max(abs(x)) / rms
```

If RMS is zero, peak factor is returned as `NaN`.

## FFT Amplitude Spectrum

The FFT amplitude spectrum removes the mean, calculates the FFT, scales by `1/N`, and doubles non-DC single-sided bins. For even-length records, the Nyquist bin is not doubled.

## Simple PSD Estimate

`calc_psd` uses an FFT-based periodogram-style estimate:

```text
two_sided_psd = abs(fft(x)).^2 / (fs * N)
```

The function then returns the single-sided PSD by doubling non-DC interior bins. This is a simple periodogram estimate, not Welch averaging.

## Equivalent Stiffness

The equivalent stiffness is a simple secant estimate:

```text
keq = (max(force) - min(force)) / (max(displacement) - min(displacement))
```

If force is N and displacement is m, stiffness is N/m. If force is kN and displacement is mm, stiffness is kN/mm.

## Equivalent Damping

The equivalent viscous damping ratio is estimated from one stable hysteresis loop:

```text
heq = Ed / (4 * pi * Es)
Ed = abs(trapz(displacement_closed, force_closed))
Es = 0.5 * max(abs(force)) * max(abs(displacement))
```

This approximation depends on the assumption that the input points represent one closed or nearly closed loop.
