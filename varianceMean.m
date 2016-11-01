function [ var diff ] = varianceMean( variance_data,cluster_locate,class_number,observation_radius )
% �����Ӧ���򷽲��ֵ
% input variance_data��
%       cluster_locate��
%       class_number��
%       observation_radius��
    visual = zeros(1,class_number); %ͳ��ÿ��������ݸ���
    data = [variance_data,zeros(size(variance_data,1),1)];
    %ͳ�����, ��Ӧ���������ӣ��������һ�д洢���
    for i = 1:size(data,1)
        %�ɼ�1
        if((data(i,1) - cluster_locate(1,1)) ^ 2 + (data(i,2) - cluster_locate(1,2)) ^ 2 < observation_radius ^ 2)
            %�ɼ�2
            if((data(i,1) - cluster_locate(2,1)) ^ 2 + (data(i,2) - cluster_locate(2,2)) ^ 2 < observation_radius ^ 2)
                %�ɼ�3
                if((data(i,1) - cluster_locate(3,1)) ^ 2 + (data(i,2) - cluster_locate(3,2)) ^ 2 < observation_radius ^ 2)
                    %�ɼ�4
                    if((data(i,1) - cluster_locate(4,1)) ^ 2 + (data(i,2) - cluster_locate(4,2)) ^ 2 < observation_radius ^ 2)
                        visual(1,4) = visual(1,4) + 1;
                        data(i,end) = 4;
                    %���ɼ�4
                    else
                        visual(1,3) = visual(1,3) + 1;
                        data(i,end) = 3;
                    end
                %������3
                else
                    %�ɼ�4
                    if((data(i,1) - cluster_locate(4,1)) ^ 2 + (data(i,2) - cluster_locate(4,2)) ^ 2 < observation_radius ^ 2)
                        visual(1,3) = visual(1,3) + 1;
                        data(i,end) = 3;
                    %���ɼ�4
                    else
                        visual(1,2) = visual(1,2) + 1;
                        data(i,end) = 2;
                    end
                end
            %���ɼ�2
            else
                %�ɼ�3
                if((data(i,1) - cluster_locate(3,1)) ^ 2 + (data(i,2) - cluster_locate(3,2)) ^ 2 < observation_radius ^ 2)
                    %�ɼ�4
                    if((data(i,1) - cluster_locate(4,1)) ^ 2 + (data(i,2) - cluster_locate(4,2)) ^ 2 < observation_radius ^ 2)
                        visual(1,3) = visual(1,3) + 1;
                        data(i,end) = 3;
                    %���ɼ�4
                    else
                        visual(1,2) = visual(1,2) + 1;
                        data(i,end) = 2;
                    end
                %���ɼ�3
                else
                    %�ɼ�4
                    if((data(i,1) - cluster_locate(4,1)) ^ 2 + (data(i,2) - cluster_locate(4,2)) ^ 2 < observation_radius ^ 2)
                        visual(1,2) = visual(1,2) + 1;
                        data(i,end) = 2;
                    %���ɼ�4
                    else
                        visual(1,1) = visual(1,1) + 1;
                        data(i,end) = 1;
                    end
                end
            end
        %���ɼ�1
        else
            %�ɼ�2
            if((data(i,1) - cluster_locate(2,1)) ^ 2 + (data(i,2) - cluster_locate(2,2)) ^ 2 < observation_radius ^ 2)
                %�ɼ�3
                if((data(i,1) - cluster_locate(3,1)) ^ 2 + (data(i,2) - cluster_locate(3,2)) ^ 2 < observation_radius ^ 2)
                    %�ɼ�4
                    if((data(i,1) - cluster_locate(4,1)) ^ 2 + (data(i,2) - cluster_locate(4,2)) ^ 2 < observation_radius ^ 2)
                        visual(1,3) = visual(1,3) + 1;
                        data(i,end) = 3;
                    %���ɼ�4
                    else
                        visual(1,2) = visual(1,2) + 1;
                        data(i,end) = 2;
                    end
                %���ɼ�3
                else
                    %�ɼ�4
                    if((data(i,1) - cluster_locate(4,1)) ^ 2 + (data(i,2) - cluster_locate(4,2)) ^ 2 < observation_radius ^ 2)
                        visual(1,2) = visual(1,2) + 1;
                        data(i,end) = 2;
                    %���ɼ�4
                    else
                        visual(1,1) = visual(1,1) + 1;
                        data(i,end) = 1;
                    end
                end
            %���ɼ�2
            else
                %�ɼ�3
                if((data(i,1) - cluster_locate(3,1)) ^ 2 + (data(i,2) - cluster_locate(3,2)) ^ 2 < observation_radius ^ 2)
                    %�ɼ�4
                    if((data(i,1) - cluster_locate(4,1)) ^ 2 + (data(i,2) - cluster_locate(4,2)) ^ 2 < observation_radius ^ 2)
                        visual(1,2) = visual(1,2) + 1;
                        data(i,end) = 2;
                    %���ɼ�4
                    else
                        visual(1,1) = visual(1,1) + 1;
                        data(i,end) = 1;
                    end
                %���ɼ�3
                else
                    %�ɼ�4
                    if((data(i,1) - cluster_locate(4,1)) ^ 2 + (data(i,2) - cluster_locate(4,2)) ^ 2 < observation_radius ^ 2)
                        visual(1,1) = visual(1,1) + 1;
                        data(i,end) = 1;
                    %���ɼ�4
                    else
                        data(i,end) = 0;
                    end
                end
            end
        end
    end
    %���ݷ���洢
    for i = 1:class_number
        temp{i} = zeros(visual(1,i),size(data,2)-4);
    end
    index = ones(1,class_number); %��ʼ�����������
    %ת������������
    for i = 1:size(data,1)
        for j = 1:class_number
            if(data(i,end) == j)
                temp{j}(index(1,j),:) = data(i,4:end - 1);
                index(1,j) = index(1,j) + 1;
            end
        end
    end
    %���㷽��
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