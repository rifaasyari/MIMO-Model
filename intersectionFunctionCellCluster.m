function [ Y ] = intersectionFunctionCellCluster( t )
% С����Χ��ɢ���巶Χ���㷽����
    x=t(1);
    y=t(2);
    Y(1) = (x + 200) .^ 2 + (y - 200) .^ 2 - 400 ^ 2;
    Y(2) = x .^ 2 + y .^ 2 - 500 ^ 2;
end

