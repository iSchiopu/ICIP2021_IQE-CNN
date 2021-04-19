clc

%% Variables
myPSNR_JPEG_PIL = zeros(29,5);
mySSIM_JPEG_PIL = zeros(29,5);
myPSNR_JPEG_MATLAB = zeros(29,5);
mySSIM_JPEG_MATLAB = zeros(29,5);
testImgName = 'test.jpeg';

%% Compress using PIL library in Python following the information from the authors 
% "In this article, Python Image Library (PIL) is adopted to encode 
% images into JPEG format for conducting all simulation experiments."
PSNR_TIP =[25.6000 27.9600 29.2500 30.1600 30.9100];
SSIM_TIP =[0.7454 0.8288 0.8642 0.8846 0.8890];

disp('Encoding using PIL library ...')
msgCMD = 'python compressJPEG.py';
[status, commandOut] = system(msgCMD);

disp('Encoding using MATLAB and computing metrics (PSNR and SSIM)...')
%% Check the compression for each image in the LIVE1 dataset
for iFile=1:29
    fileName = [ './LIVE1/'  num2str(iFile) '.bmp'];
    image = imread(fileName);
    
    %% For each Q values Q = 10, 20, 30, 40, 50
    for k=1:5
        %% PIL library in Paython
        imageComp = imread(['./JPEG_Results/' num2str(iFile) '_' num2str(k*10) '.jpg']);
        
        myPSNR_JPEG_PIL(iFile,k) = psnr(image, imageComp);
        mySSIM_JPEG_PIL(iFile,k) = ssim(image, imageComp);
        
        %% MATLAB implementation 
        imwrite(image, testImgName, 'Mode','lossy', 'Quality', k*10);
        imageComp = imread(testImgName);
        
        myPSNR_JPEG_MATLAB(iFile,k) = psnr(image,imageComp);
        mySSIM_JPEG_MATLAB(iFile,k) = ssim(image,imageComp);
    end
end
delete test.jpeg

%% Display results
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('PSNR Results:')
disp([' MATLAB: ' num2str(mean(myPSNR_JPEG_MATLAB))]);
disp([' PIL:    ' num2str(mean(myPSNR_JPEG_PIL))]);
disp([' TIP:    ' num2str(PSNR_TIP)]);

disp('SSIM Results:')
disp([' MATLAB: ' num2str(mean(mySSIM_JPEG_MATLAB))]);
disp([' PIL:    ' num2str(mean(mySSIM_JPEG_PIL))]);
disp([' TIP:    ' num2str(SSIM_TIP)]);
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
