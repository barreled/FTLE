% Matlab Visualization stuff. This function will take a sequence of 38
% converted.X.txt files containing FTLE eigenvalues, plot their contours
% (which are Lagrangian Coherent Structures), and turn that into a movie.


function visualize()
clear;
clc;
tic;


%% Intialization, adapted from PIV2Doppler
% clear all;
% clc; clf; close all;
% warning off

path0 =uigetdir(pwd);
cd(path0)
d= dir(path0);
filesindir= {d.name};
disp(['Working in ' path0])

%% Sample code from internet for finding and chaining local maxima
%  load cuspamax;
%  x = 1:length(cuspamax);
%  scales = 1:32;
%  cfs = cwt(cuspamax,scales,'haar');
%  [lmaxima,indices] = localmax(cfs,[],false);
%  [iRow,iCol] = find(lmaxima);
%  subplot(211);
%  imagesc(abs(cfs)); axis xy;
%  axis([1 1024 1 32]);
%  ylabel('Scale'); title('CWT Coefficients (Moduli)');
%  subplot(212);
%  plot(x(iCol),scales(iRow),'marker','o','markerfacecolor',[0 0 1],...
%      'linestyle','none');
%  xlabel('Position'); ylabel('Scale'); title('Maxima Lines');
%  axis([1 1024 1 32]);


%% Make N contour images from the converted FTLE files, save them as "LCS.X.tif"
N = 38; % number of FTLE files
figure(1);
set(gcf,'visible','off');


%%         Reverse FTLE data
cd('reverse');
for i = 0:(N-1);
    matfilename = ['converted_reverse',num2str(i),'.mat'];
    try
        load(matfilename);
    catch
        disp('failed loading file')
        return
    end
    hpc = pcolor(reverse);
%     set(hpc,'facealpha',0.4);
    shading flat
    colorbar
    caxis([0 10])
    hold on;
%     x = 1:length(reverse);
%     [lmaxima,indices] = localmax(reverse,[],false);
%     [iRow,iCol] = find(lmaxima);
%     plot(x(iCol),x(iRow),'marker','p',...
%    'linestyle','none', 'color', 'g');
    hold off
    print(1, ['LCS_reverse',num2str(i,'%d')], '-dtiff','-r100','-noui');
    display(['Saved reverse FTLE image #',num2str(i)])
end
%% Check for .tif files, adapted from PIV2Doppler/mkmovframebyframe
for i = 0:(N-1)
   fileframe = ['LCS_reverse', num2str(i), '.tif']; 
   try
       R(i+1)=im2frame(imread(fileframe));
   catch
       display(['Last file was "LCS_reverse', num2str(i-1), '.tif"']);
       break
   end
end

%% Make the movie, also adapted from PIV2Doppler/mkmovframebyframe
aviname2 = 'LCS_reverse.avi';

framesPerSec = 4;

try
    movie2avi(R,aviname2,'compression','none','quality',100,'fps',framesPerSec);
    disp(['Reverse LCS movie saved']);
catch
    disp('An error occured in making the movies')
end




%%         Forward FTLE data
cd('../forward')
for i = 0:(N-1);
    matfilename = ['converted_forward',num2str(i),'.mat'];
    try
        load(matfilename);
    catch
        disp('failed loading file')
        return
    end
    hpc = pcolor(forward);
%     set(hpc,'facealpha',0.4);
    shading flat
    colorbar
    caxis([3 13])
    hold on;
%     x = 1:length(forward);
%     [lmaxima,indices] = localmax(forward,[],false);
%     [iRow,iCol] = find(lmaxima);
%     plot(x(iCol),x(iRow),'marker','p',...
%     'linestyle','none', 'color', 'g');
    hold off
    print(1, ['LCS_forward',num2str(i,'%d')], '-dtiff','-r100','-noui');
    display(['Saved forward FTLE image #',num2str(i)])
end

%% Check for .tif files, adapted from PIV2Doppler/mkmovframebyframe
for i = 0:(N-1) 
   fileframe2 = ['LCS_forward', num2str(i), '.tif'];   
   try
       F(i+1)=im2frame(imread(fileframe2));
   catch
       display(['Last file was "LCS_forward', num2str(i-1), '.tif"']);
       break
   end  
end

%% Make the movie, also adapted from PIV2Doppler/mkmovframebyframe

aviname = 'LCS_forward.avi';

try
    movie2avi(F,aviname,'compression','none','quality',100,'fps',framesPerSec);
    disp(['Forward LCS movies saved']);
catch
    disp('An error occured in making the movies')
end

cd('..')
toc
return

