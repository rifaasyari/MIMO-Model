function [ Y ] = intersectionFunctionCellCluster( t )
% 小区范围与散射体范围交点方程组
    x=t(1);
    y=t(2);
    Y(1) = (x + 200) .^ 2 + (y - 200) .^ 2 - 400 ^ 2;
    Y(2) = x .^ 2 + y .^ 2 - 500 ^ 2;
end

