%% This script will reproduce the results from Supplementary Figure 
%% SF1B-E in the Agathos et al. paper.

% Please ensure that your SPM12 folder is listed in your MATLAB set
% path. These results were obtained using MATLAB R2023b. Values may
% slightly differ from the manuscript depending on your OS and versions of
% MATLAB and SPM12.

% This script runs leave-one-out cross-validation to predict the severity
% of PTSD participants' posttraumatic cognitions, measured by 
% Posttraumatic Cognitions Inventory (PTCI) total and subscale scores,
% from modulation of MPFC-to-MDT connectivity. This produces the results
% depicted in Supplementary Figure SF1B-E.

%% Load GCM and M.mat files
clear
load('PTSD_GCM_PTCI.mat')
load('PTSD_M_BMR_PTCI.mat')
%% Load PTCI (sub)scale;
% Each of these files contains participant scores for the PTCI and its subscales:
% Substitute the (sub)scale of interest below:

%M_PTCI_PTSD.mat = Total PTCI scores; Figure SF1B
%M_PTCIworld_PTSD.mat = World subscale scores; 
%M_PTCIself_PTSD.mat = Self subscale scores; 
%M_PTCIselfblame_PTSD.mat = Self-blame subscale scores; 

load(['M_PTCI_PTSD.mat']);
%% Run leave-one-out cross validation
M = struct ();
M.Q = 'all';
M.X = X;
M.Xnames = labels;

[qE ,qC ,Q] = spm_dcm_loo (GCM ,M, {'B(1,2,2)'} );