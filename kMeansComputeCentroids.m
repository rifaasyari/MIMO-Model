function [ centroids ] = kMeansComputeCentroids( train_data, class_index, class_number )
%
    epsilon = 0.05; % 指定异常值的概率范围
    class_data = cell(class_number,1); % 处理前各个类别的样本矩阵
    class_count = zeros(class_number,1); % 处理前各个类别的样本数目
    AD_class_data = cell(class_number,1); % 去除异常值后的各个类别的样本矩阵
    AD_class_count = zeros(class_number,1); % 去除异常值后的各个类别的样本数目
    
    [sample_number feature_number] = size(train_data); % 样本总数和特征数量
    centroids = zeros(class_number, feature_number); % 初始化返回值
    
    % 计算各个类别的样本数量
    for i=1:sample_number
        for j =1:class_number
            if class_index(i)==j
                class_count(j,1) = class_count(j,1) + 1;
            end
        end
    end
    
    % 生成各个类别的样本矩阵
    for i=1:class_number
        class_data{i} = zeros(class_count(i,1),feature_number); % 初始化各个类别的样本矩阵空间
        tmp = 1; % 临时计数变量
        for j=1:sample_number
            if class_index(j)==i
                class_data{i}(tmp,:) = train_data(j,:);
                tmp = tmp + 1;
            end
        end
    end
    
    % 差错检测
    for i = 1:class_number
        [ mu,sigma2 ] = ADestimateGaussian(class_data{i}); % 获取均值和方差
        p = ADmultivariateGaussian(class_data{i}, mu, sigma2); % 计算正常值概率
        
        % 计数正常值的样本个数
        for j = 1:class_count(i,1)
            if(p(j)>epsilon)
                AD_class_count(i,1) = AD_class_count(i,1) + 1;
            end
        end
        
        AD_class_data{i} = zeros(AD_class_count(i,1),feature_number); % 初始化去处异常值后的样本矩阵
        tmp = 1; % 计数变量
        
        % 生成去处异常值后的样本矩阵
        for j = 1:class_count(i,1)
            if(p(j)>epsilon)
                AD_class_data{i}(tmp,:) = class_data{i}(j,:);
                tmp = tmp + 1;
            end
        end
        centroids(i,:) = mean(AD_class_data{i});
    end
end