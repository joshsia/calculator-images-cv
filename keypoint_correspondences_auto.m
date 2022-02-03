% - Results - %
% FD (001 & 002) (Harris)= 13, good
% FD (001 & 002) (SURF)  = 98, average  (metricthreshold 10000)
% FD (003 & 004) (Harris)= 3 , very bad 
% FD (003 & 004) (SURF)  = 16, quite bad  (metricthreshold 8000)

% ----------- %
% HG (001 & 002) (Harris)= 137, good
% HG (001 & 002) (SURF)  = 73,  quite good (metricthreshold 15000)
% HG (003 & 004) (Harris)= 89 , average
% HG (003 & 004) (SURF)  = 26, quite good (metricthreshold 15000)


%% FD using Harris
fd1 = rgb2gray(imread('FD/FD_001.jpg'));
fd2 = rgb2gray(imread('FD/FD_002.jpg'));

points1 = detectHarrisFeatures(fd1,'filtersize',3,'roi',[980 1000 2000 800]);
points2 = detectHarrisFeatures(fd2,'filtersize',3,'roi',[980 1000 2000 800]);

[features1,valid_points1] = extractFeatures(fd1,points1);
[features2,valid_points2] = extractFeatures(fd2,points2);

indexPairs = matchFeatures(features1,features2);

matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);

figure; ax = axes;
showMatchedFeatures(fd1,fd2,matchedPoints1,matchedPoints2,'montage','Parent',ax);
title(ax, 'Correspondence');
legend(ax, 'Matched points 1','Matched points 2');

%% FD using SURF
fd1 = rgb2gray(imread('FD/FD_003.jpg'));
fd2 = rgb2gray(imread('FD/FD_004.jpg'));


% ROI for FD 001 & 002
% points1 = detectSURFFeatures(fd1,'metricthreshold',10000,'numoctaves',3,'numscalelevels',9,'roi',[1100 1000 2000 800]);
% points2 = detectSURFFeatures(fd2,'metricthreshold',10000,'numoctaves',3,'numscalelevels',9,'roi',[1100 1000 2000 800]);

% ROI for FD 003 & 004
points1 = detectSURFFeatures(fd1,'metricthreshold',8000,'numoctaves',3,'numscalelevels',9,'roi',[1100 1180 2000 800]);
points2 = detectSURFFeatures(fd2,'metricthreshold',8000,'numoctaves',3,'numscalelevels',9,'roi',[1100 1180 2000 800]);

[features1,valid_points1] = extractFeatures(fd1,points1);
[features2,valid_points2] = extractFeatures(fd2,points2);

indexPairs = matchFeatures(features1,features2);

matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);

figure; ax = axes;
showMatchedFeatures(fd1,fd2,matchedPoints1,matchedPoints2,'montage','Parent',ax);
title(ax, 'Automatic Correspondences for FD 001 & 002');
legend(ax, 'Matched points 1','Matched points 2');

%% HG using Harris
hg1 = rgb2gray(imread('HG\HG_003.jpg'));
hg2 = rgb2gray(imread('HG\HG_004.jpg'));

points1 = detectHarrisFeatures(hg1,'roi',[900 1000 2000 900]);
points2 = detectHarrisFeatures(hg2,'roi',[900 1000 2000 900]);

[f1,vpts1] = extractFeatures(hg1,points1);
[f2,vpts2] = extractFeatures(hg2,points2);

indexPairs = matchFeatures(f1,f2) ;
matchedPoints1 = vpts1(indexPairs(:,1));
matchedPoints2 = vpts2(indexPairs(:,2));

figure; ax = axes;
showMatchedFeatures(hg1,hg2,matchedPoints1,matchedPoints2,'montage','Parent',ax);
title(ax, 'Correspondence');
legend(ax, 'Matched points 1','Matched points 2');

% figure; showMatchedFeatures(hg1,hg2,matchedPoints1,matchedPoints2,'markersize',12,'markercolor','b');
% legend('matched points 1','matched points 2');

%% HG using SURF
hg1 = rgb2gray(imread('HG\HG_001.jpg'));
hg2 = rgb2gray(imread('HG\HG_002.jpg'));
%hg2 = imresize(imrotate(hg1,-20),1.2);

points1 = detectSURFFeatures(hg1,'metricthreshold',15000,'numoctaves',3,'numscalelevels',9,'roi',[900 1000 2000 900]);
points2 = detectSURFFeatures(hg2,'metricthreshold',15000,'numoctaves',3,'numscalelevels',9,'roi',[900 1000 2000 900]);

[f1,vpts1] = extractFeatures(hg1,points1);
[f2,vpts2] = extractFeatures(hg2,points2);

indexPairs = matchFeatures(f1,f2) ;
matchedPoints1 = vpts1(indexPairs(:,1));
matchedPoints2 = vpts2(indexPairs(:,2));

figure; ax = axes;
showMatchedFeatures(hg1,hg2,matchedPoints1,matchedPoints2,'montage','Parent',ax);
title(ax, 'Correspondence');
legend(ax, 'Matched points 1','Matched points 2');

% figure; showMatchedFeatures(hg1,hg2,matchedPoints1,matchedPoints2,'markersize',12,'markercolor','b');
% legend('matched points 1','matched points 2');