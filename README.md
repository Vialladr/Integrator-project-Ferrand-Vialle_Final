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

### Versions
A list of technologies used within the project:
* [Technologie name](https://example.com): Version 12.3 
* [Technologie name](https://example.com): Version 2.34
* [Library name](https://example.com): Version 1234
  
## Our files and Installation
From OpenFAST models, we choose the windPACT 1.5-MW wind turbine [model](http://www.nrel.gov/docs/fy06osti/32495.pdf).
There is a first folder called WP_baseline which contains general parameters and inputs of the wind turbine model like tower and blades structure, airfoils, or wind files.
Then different variations of this model are proposed. We choose the WP_VSP_WTurb model.



## General parameters and outputs configuration
In OpenFAST, each model has several configuration files which correspond to a specific part in the architecture model (sse the figure below). 

![architecture openfast](https://github.com/Vialladr/Integrator-project-Ferrand-Vialle/assets/146111332/1fcff325-8421-490b-a675-e5a940452236)

You can find the files described below [here](https://github.com/Vialladr/Integrator-project-Ferrand-Vialle_Final/tree/main/openfast-main/reg_tests/r-test/glue-codes/openfast/1.WP_1.5MW_IntegratorProject).
* model.**fst** : It is the main input file of the model. From there you regroup all the others input files, and choose general paramters like simulation time, time step, environmental conditions, etc.
* model_**Aerodyn.dat** : It regroups all the aerodynamic parameters of the wind turbine, outputs, and the corresponding files.
* model_**InflowWind.dat** : It regroups all the wind parameters, outputs and the corresponding files of generated wind. 
* model_**ElastoDyn.dat** : It regroups all the mechanical parameters (structure model, mass distribution, inertia, DoF, drivetrain, etc) and the corresponding files (blades, tower strucutre) and outputs.
* model_**ServoDyn.dat** : It regroups all the electrical and automatic control parameters (i.e generator parameters) and the correspondind outputs.

For each of this input files, you can write the outputs you want in the section "Outputs", generally at the bottom of the file. You cannot put any outputs in any files. For example, outputs linked to the generator are to be written in ServoDyn file, while outputs linked to wind are to be written in InflowWind file.


## Simulation with Matlab

The goal of the project was to use Matlab and Simulink with Openfast to easily integrate automatic control algorithm for the wind turbine, in our case, Degradation Aware Control (DAC).
Here will be explained our very basic Matlab and Simulink files to explain how to run the simulation.

















## Table of Contents
1. [General Info](#general-info)
2. [Technologies](#technologies)
3. [Installation](#installation)
4. [Collaboration](#collaboration)
5. [FAQs](#faqs)
### General Info
***
Write down the general informations of your project. It is worth to always put a project status in the Readme file. This is where you can add it. 
### Screenshot
![Image text](https://www.united-internet.de/fileadmin/user_upload/Brands/Downloads/Logo_IONOS_by.jpg)
## Technologies
***
A list of technologies used within the project:
* [Technologie name](https://example.com): Version 12.3 
* [Technologie name](https://example.com): Version 2.34
* [Library name](https://example.com): Version 1234
## Installation
***
A little intro about the installation. 
```
$ git clone https://example.com
$ cd ../path/to/the/file
$ npm install
$ npm start
```
Side information: To use the application in a special environment use ```lorem ipsum``` to start
## Collaboration
***
Give instructions on how to collaborate with your project.
> Maybe you want to write a quote in this part. 
> It should go over several rows?
> This is how you do it.
## FAQs
***
A list of frequently asked questions
1. **This is a question in bold**
Answer of the first question with _italic words_. 
2. __Second question in bold__ 
To answer this question we use an unordered list:
* First point
* Second Point
* Third point
