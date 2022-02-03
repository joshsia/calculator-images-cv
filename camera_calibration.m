%% Calibrate
images = imageDatastore('C:\Users\yiten\Documents\CVPR\CW1\Grid','FileExtensions','.jpg');
[imagePoints,boardSize] = detectCheckerboardPoints(images.Files);
squareSize = 20;
worldPoints = generateCheckerboardPoints(boardSize,squareSize);
I = readimage(images,1); 
imageSize = [size(I,1),size(I,2)];
radialCoeffs = 2;
[cameraParams,~,estimationErros] = estimateCameraParameters(imagePoints,worldPoints,'ImageSize',imageSize,'numradialdistortioncoefficients',radialCoeffs,'estimatetangentialdistortion',true,'estimateskew',true);
I = images.readimage(1);
J = undistortImage(I,cameraParams,'OutputView','full');
%% Plot distorted vs undistorted
%Define spacings
spaceH=0.03;spaceV=0.03;marTop=0.05;marBot=0;
padding=0;margin=0.02;marginL=0.03;

J2 = J(316:3339,316:4347,:);
figure()
subaxis(1,2,1,'SpacingHoriz', spaceH,'SpacingVert',spaceV, 'PL',padding,'PR',padding,'mt',marTop,'mb',marBot,'ML',marginL,'MR',margin);
imshow(I)
%title('Distorted (top) vs Undistorted (bottom)');
title({'                                                                        Distorted (Left) vs Undistorted (Right) image of FD001',' '});
subaxis(1,2,2,'SpacingHoriz', spaceH,'SpacingVert',spaceV, 'PL',padding,'PR',padding,'mt',marTop,'mb',marBot,'ML',marginL,'MR',margin);
imshow(J2)
%saveas(gcf, "CW1_Images/distorted_vs_undistorted.eps", "epsc");
saveas(gcf, "CW1_Images/distorted_vs_undistorted_2_coeffs.eps", "epsc");