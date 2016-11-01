function [  ] = plotCellRange( cell_radius )
% 画出小区范围
% input: cell_radius：小区半径
    x_range = [-cell_radius:0.01:cell_radius,cell_radius:-0.01:-cell_radius]; %计算小区范围
    cell = zeros(size(x_range,2),1);
    cell(1:end / 2,1) = sqrt(cell_radius ^ 2 - x_range(1,1:end / 2) .^ 2); %小区上半圆
    cell(end / 2 + 1:end,1) = -sqrt(cell_radius ^ 2 - x_range(1,end / 2 + 1:end) .^ 2); %小区下半圆
    plot(x_range,cell,'k','LineWidth',2); %画圆
end

