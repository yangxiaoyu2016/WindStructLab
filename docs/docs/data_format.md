# Data Format

WindStructLab uses simple comma-separated value files with one header row and numeric data.

## Time-History Data

The first column should be time in seconds. Remaining columns may contain displacement, velocity, acceleration, force, pressure, or other response quantities.

Example:

| time | displacement | acceleration |
| --- | --- | --- |
| 0.00 | 0.0000 | 0.0000 |
| 0.01 | 0.0006 | -0.0150 |
| 0.02 | 0.0012 | -0.0298 |

## Hysteresis Data

Hysteresis files should contain displacement and force columns.

Example:

| displacement | force |
| --- | --- |
| 0.0000 | 2.0000 |
| 0.1253 | 3.2272 |
| 0.2487 | 4.4026 |

## Units Policy

WindStructLab does not convert units automatically. Use consistent units and document them in your workflow. For equivalent stiffness:

- If force is N and displacement is m, stiffness is N/m.
- If force is kN and displacement is mm, stiffness is kN/mm.

PSD units are consistent with response units squared per hertz.

## Missing Data Policy

The initial version assumes complete numeric data. Missing data, text values, and malformed rows are not automatically repaired. Clean input data before analysis or add project-specific preprocessing steps.

## Synthetic Data Only

The repository includes synthetic data only. Do not add private, real, unpublished, or confidential experimental data.
