function [ var,diff ] = varianceResultMean( data,class_index,class_number )
%
    visual = zeros(1,class_number); %统计每个类别数据个数
    data = [data,class_index];
    for i = 1:size(data,1)
        for j = 1:class_number
            if(data(i,end)==j - 1)
                visual(1,j) = visual(1,j) + 1;
            end
        end
    end
    %数据分类存储
    for i = 1:class_number
        temp{i} = zeros(visual(1,i),size(data,2)-4);
    end
    index = ones(1,class_number); %初始化各类别索引
    %转存各个类别数据
    for i = 1:size(data,1)
        for j = 1:class_number
            if(data(i,end) == j)
                temp{j}(index(1,j),:) = data(i,4:end - 1);
                index(1,j) = index(1,j) + 1;
            end
        end
    end
    %计算方差
    var = mean(temp{1});
    if (class_number > 1)
        for i = 2:class_number
            var = [var;mean(temp{i})];
        end
    end
    fprintf('variance result:\n');
    for i = 1:class_number
        fprintf('%d class: ',i);
        for j = 1:size(var,2)
            fprintf('%14.4f',var(i,j));
        end
        fprintf('\n');
    end
    diff = zeros(class_number,class_number);
    fprintf('differents between classes: \n');
    for i = 1:class_number
        for j = 1:class_number
            diff(i,j) = sum(abs((var(i,:) - var(j,:))));
            fprintf('%14.4f',diff(i,j));
        end
        fprintf('\n');
    end
end

