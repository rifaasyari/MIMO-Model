function [ transmit_locate ] = generateTransmit( transmit_number,cell_radius )
% input transmit_number�����Ͷ�����
%       cell_radius��С���뾶
% output transmit_locate�����Ͷ�λ�ò�����ǰ��Ԫ��Ϊ���꣬������Ԫ��Ϊ�����
    transmit_locate = zeros(transmit_number,3);
    % �������ֱ�����꣬ȡ�ڰ뾶��Χ�ڵ������
    % �ŵ㣺��Բ��ƽ���ֲ�
    % ȱ�㣺�����˼���ĸ��Ӷ�
    i=1;
    while i <= transmit_number
        temp = 2 * cell_radius * rand(1,2) - cell_radius;
        if (temp(1,1) ^ 2 + temp(1,2) ^ 2) < cell_radius ^ 2
            transmit_locate(i,1:2) = temp;
            i = i + 1;
        end
    end
    
    transmit_array_beta = pi * rand(transmit_number,1); %���Ͷ����߽�
    transmit_locate(:,3) = transmit_array_beta; %��ֵ�����
end

