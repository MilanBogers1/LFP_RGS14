# LFP_RGS14

The secondary branch contains scripts secondary to core scripts and scripts very similar to the core scripts.
delta_features.m uses the Delta_Waves_Ratx mat-file produced by the Delta_analysis_Milan.m script which has to be loaded in manually. The script sets up for both delta_specs.m and delta_specs2.m.
delta_specs.m is a function of delta_features.m, it calculates the instant frequencies, average frequencies, amplitude, surface area under the peak, deltawave length, and peak-to=peak amplitude.
delta_specs2.m is a function that right now is used to create figures of the overlapping deltawaves, or create the variables needed to create the average waveform with standard deviatons.
Delta_Ratio_Mean_SD_RGS14.m returns the mean delta ratios obtained from Power_analysis_RGS14_Delta.m
Theta_Ratio_Mean_SD_RGS14.m returns the mean delta ratios obtained from Power_analysis_RGS14.m
Power_analysis_RGS14_Delta_Half_Epochs.m functions similarly to the other power analysis scripts, but splits up each NREM epoch in two and therefore produces two delta ratios.
Power_analysis_RGS14_Split_Delta.m functions similarly to the other power analysis scripts, but splits up the study day in PT1-4 and PT5 (both 3 hours long) and therefore produces two delta ratios.
Power_analysis_RGS14_Theta_Half_Epochs.m functions similarly to the other power analysis scripts, but splits up each NREM epoch in two and therefore produces two theta ratios.
Power_analysis_RGS14_Theta_Split.m functions similarly to the other power analysis scripts, but splits up the study day in PT1-4 and PT5 (both 3 hours long) and therefore produces two theta ratios.
