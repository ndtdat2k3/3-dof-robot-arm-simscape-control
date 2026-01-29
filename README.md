Adaptive RBF Neural Network Control for 3-DOF Manipulator

 Project Overview

This project focuses on the design and simulation of an Adaptive Control System based on Radial Basis Function (RBF) Neural Networks for a 3-DOF RRR robotic manipulator.

The primary goal is to address the limitations of conventional Computed Torque Control (CTC) when operating under severe uncertainties, such as:

High joint friction (Coulomb & Viscous).

Unexpected payload variations (Unmodeled dynamics).

The simulation is built using MATLAB/Simulink and Simscape Multibody to ensure high-fidelity physical modeling.

 Key Features

Dynamic Modeling: Full derivation of Kinematics (DH Parameters) and Dynamics (Euler-Lagrange).

High-Fidelity Simulation: Physical robot modeling using Simscape Multibody (not just mathematical transfer functions).

Adaptive Intelligence: Integration of an RBF Neural Network to approximate unknown nonlinearities online.

Robustness: Proven stability under extreme disturbances (36,000 N.m friction, 500% mass increase).

 System Architecture

1. Control Strategy

The system utilizes a hybrid control architecture:

Base Controller: Computed Torque Control (CTC) for feedback linearization based on the nominal model.

Adaptive Component: A 3-layer RBF Neural Network that learns the error dynamics ($\Delta = M(q)\ddot{q} + C\dot{q} + G + F$) in real-time.

$$\tau = \tau_{CTC} + \tau_{NN}$$

2. Neural Network Configuration

Input Layer: Joint position error and velocity error vector $x = [e, \dot{e}]^T$.

Hidden Layer: Gaussian Radial Basis Functions.

Output Layer: Adaptive torque compensation weights updated via Gradient Descent.

 Simulation Results & Analysis

We conducted stress tests by increasing the link mass by 5 times and injecting significant friction (36,000 N.m).

Scenario 1: Conventional CTC (Failure)

Without the Neural Network, the controller relies on incorrect model parameters, leading to significant trajectory drift.

Max Tracking Error: ~0.26 m

Steady State: Failed to converge.

Scenario 2: Adaptive NN Control (Success)

The Neural Network successfully learned the unmodeled dynamics and compensated for the friction/gravity forces.

Max Tracking Error: ~0.02 m

Improvement: 92% reduction in error.

Performance Metric

Without NN

With NN

Trajectory Shape

Distorted

Perfect Circle

Torque Response

Insufficient

Adaptive Compensation


 Installation & Usage

Prerequisites

MATLAB R2022b or later.

Simulink.

Simscape Multibody.

Control System Toolbox.

How to Run

Clone this repository:

git clone [https://github.com/yourusername/adaptive-rbf-control-3dof-arm.git](https://github.com/yourusername/adaptive-rbf-control-3dof-arm.git)


Open MATLAB and navigate to the src folder.

Run the initialization script (e.g., params_init.m) to load robot parameters ($m, l, I$) into the workspace.

Open the Simulink model file robot_control_main.slx.

Run the simulation.

Use the plot_results.m script to visualize the comparison graphs.

 Author

Nguyen Dinh Tien Dat

Role: Team Leader & Algorithm Developer

Email: ndtdat2k3@gmail.com

This project was developed as part of the Intelligent Robotics course at Da Nang University of Science and Technology.
