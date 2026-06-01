# Contributing

Thank you for considering a contribution to WindStructLab.

## Reporting Bugs

Use the bug report issue template and include:

- A clear description of the problem
- Steps to reproduce
- Expected and actual behavior
- Operating system
- MATLAB or GNU Octave version
- A minimal example
- Full error messages when available

## Requesting Features

Use the feature request issue template and explain the engineering or teaching need. Please include a short example use case whenever possible.

## Coding Style

- Write MATLAB/GNU Octave compatible `.m` files.
- Avoid external toolboxes.
- Keep functions small and readable.
- Include help comments at the top of each function.
- Prefer transparent formulas over compact but obscure implementations.
- Add clear input checks for invalid values.

## Testing Expectations

New functions should include simple tests in `tests/` using synthetic numeric arrays. Tests should run with GNU Octave through:

```bash
octave --eval "run('tests/run_all_tests.m')"
```

## Documentation Expectations

Update the README or files in `docs/` when behavior, assumptions, data formats, or formulas change. Documentation should be understandable for students and researchers who are learning the method.

## Data Policy

Do not contribute private, real, unpublished, confidential, or restricted experimental data. Use synthetic examples only unless a future governance policy explicitly allows public benchmark data with clear permission and provenance.

## Formula Policy

WindStructLab favors simple, transparent, and verifiable formulas. When adding a method, document assumptions, units, and limitations.
