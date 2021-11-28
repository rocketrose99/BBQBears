x_quat = readmatrix('BBQinputQuats.xlsx');
x_dcm = quat2dcm(x_quat);
BBQ_dcm = zeros(size(x_dcm));

for i=1:length(x_dcm)
    % Rotate about what matlab thinks is the roll axis 0.5*i degrees
    BBQ_offset = [1,0,0; 0, cosd(.5*i), -sind(.5*i);0, sind(.5*i), cosd(.5*i)]; 
    BBQ_dcm(:,:,i) = BBQ_offset*x_dcm(:,:,i);
end

BBQ_quat = dcm2quat(BBQ_dcm);
xlswrite('BBQoutputQuats.xlsx', BBQ_quat);