function [ output_args ] = plotRange( cluster_number,cluster_locate,observation_radius,cell_radius )
% ����ɢ����Ŀ�����Χ��С���Ŀɼ���Χ
% input: cluster_number��ɢ�������
%        cluster_locate��ɢ����λ��
%        observation_radius��ɢ����ɼ��뾶
%        cell_radius��С���뾶

    subplot(1,2,1); % ��ͼλ��
    
    % ɢ����ɼ���Χ
    plotClusterObservationRange( cluster_number,cluster_locate,observation_radius );

    % С����Χ
    plotCellRange( cell_radius )
end

