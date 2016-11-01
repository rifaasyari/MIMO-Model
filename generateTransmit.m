function [ transmit_locate ] = generateTransmit( transmit_number,cell_radius )
% input transmit_number：发送端数量
%       cell_radius：小区半径
% output transmit_locate：发送端位置参数，前两元素为坐标，第三个元素为发射角
    transmit_locate = zeros(transmit_number,3);
    % 随机生成直角坐标，取在半径范围内的坐标点
    % 优点：在圆内平均分布
    % 缺点：增加了计算的复杂度
    i=1;
    while i <= transmit_number
        temp = 2 * cell_radius * rand(1,2) - cell_radius;
        if (temp(1,1) ^ 2 + temp(1,2) ^ 2) < cell_radius ^ 2
            transmit_locate(i,1:2) = temp;
            i = i + 1;
        end
    end
    
    transmit_array_beta = pi * rand(transmit_number,1); %发送端天线角
    transmit_locate(:,3) = transmit_array_beta; %赋值发射角
end

