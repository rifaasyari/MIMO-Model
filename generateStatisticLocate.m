function [ statistic_locate ] = generateStatisticLocate( transmit_locate,...
    statistic_number,statistic_radius )
% input transmit_locate：发送端位置
%       statistic_number：统计数据数量
%       statistic_radius：统计数据半径
    statistic_locate = zeros(statistic_number,3);
    % 随机生成直角坐标，取在半径范围内的坐标点
    i=1;
    while i <= statistic_number
        temp = 2 * statistic_radius * rand(1,2) - statistic_radius;
        if (temp(1,1) ^ 2 + temp(1,2) ^ 2) < statistic_radius ^ 2
            statistic_locate(i,1:2) = temp + transmit_locate(1,1:2);
            i = i + 1;
        end
    end
    statistic_locate(:,3) = transmit_locate(1,3); %赋值发射角
end

