%% this function recv a initial grid value and iterate it by laplace's
%% equation and return the result of iteration

%% recv params
% |value|          is initial matrix
% |roi|            is region that we interested to study, only points in the regoin
% will be updated
% |iteration_time| is the max iteration time. if times over it, stop
% iterating
% |precision|      is the condition of convergence, if discrepancy is
% smaller than the value, then stop iterating
%% return params
% |res|            is the result of this iteration method (jacobi iteration method)
% |it|             is elapsed iteration times
function [res, it] = iterate_method_A(value, roi, iteration_time, precision)
    
    % initialisation or judgement
    if nargin < 2
        error("at least value and roi are required")
    else
        if nargin < 3
            iteration_time = 500;
        end
        if nargin < 4
            precision = 0.001;
        end
    end
    
    % get the size of roi / value
    [m, n] = size(value);

    %% Method A, update all points in a single step (a step is a pass)
    % according to Jacobi iteration method
    % we can rewrite the laplace's equation into following view
    % next gen v = 1/4 (sum of neighbors of v)
    new_value = zeros([m, n]);
    for t = 1:iteration_time     % t means time for short
        % update all the point
        for r = 1:m
            for c = 1:n
                % check the current position is inside boundary or not
                % only when the current position is inside boundary we update
                % its value into new_value
                if roi(r, c) == -1
                    continue
                end
                % if the current position is on the boundary, we keep it into
                % the next iteration
                if roi(r, c) == 0
                    new_value(r, c) = value(r, c);
                    continue
                end
                % we assert that any point inside the boundary never be on the
                % edge of the matrix.
                % so those indexes r-1, r+1, c-1, c+1 are legal to get value 
                new_value(r, c) = (value(r-1, c) + value(r+1, c) + value(r, c-1) + value(r, c+1)) / 4;

            end
        end

        % calculate the discrepancy of value and new_value
        discrepancy = norm(new_value - value);
        
        % check the discrepancy is suitable or not
        % if it smaller than precision, then break loop
        if discrepancy < precision
            break
        end
        
        % print the current information
%         disp("iterating: " + t + " step(s). " + " current discrepancy: " + discrepancy + ".");
        
        % assign the new value to value, preparing for the next iteration
        value = new_value;
    end
    
    % return the result by method B and elapsed iteration times
    res = value;
    it = t;
end
