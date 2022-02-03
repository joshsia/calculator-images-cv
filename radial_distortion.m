%% Radial distortion

clear all; close all; clc;

load('cameraParams2.mat')
rad_dist = cameraParams2.RadialDistortion;
tan_dist = cameraParams2.TangentialDistortion;

k1 = rad_dist(1);
k2 = rad_dist(2);
p1 = tan_dist(1);
p2 = tan_dist(2);

image_size = cameraParams2.ImageSize;
middle = image_size/2;

y_axis = 1:image_size(1);
x_axis = 1:image_size(2);

original = 200*ones(length(y_axis), length(x_axis));
img_dist = 200*ones(length(y_axis), length(x_axis));

n = 336;
for i = 0:8
    original(:,(n+i):n:end) = 0;
    original(:,(n-i):n:end) = 0;
end
n = 336;
for i = 0:8
    original((n+i):n:end,:) = 0;
    original((n-i):n:end,:) = 0;
end


count = 0;
for i = 1:length(y_axis)
    for j = 1:length(x_axis)

        x_org = x_axis(j);
        y_org = y_axis(i);

        x = (x_org - middle(2))/length(x_axis);
        y = (y_org - middle(1))/length(y_axis);
        
        r2 = x^2 + y^2;
        
        x_distorted = x*(1 + k1*r2 + k2*(r2^2)) + 2*p1*x*y + p2*(r2 + 2*(x^2));
        y_distorted = y*(1 + k1*r2 + k2*(r2^2)) + 2*p2*x*y + p1*(r2 + 2*(y^2));
        
        x_distorted = round((x_distorted * length(x_axis)) + middle(2));
        y_distorted = round((y_distorted * length(y_axis)) + middle(1));
        
        if( (x_distorted>0) && (x_distorted<image_size(2)) )
            if( (y_distorted>0) && (y_distorted<image_size(1)) )
                count = count + 1;
                img_dist(y_distorted, x_distorted) = original(y_org,x_org);
            end
        end
        
        x_distorted = x_distorted - 1;
        y_distorted = y_distorted - 1;
        
        if( (x_distorted>0) && (x_distorted<image_size(2)) )
            if( (y_distorted>0) && (y_distorted<image_size(1)) )
                img_dist(y_distorted, x_distorted) = original(y_org,x_org);
            end
        end
        
    end
end

count = 100*count/(length(y_axis)*length(x_axis));

spaceH=0.03;spaceV=0.03;marTop=0.05;marBot=0;
padding=0;margin=0.02;marginL=0.03;

figure();
subaxis(1,2,1,'SpacingHoriz', spaceH,'SpacingVert',spaceV, 'PL',padding,'PR',padding,'mt',marTop,'mb',marBot,'ML',marginL,'MR',margin);
imshow(original);
hold on;
subaxis(1,2,2,'SpacingHoriz', spaceH,'SpacingVert',spaceV, 'PL',padding,'PR',padding,'mt',marTop,'mb',marBot,'ML',marginL,'MR',margin);
imshow(img_dist);

% figure();
% subplot(121)
% imshow(original);
% subplot(122)
% % figure();
% imshow(img_dist);

%imshow(imfuse(img_dist,original,'ColorChannels',[2 1 2]));


%%

clear all; close all; clc;

% Parameters
syms k_1 k_2 p_1 p_2 real
syms r x y
distortionX = subs(x * (1 + k_1 * r^2 + k_2 * r^4) + 2 * p_1 * x * y + p_2 * (r^2 + 2 * x^2), r, sqrt(x^2 + y^2));
distortionY = subs(y * (1 + k_1 * r^2 + k_2 * r^4) + 2 * p_2 * x * y + p_1 * (r^2 + 2 * y^2), r, sqrt(x^2 + y^2));

% % Set Parameters (undistorted)
% 
% parameters = [k_1 k_2 p_1 p_2];
% parameterValues = [0 0 0 0];
% plotLensDistortion(distortionX,distortionY,parameters,parameterValues)


% Set Parameters (distorted)
load('cameraParams2.mat')
rad_dist = cameraParams2.RadialDistortion;
tan_dist = cameraParams2.TangentialDistortion;

k1 = rad_dist(1);
k2 = rad_dist(2);
p1 = tan_dist(1);
p2 = tan_dist(2);

parameters = [k_1 k_2 p_1 p_2];
parameterValues = [k1 k2 p1 p2];
plotLensDistortion(distortionX,distortionY,parameters,parameterValues)

