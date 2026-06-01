%RUN_ALL_TESTS Run all WindStructLab tests.

clear variables;
clc;

tic;

script_path = mfilename('fullpath');
if isempty(script_path)
    root_dir = pwd;
    test_dir = fullfile(root_dir, 'tests');
else
    test_dir = fileparts(script_path);
    root_dir = fileparts(test_dir);
end

addpath(genpath(fullfile(root_dir, 'src')));

test_files = {
    'test_remove_mean.m';
    'test_calc_basic_stats.m';
    'test_calc_fft_spectrum.m';
    'test_calc_psd.m';
    'test_calc_equivalent_stiffness.m';
    'test_calc_equivalent_damping.m'
};

fprintf('Running WindStructLab tests...\n');

for k = 1:length(test_files)
    test_file = fullfile(test_dir, test_files{k});
    fprintf('Running %s ... ', test_files{k});
    run(test_file);
    fprintf('PASS\n');
end

fprintf('All WindStructLab tests passed.\n');
toc;
