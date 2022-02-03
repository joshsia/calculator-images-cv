%% Rectified stereo images and depth map
fd001 = imread('raw-images/FD/FD_001.jpg');
fd002 = imread('raw-images/FD/FD_002.jpg');

[t1, t2] = estimateUncalibratedRectification(f1, movingPoints, fixedPoints, size(fd001));
tform1 = projective2d(t1);
tform2 = projective2d(t2);

[I1Rect, I2Rect] = rectifyStereoImages(fd001, fd002, tform1, tform2);
load('fd-data-matrices/fd001_002_rect_manual.mat')

%Define spacings
spaceH=0.03;spaceV=0.03;marTop=0.05;marBot=0;
padding=0;margin=0.02;marginL=0.03;

figure();
subaxis(1,2,1,'SpacingHoriz', spaceH,'SpacingVert',spaceV, 'PL',padding,'PR',padding,'mt',marTop,'mb',marBot,'ML',marginL,'MR',margin);
imshow(I1Rect)
hold on
% extralines = [1:100:600 1500:100:3500];
% for i = 1:length(extralines)
%     plot([0,length(I1Rect)],[extralines(i),extralines(i)])
% end
for i = 1:length(movingPoints)
    plot([0,length(I1Rect)],[movingPoints(i,2),movingPoints(i,2)])
end
offset = [400 360 360 490 465 425 525 490 475 550 525 500 575 550 525 625 590 560];
for i = 1:length(movingPoints)
scatter(movingPoints(i,1)+offset(i), movingPoints(i,2),'cyan')
end
%title('Rectified Stereo Images for FD001 (Top) & FD002 (Bottom)');

subaxis(1,2,2,'SpacingHoriz', spaceH,'SpacingVert',spaceV, 'PL',padding,'PR',padding,'mt',marTop,'mb',marBot,'ML',marginL,'MR',margin);
imshow(I2Rect)
hold on
% for i = 1:length(extralines)
%     plot([0,length(I1Rect)],[extralines(i),extralines(i)])
% end
for i = 1:length(fixedPoints)
plot([0,length(I2Rect)],[fixedPoints(i,2),fixedPoints(i,2)])
end
scatter(fixedPoints(:,1)+445, fixedPoints(:,2),'cyan')
title('Rectified Stereo Images for FD001 (Left) & FD002 (Right)');
saveas(gcf,'results/rect_fd001_002_epipolar_side','epsc')

%%
disparityRange = [-24 24];
disparityMap = disparityBM(rgb2gray(I1Rect), rgb2gray(I2Rect),'DisparityRange',disparityRange,'uniquenessthreshold',30);
figure();
imshow(disparityMap,disparityRange)
title('Depth Map between Rectified FD 001 & 002','fontsize',18);
colormap(gca,jet) 
colorbar
% set(gca,'ColorScale','log')
saveas(gcf,'results/disparity_map.eps','epsc')
