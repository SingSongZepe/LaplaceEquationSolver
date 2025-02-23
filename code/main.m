clc; clear;

%% some constant string or value
ROI_FILE_NAME = "ROI_3.txt";
BOUNDARY_VALUE_FILE_NAME = "bdry_Values_3.txt";

DO_PLOT_INPUT = 1;
DO_PLOT_OUTPUT = 1;

%% Some hyperparameters
ITERATION_TIME = 5000;
PRECISION = 0.001;

%% main content of the algorithm

% read in data
roi = read_file(ROI_FILE_NAME);
value = read_file(BOUNDARY_VALUE_FILE_NAME);

% visualise the read-in data
if DO_PLOT_INPUT
    plot_grid(roi, "ROI");
    plot_grid(value, "Current Value");
end

% start iterate the value
tic % start timer
[res_method_A, it_method_A] = iterate_method_A(value, roi, ITERATION_TIME, PRECISION);
elapsed_time_method_A = toc; % collect the time it spent

tic % start timer
[res_method_B, it_method_B]= iterate_method_B(value, roi, ITERATION_TIME, PRECISION);
elapsed_time_method_B = toc;

% visualise the result of iteration
if DO_PLOT_OUTPUT
    plot_grid(res_method_A, "Result Value by Method A");
    plot_grid(res_method_B, "Result Value by Method B");
end

% print some message comparing the performance of two methods
disp("method A use iteration time: " + it_method_A + " and elapsed time: " + elapsed_time_method_A + " to get the precision: " + PRECISION);
disp("method B use iteration time: " + it_method_B + " and elapsed time: " + elapsed_time_method_B + " to get the precision: " + PRECISION);

writematrix(res_method_A, "file.xlsx");
%% end main content of the algorithm

