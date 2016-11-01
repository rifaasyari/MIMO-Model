function [  ] = plotDataPoints( data, class_index, class_number )
    %PLOTDATAPOINTS plots data points in X, coloring them so that those with the same
    %index assignments in idx have the same color
    %   PLOTDATAPOINTS(X, idx, K) plots data points in X, coloring them so that those 
    %   with the same index assignments in idx have the same color

    % Create palette
    palette = hsv(class_number + 1);
    colors = palette(class_index, :);

    % Plot the data
    scatter(data(:,1), data(:,2), 1, colors);

end