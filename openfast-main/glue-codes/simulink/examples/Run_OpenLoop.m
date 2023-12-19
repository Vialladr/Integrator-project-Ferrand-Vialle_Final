% make sure the OpenFAST directory where the FAST_SFunc.mex* file is located
% is in the MATLAB path (also make sure any other OpenFAST library files that
% are needed are on the MATLAB path)
%    (relative path names are not recommended in addpath()):
% addpath('../../../build/bin'); % install location for Windows Visual Studio builds
% addpath(genpath('../../../install')); % cmake default install location

% these variables are defined in the OpenLoop model's FAST_SFunc block:
FAST_InputFileName = ['C:\Users\manip\Documents\Projet-Integrateur_Ferrand-Vialle' ...
    '\openfast-main\reg_tests\r-test\glue-codes\openfast\1.WP_1.5MW_IntegratorProject\WP_VSP_WTurb.fst'];
TMax               = 30; % seconds need to modified also in WP_VSP_WTurb.fst

sim('OpenLoop.mdl',[0,TMax]);

% Matlab2FAST(OutList,OutList,'AOC_Test')

%% plot Outputs in Outlist
PlotFASToutput({['C:\Users\manip\Documents\Projet-Integrateur_Ferrand-Vialle' ...
    '\openfast-main\reg_tests\r-test\glue-codes\openfast\1.WP_1.5MW_IntegratorProject\WP_VSP_WTurb.SFunc.outb']},{'SFunc','exe'});