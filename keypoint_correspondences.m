%% Manual Correspondences for FD 001 & 002
close all
%clear all
load('fd-data-matrices/fd001_002_manual.mat')
fd001 = imread('raw-images/FD/FD_001.jpg');
fd002 = imread('raw-images/FD/FD_002.jpg');

%Define spacings
spaceH=0.03;spaceV=0.03;marTop=0.05;marBot=0;
padding=0;margin=0.02;marginL=0.03;

figure()
subaxis(2,1,1,'SpacingHoriz', spaceH,'SpacingVert',spaceV, 'PL',padding,'PR',padding,'mt',marTop,'mb',marBot,'ML',marginL,'MR',margin);
imshow(fd001)
hold on
scatter(movingPoints(:,1),movingPoints(:,2),20,'+','cyan','linewidth',0.75)
for k=1:length(movingPoints)
    text(movingPoints(k,1)+80,movingPoints(k,2)+110,num2str(k),'margin',1,'backgroundcolor','w','fontsize',6,'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Middle')
end
title('Manual Correspondences for FD 001 & 002')
annotation('textbox', [0.15, 0.75, 0, 0], 'string', 'FD001')
subaxis(2,1,2,'SpacingHoriz', spaceH,'SpacingVert',spaceV, 'PL',padding,'PR',padding,'mt',marTop,'mb',marBot,'ML',marginL,'MR',margin);
imshow(fd002)
hold on
scatter(fixedPoints(:,1),fixedPoints(:,2),20,'+','cyan','linewidth',0.75)
for k=1:length(fixedPoints)
    text(fixedPoints(k,1)+80,fixedPoints(k,2)+110,num2str(k),'margin',1,'backgroundcolor','w','fontsize',6,'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Middle')
end
annotation('textbox', [0.15, 0.25, 0, 0], 'string', 'FD002')
saveas(gcf, "results/fd001_002_manual.eps", "epsc");

%% Automatic Correspondences for FD 001 & 002
points1 = cast(matchedPoints1.Location,'double');
points2 = cast(matchedPoints2.Location,'double');
figure()
subaxis(2,1,1,'SpacingHoriz', spaceH,'SpacingVert',spaceV, 'PL',padding,'PR',padding,'mt',marTop,'mb',marBot,'ML',marginL,'MR',margin);
imshow(fd001)
hold on
scatter(points1(:,1),points1(:,2),20,'+','cyan','linewidth',0.75)
for k=1:length(points1)
    text(points1(k,1)+80,points1(k,2)+110,num2str(k),'margin',1,'backgroundcolor','w','fontsize',6,'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Middle')
end
title('Automatic Correspondences for FD 001 & 002')
annotation('textbox', [0.15, 0.75, 0, 0], 'string', 'FD001')
subaxis(2,1,2,'SpacingHoriz', spaceH,'SpacingVert',spaceV, 'PL',padding,'PR',padding,'mt',marTop,'mb',marBot,'ML',marginL,'MR',margin);
imshow(fd002)
hold on
scatter(points2(:,1),points2(:,2),20,'+','cyan','linewidth',0.75)
for k=1:length(points2)
    text(points2(k,1)+80,points2(k,2)+110,num2str(k),'margin',1,'backgroundcolor','w','fontsize',6,'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Middle')
end
annotation('textbox', [0.15, 0.25, 0, 0], 'string', 'FD002')
saveas(gcf, "results/fd001_002_auto.eps", "epsc");

%% Manual Correspondences for HG 001 & 002
close all
clear all
load('hg-data-matrices/hg003_004_manual.mat')
hg001 = imread('raw-images/HG/HG_003.jpg');
hg002 = imread('raw-images/HG/HG_004.jpg');

%Define spacings
spaceH=0.03;spaceV=0.03;marTop=0.05;marBot=0;
padding=0;margin=0.02;marginL=0.03;

figure()
subaxis(1,2,1,'SpacingHoriz', spaceH,'SpacingVert',spaceV, 'PL',padding,'PR',padding,'mt',marTop,'mb',marBot,'ML',marginL,'MR',margin);
imshow(hg001)
hold on
scatter(movingPoints(:,1),movingPoints(:,2),20,'+','cyan','linewidth',0.75)
for k=1:length(movingPoints)
    text(movingPoints(k,1)+80,movingPoints(k,2)+110,num2str(k),'margin',1,'backgroundcolor','w','fontsize',6,'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Middle')
end
%title('Manual Correspondences for HG 003 & 004')
title('                                                                       Projection of keypoints and correspondences from HG003 to HG004')
%annotation('textbox', [0.15, 0.75, 0, 0], 'string', 'HG003')
subaxis(1,2,2,'SpacingHoriz', spaceH,'SpacingVert',spaceV, 'PL',padding,'PR',padding,'mt',marTop,'mb',marBot,'ML',marginL,'MR',margin);
imshow(hg002)
hold on
scatter(fixedPoints(:,1),fixedPoints(:,2),20,'+','cyan','linewidth',0.75)
for k=1:length(fixedPoints)
    text(fixedPoints(k,1)+80,fixedPoints(k,2)+110,num2str(k),'margin',1,'backgroundcolor','w','fontsize',6,'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Middle')
end
%annotation('textbox', [0.15, 0.25, 0, 0], 'string', 'HG004')
saveas(gcf, "results/hg003_004_projection.eps", "epsc");

%% Automatic Correspondences for HG 001 & 002
hg001 = imread('raw-images/HG/HG_001.jpg');
hg002 = imread('raw-images/HG/HG_002.jpg');
load('hg-data-matrices/hg001_002_surf.mat')

%Define spacings
spaceH=0.03;spaceV=0.03;marTop=0.05;marBot=0;
padding=0;margin=0.02;marginL=0.03;

points1 = cast(matchedPoints1.Location,'double');
points2 = cast(matchedPoints2.Location,'double');
figure()
subaxis(1,2,1,'SpacingHoriz', spaceH,'SpacingVert',spaceV, 'PL',padding,'PR',padding,'mt',marTop,'mb',marBot,'ML',marginL,'MR',margin);
imshow(hg001)
hold on
scatter(points1(:,1),points1(:,2),20,'+','cyan','linewidth',0.75)
for k=1:length(points1)
    text(points1(k,1)+80,points1(k,2)+110,num2str(k),'margin',1,'backgroundcolor','w','fontsize',6,'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Middle')
end
title('Automatic Correspondences for HG 001 (Left) & 002 (Right)')
%annotation('textbox', [0.15, 0.75, 0, 0], 'string', 'HG001')
subaxis(1,2,2,'SpacingHoriz', spaceH,'SpacingVert',spaceV, 'PL',padding,'PR',padding,'mt',marTop,'mb',marBot,'ML',marginL,'MR',margin);
imshow(hg002)
hold on
scatter(points2(:,1),points2(:,2),20,'+','cyan','linewidth',0.75)
for k=1:length(points2)
    text(points2(k,1)+80,points2(k,2)+110,num2str(k),'margin',1,'backgroundcolor','w','fontsize',6,'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Middle')
end
%annotation('textbox', [0.15, 0.25, 0, 0], 'string', 'HG002')
saveas(gcf, "results/hg001_002_auto_side.eps", "epsc");