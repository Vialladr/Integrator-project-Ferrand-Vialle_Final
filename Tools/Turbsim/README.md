
## Turbsim

We learn how to use it [here](https://www.youtube.com/watch?v=UTsR-feCNhc), youtube video where someone show how to configure and run it. You can also use documentation and explaination from the git or the website.

## How TurbSim works:

Wind Field Simulation: TurbSim uses stochastic (random) models to simulate the wind field. It generates time-series data for wind speed, wind direction, and other relevant parameters at the location of interest.

Input Parameters: Users provide input parameters such as mean wind speed, turbulence intensity, wind shear, wind veer, and other atmospheric conditions. These parameters help define the characteristics of the generated wind data.

Models: TurbSim employs various models to simulate the complex behavior of wind. For instance, it uses the Kaimal spectrum or other spectral models to represent the turbulence characteristics in the generated wind data.

Output: The output of TurbSim is a time-series dataset that represents the synthetic wind conditions at the specified location over a defined period. This dataset can be used as input for simulations in wind turbine software like OpenFAST.

When coupled with OpenFAST, the generated wind data from TurbSim becomes the input to simulate how a wind turbine would perform under those specific wind conditions. This helps engineers and researchers in the wind energy industry to assess the performance, reliability, and efficiency of wind turbines in various wind conditions without having to rely solely on real-world data.

This synthetic data generation capability is crucial for testing and validating wind turbine designs and control strategies under different wind scenarios, as obtaining real-world wind data for all required conditions can be challenging or even impossible.
# TurbSim
A stochastic, full-field, turbulence simulator, primarialy for use with [InflowWind](https://nwtc.nrel.gov/InflowWind "InflowWind")-based simulation tools 

![turbsim2](https://github.com/Vialladr/Integrator-project-Ferrand-Vialle_Final/assets/146110958/e744aeef-514b-4f47-9809-73f095821b09)


**Authors**: Neil Kelley and [Bonnie Jonkman](mailto:bonnie.jonkman@nrel.gov), NREL

TurbSim is a stochastic, full-field, turbulent-wind simulator. It uses a statistical model (as opposed to a physics-based model) to 
numerically simulate time series of three-component wind-speed vectors at points in a two-dimensional vertical rectangular 
grid that is fixed in space. 

Spectra of velocity components and spatial coherence are defined in the frequency domain, and 
an inverse Fourier transform produces time series. The underlying theory behind this method of 
simulating time series assumes a stationary process.

![turbsim](https://github.com/Vialladr/Integrator-project-Ferrand-Vialle_Final/assets/146110958/bc5cc9bb-2d67-41ad-88eb-f27becd2aa9d)

For more information, please refer to documentation on the [TurbSim web site](https://nwtc.nrel.gov/TurbSim).

