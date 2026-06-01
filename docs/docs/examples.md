# Examples

## Basic Time-History Workflow

```matlab
addpath(genpath('src'));
[data, header] = read_time_history('sample_data/synthetic/synthetic_time_history.csv');
time = data(:, 1);
displacement = data(:, 2);

[disp_zero_mean, removed_mean] = remove_mean(displacement);
stats = calc_basic_stats(displacement);
plot_time_history(time, displacement, 'Displacement');
```

## Basic Spectrum Workflow

```matlab
fs = 1 / mean(diff(time));
[f_fft, amp] = calc_fft_spectrum(displacement, fs);
[f_psd, psd] = calc_psd(displacement, fs);
```

The PSD function provides a simple periodogram estimate. It does not perform Welch averaging.

## Basic Hysteresis Workflow

```matlab
[loop_data, loop_header] = read_time_history('sample_data/synthetic/synthetic_hysteresis.csv');
displacement = loop_data(:, 1);
force = loop_data(:, 2);

keq = calc_equivalent_stiffness(displacement, force);
heq = calc_equivalent_damping(displacement, force);
plot_hysteresis(displacement, force);
```

The equivalent damping function assumes the input represents one stable hysteresis loop.
