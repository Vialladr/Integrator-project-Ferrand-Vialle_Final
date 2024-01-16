# Intelligent Control for Lifetime Extension of Industrial Wind Turbines in a Benchmark Framework
## General info
This work has been done as part of a semester project in last year of master at Grenoble INP - ENSE3, UGA, in "Automatic control and intelligent systems" course. 
This project has been proposed in the context of a thesis on Intelligent Control for Lifetime Extension of Industrial Wind Turbines. 
This project centers on the implementation of a benchmark control framework for wind turbines. It involves the integration of well-established industrial control approaches for wind turbines, 
followed by testing to validate the framework. The ultimate aim is to deploy an innovative control strategy that extend the operational lifetime of wind turbines, 
effectively addressing the critical issue of degradation and bolstering their long-term sustainability.

The test plateform benchmark chosen for this project is OpenFAST which which is capable of performing realistic simulation of wind turbine, and includes different types of wind turbines model.
OpenFAST is an open source tool and all its features can be found [here](https://github.com/openfast).

## Table of Contents
1. [Our files and Installation](#our-files-and-installation)
2. [General parameters and outputs configuration](#general-parameters-and-outputs-configuration)
3. [Simulation with Matlab/Simulink](#simulation-with-matlab)


  
## Our files and Installation
From OpenFAST models, we choose the windPACT 1.5-MW wind turbine [model](http://www.nrel.gov/docs/fy06osti/32495.pdf). You can aslo find a lot of its parameters in this [file](https://github.com/Vialladr/Integrator-project-Ferrand-Vialle_Final/blob/main/WindPACT_1.5MW.xlsx).
There is a first folder called WP_baseline which contains general parameters and inputs of the wind turbine model like tower and blades structure, airfoils, or wind files.
Then different variations of this model are proposed. We choose the WP_VSP_WTurb model.

### Versions
A list of technologies used within the project:
* [OpenFast](https://github.com/OpenFAST/openfast/releases/tag/v3.5.0): Version 3.5.0 
* [TurbSim](https://www.nrel.gov/wind/nwtc/turbsim.html): Version 2.0.0
* [PyDatView](https://github.com/ebranlard/pyDatView): Version 0.4
* [Matlab](https://fr.mathworks.com/products/new_products/release2021b.html): Version 9.11.0.1769968 (R2021b)
* [matlab-toolbox](https://github.com/OpenFAST/matlab-toolbox).

## General parameters and outputs configuration
In OpenFAST, each model has several configuration files which correspond to a specific part in the architecture model (sse the figure below). 

![architecture openfast](https://github.com/Vialladr/Integrator-project-Ferrand-Vialle/assets/146111332/1fcff325-8421-490b-a675-e5a940452236)

You can find the files described below [here](https://github.com/Vialladr/Integrator-project-Ferrand-Vialle_Final/tree/main/openfast-main/reg_tests/r-test/glue-codes/openfast/1.WP_1.5MW_IntegratorProject).
* model.**fst** : It is the main input file of the model. From there you regroup all the others input files, and choose general paramters like simulation time, time step, environmental conditions, etc.
* model_**Aerodyn.dat** : It regroups all the aerodynamic parameters of the wind turbine, outputs, and the corresponding files.
* model_**InflowWind.dat** : It regroups all the wind parameters, outputs and the corresponding files of generated wind. 
* model_**ElastoDyn.dat** : It regroups all the mechanical parameters (structure model, mass distribution, inertia, DoF, drivetrain, etc) and the corresponding files (blades, tower strucutre) and outputs.
* model_**ServoDyn.dat** : It regroups all the electrical and automatic control parameters (i.e generator parameters) and the correspondind outputs.

For each of this input files, you can write the outputs you want in the section "Outputs", generally at the bottom of the file. You cannot put any outputs in any files. For example, outputs linked to the generator are to be written in ServoDyn file, while outputs linked to wind are to be written in InflowWind file. You can find all the outputs possible in this [file](https://github.com/Vialladr/Integrator-project-Ferrand-Vialle_Final/blob/main/OutListParameters.xlsx).

Here are all the outputs that we chose for the project :
| Outputs | Description |
| --- | --- |
| Wind1VelX | X component of wind at user selected wind point 1 (m/s) |
| Wind1VelY | Y component of wind at user selected wind point 1 (m/s) |
| Wind1VelZ | Z component of wind at user selected wind point 1 (m/s) |
| GenSpeed | Angular speed of the high-speed shaft and generator (rpm) |
| RotSpeed | Rotor azimuth angular speed (rpm) |
| GenTq | Electrical generator torque (kN-m) | 
| GenPwr | Electrical generator power (kW) |
| RtTSR | Rotor tip-speed ratio (-) |
| QD_DrTr | Velocity of drivetrain rotational-flexibility DOF (rad/s) |
| Q_DrTr | Displacement of drivetrain rotational-flexibility DOF (rad) |


## Simulation with Matlab

The goal of the project was to use Matlab and Simulink with Openfast to easily integrate automatic control algorithm for the wind turbine, in our case, Degradation Aware Control (DAC).
Here will be explained our very basic Matlab and Simulink files to explain how to run the simulation.

First the most important things to know is how set the simulation time. to do that you have to change it into the model file .fst (in our case WP_VSP_WTurb.fst) the Total run time. It has to be the same as in the file.m from which the simulation is run.

To display all outputs and plot the associated figures, you can directly use the matlab toolbox available in the tools menu. simply run *PlotFASToutput({['C:\link..\file.outb]},{'SFunc','exe'});* command. An example is available [here](https://github.com/Vialladr/Integrator-project-Ferrand-Vialle_Final/blob/main/openfast-main/glue-codes/simulink/examples/Run_Test_control_Openfast.m)

