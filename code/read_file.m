%% this function read data from file and return matrix grid

%% recv params:
% |file_name| is the (absolute or relative) path of the data file that you
% want to read
%% return params:
% |grid|      is a m x n matrix read from the content of the file
function grid = read_file(file_name)
    grid = load(file_name);
end