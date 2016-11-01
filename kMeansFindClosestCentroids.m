function [ class_index ] = kMeansFindClosestCentroids( train_data, centroids )
%
% input 
    K = size(centroids, 1);
    class_index = zeros(size(train_data,1), 1);
    for i = 1:size(train_data,1)
        min = inf;
        for j = 1:K
            if(sum((train_data(i,:)-centroids(j,:)) .^ 2) < min)
                min = sum((train_data(i,:)-centroids(j,:)) .^ 2);
                class_index(i)=j;
            end
        end
	end
end