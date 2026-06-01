%DEMO_BASIC_WORKFLOW Demonstrate the initial WindStructLab workflow.
%
% Run from the repository root:
%   octave --eval "run('examples/demo_basic_workflow.m')"
%
% This script uses only synthetic data included in the repository.

clear variables;
close all;
clc;

tic;

script_path = mfilename('fullpath');
if isempty(script_path)
    root_dir = pwd;
else
    root_dir = fileparts(fileparts(script_path));
end

addpath(genpath(fullfile(root_dir, 'src')));

fprintf('WindStructLab basic workflow demo\n');
fprintf('Repository root: %s\n\n', root_dir);

time_history_file = fullfile(root_dir, 'sample_data', 'synthetic', 'synthetic_time_history.csv');
[time_data, time_header] = read_time_history(time_history_file);

time = time_data(:, 1);
displacement = time_data(:, 2);
acceleration = time_data(:, 3);
fs = 1 / mean(diff(time));

disp_stats = calc_basic_stats(displacement);
[f_fft, amp] = calc_fft_spectrum(displacement, fs);
[f_psd, psd] = calc_psd(displacement, fs);

fprintf('Time-history file: %s\n', time_history_file);
fprintf('Columns: %s, %s, %s\n', time_header{1}, time_header{2}, time_header{3});
fprintf('Sampling frequency: %.3f Hz\n', fs);
fprintf('Displacement mean: %.6g\n', disp_stats.mean);
fprintf('Displacement RMS: %.6g\n', disp_stats.rms);
fprintf('Displacement absolute maximum: %.6g\n', disp_stats.abs_max);
fprintf('FFT bins: %d\n', length(f_fft));
fprintf('PSD bins: %d\n\n', length(f_psd));

plot_time_history(time, displacement, 'Displacement');

hysteresis_file = fullfile(root_dir, 'sample_data', 'synthetic', 'synthetic_hysteresis.csv');
[loop_data, loop_header] = read_time_history(hysteresis_file);

loop_displacement = loop_data(:, 1);
loop_force = loop_data(:, 2);

keq = calc_equivalent_stiffness(loop_displacement, loop_force);
heq = calc_equivalent_damping(loop_displacement, loop_force);

fprintf('Hysteresis file: %s\n', hysteresis_file);
fprintf('Columns: %s, %s\n', loop_header{1}, loop_header{2});
fprintf('Equivalent stiffness: %.6g\n', keq);
fprintf('Equivalent damping ratio: %.6g\n\n', heq);

plot_hysteresis(loop_displacement, loop_force);

fprintf('Demo complete.\n');
toc;
