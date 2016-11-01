function [ phi_NLOS ] = NLOS_phi( transmit_array_locate,transmit_antenna_number,...
    transmit_antenna_index,transmit_delta,receiver_antenna_number,...
    receiver_antenna_index,receiver_delta,receiver_array_beta,cluster_locate,...
    transmit_phi,carrier_lambda )
% input
% output
transmit_antenna_locate_r = abs(((transmit_antenna_number + 1) / 2 -...
    transmit_antenna_index) * transmit_delta);
if (transmit_antenna_number + 1) / 2 - transmit_antenna_index > 0
    transmit_antenna_locate_angle = transmit_array_locate(1,3);
else
    transmit_antenna_locate_angle = pi + transmit_array_locate(1,3);
end
transmit_antenna_locate = [transmit_antenna_locate_r * cos(transmit_antenna_locate_angle) +...
    transmit_array_locate(1,1),...
    transmit_antenna_locate_r*sin(transmit_antenna_locate_angle) +...
    transmit_array_locate(1,2)];
D_l_cluster = sqrt((transmit_antenna_locate(1,1) - cluster_locate(1,1)) ^ 2 +...
    (transmit_antenna_locate(1,2) - cluster_locate(1,2)) ^ 2);

receiver_antenna_locate_r = abs(((receiver_antenna_number + 1) / 2 -...
    receiver_antenna_index) * receiver_delta);
if (receiver_antenna_number + 1) / 2 - receiver_antenna_index > 0
    receiver_antenna_locate_angle = receiver_array_beta;
else
    receiver_antenna_locate_angle = pi + receiver_array_beta;
end
receiver_antenna_locate = [receiver_antenna_locate_r*cos(receiver_antenna_locate_angle),...
    receiver_antenna_locate_r*sin(receiver_antenna_locate_angle)];
D_k_cluster = sqrt(receiver_antenna_locate(1,1) ^ 2 + receiver_antenna_locate(1,2) ^ 2);

phi_NLOS = transmit_phi + (2 * pi) / carrier_lambda * (D_l_cluster + D_k_cluster);
end

