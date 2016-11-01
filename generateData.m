function [ data ] = generateData( transmit_number,transmit_locate,...
    statistic_number,statistic_radius,rician_factor,carrier_lambda,...
    cluster_average_power,cluster_number,observation_radius,cluster_locate,...
    transmit_antenna_number,transmit_delta,transmit_phi,...
    receiver_antenna_number,receiver_array_beta,receiver_delta )
% input transmit_number�����Ͷ�����
%       transmit_locate�����Ͷ�λ��
%       statistic_number��ͳ����������
%       statistic_radius��ͳ�����ݰ뾶
%       rician_factor
%       carrier_lambda
%       cluster_average_power
%       cluster_number
%       observation_radius
%       cluster_locate
%       transmit_antenna_number
%       transmit_delta
%       transmit_phi
%       receiver_antenna_number
%       receiver_array_beta
%       receiver_delta
% output data��ͳ������
    feature_number = 2 * receiver_antenna_number * transmit_antenna_number;
    data = zeros(transmit_number,feature_number);
    for i = 1:transmit_number
        statistic_locate = generateStatisticLocate(transmit_locate(i,:),...
            statistic_number,statistic_radius);
        statistic_channel_matrix = calculateChannelMatrix( rician_factor,...
            carrier_lambda,statistic_number,statistic_locate,...
            cluster_average_power,cluster_number,observation_radius,...
            cluster_locate,transmit_antenna_number,transmit_delta,...
            transmit_phi,receiver_antenna_number,receiver_array_beta,...
            receiver_delta);
        statistic_channel_vector_complex = zeros(statistic_number,feature_number / 2);
        for j = 1:statistic_number
            statistic_channel_vector_complex(j,:) =...
                reshape(statistic_channel_matrix(:,:,j),1,[]);
        end
        statistic_channel_vector = [real(statistic_channel_vector_complex),...
            imag(statistic_channel_vector_complex)];
        data(i,:) = std(statistic_channel_vector) .^ 2;
    end
    data = [transmit_locate,data];
end

