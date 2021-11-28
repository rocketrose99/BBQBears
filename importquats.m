x = readmatrix('quatsv1.xlsx');
x(:,1) = []
x = timeseries(x);
save quatsv1mat.mat -v7.3 x;
