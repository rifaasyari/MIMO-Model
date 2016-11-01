function [ centroids ] = kMeansComputeCentroids( train_data, class_index, class_number )
%
    epsilon = 0.05; % ָ���쳣ֵ�ĸ��ʷ�Χ
    class_data = cell(class_number,1); % ����ǰ����������������
    class_count = zeros(class_number,1); % ����ǰ��������������Ŀ
    AD_class_data = cell(class_number,1); % ȥ���쳣ֵ��ĸ���������������
    AD_class_count = zeros(class_number,1); % ȥ���쳣ֵ��ĸ�������������Ŀ
    
    [sample_number feature_number] = size(train_data); % ������������������
    centroids = zeros(class_number, feature_number); % ��ʼ������ֵ
    
    % �������������������
    for i=1:sample_number
        for j =1:class_number
            if class_index(i)==j
                class_count(j,1) = class_count(j,1) + 1;
            end
        end
    end
    
    % ���ɸ���������������
    for i=1:class_number
        class_data{i} = zeros(class_count(i,1),feature_number); % ��ʼ������������������ռ�
        tmp = 1; % ��ʱ��������
        for j=1:sample_number
            if class_index(j)==i
                class_data{i}(tmp,:) = train_data(j,:);
                tmp = tmp + 1;
            end
        end
    end
    
    % �����
    for i = 1:class_number
        [ mu,sigma2 ] = ADestimateGaussian(class_data{i}); % ��ȡ��ֵ�ͷ���
        p = ADmultivariateGaussian(class_data{i}, mu, sigma2); % ��������ֵ����
        
        % ��������ֵ����������
        for j = 1:class_count(i,1)
            if(p(j)>epsilon)
                AD_class_count(i,1) = AD_class_count(i,1) + 1;
            end
        end
        
        AD_class_data{i} = zeros(AD_class_count(i,1),feature_number); % ��ʼ��ȥ���쳣ֵ�����������
        tmp = 1; % ��������
        
        % ����ȥ���쳣ֵ�����������
        for j = 1:class_count(i,1)
            if(p(j)>epsilon)
                AD_class_data{i}(tmp,:) = class_data{i}(j,:);
                tmp = tmp + 1;
            end
        end
        centroids(i,:) = mean(AD_class_data{i});
    end
end