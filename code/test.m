
ROI_FILE_NAME = "ROI_3.txt";
BOUNDARY_VALUE_FILE_NAME = "bdry_Values_3.txt";

% roi = read_file(ROI_FILE_NAME);
% value = read_file(BOUNDARY_VALUE_FILE_NAME);

STORE_ROI_FILE_NAME = "ROI_3.xlsx";
STORE_BOUNDARY_VALUE_FILE_NAME = "bdry_Values_3.xlsx";

% writematrix(roi, STORE_ROI_FILE_NAME);
% writematrix(value, STORE_BOUNDARY_VALUE_FILE_NAME);

roi = readmatrix(STORE_ROI_FILE_NAME);
value = readmatrix(STORE_BOUNDARY_VALUE_FILE_NAME);

writematrix(roi, ROI_FILE_NAME, "Delimiter", ",");
writematrix(value,BOUNDARY_VALUE_FILE_NAME, "Delimiter", ",");


