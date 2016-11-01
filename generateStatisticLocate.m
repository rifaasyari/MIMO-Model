function [ statistic_locate ] = generateStatisticLocate( transmit_locate,...
    statistic_number,statistic_radius )
% input transmit_locate�����Ͷ�λ��
%       statistic_number��ͳ����������
%       statistic_radius��ͳ�����ݰ뾶
    statistic_locate = zeros(statistic_number,3);
    % �������ֱ�����꣬ȡ�ڰ뾶��Χ�ڵ������
    i=1;
    while i <= statistic_number
        temp = 2 * statistic_radius * rand(1,2) - statistic_radius;
        if (temp(1,1) ^ 2 + temp(1,2) ^ 2) < statistic_radius ^ 2
            statistic_locate(i,1:2) = temp + transmit_locate(1,1:2);
            i = i + 1;
        end
    end
    statistic_locate(:,3) = transmit_locate(1,3); %��ֵ�����
end

