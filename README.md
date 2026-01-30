# Adaptive RBF Neural Network Control for 3-DOF Manipulator

## Project Overview

This project focuses on the design and simulation of an **Adaptive Control System** based on **Radial Basis Function (RBF) Neural Networks** for a **3-DOF RRR robotic manipulator**.

The primary goal is to address the limitations of conventional **Computed Torque Control (CTC)** when operating under severe uncertainties, such as:

- High joint friction (Coulomb & Viscous)
- Unexpected payload variations (Unmodeled dynamics)

The simulation is built using **MATLAB/Simulink** and **Simscape Multibody** to ensure high-fidelity physical modeling.

---

## Key Features

- **Dynamic Modeling**  
  Full derivation of *Kinematics (DH Parameters)* and *Dynamics (Euler–Lagrange)*

- **High-Fidelity Simulation**  
  Physical robot modeling using **Simscape Multibody** (not just mathematical transfer functions)

- **Adaptive Intelligence**  
  Integration of an **RBF Neural Network** to approximate unknown nonlinearities online

- **Robustness**  
  Proven stability under extreme disturbances  
  - `36,000 N·m` friction  
  - `500%` mass increase

---

## System Architecture

### 1. Control Strategy

The system utilizes a **hybrid control architecture**:

- **Base Controller**  
  Computed Torque Control (CTC) for feedback linearization based on the nominal model

- **Adaptive Component**  
  A 3-layer **RBF Neural Network** that learns the error dynamics `e(t)` in real time

### 2. Neural Network Configuration

- **Input Layer**  
  Joint position error and velocity error vector `'[e, ė]'`

- **Hidden Layer**  
  Gaussian Radial Basis Functions (RBF)

- **Output Layer**  
  Adaptive torque compensation  
  - Weights updated via **Gradient Descent**

---

## Simulation Results & Analysis

Stress tests were conducted by:

- Increasing link mass by **5×**
- Injecting **36,000 N·m** friction

### Scenario 1: Conventional CTC (Failure)

Without the Neural Network, the controller relies on incorrect model parameters.

- **Max Tracking Error:** `~0.26 m`
- **Steady State:** Failed to converge

### Scenario 2: Adaptive NN Control (Success)

The Neural Network successfully learned unmodeled dynamics and compensated for disturbances.

- **Max Tracking Error:** `~0.02 m`
- **Improvement:** `92%` error reduction

---

## Performance Comparison

| Metric              | Without NN | With NN |
|---------------------|------------|---------|
| Trajectory Shape    | Distorted  | Perfect Circle |
| Torque Response     | Insufficient | Adaptive Compensation |

--- 

## 🔧 Installation & Usage

### Prerequisites

- MATLAB `R2022b` or later
- Simulink
- Simscape Multibody
- Control System Toolbox

### How to Run

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/adaptive-rbf-control-3dof-arm.git
2. Open MATLAB and navigate to the src folder
3. Run the initialization script: params_init.m
4. Open the Simulink model: robot_control_main.slx
5. Run the simulation
6. Visualize results: plot_results.m

---

## Author
### Nguyen Dinh Tien Dat
- Role: Team Leader & Algorithm Developer
- Email: 'ndtdat2k3@gmail.com'

This project was developed as part of the Intelligent Robotics course at Da Nang University of Science and Technology.

### For more details, please read the report at docs.
