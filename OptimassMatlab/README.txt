For data processing.

Export scada page 'OptimassFinal'[trend tree] using jump to time. Do not scroll on trends to maintain timesteps in sync. Save the raw .csv file under TymMatlab2/ DO_NOT_EDIT_backup_OriginalScadasData.
File name: 'yyyy-mm-dd_scada'
Copy the file to Optimass Matlab/ CSV files. 

Log steady-state timestamps in 'timestamps.xl'

Typical one test per afternoon so up to 2 exports per day. Append '2' after scada for second test.

To import: run 'CreateMatlabDataBase' after checking time range.
Preprocessed database located in 'optimass Matlab/MatlabTestData'.

Run GetDataFromDataBase after checking time range. 

run importTimestamps
run createTimeFilter
run processData

Clean, steady state data is now stored as 'processed data' in the directory 'postProcessedData/<latest datenum>'. 

You can now plot variables as named in processData. 