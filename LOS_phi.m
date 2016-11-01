function [ phi_LOS ] = LOS_phi( transmit_array_locate,transmit_antenna_index,...
    transmit_antenna_number,transmit_delta,transmit_phi,...
    receiver_antenna_index,receiver_antenna_number,receiver_delta,...
    receiver_array_beta,carrier_lambda )
% input transmit_array_locate£º
%       transmit_antenna_index£º
%       transmit_antenna_number£º
%       transmit_delta£º
%       transmit_phi£º
%       receiver_antenna_index£º
%       receiver_antenna_number£º
%       receiver_delta£º
%       receiver_array_beta£º
%       carrier_lambda£º
% output phi_LOS£º
    receiver_antenna_locate_r = abs(((receiver_antenna_number + 1) / 2 - receiver_antenna_index) * receiver_delta);
    if (receiver_antenna_number + 1) / 2 - receiver_antenna_index > 0
        receiver_antenna_locate_angle = receiver_array_beta;
    else
        receiver_antenna_locate_angle = pi + receiver_array_beta;
    end
    receiver_antenna_locate = [receiver_antenna_locate_r*cos(receiver_antenna_locate_angle),...
        receiver_antenna_locate_r*sin(receiver_antenna_locate_angle)];

    transmit_antenna_locate_r = abs(((transmit_antenna_number + 1) / 2 - transmit_antenna_index) * transmit_delta);
    if (transmit_antenna_number + 1) / 2 - receiver_antenna_index > 0
        transmit_antenna_locate_angle = transmit_array_locate(1,3);
    else
        transmit_antenna_locate_angle = pi + transmit_array_locate(1,3);
    end
    transmit_antenna_locate = [transmit_antenna_locate_r * cos(transmit_antenna_locate_angle) +...
        transmit_array_locate(1,1),...
        transmit_antenna_locate_r*sin(transmit_antenna_locate_angle) +...
        transmit_array_locate(1,2)];

    D_l_k = sqrt((transmit_antenna_locate(1,1) - receiver_antenna_locate(1,1)) ^ 2 +...
        (transmit_antenna_locate(1,2) - receiver_antenna_locate(1,2)) ^ 2);

    phi_LOS = transmit_phi + (2 * pi) / carrier_lambda * (D_l_k);
end

