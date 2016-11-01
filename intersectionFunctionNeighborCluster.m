function [ Y ] = intersectionFunctionNeighborCluster( t )
%相邻反射体范围的交点方程组
    x=t(1);
    y=t(2);
    Y(1) = (x + 200) .^ 2 + (y + 200) .^ 2 - 400 ^ 2;
    Y(2) = (x - 200) .^ 2 + (y + 200) .^ 2 - 400 ^ 2;
end

