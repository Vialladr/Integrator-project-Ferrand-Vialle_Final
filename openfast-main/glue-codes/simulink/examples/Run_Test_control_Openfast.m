% make sure the OpenFAST directory where the FAST_SFunc.mex* file is located
% is in the MATLAB path (also make sure any other OpenFAST library files that
% are needed are on the MATLAB path)
%    (relative path names are not recommended in addpath()):
% addpath('../../../build/bin'); % install location for Windows Visual Studio builds
% addpath(genpath('../../../install')); % cmake default install location

close all

% these variables are defined in the OpenLoop model's FAST_SFunc block:

FAST_InputFileName = ['C:\Users\manip\Documents\Projet-Integrateur_Ferrand-Vialle' ...
    '\openfast-main\reg_tests\r-test\glue-codes\openfast\1.WP_1.5MW_IntegratorProject\WP_VSP_WTurb.fst'];

TMax=500; % seconds need to modified also in WP_VSP_WTurb.fst

C=zeros(30,30);
C(2:5,2:5)=eye(4);
C(28:30,28:30)=eye(3); % observer les données qui nous interessent

% Cp et lambda optimal
Cpmax=0.465813666582108;
Lambda_opt=6.443736553192139;

% Controller gain
rho_air=1.225;
R=70/2;
A=pi*R*R;
GBRatio=87,965;
K=0.5*rho_air*A*R*R*R*Cpmax/(Lambda_opt*Lambda_opt*Lambda_opt)
Bdt = 4.83e8;
%% 
% Simulation
sim('Test_control_Openfast.slx',[0,TMax]);

% Matlab2FAST(OutList,OutList,'AOC_Test')

%% plot
PlotFASToutput({['C:\Users\manip\Documents\Projet-Integrateur_Ferrand-Vialle' ...
    '\openfast-main\reg_tests\r-test\glue-codes\openfast\1.WP_1.5MW_IntegratorProject\WP_VSP_WTurb.SFunc.outb']},{'SFunc','exe'});
