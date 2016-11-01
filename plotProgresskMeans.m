function [  ] = plotProgresskMeans( data, centroids, previous, class_index, K, i )
%PLOTPROGRESSKMEANS is a helper function that displays the progress of 
%k-Means as it is running. It is intended for use only with 2D data.
%   PLOTPROGRESSKMEANS(X, centroids, previous, idx, K, i) plots the data
%   points with colors assigned to each centroid. With the previous
%   centroids, it also plots a line between the previous locations and
%   current locations of the centroids.
%

    % Plot the examples
    plotDataPoints(data, class_index, K);
    % Title
    title(sprintf('Iteration number %d', i))

end