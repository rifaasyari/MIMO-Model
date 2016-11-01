function [ H_NLOS ] = NLOS( cluster_average_power,rician_factor,cluster_number,...
    transmit_array_locate,transmit_antenna_index,transmit_antenna_number,...
    transmit_delta,receiver_antenna_index,receiver_antenna_number,...
    receiver_delta,receiver_array_beta,cluster_locate,transmit_phi,carrier_lambda )
% input
% output
    H_NLOS = sqrt(cluster_average_power / (rician_factor + 1)) * 1 / sqrt(cluster_number) * ...
    exp(1j * NLOS_phi(transmit_array_locate,transmit_antenna_number,...
    transmit_antenna_index,transmit_delta,receiver_antenna_number,...
    receiver_antenna_index,receiver_delta,receiver_array_beta,...
    cluster_locate,transmit_phi,carrier_lambda));
end


