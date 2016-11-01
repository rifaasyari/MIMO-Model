function [ output_args ] = plotRange( cluster_number,cluster_locate,observation_radius,cell_radius )
% 绘制散射体的看见范围和小区的可见范围
% input: cluster_number：散射体个数
%        cluster_locate：散射体位置
%        observation_radius：散射体可见半径
%        cell_radius：小区半径

    subplot(1,2,1); % 绘图位置
    
    % 散射体可见范围
    plotClusterObservationRange( cluster_number,cluster_locate,observation_radius );

    % 小区范围
    plotCellRange( cell_radius )
end

