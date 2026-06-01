# Getting Started

## Clone The Repository

```bash
git clone https://github.com/<your-user-or-org>/WindStructLab.git
cd WindStructLab
```

## Add Source Paths

Start MATLAB or GNU Octave from the repository root and add all source subdirectories:

```matlab
addpath(genpath('src'));
```

## Run The Demo

```bash
octave --eval "run('examples/demo_basic_workflow.m')"
```

In MATLAB:

```matlab
run('examples/demo_basic_workflow.m')
```

The demo reads synthetic data, calculates statistics, calculates FFT and PSD estimates, evaluates a synthetic hysteresis loop, and creates simple plots.

## Run Tests

```bash
octave --eval "run('tests/run_all_tests.m')"
```

The tests use synthetic numeric arrays and do not require external toolboxes.

## Basic Workflow

1. Add the `src` tree to the path.
2. Read a CSV file with `read_time_history`.
3. Select a response channel.
4. Remove offsets or calculate statistics.
5. Calculate spectra if needed.
6. Process force-displacement loops for hysteresis metrics.
7. Save scripts and settings so the workflow is reproducible.
