# Three-Phase RL Power System Analysis

MATLAB/Simulink based analysis of a three-phase RL power system under different operating conditions.

## Project Overview

This project investigates the behavior of a three-phase RL loaded power system under different simulation cases using MATLAB and Simulink.

The study includes:
- Reactive power variation
- Active and reactive load variation
- Power factor correction (compensation)
- Single phase-to-ground fault analysis

Simulation results were analyzed using voltage, current, active power, reactive power, apparent power, and power factor measurements.

---

## Project Structure

```text
models_and_results/
│
├── base_system.slx
├── case_1_1.slx
├── case_1_2.slx
├── case_1_3.slx
├── case_2_1.slx
├── case_2_2.slx
├── case_3_1.slx
└── case_4_1.slx

parameters/
│
└── system_parameters.m

report/
│
└── three_phase_rl_power_system_report_public.pdf
