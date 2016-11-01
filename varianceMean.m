function [ var diff ] = varianceMean( variance_data,cluster_locate,class_number,observation_radius )
% 计算对应区域方差均值
% input variance_data：
%       cluster_locate：
%       class_number：
%       observation_radius：
    visual = zeros(1,class_number); %统计每个类别数据个数
    data = [variance_data,zeros(size(variance_data,1),1)];
    %统计类别, 对应类别个数增加，数据最后一列存储类别
    for i = 1:size(data,1)
        %可见1
        if((data(i,1) - cluster_locate(1,1)) ^ 2 + (data(i,2) - cluster_locate(1,2)) ^ 2 < observation_radius ^ 2)
            %可见2
            if((data(i,1) - cluster_locate(2,1)) ^ 2 + (data(i,2) - cluster_locate(2,2)) ^ 2 < observation_radius ^ 2)
                %可见3
                if((data(i,1) - cluster_locate(3,1)) ^ 2 + (data(i,2) - cluster_locate(3,2)) ^ 2 < observation_radius ^ 2)
                    %可见4
                    if((data(i,1) - cluster_locate(4,1)) ^ 2 + (data(i,2) - cluster_locate(4,2)) ^ 2 < observation_radius ^ 2)
                        visual(1,4) = visual(1,4) + 1;
                        data(i,end) = 4;
                    %不可见4
                    else
                        visual(1,3) = visual(1,3) + 1;
                        data(i,end) = 3;
                    end
                %不看见3
                else
                    %可见4
                    if((data(i,1) - cluster_locate(4,1)) ^ 2 + (data(i,2) - cluster_locate(4,2)) ^ 2 < observation_radius ^ 2)
                        visual(1,3) = visual(1,3) + 1;
                        data(i,end) = 3;
                    %不可见4
                    else
                        visual(1,2) = visual(1,2) + 1;
                        data(i,end) = 2;
                    end
                end
            %不可见2
            else
                %可见3
                if((data(i,1) - cluster_locate(3,1)) ^ 2 + (data(i,2) - cluster_locate(3,2)) ^ 2 < observation_radius ^ 2)
                    %可见4
                    if((data(i,1) - cluster_locate(4,1)) ^ 2 + (data(i,2) - cluster_locate(4,2)) ^ 2 < observation_radius ^ 2)
                        visual(1,3) = visual(1,3) + 1;
                        data(i,end) = 3;
                    %不可见4
                    else
                        visual(1,2) = visual(1,2) + 1;
                        data(i,end) = 2;
                    end
                %不可见3
                else
                    %可见4
                    if((data(i,1) - cluster_locate(4,1)) ^ 2 + (data(i,2) - cluster_locate(4,2)) ^ 2 < observation_radius ^ 2)
                        visual(1,2) = visual(1,2) + 1;
                        data(i,end) = 2;
                    %不可见4
                    else
                        visual(1,1) = visual(1,1) + 1;
                        data(i,end) = 1;
                    end
                end
            end
        %不可见1
        else
            %可见2
            if((data(i,1) - cluster_locate(2,1)) ^ 2 + (data(i,2) - cluster_locate(2,2)) ^ 2 < observation_radius ^ 2)
                %可见3
                if((data(i,1) - cluster_locate(3,1)) ^ 2 + (data(i,2) - cluster_locate(3,2)) ^ 2 < observation_radius ^ 2)
                    %可见4
                    if((data(i,1) - cluster_locate(4,1)) ^ 2 + (data(i,2) - cluster_locate(4,2)) ^ 2 < observation_radius ^ 2)
                        visual(1,3) = visual(1,3) + 1;
                        data(i,end) = 3;
                    %不可见4
                    else
                        visual(1,2) = visual(1,2) + 1;
                        data(i,end) = 2;
                    end
                %不可见3
                else
                    %可见4
                    if((data(i,1) - cluster_locate(4,1)) ^ 2 + (data(i,2) - cluster_locate(4,2)) ^ 2 < observation_radius ^ 2)
                        visual(1,2) = visual(1,2) + 1;
                        data(i,end) = 2;
                    %不可见4
                    else
                        visual(1,1) = visual(1,1) + 1;
                        data(i,end) = 1;
                    end
                end
            %不可见2
            else
                %可见3
                if((data(i,1) - cluster_locate(3,1)) ^ 2 + (data(i,2) - cluster_locate(3,2)) ^ 2 < observation_radius ^ 2)
                    %可见4
                    if((data(i,1) - cluster_locate(4,1)) ^ 2 + (data(i,2) - cluster_locate(4,2)) ^ 2 < observation_radius ^ 2)
                        visual(1,2) = visual(1,2) + 1;
                        data(i,end) = 2;
                    %不可见4
                    else
                        visual(1,1) = visual(1,1) + 1;
                        data(i,end) = 1;
                    end
                %不可见3
                else
                    %可见4
                    if((data(i,1) - cluster_locate(4,1)) ^ 2 + (data(i,2) - cluster_locate(4,2)) ^ 2 < observation_radius ^ 2)
                        visual(1,1) = visual(1,1) + 1;
                        data(i,end) = 1;
                    %不可见4
                    else
                        data(i,end) = 0;
                    end
                end
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
    fprintf('mean variance:\n');
    for i = 1:class_number
        fprintf('%d cluster: ',i);
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