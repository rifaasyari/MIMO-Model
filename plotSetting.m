function [  ] = plotSetting( cell_radius )
% �趨ͼ�β���
    % 
    subplot(1,2,1)
    hold on;
    axis equal;
    axis([-cell_radius cell_radius -cell_radius cell_radius]);% �趨���귶Χ
    % 
    subplot(1,2,2)
    hold on;
    axis equal;
    axis([-cell_radius cell_radius -cell_radius cell_radius]);% �趨���귶Χ

end

