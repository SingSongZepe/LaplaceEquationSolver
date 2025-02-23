%% This function visualise a matrix in 3D view
%% while x and y axis is the grid, and value of z axis represent the value of corresponding position in grid matrix

%% recv params:
% |matrix| is a m x n size matrix
% |name|   is the title of the graph title
%% return params:
% do not return
function plot_grid(matrix, name)  
    % Check if the input is a valid matrix  

    if nargin < 1
        error("at least matrix input is required.");
    elseif nargin < 2
        name = "value of matrix";
    end

    if isempty(matrix)  
        error('Input matrix is empty.');  
    end  

    % Get the size of the matrix  
    [rows, cols] = size(matrix);  
    
    % Create a grid of x and y coordinates  
    [X, Y] = meshgrid(1:cols, 1:rows);  
    
    % Create the 3D surface plot  
    figure; % Open a new figure window  
    surf(X, Y, matrix); % Plot the surface  

    % Add labels and title  
    xlabel('X Axis');  
    ylabel('Y Axis');  
    zlabel('Z Axis');  
    title(name);  
    
    % Optionally, adjust the view angle  
    view(2);  % Set a nice viewing angle  
    colorbar;      % Add a colorbar to indicate the scale  
    grid on;       % Turn the grid on  
end