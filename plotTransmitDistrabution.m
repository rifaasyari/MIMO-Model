function [ class_index,class_number ] = plotTransmitDistrabution( transmit_locate,cluster_locate,observation_radius )
% 
% 
    transmit_number = size(transmit_locate,1);
    class_index = zeros(transmit_number,1);
    for i = 1:transmit_number
        class_index(i,1) = sum((transmit_locate(i,1) - cluster_locate(:,1)) .^ 2 +...
            (transmit_locate(i,2) - cluster_locate(:,2)) .^ 2 < observation_radius ^ 2);
    end
    class_number = size(unique(class_index),1);
    scatter(transmit_locate(:,1),transmit_locate(:,2),1,class_index);
end

