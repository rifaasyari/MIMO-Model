function [ class_index,centroids ] = kMeans( data,class_number,max_iters )
%
% input data：
%       class_number：
%       max_iters：
% output class_index：
%        centroids：
	locate = data(:,1:3); % 提取坐标信息
    train_data = data(:,4:end); % 提取特征信息
    [sample_number,feature_number]=size(train_data); % sample_number是数据个数，feature_number是数据维数
    max_feature = zeros(feature_number); % 每一维最大的数
    min_feature = zeros(feature_number); % 每一维最小的数
    initial_centroids = zeros(class_number,feature_number); % 随机初始化，最终迭代到每一类的中心位置

% 1 随机生成中心每一个维度的数据
    for i=1:feature_number
        max_feature(i) = max(train_data(:,i)); % 每一维最大的数
        min_feature(i) = min(train_data(:,i)); % 每一维最小的数
        for j=1:class_number
            initial_centroids(j,i) = max_feature(i) + (min_feature(i) -...
                max_feature(i)) * rand(); % 随机初始化，不过还是在每一维[min max]中初始化好些
        end      
    end

% 2 认为每一个维度都是相同的分布，生成一个拷贝给其他的
%     max_feature = max(train_data(:,1));
%     min_feature = min(train_data(:,1));
%     for i=1:class_number
%         initial_centroids(i,1) = max_feature + (min_feature - max_feature) * rand();
%         for j=2:feature_number
%             initial_centroids(i,j) = initial_centroids(i,1);
%              % 随机初始化，不过还是在每一维[min max]中初始化好些 
%         end
%     end
    
% 3 均分区间
%     max_feature = max(train_data(:,1));
%     min_feature = min(train_data(:,1));
%     for i=1:class_number
%         initial_centroids(i,1) = max_feature + (min_feature - max_feature) *...
%             (i + 3) / (2 * class_number);
%         for j=2:feature_number
%             initial_centroids(i,j) = initial_centroids(i,1);
%         end
%     end
    
%    plot(initial_centroids(:,1),initial_centroids(:,2),'*','markersize',5);
    class_index = kMeansFindClosestCentroids(train_data, initial_centroids);
    centroids = kMeansComputeCentroids(train_data, class_index, class_number);
    [centroids, class_index] = kMeansRun(data, initial_centroids,max_iters, true);
end

