% Matlab Visualization stuff. This function will take a sequence of 38
% converted.X.txt files containing FTLE eigenvalues, plot their contours
% (which are Lagrangian Coherent Structures), and turn that into a movie.


function visualize(bag, speed)
% clc;
clearvars -except bag speed
%tic;
system('./nonCartFTLE');
cd('output');

lowerlimit = 0;
upperlimit = 15;

% Make files for confirming which condition it is
fh1 = fopen([bag, ' - ', speed, ' - reverse.txt'], 'wt');
fh2 = fopen([bag, ' - ', speed, ' - forward.txt'], 'wt');

fclose(fh1);
fclose(fh2);

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
N = 38; % number of FTLE files
figure(1);
set(gcf,'visible','off');


%         Reverse FTLE data
for i = 0:(N-1);
    fname = ['converted_reverse.',num2str(i),'.csv'];
    try
        reverse = csvread(fname);
    catch
        display(['Last file was ',fname]);
        break
    end
    matfilename = [bag, ' - ', speed, ' - ', 'reverse',num2str(i),'.mat'];
    save(matfilename,'reverse');
    hpc = pcolor(reverse);
%     set(hpc,'facealpha',0.4);
    shading flat;
    colorbar;
    caxis([lowerlimit upperlimit]);
    title([bag, ' - ', speed, ' - ', 'Attracting LCS - Frame ',num2str(i,'%02d')]);
    hold on;
%     x = 1:length(reverse);
%     [lmaxima,indices] = localmax(reverse,[],false);
%     [iRow,iCol] = find(lmaxima);
%     plot(x(iCol),x(iRow),'marker','p',...
%    'linestyle','none', 'color', 'g');
    hold off;
    print(1, [bag, ' - ', speed, ' - ', 'reverse',num2str(i,'%d'),'.tif'], '-dtiff','-r100','-noui');
    display(['Saved reverse FTLE image #',num2str(i)]);
end

%         Forward FTLE data
for i = 0:(N-1);
    fname = ['converted.',num2str(i),'.csv'];
    try
        forward = csvread(fname);
    catch
        display(['Last file was ',fname]);
        break
    end
    matfilename = [bag, ' - ', speed, ' - ', 'forward',num2str(i),'.mat'];
    save(matfilename,'forward');
    hpc = pcolor(forward);
%     set(hpc,'facealpha',0.4);
    shading flat;
    colorbar;
    caxis([lowerlimit upperlimit]);
    title([bag, ' - ', speed, ' - ', 'Repelling LCS - Frame ',num2str(i,'%02d')]);
    hold on;
%     x = 1:length(forward);
%     [lmaxima,indices] = localmax(forward,[],false);
%     [iRow,iCol] = find(lmaxima);
%     plot(x(iCol),x(iRow),'marker','p',...
%     'linestyle','none', 'color', 'g');
    hold off
    print(1, [bag, ' - ', speed, ' - ', 'forward',num2str(i,'%d'),'.tif'], '-dtiff','-r100','-noui');
    display(['Saved forward FTLE image #',num2str(i)])
end


% %% Check for .tif files, adapted from PIV2Doppler/mkmovframebyframe
% for i = 0:(N-1)
%    fileframe = [bag, ' - ', speed, ' - ', 'forward',num2str(i,'%d'),'.tif']; 
%    fileframe2 = [bag, ' - ', speed, ' - ', 'reverse',num2str(i,'%d'),'.tif'];
%    
%    try
%        F(i+1)=im2frame(imread(fileframe));
%    catch
%        display(['Last file was ',fileframe]);
%        break
%    end
%    
%    try
%        R(i+1)=im2frame(imread(fileframe2));
%    catch
%        display(['Last file was ', fileframe2]);
%        break
%    end
%       
%    
% end
% 
% %% Make the movie, also adapted from PIV2Doppler/mkmovframebyframe
% 
% aviname = ['forward - ', bag, ' - ', speed, '.avi'];
% aviname2 = ['reverse - ', bag, ' - ', speed, '.avi'];
% 
% framesPerSec = 4;
% 
% try
%     movie2avi(F,aviname,'compression','none','quality',100,'fps',framesPerSec);
%     movie2avi(R,aviname2,'compression','none','quality',100,'fps',framesPerSec);
%     disp(['LCS movies saved']);
% catch
%     disp('An error occured in making the movies')
% end

%toc

system('../copyfolder');
% disp(pwd)
cd('..');
% disp(pwd)
% disp('end visualization')
return

