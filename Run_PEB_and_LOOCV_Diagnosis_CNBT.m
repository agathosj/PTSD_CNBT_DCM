%% This script will reproduce the main Dynamic Causal Modeling results for 
%% the Agathos et al. paper.

% Please ensure that your SPM12 folder is listed in your MATLAB set
% path. These results were obtained using MATLAB R2023b. Values may
% slightly differ from the manuscript depending on your OS and versions of
% MATLAB and SPM12.

% The first section runs Bayesian Model Reduction (BMR) on the estimated 
% full models whose data are saved in the GCM.mat file and generates the 
% results which have been visualized in Figure 4A.

% The second section runs a PEB model containing a parameter to quantify
% the effects of diagnostic group (PTSD vs Trauma-Exposed Control), which 
% are saved in M_PTSDvControl.mat, on each of the DCM modulatory {'B'} 
% pathways. Leave-one-out cross validation is used to predict diagnostic
% group from modulation of MPFC-to-MDT connectivity, which generates the 
% results depicted in Supplementary Figure SF1A. 

%% Load GCM & M.mat file and run BMR
clear
load('GCM.mat')
load('M_BMR.mat')

[PEB,P]=spm_dcm_peb(GCM, M, {'A','B'});
[BMA,BMR] = spm_dcm_peb_bmc(PEB);

spm_dcm_peb_review (BMA,GCM);

%% Run PEB and leave-one-out validation
load(['M_PTSDvControl.mat']); % This design matrix includes information 
                              % on participant diagnostic group 
                              % (PTSD v Trauma-Exposed Control)
M = struct ();
M.Q = 'all';
M.X = X;
M.Xnames = labels;

[PEB_PTSD, RCM_PTSD] = spm_dcm_peb (GCM , M ,{'B'});

[BMA_PTSD, BMR_PTSD]= spm_dcm_peb_bmc(PEB_PTSD);

spm_dcm_peb_review (BMA_PTSD ,GCM);

[qE ,qC ,Q] = spm_dcm_loo (GCM ,M, {'B(1,2,2)'} );
