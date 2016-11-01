%% MIMO Model Machine Learning
% 接收端为线性天线阵列位于原点（0，0）
% linear antenna 
% receiver locate (0,0)
%% 0. clear

% 清除工作区变量，关闭窗口，清除命令行窗口信息
clear; % 清除工作区变量
close; % 关闭窗口
clc; % 清除命令行窗口信息

% 定义阶段名称
phase_name = 'Phase 0(clear and runtime setting)';

% 设置运行参数
debug = 0; % 调试信息
pause_require = 0; % 阶段等待

% 第0阶段结束
phaseComplete(pause_require,phase_name); % 阶段结束信息
%% 1. parameters setting

% 定义阶段名称
phase_name = 'Phase 1(parameters setting)';

% 参数设定

% 传输参数
cell_radius = 500; % 小区半径，单位为米
rician_factor = 1.9953; % LOS Rician factor 3db
carrier_frequency = 1 * 10 ^ 9; % 载波频率1GHz
carrier_lambda = 3 * 10 ^ 8 / carrier_frequency; % 载波波长

% 统计参数设定
statistic_radius = 10 * carrier_lambda; % 统计范围，单位为米
statistic_number = 100000; % 统计数据数量

% 坐标参数
x_range = -cell_radius:0.01:cell_radius; % x轴坐标范围
y_range = -cell_radius:0.01:cell_radius; % y轴坐标范围

% 散射体参数
cluster_average_power = 0.1; % 散射体平均能量
cluster_number = 4; % cluster数量
observation_radius = cell_radius * 0.8; % cluster可见范围

% 发送参数
transmit_antenna_number = 1; % 发送端天线个数
transmit_number = 1000000; % 发送端数量
transmit_delta = 0.2; % 发送端天线间距
transmit_phi = 0; % 发送端相位

% 接收端参数
receiver_antenna_number = 3; % 接收端天线个数
receiver_array_beta = pi * rand(1,1); % 接收端天线角
receiver_delta = 0.2; % 接收端天线间距

% K-Means参数
class_number = 4; % 类别个数
max_iters = 50; % 最大迭代次数

% 调试参数指定
if debug
    receiver_array_beta = pi / 4; % 接收端阵列接收角指定为pi/4
    cluster_number = 4; % 反射体个数制定为4
end

% 第1阶段结束
phaseComplete(pause_require,phase_name); % 阶段结束信息
%% 2. generate clusters

% 定义阶段名称
phase_name = 'Phase 2(generate clusters)';

% 生成散射体
cluster_locate = generateCluster( cluster_number,cell_radius );

% 调试参数指定
if debug
    % 标记散射体编号与象限编号相同
    cluster_locate=[200,200;-200,200;-200,-200;200,-200]; % 制定反射体分布的位置
end

% plot cluster observation range
% 设定图形参数
plotSetting(cell_radius);

% 绘图
plotRange( cluster_number,cluster_locate,observation_radius,cell_radius );

% 着色标记不同区域
% plotAreaColor();

% 第2阶段结束
phaseComplete(pause_require,phase_name); % 阶段结束信息
%% 3. generate transmit

% 定义阶段名称
phase_name = 'Phase 3(generate transmit)';

% generate
transmit_locate = generateTransmit( transmit_number,cell_radius );

% plot transmit distrabution
[ class_origin_index,class_origin_number ] = plotTransmitDistrabution( transmit_locate,cluster_locate,observation_radius );

% 第3阶段结束
phaseComplete(pause_require,phase_name); % 阶段结束信息
%% 4. data generate

% 定义阶段名称
phase_name = 'Phase 4(generate transmit)';

% 生成数据
data = generateData( transmit_number,transmit_locate,statistic_number,...
    statistic_radius,rician_factor,carrier_lambda,cluster_average_power,...
    cluster_number,observation_radius,cluster_locate,transmit_antenna_number,...
    transmit_delta,transmit_phi,receiver_antenna_number,receiver_array_beta,...
    receiver_delta );

% 原始数据方差分析
varianceResultMean( data,class_origin_index,class_origin_number );

% 第4阶段结束
phaseComplete(pause_require,phase_name); % 阶段结束信息
%% 5. k-means

% 定义阶段名称
phase_name = 'Phase 5(k-means)';

% 迭代计算聚类
[ class_index,centroids ] = kMeans(data,class_origin_number,max_iters);

% 聚类方差分析
varianceResultMean( data,class_index,class_origin_number );

% 第5阶段结束
phaseComplete(pause_require,phase_name); % 阶段结束信息