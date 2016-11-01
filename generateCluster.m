function [ cluster_locate ] = generateCluster( cluster_number,cell_radius )
% input cluster��������ĸ���
%       cell_radius��С���뾶
% output cluster_locate������������λ��
    cluster_locate = zeros(cluster_number,2);
    % �������ֱ�����꣬ȡ�ڰ뾶��Χ�ڵ������
    i=1;
    while i <= cluster_number
        temp = 2 * cell_radius * rand(1,2) - cell_radius;
        if (temp(1,1)^2+temp(1,2)^2)<cell_radius^2
            cluster_locate(i,:) = temp;
            i = i + 1;
        end
    end
end

