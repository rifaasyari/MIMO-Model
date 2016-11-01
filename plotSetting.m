function [  ] = plotSetting( cell_radius )
% 设定图形参数
    % 
    subplot(1,2,1)
    hold on;
    axis equal;
    axis([-cell_radius cell_radius -cell_radius cell_radius]);% 设定坐标范围
    % 
    subplot(1,2,2)
    hold on;
    axis equal;
    axis([-cell_radius cell_radius -cell_radius cell_radius]);% 设定坐标范围

end

