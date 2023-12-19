%% Mônica Spinola Felix Feb. 2023
%% Code for project of RUL control of WT
clear all
close all
load simani.mat
%% ---- Benchmark model -----

% Wind Turbine Parameters
R_r = 57.5 ; %m
A_r = R_r^2 * pi; %m^2
Cp_max = 0.4554;
lambda_opt = 8;
omega_n = 11.11;
xi = 0.6;
Ts=1/100;


% Wind parameters
v_0 = 7; %m/s
r0 = 1.5;
rho_r = 1.225; %kg/m-3

% Drive train Parameters
K_dt = 2.7e9;  %Nmrad-1
B_dt = 775.49; %Nmsrad-1
B_r = 7.11;
B_g= 45.6;
N_g = 95;
J_g = 390; %kgm-2
J_r = 55e6;
eta_dt = 0.97;

% Generator Parameters

Constant_tau_gc = 100;
eta_gc = 0.98;
alpha_gc = 1/20e-3;

% Controller Pitch

K_i=1;
K_p=4;
Omega_nom = 162;
Omega_delta =15;
P_r=4.8e6;


% Defining operating points

omegar_0 =  v_0*lambda_opt/R_r; % rad/s
omegag_0 = omegar_0*1.01*N_g;%1.0*omegar_0*N_g; % rad/s
x0 = [omegar_0 omegag_0 (omegar_0-omegag_0/N_g)]

% Control benchmark
K_a = 0.5*rho_r*A_r;
Kc = 0.5*rho_r*A_r*eta_dt*R_r^3*Cp_max/lambda_opt^3
Ta_0 = 0.5*rho_r*A_r*R_r^3*omegar_0^2*Cp_max/lambda_opt^3
Pa_0 = 0.5*rho_r*A_r*v_0^3*Cp_max




A = [ -(B_dt+B_r)/J_r B_dt/N_g/J_r -K_dt/J_r
     eta_dt*B_dt/N_g/J_g -(eta_dt*B_dt/N_g^2+B_g)/J_g eta_dt*K_dt/N_g/J_g
     1 -1/N_g 0];

B = [1/J_r 0; 0 -1/J_g ; 0 0 ];

C = [1 0 0; 0 1/N_g 0; 0 0 1] ;

