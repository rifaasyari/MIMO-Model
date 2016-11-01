function [  ] = plotAreaColor(  )
% �Բ�ͬ��������ɫ
    % �󽻵�
    intersection_cell_cluster = fsolve('intersectionFunctionCellCluster',...
        [0,500],optimset('Display','off')); % (70.0664,495.0664)
    intersection_towards_cluster = fsolve('intersectionFunctionTowardsCluster',...
        [200,200],optimset('Display','off')); % (200,200)
    intersection_neighbor_cluster = fsolve('intersectionFunctionNeighborCluster',...
        [0,100],optimset('Display','off')); % (0,146.4102)
    % ��ͬ������ɫ
    colors = hsv(5); %��ɫ����
   
    % �ɼ�һ��ɢ���������
    first_head = intersection_cell_cluster(1);
    first_tail = intersection_towards_cluster(1);
    second_head = intersection_towards_cluster(1);
    second_tail = intersection_cell_cluster(2);
    third_head = intersection_cell_cluster(2);
    third_tail = intersection_cell_cluster(1);
    
    first_edge = [first_head,ceil(first_head):first_tail]; % ��һ��������
    secong_edge = [second_head:floor(second_tail),second_tail]; % �ڶ���������
    third_edge = [third_head,floor(third_head):-1:ceil(third_tail),third_tail]; % ������������
    
    x_one_cluster = [first_edge,secong_edge,third_edge];
    y_one_cluster = zeros(1,size(x_one_cluster,2));
    
    first_begin = 1; % ��һ��������������ʼλ��
    first_end = size(first_edge,2); % ��һ����������������λ��
    second_begin = first_end + 1; % �ڶ���������������ʼλ��
    second_end = size(first_edge,2) + size(secong_edge,2); % �ڶ�����������������λ��
    third_begin = second_end + 1; %������������������ʼλ��
    third_end = size(x_one_cluster,2); %��������������������λ��
    
    y_one_cluster(1,first_begin:first_end) = sqrt(400 ^ 2 - (x_one_cluster(1,first_begin:first_end) + 200) .^ 2) + 200;
    y_one_cluster(1,second_begin:second_end) = sqrt(400 ^ 2 - (x_one_cluster(1,second_begin:second_end) - 200) .^ 2) - 200;
    y_one_cluster(1,third_begin:third_end) =sqrt(500 ^ 2 - x_one_cluster(1,third_begin:third_end) .^ 2);
    
    %��һ����
    fill(x_one_cluster,y_one_cluster,colors(1,:));
    %�ڶ�����
    fill(-x_one_cluster,y_one_cluster,colors(1,:));
    %��������
    fill(-x_one_cluster,-y_one_cluster,colors(1,:));
    %��������
    fill(x_one_cluster,-y_one_cluster,colors(1,:));
    
    %�ɼ�����ɢ���������
    first_head = intersection_neighbor_cluster(1);
    first_tail = intersection_towards_cluster(1);
    second_head = intersection_towards_cluster(1);
    second_tail = intersection_cell_cluster(1);
    third_head = intersection_cell_cluster(1);
    third_tail = -intersection_cell_cluster(1);
    fourth_head = -intersection_cell_cluster(1);
    fourth_tail = -intersection_towards_cluster(1);
    fifth_head = -intersection_towards_cluster(1);
    fifth_tail = intersection_neighbor_cluster(1);
    
    first_edge = first_head:first_tail; % ��һ��������
    second_edge = [second_head:-1:ceil(second_tail),second_tail]; % �ڶ���������
    third_edge = [third_head,floor(third_head):-1:ceil(third_tail),third_tail]; % ������������
    fourth_edge = [fourth_head,floor(fourth_head):-1:fourth_tail]; % ���Ĳ�������
    fifth_edge = fifth_head:fifth_tail; % ���岿������
    
    x_two_cluster = [first_edge,second_edge,third_edge,fourth_edge,fifth_edge];
    y_four_cluster = zeros(1,size(x_two_cluster,2));
    
    first_begin = 1;
    first_end = size(first_edge,2);
    second_begin = first_end + 1;
    second_end = size(first_edge,2) + size(second_edge,2);
    third_begin = second_end + 1;
    third_end = size(first_edge,2) + size(second_edge,2) + size(third_edge,2);
    fourth_begin = third_end + 1;
    fourth_end = size(first_edge,2) + size(second_edge,2) + size(third_edge,2) + size(fourth_edge,2);
    fifth_begin = fourth_end + 1;
    fifth_end = size(x_two_cluster,2);
    
    y_four_cluster(1,first_begin:first_end) =...
        sqrt(400 ^ 2 - (x_two_cluster(1,first_begin:first_end) - 200) .^ 2) - 200;
    y_four_cluster(1,second_begin:second_end) =...
        sqrt(400 ^ 2 - (x_two_cluster(1,second_begin:second_end) + 200) .^ 2) + 200;
    y_four_cluster(1,third_begin:third_end) =...
        sqrt(500^2 - x_two_cluster(1,third_begin:third_end) .^ 2);
    y_four_cluster(1,fourth_begin:fourth_end) =...
        sqrt(400 ^ 2 - (x_two_cluster(1,fourth_begin:fourth_end) - 200) .^ 2) + 200;
    y_four_cluster(1,fifth_begin:fifth_end) =...
        sqrt(400 ^ 2 - (x_two_cluster(1,fifth_begin:fifth_end) + 200) .^ 2) - 200;

    %��һ������
    fill(x_two_cluster,y_four_cluster,colors(2,:));
    %�ڶ�������
    fill(-y_four_cluster,x_two_cluster,colors(2,:));
    %����������
    fill(x_two_cluster,-y_four_cluster,colors(2,:));
    %��һ������
    fill(y_four_cluster,x_two_cluster,colors(2,:));
    %�ɼ�����ɢ����
    
    first_head = intersection_neighbor_cluster(1);
    first_tail = intersection_neighbor_cluster(2);
    second_head = intersection_neighbor_cluster(2);
    second_tail = intersection_towards_cluster(1);
    third_head = intersection_towards_cluster(1);
    third_tail = intersection_neighbor_cluster(1);
    
    first_edge = [first_head:floor(first_tail),first_tail]; % ��һ��������
    second_edge = [second_head,ceil(second_head):second_tail]; % �ڶ���������
    third_edge = third_head:-1:third_tail; % ������������
    
    x_three_cluster = [first_edge,second_edge,third_edge];    
    y_three_cluster = zeros(1,size(x_three_cluster,2));
    
    first_begin = 1;
    first_end = size(first_edge,2);
    second_begin = first_end + 1;
    second_end = size(first_edge,2) + size(second_edge,2);
    third_begin = second_end + 1;
    third_end = size(x_three_cluster,2);
    
    y_three_cluster(1,first_begin:first_end) =...
        sqrt(400 ^ 2 - (x_three_cluster(1,first_begin:first_end) + 200) .^ 2) - 200;
    y_three_cluster(1,second_begin:second_end) =...
        -sqrt(400 ^ 2 - (x_three_cluster(1,second_begin:second_end) + 200) .^ 2) + 200;
    y_three_cluster(1,third_begin:third_end) =...
        sqrt(400 ^ 2 - (x_three_cluster(1,third_begin:third_end) - 200) .^ 2) - 200;
    %��һ����
    fill(x_three_cluster,y_three_cluster,colors(3,:));
    %�ڶ�����
    fill(-x_three_cluster,y_three_cluster,colors(3,:));
    %��������
    fill(-x_three_cluster,-y_three_cluster,colors(3,:));
    %��������
    fill(x_three_cluster,-y_three_cluster,colors(3,:));
    
    %�ɼ��ĸ�ɢ���������
    first_head = -intersection_neighbor_cluster(2);
    first_tail = intersection_neighbor_cluster(1);
    second_head = intersection_neighbor_cluster(1);
    second_tail = intersection_neighbor_cluster(2);
    third_head = intersection_neighbor_cluster(2);
    third_tail = intersection_neighbor_cluster(1);
    fourth_head = intersection_neighbor_cluster(1);
    fourth_tail = -intersection_neighbor_cluster(2);
    
    first_edge = [first_head,ceil(first_head):first_tail]; % ��һ��������
    second_edge = [second_head:floor(second_tail),second_tail]; % �ڶ���������
    third_edge = [third_head,floor(third_head):-1:third_tail]; % ������������
    fourth_edge = [fourth_head:-1:ceil(fourth_tail),fourth_tail]; % ���Ĳ�������
    
    x_four_cluster = [first_edge,second_edge,third_edge,fourth_edge];
    y_four_cluster = zeros(1,size(x_four_cluster,2));
    
    first_begin = 1;
    first_end = size(first_edge,2);
    second_begin = first_end + 1;
    second_end = size(first_edge,2) + size(second_edge,2);
    third_begin = second_end + 1;
    third_end = size(first_edge,2) + size(second_edge,2) + size(third_edge,2);
    fourth_begin = third_end + 1;
    fourth_end = size(y_four_cluster,2);
    
    y_four_cluster(1,first_begin:first_end) =...
        sqrt(400 ^ 2 - (x_four_cluster(1,first_begin:first_end) - 200) .^ 2) - 200;
    y_four_cluster(1,second_begin:second_end) =...
        sqrt(400 ^ 2 - (x_four_cluster(1,second_begin:second_end) + 200) .^ 2) - 200;
    y_four_cluster(1,third_begin:third_end) =...
        -sqrt(400 ^ 2 - (x_four_cluster(1,third_begin:third_end) + 200) .^ 2) + 200;
    y_four_cluster(1,fourth_begin:fourth_end) =...
        -sqrt(400 ^ 2 - (x_four_cluster(1,fourth_begin:fourth_end) - 200) .^ 2) + 200;
    
    fill(x_four_cluster,y_four_cluster,colors(4,:));
end