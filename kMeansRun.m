function [ centroids, class_index ] = kMeansRun( data, initial_centroids, ...
                                      max_iters, plot_progress )
    if ~exist('plot_progress', 'var') || isempty(plot_progress)
        plot_progress = false;
    end

    % Plot the data if we are plotting progress
    if plot_progress
        subplot(1,2,2);
        hold on;
    end

    % Initialize values
    locate = data(:,1:3);
    train_data = data(:,4:end);
    [sample_number feature_number] = size(train_data);
    class_number = size(initial_centroids, 1);
    centroids = initial_centroids;
    previous_centroids = centroids;
    class_index = zeros(sample_number, 1);

    % Run K-Means
    for i=1:max_iters
        % Output progress
        fprintf('K-Means iteration %d/%d...\n', i, max_iters);
        if exist('OCTAVE_VERSION')
            fflush(stdout);
        end
        % For each example in X, assign it to the closest centroid
        class_index = kMeansFindClosestCentroids(train_data, centroids);
        % Optionally, plot progress here
        if plot_progress
            plotProgresskMeans(data, centroids, previous_centroids, class_index, class_number, i);
            previous_centroids = centroids;
            fprintf('Press enter to continue.\n');
            pause;
        end

        % Given the memberships, compute new centroids
        centroids = kMeansComputeCentroids(train_data, class_index, class_number);
    end

    % Hold off if we are plotting progress
    if plot_progress
        hold off;
    end

end

