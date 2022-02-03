%% Homography matrix for HG 001 & 002
clear all
load('hg-data-matrices/hg001_002_manual.mat')
h1 = homography_solver(fixedPoints', movingPoints')

%% Homography matrix for HG 003 & 004
clear all
load('hg-data-matrices/hg003_004_manual.mat')
h2 = homography_solver(fixedPoints', movingPoints')

%% Fundamental matrix for FD 001 & 002
clear all
load('fd-data-matrices/fd001_002_manual.mat')
f1 = estimateFundamentalMatrix(movingPoints, fixedPoints,'method','norm8point')

%Define spacings
spaceH=0.03;spaceV=0.03;marTop=0.05;marBot=0;
padding=0;margin=0.02;marginL=0.03;

fd001 = imread('raw-images/FD/FD_001.jpg');
figure(); 
subaxis(2,1,1,'SpacingHoriz', spaceH,'SpacingVert',spaceV, 'PL',padding,'PR',padding,'mt',marTop,'mb',marBot,'ML',marginL,'MR',margin);
imshow(fd001); 
title('Epipolar Lines in FD 001 & 002'); 
hold on;
scatter(movingPoints(:,1), movingPoints(:,2),'cyan')
epiLines = epipolarLine(f1',fixedPoints);
points = lineToBorderPoints(epiLines,size(fd001));
line(points(:,[1,3])',points(:,[2,4])');
annotation('textbox', [0.15, 0.75, 0, 0], 'string', 'FD001')

fd002 = imread('raw-images/FD/FD_002.jpg');
subaxis(2,1,2,'SpacingHoriz', spaceH,'SpacingVert',spaceV, 'PL',padding,'PR',padding,'mt',marTop,'mb',marBot,'ML',marginL,'MR',margin);
imshow(fd002);
%title('Epipolar Lines in FD 002'); 
hold on;
scatter(fixedPoints(:,1), fixedPoints(:,2),'cyan')
epiLines = epipolarLine(f1,movingPoints);
points = lineToBorderPoints(epiLines,size(fd002));
line(points(:,[1,3])',points(:,[2,4])');
annotation('textbox', [0.15, 0.25, 0, 0], 'string', 'FD002')
%saveas(gcf, "results/fd001_002_epipoles.eps", "epsc");
%% Fundamental matrix for FD 003 & 004
clear all
load('fd-data-matrices/fd003_004_manual.mat')
f2 = estimateFundamentalMatrix(movingPoints, fixedPoints,'method','norm8point')

%Define spacings
spaceH=0.03;spaceV=0.03;marTop=0.05;marBot=0;
padding=0;margin=0.02;marginL=0.03;

fd003 = imread('raw-images/FD/FD_003.jpg');
figure(); 
subaxis(2,1,1,'SpacingHoriz', spaceH,'SpacingVert',spaceV, 'PL',padding,'PR',padding,'mt',marTop,'mb',marBot,'ML',marginL,'MR',margin);
imshow(fd003); 
title('Epipolar Lines in FD 003 & 004'); 
hold on;
scatter(movingPoints(:,1), movingPoints(:,2),'cyan')
epiLines = epipolarLine(f2',fixedPoints);
points = lineToBorderPoints(epiLines,size(fd003));
line(points(:,[1,3])',points(:,[2,4])');
annotation('textbox', [0.15, 0.75, 0, 0], 'string', 'FD004')

fd004 = imread('raw-images/FD/FD_004.jpg');
subaxis(2,1,2,'SpacingHoriz', spaceH,'SpacingVert',spaceV, 'PL',padding,'PR',padding,'mt',marTop,'mb',marBot,'ML',marginL,'MR',margin);
imshow(fd004);
%title('Epipolar Lines in FD 004'); 
hold on;
scatter(fixedPoints(:,1), fixedPoints(:,2),'cyan')
epiLines = epipolarLine(f2,movingPoints);
points = lineToBorderPoints(epiLines,size(fd004));
annotation('textbox', [0.15, 0.25, 0, 0], 'string', 'FD004')
line(points(:,[1,3])',points(:,[2,4])');
%saveas(gcf, "results/fd003_004_epipoles.eps", "epsc");
