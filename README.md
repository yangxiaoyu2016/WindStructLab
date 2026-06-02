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


# WindStructLab

WindStructLab 是一个开源的 MATLAB / GNU Octave 兼容工具包，用于结构工程与风工程实验数据的可重复处理。

本项目的初始版本主要提供一些公式透明、便于教学和研究检查的基础函数，包括：

- 时刻历数据读取
- 平均值去除
- 基本统计量计算
- FFT 振幅谱计算
- PSD 功率谱密度估算
- 力-位移履历曲线处理
- 等效刚度计算
- 等效阻尼比计算
- 基础作图函数

本仓库只包含合成示例数据，不包含任何真实、未发表、保密或共同研究中的实验数据。

---

## 项目目的

结构工程、风工程和振动实验中，经常会得到大量时刻历数据，例如：

- 位移响应
- 加速度响应
- 速度响应
- 荷载响应
- 力-位移履历数据
- 风响应数据
- 免震、制振、振动台、风洞实验数据

这些数据在正式分析、论文整理或教学说明之前，需要进行一致、透明、可重复的数据处理。

WindStructLab 的目标是提供一个小型、清楚、可修改、可验证的开源工具包，帮助研究者、学生和工程人员建立基础的数据处理流程。

---

## 适用对象

本项目适合：

- 结构工程研究者
- 风工程研究者
- 免震、制振、振动实验相关研究者
- 研究生和本科生
- 需要处理实验时刻历数据的工程人员
- 准备教学示例的教师

---

## 主要功能

| 功能 | 说明 |
|---|---|
| CSV 数据读取 | 读取带表头的 CSV 时刻历数据 |
| 去平均值 | 对向量或矩阵按列去除平均值 |
| 基本统计量 | 计算平均值、标准差、RMS、最大值、最小值、偏斜度、峰值因子 |
| FFT 振幅谱 | 计算单边 FFT amplitude spectrum |
| PSD 估算 | 基于 FFT 的简单 periodogram 型 PSD 估算 |
| 等效刚度 | 根据力-位移最大最小值计算简单割线刚度 |
| 等效阻尼 | 根据履历环面积计算等效阻尼比 |
| 作图 | 绘制时刻历图和力-位移履历曲线 |
| 示例数据 | 提供 synthetic data，用于演示和测试 |
| 测试 | 提供基础测试脚本，便于检查函数是否正常运行 |

---

## 仓库结构

```text
WindStructLab/
├── README.md
├── LICENSE
├── CITATION.cff
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
├── docs/
│   ├── getting_started.md
│   ├── data_format.md
│   ├── examples.md
│   ├── theory_notes.md
│   └── roadmap.md
├── src/
│   ├── io/
│   ├── preprocessing/
│   ├── statistics/
│   ├── spectrum/
│   ├── hysteresis/
│   └── plotting/
├── examples/
│   └── demo_basic_workflow.m
├── sample_data/
│   └── synthetic/
├── tests/
│   └── run_all_tests.m
└── .github/
    ├── ISSUE_TEMPLATE/
    └── workflows/
