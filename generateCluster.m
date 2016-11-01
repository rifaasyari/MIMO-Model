function [ cluster_locate ] = generateCluster( cluster_number,cell_radius )
% input cluster：反射体的个数
%       cell_radius：小区半径
% output cluster_locate：反射体坐标位置
    cluster_locate = zeros(cluster_number,2);
    % 随机生成直角坐标，取在半径范围内的坐标点
    i=1;
    while i <= cluster_number
        temp = 2 * cell_radius * rand(1,2) - cell_radius;
        if (temp(1,1)^2+temp(1,2)^2)<cell_radius^2
            cluster_locate(i,:) = temp;
            i = i + 1;
        end
    end
end

