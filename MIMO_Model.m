%% MIMO Model Machine Learning
% ���ն�Ϊ������������λ��ԭ�㣨0��0��
% linear antenna 
% receiver locate (0,0)
%% 0. clear

% ����������������رմ��ڣ���������д�����Ϣ
clear; % �������������
close; % �رմ���
clc; % ��������д�����Ϣ

% ����׶�����
phase_name = 'Phase 0(clear and runtime setting)';

% �������в���
debug = 0; % ������Ϣ
pause_require = 0; % �׶εȴ�

% ��0�׶ν���
phaseComplete(pause_require,phase_name); % �׶ν�����Ϣ
%% 1. parameters setting

% ����׶�����
phase_name = 'Phase 1(parameters setting)';

% �����趨

% �������
cell_radius = 500; % С���뾶����λΪ��
rician_factor = 1.9953; % LOS Rician factor 3db
carrier_frequency = 1 * 10 ^ 9; % �ز�Ƶ��1GHz
carrier_lambda = 3 * 10 ^ 8 / carrier_frequency; % �ز�����

% ͳ�Ʋ����趨
statistic_radius = 10 * carrier_lambda; % ͳ�Ʒ�Χ����λΪ��
statistic_number = 100000; % ͳ����������

% �������
x_range = -cell_radius:0.01:cell_radius; % x�����귶Χ
y_range = -cell_radius:0.01:cell_radius; % y�����귶Χ

% ɢ�������
cluster_average_power = 0.1; % ɢ����ƽ������
cluster_number = 4; % cluster����
observation_radius = cell_radius * 0.8; % cluster�ɼ���Χ

% ���Ͳ���
transmit_antenna_number = 1; % ���Ͷ����߸���
transmit_number = 1000000; % ���Ͷ�����
transmit_delta = 0.2; % ���Ͷ����߼��
transmit_phi = 0; % ���Ͷ���λ

% ���ն˲���
receiver_antenna_number = 3; % ���ն����߸���
receiver_array_beta = pi * rand(1,1); % ���ն����߽�
receiver_delta = 0.2; % ���ն����߼��

% K-Means����
class_number = 4; % ������
max_iters = 50; % ����������

% ���Բ���ָ��
if debug
    receiver_array_beta = pi / 4; % ���ն����н��ս�ָ��Ϊpi/4
    cluster_number = 4; % ����������ƶ�Ϊ4
end

% ��1�׶ν���
phaseComplete(pause_require,phase_name); % �׶ν�����Ϣ
%% 2. generate clusters

% ����׶�����
phase_name = 'Phase 2(generate clusters)';

% ����ɢ����
cluster_locate = generateCluster( cluster_number,cell_radius );

% ���Բ���ָ��
if debug
    % ���ɢ�����������ޱ����ͬ
    cluster_locate=[200,200;-200,200;-200,-200;200,-200]; % �ƶ�������ֲ���λ��
end

% plot cluster observation range
% �趨ͼ�β���
plotSetting(cell_radius);

% ��ͼ
plotRange( cluster_number,cluster_locate,observation_radius,cell_radius );

% ��ɫ��ǲ�ͬ����
% plotAreaColor();

% ��2�׶ν���
phaseComplete(pause_require,phase_name); % �׶ν�����Ϣ
%% 3. generate transmit

% ����׶�����
phase_name = 'Phase 3(generate transmit)';

% generate
transmit_locate = generateTransmit( transmit_number,cell_radius );

% plot transmit distrabution
[ class_origin_index,class_origin_number ] = plotTransmitDistrabution( transmit_locate,cluster_locate,observation_radius );

% ��3�׶ν���
phaseComplete(pause_require,phase_name); % �׶ν�����Ϣ
%% 4. data generate

% ����׶�����
phase_name = 'Phase 4(generate transmit)';

% ��������
data = generateData( transmit_number,transmit_locate,statistic_number,...
    statistic_radius,rician_factor,carrier_lambda,cluster_average_power,...
    cluster_number,observation_radius,cluster_locate,transmit_antenna_number,...
    transmit_delta,transmit_phi,receiver_antenna_number,receiver_array_beta,...
    receiver_delta );

% ԭʼ���ݷ������
varianceResultMean( data,class_origin_index,class_origin_number );

% ��4�׶ν���
phaseComplete(pause_require,phase_name); % �׶ν�����Ϣ
%% 5. k-means

% ����׶�����
phase_name = 'Phase 5(k-means)';

% �����������
[ class_index,centroids ] = kMeans(data,class_origin_number,max_iters);

% ���෽�����
varianceResultMean( data,class_index,class_origin_number );

% ��5�׶ν���
phaseComplete(pause_require,phase_name); % �׶ν�����Ϣ