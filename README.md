# WindStructLab

WindStructLab is an open-source MATLAB/GNU Octave compatible toolkit for reproducible processing of structural engineering and wind engineering experiment data.

The initial release focuses on transparent, teaching-friendly functions for time-history response processing, basic statistics, FFT and PSD analysis, hysteresis curves, equivalent stiffness, and equivalent damping. The repository includes only synthetic sample data.

## Why This Project Matters

Structural engineering and wind engineering experiments often produce time-history response data that must be processed consistently before results can be compared or published. WindStructLab provides a small, readable starting point for reproducible workflows that students, researchers, and engineers can inspect, modify, and validate.

## Main Features

- CSV time-history import with header support
- Mean removal for vectors and matrices
- Basic response statistics using transparent formulas
- Single-sided FFT amplitude spectrum
- Simple FFT-based PSD periodogram estimate
- Equivalent secant stiffness from force-displacement data
- Equivalent damping ratio from one hysteresis loop
- Simple plotting helpers for time histories and hysteresis curves
- Synthetic sample data for reproducible examples and tests

## Target Users

- Structural engineering researchers
- Wind engineering researchers
- Graduate and undergraduate students
- Engineers processing laboratory or simulation time-history data
- Instructors preparing transparent teaching examples

## Repository Structure

```text
WindStructLab/
  README.md
  LICENSE
  CITATION.cff
  CONTRIBUTING.md
  CODE_OF_CONDUCT.md
  docs/
  src/
    io/
    preprocessing/
    statistics/
    spectrum/
    hysteresis/
    plotting/
  examples/
  sample_data/synthetic/
  tests/
  .github/
    ISSUE_TEMPLATE/
    workflows/
```

## Installation / Setup

Clone the repository and open MATLAB or GNU Octave from the repository root:

```bash
git clone https://github.com/<your-user-or-org>/WindStructLab.git
cd WindStructLab
```

No external toolbox is required. Add the source tree to the MATLAB/GNU Octave path:

```matlab
addpath(genpath('src'));
```

## Quick Start

```matlab
addpath(genpath('src'));

[data, header] = read_time_history('sample_data/synthetic/synthetic_time_history.csv');
time = data(:, 1);
displacement = data(:, 2);
fs = 1 / mean(diff(time));

stats = calc_basic_stats(displacement);
[f_fft, amp] = calc_fft_spectrum(displacement, fs);
[f_psd, psd] = calc_psd(displacement, fs);

disp(stats);
plot_time_history(time, displacement, 'Displacement');
```

## Example Workflow

The example script reads synthetic time-history data, calculates displacement statistics, calculates FFT and PSD estimates, reads synthetic hysteresis data, estimates equivalent stiffness and damping, and produces basic plots.

Run from the repository root:

```bash
octave --eval "run('examples/demo_basic_workflow.m')"
```

In MATLAB:

```matlab
run('examples/demo_basic_workflow.m')
```

## Function List

| Function | Purpose |
| --- | --- |
| `read_time_history` | Read CSV files with one header row and numeric data |
| `remove_mean` | Remove the mean from a vector or each matrix column |
| `calc_basic_stats` | Calculate mean, standard deviation, RMS, extrema, skewness, and peak factor |
| `calc_fft_spectrum` | Calculate a single-sided FFT amplitude spectrum |
| `calc_psd` | Calculate a simple single-sided periodogram PSD estimate |
| `calc_equivalent_stiffness` | Estimate simple secant equivalent stiffness |
| `calc_equivalent_damping` | Estimate equivalent damping from one hysteresis loop |
| `plot_time_history` | Plot response versus time |
| `plot_hysteresis` | Plot force versus displacement |

## Data Format

Time-history CSV files should contain one header row. The first column is time in seconds, and the remaining columns are response quantities such as displacement, velocity, acceleration, or force.

Hysteresis CSV files should contain displacement and force columns. Units are not converted automatically. Keep force and displacement units consistent with the interpretation of each result.

See [docs/data_format.md](docs/data_format.md) for details.

## How To Run The Demo

From a clean checkout:

```bash
octave --eval "run('examples/demo_basic_workflow.m')"
```

The demo assumes it is launched from the repository root or through the script path stored by MATLAB/GNU Octave.

## How To Run Tests

From the repository root:

```bash
octave --eval "run('tests/run_all_tests.m')"
```

The GitHub Actions workflow installs GNU Octave on Ubuntu and runs the same test runner. CI may need adjustment if the GitHub Actions image or Octave package behavior changes.

## Citation

If you use this software, please cite it. See [CITATION.cff](CITATION.cff).

## License

WindStructLab is released under the MIT License. See [LICENSE](LICENSE).

## Contributing

Contributions are welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md). Do not contribute private, real, unpublished, or confidential experimental data.

## Roadmap

Planned areas include filters, response spectrum calculation, rainflow counting, coherence functions, batch processing, Python implementation, teaching notebooks, and more validation examples. See [docs/roadmap.md](docs/roadmap.md).

## Disclaimer

WindStructLab is intended for education, research, and transparent reproducible processing workflows. It is not a substitute for professional engineering judgment, project-specific validation, or code-required design checks. The included data are synthetic examples only.
