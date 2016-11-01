function [  ] = plotCellRange( cell_radius )
% ����С����Χ
% input: cell_radius��С���뾶
    x_range = [-cell_radius:0.01:cell_radius,cell_radius:-0.01:-cell_radius]; %����С����Χ
    cell = zeros(size(x_range,2),1);
    cell(1:end / 2,1) = sqrt(cell_radius ^ 2 - x_range(1,1:end / 2) .^ 2); %С���ϰ�Բ
    cell(end / 2 + 1:end,1) = -sqrt(cell_radius ^ 2 - x_range(1,end / 2 + 1:end) .^ 2); %С���°�Բ
    plot(x_range,cell,'k','LineWidth',2); %��Բ
end

