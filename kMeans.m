function [ class_index,centroids ] = kMeans( data,class_number,max_iters )
%
% input data��
%       class_number��
%       max_iters��
% output class_index��
%        centroids��
	locate = data(:,1:3); % ��ȡ������Ϣ
    train_data = data(:,4:end); % ��ȡ������Ϣ
    [sample_number,feature_number]=size(train_data); % sample_number�����ݸ�����feature_number������ά��
    max_feature = zeros(feature_number); % ÿһά������
    min_feature = zeros(feature_number); % ÿһά��С����
    initial_centroids = zeros(class_number,feature_number); % �����ʼ�������յ�����ÿһ�������λ��

% 1 �����������ÿһ��ά�ȵ�����
    for i=1:feature_number
        max_feature(i) = max(train_data(:,i)); % ÿһά������
        min_feature(i) = min(train_data(:,i)); % ÿһά��С����
        for j=1:class_number
            initial_centroids(j,i) = max_feature(i) + (min_feature(i) -...
                max_feature(i)) * rand(); % �����ʼ��������������ÿһά[min max]�г�ʼ����Щ
        end      
    end

% 2 ��Ϊÿһ��ά�ȶ�����ͬ�ķֲ�������һ��������������
%     max_feature = max(train_data(:,1));
%     min_feature = min(train_data(:,1));
%     for i=1:class_number
%         initial_centroids(i,1) = max_feature + (min_feature - max_feature) * rand();
%         for j=2:feature_number
%             initial_centroids(i,j) = initial_centroids(i,1);
%              % �����ʼ��������������ÿһά[min max]�г�ʼ����Щ 
%         end
%     end
    
% 3 ��������
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

