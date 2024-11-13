## Cognitive restructuring and thalamocortical circuit alterations in posttraumatic stress disorder
This repository contains de-identified effective connectivity data and the scripts used to generate the main findings in the Agathos et al. manuscript.

This study investigated differences in effective connectivity of a thalamocortical brain network during cognitive restructuring of negative cognitions between people with PTSD and trauma-exposed controls, using dynamic causal modeling (DCM) of ultra-high-field 7-Tesla functional magnetic resonance imaging (fMRI) data.

## Main Results
The [Run_PEB_and_LOOCV_Diagnosis_CNBT.m](Run_PEB_and_LOOCV_Diagnosis_CNBT.m) script will reproduce the main DCM results comparing effective connectivity between PTSD patients and trauma-exposed controls during cognitive restructuring (discussed in-text and visualized in Figure 4A).

## Supplementary Results
The [Run_PEB_and_LOOCV_Diagnosis_CNBT.m](Run_PEB_and_LOOCV_Diagnosis_CNBT.m) script will also reproduce the leave-one-out cross-validation (LOOCV) results predicting diagnostic status from modulation of MPFC-to-MDT connectivity during cognitive restructuring (Supplementary Figure SF1A).

The [Run_LOOCV_PTCI.m](Run_LOOCV_PTCI.m) script will reproduce the LOOCV results predicting posttraumatic cognitions in the PTSD group from modulation of MPFC-to-MDT connectivity during cognitive restructuring (Supplementary Figure SF1B-E).

## Notes
* Due to their large file size, the GCM files which contain subject-level DCM estimates ([GCM.mat](GCM.mat) for the main DCM analyses; [PTSD_GCM_PTCI.mat](PTSD_GCM_PTCI.mat) for supplementary LOOCV analyses within the PTSD group) should be downloaded separately and placed in the same directory as the .m script files.
