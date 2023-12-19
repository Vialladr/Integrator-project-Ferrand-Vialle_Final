%% Mônica Spinola Felix Feb. 2023
%% Code for project of RUL control of WT
clear all
close all
load bianchi.mat
%% ---- Benchmark model -----

% Wind Turbine Parameters
R_r = 57.5 ; %m
A_r = R_r^2 * pi; %m^2
K_dt = 2.7e9;  %Nmrad-1
B_dt = 775.49; %Nmsrad-1
eta_dt = 1;
eta_gc = 1;
alpha_gc = 1/20e-3;
B_g= 45.6;
N_g = 1;
J = 55e6;
J_g = J;
J_r = J;
omega_n=11.11;
xi=0.6;
Ts=1/100;

% Wind parameters

% Defining operating points

v_0 = 7; %m/s
rho_r = 1.225; %kg/m-3
Cp_max = 0.4859;
lambda_opt = 8; 

%Cp_max=0.48;
%lambda_opt = 7.5; 


omegar_0 =  v_0*lambda_opt/R_r;% rad/s
omegag_0 = omegar_0; % rad/s
x0 = [omegar_0 omegag_0 (omegar_0-omegag_0)];

% Control benchmark
K_a = 0.5*rho_r*A_r;
Kc = K_a*eta_dt*R_r^3*Cp_max/lambda_opt^3;
Ta_0 =  0.5*rho_r*A_r*Cp_max*v_0^3/omegar_0;
Pa_0 = 0.5*rho_r*A_r*v_0^3*Cp_max




A = [ -B_dt/J B_dt/J -K_dt/J
     B_dt/J -B_dt/J K_dt/J
     1 -1 0];

B = [1/J 0; 0 -1/J ; 0 0 ];

C = [1 0 0; 0 1 0; 0 0 1] ;

