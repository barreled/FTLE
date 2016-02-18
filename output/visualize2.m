% Matlab Visualization stuff. This function will take a sequence of 38
% converted.X.txt files containing FTLE eigenvalues, plot their contours
% (which are Lagrangian Coherent Structures), and turn that into a movie.


function visualize()
clear;
clc;
tic;
system('../nonCartFTLE');
%cd('output')

%% Intialization, adapted from PIV2Doppler
% clear all;
% clc; clf; close all;
% warning off

% path0 =uigetdir(pwd);
% cd(path0)
% d= dir(path0);
% filesindir= {d.name};
% disp(['Working in ' path0])

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
N = 40; % number of FTLE files
figure(1);
set(gcf,'visible','off');


%         Reverse FTLE data
for i = 0:(N-1);
    try
        reverse = csvread(['converted_reverse.',num2str(i),'.csv']);
    catch
        display(['Last file was "converted_reverse.',num2str(i-1),'.csv"']);
        break
    end
    matfilename = ['converted_reverse',num2str(i),'.mat'];
    save(matfilename,'reverse');
    hpc = pcolor(reverse);
%     set(hpc,'facealpha',0.4);
    shading flat
    colorbar
    caxis([0 12])
    hold on;
%     x = 1:length(reverse);
%     [lmaxima,indices] = localmax(reverse,[],false);
%     [iRow,iCol] = find(lmaxima);
%     plot(x(iCol),x(iRow),'marker','p',...
%    'linestyle','none', 'color', 'g');
    hold off
    print(1, ['LCS_reverse',num2str(i,'%d')], '-dtiff','-r100','-noui');
    display(['Processed reverse FTLE image #',num2str(i)])
end

%         Forward FTLE data
for i = 0:(N-1);
    try
        forward = csvread(['converted.',num2str(i),'.csv']);
    catch
        display(['Last file was "converted.',num2str(i-1),'.csv"']);
        break
    end
    matfilename = ['converted_forward',num2str(i),'.mat'];
    save(matfilename,'forward');
    hpc = pcolor(forward);
%     set(hpc,'facealpha',0.4);
    shading flat
    colorbar
    caxis([0 12])
    hold on;
%     x = 1:length(forward);
%     [lmaxima,indices] = localmax(forward,[],false);
%     [iRow,iCol] = find(lmaxima);
%     plot(x(iCol),x(iRow),'marker','p',...
%     'linestyle','none', 'color', 'g');
    hold off
    print(1, ['LCS_forward',num2str(i,'%d')], '-dtiff','-r100','-noui');
    display(['Processed forward FTLE image #',num2str(i)])
end


%% Check for .tif files, adapted from PIV2Doppler/mkmovframebyframe
for i = 0:(N-1)
   fileframe = ['LCS_reverse', num2str(i), '.tif']; 
   fileframe2 = ['LCS_forward', num2str(i), '.tif']; 
   try
       R(i+1)=im2frame(imread(fileframe));
   catch
       display(['Last file was "LCS_reverse', num2str(i-1), '.tif"']);
       break
   end
   
   
   try
       F(i+1)=im2frame(imread(fileframe2));
   catch
       display(['Last file was "LCS_forward', num2str(i-1), '.tif"']);
       break
   end
    
   
end

%% Make the movie, also adapted from PIV2Doppler/mkmovframebyframe

aviname = 'LCS_forward.avi';
aviname2 = 'LCS_reverse.avi';

framesPerSec = 4;

movie2avi(F,aviname,'compression','none','quality',100,'fps',framesPerSec);
movie2avi(R,aviname2,'compression','none','quality',100,'fps',framesPerSec);

disp(['LCS movies saved']);

toc

% system('../copyfolder');

return

