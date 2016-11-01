function [  ] = plotClusterObservationRange( cluster_number,cluster_locate,...
    observation_radius )
% ����ɢ����Ŀɼ���Χ
% input cluster_number�����������
%       cluster_locate������������
%       observation_distance��������ɼ��İ뾶
% �ֱ����ÿ��ɢ����Ŀɼ���Χ����ͼ��ʹ��Բ�α�ʾ
    palette = hsv(cluster_number + 1); % ������ɫ����
    for i=1:cluster_number
        head = cluster_locate(i,1) - observation_radius; % ������ʼ�������
        tail = cluster_locate(i,1) + observation_radius; % ������ֹ�������
        x_range = [head:0.01:tail,tail:-0.01:head]; % �������߷�Χ
        circle = zeros(size(x_range,2),1);
        circle(1:end / 2,1) = cluster_locate(i,2) + sqrt(observation_radius ^ 2 -...
            (x_range(1,1:end / 2) - cluster_locate(i,1)) .^ 2); % �����ϰ�Բ
        circle(end / 2 + 1:end,1) = cluster_locate(i,2) - sqrt(observation_radius ^ 2 -...
            (x_range(1,end / 2 + 1:end) -cluster_locate(i,1)) .^ 2); % �����°�Բ
        plot(x_range,circle,'color',palette(i,:),'LineWidth',2); % ��Բ
    end
end

