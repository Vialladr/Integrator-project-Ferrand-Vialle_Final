%% Documentation

% Script to post-process several linearization files generated by different OpenFAST simulations.
% 
% For the full generation of input file/run and postprocessing see the script runCampbell.m
% 
% Each OpenFAST simulation is considered to be at a different operating point (OP).
% Typically, this is run for several wind speed/RPM.
% A Campbell diagram is plotted, showing the frequencies and damping of each modes for each operating point.
% An attempt to identify the turbine modes is done by the script, but a manual sorting is usually needed.
% This is done by opening the csv file generated (Campbell_ModesID.csv), and changing the indices. 
% The "plot call" at the end of the script can then be repeated with the updated csv file.
%
% NOTE: This script is only an example. 
%       The example data is suitable for OpenFAST 2.5.
%     
% Adapt this script to your need, by calling the different subfunctions presented.
%
%% Initialization
clear all; close all; clc; 
restoredefaultpath;
addpath(genpath('C:/Work/FAST/matlab-toolbox')); % TODO adapt me

%% Parameters

% Main Flags
postproLin    = logical(1); % Postprocess .lin files, perform MBC, and write XLS or CSV files
outputFormat  ='CSV';       % Output format XLS, or CSV
% Main Inputs
simulationFolder    = '../../_ExampleData/5MW_Land_Lin/';
%      Folder where OpenFAST simulations will be run for the linearization.
%      OpenFAST input files for each operating point will be created there.
%      Should contain all the necessary files for a OpenFAST simulation.
%      Will be created if does not exists.

operatingPointsFile = 'LinearizationPoints_NoServo.csv'; 
%      File defining the operating conditions for linearization (e.g. RotorSpeeed, WindSpeed).
%      If special filenames are needed, the filenames can be defined in this file as well.
%      See function `readOperatingPoints` for more info.
%      You can define this data using a matlab structure, but an input file is recommended.
   

%% --- Step 3: Run MBC, identify modes and generate XLS or CSV file
% NOTE:  
%      Select CSV output format if XLS is not available
%        - XLS: one output file is generated (existing sheets will be overriden, not new sheets)
%        - CSV: several output files are generated
%      The mode identification currently needs manual tuning (modes might be swapped): 
%        - XLS: modify the `ModesID` sheet of the Excel file generated to do this tuning
%        - CSV: modify the csv file `*_ModesID.csv` if you chose CSV output.
%      To avoid the manual identification to be overriden, you can: 
%        - XLS: use a new sheet , e.g. 'ModesID_Sorted` and use this in Step 4
%        - CSV: create a new file, e.g. 'Campbell_ModesID_Sorted.csv` and this for step 4
if postproLin
    [ModesData, outputFiles] = postproLinearization(simulationFolder, operatingPointsFile, outputFormat);
end


%% --- Step 4: Campbell diagram plot
if isequal(lower(outputFormat),'xls')

    %  NOTE: more work is currently needed for the function below
    plotCampbellData([simulationFolder '/Campbell_DataSummary.xlsx'], 'WS_ModesID');

elseif isequal(lower(outputFormat),'csv')

    % python script is used for CSV (or XLS)
    fprintf('\nUse python script to visualize CSV data: \n\n')
    fprintf('usage:  \n')
    fprintf('python plotCampbellData.py XLS_OR_CSV_File [WS_OR_RPM] [sheetname]\n\n')
    fprintf('\n')
    fprintf('for instance:  python plotCampbellData.py Campbell_ModesID.csv \n')

end
