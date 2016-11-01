function [  ] = plotClusterObservationRange( cluster_number,cluster_locate,...
    observation_radius )
% 画出散射体的可见范围
% input cluster_number：反射体个数
%       cluster_locate：反射体坐标
%       observation_distance：反射体可见的半径
% 分别计算每个散射体的可见范围，在图中使用圆形表示
    palette = hsv(cluster_number + 1); % 生成颜色向量
    for i=1:cluster_number
        head = cluster_locate(i,1) - observation_radius; % 计算起始点横坐标
        tail = cluster_locate(i,1) + observation_radius; % 计算终止点横坐标
        x_range = [head:0.01:tail,tail:-0.01:head]; % 计算曲线范围
        circle = zeros(size(x_range,2),1);
        circle(1:end / 2,1) = cluster_locate(i,2) + sqrt(observation_radius ^ 2 -...
            (x_range(1,1:end / 2) - cluster_locate(i,1)) .^ 2); % 区域上半圆
        circle(end / 2 + 1:end,1) = cluster_locate(i,2) - sqrt(observation_radius ^ 2 -...
            (x_range(1,end / 2 + 1:end) -cluster_locate(i,1)) .^ 2); % 区域下半圆
        plot(x_range,circle,'color',palette(i,:),'LineWidth',2); % 画圆
    end
end

