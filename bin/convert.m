% Matlab Visualization stuff. This function will take a sequence of 38
% converted.X.txt files containing FTLE eigenvalues, plot their contours
% (which are Lagrangian Coherent Structures), and turn that into a movie.


function visualize()

%% Intialization, adapted from PIV2Doppler
clear all;
clc; clf; close all;
warning off

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
%  [lmaxima,indices] = localmax(reverse,[],false);
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


% %% Make N contour images from the converted FTLE files, save them as "LCS.X.tif"
% N = 40; % number of FTLE files
% figure(1)
% set(gcf,'visible','off')


%         Reverse FTLE data
x = csvread(['x.txt'])';
y = csvread(['y.txt'])';
time = csvread(['time.txt'])';
xlen = length(x);
ylen = length(y);
timelen = length(time);

u = zeros(timelen,ylen,xlen);
v = zeros(timelen,ylen,xlen);

% 
% u = zeros(length(time),length(x).length(y))
% v = zeros(length(time),length(x).length(y))

for i = 1:length(time);
    try
        uname = ['u',num2str(i),'.txt'];
        vname = ['v',num2str(i),'.txt'];
        u(i,:,:) = csvread(uname);
        v(i,:,:) = csvread(vname);
    catch
        display(['Could not read velocities from frame ',num2str(i)]);
        break
    end
end
u(u==0) = NaN;
v(v==0) = NaN;

save('data.mat','x','y','time','u','v');

% 
% %% Check for .tif files, adapted from PIV2Doppler/mkmovframebyframe
% for i = 0:(N-1)
%    fileframe2 = ['LCS_reverse', num2str(i), '.tif']; 
%    
%    try
%        R(i+1)=im2frame(imread(fileframe2));
%    catch
%        display(['Last file was "LCS_reverse', num2str(i-1), '.tif"']);
%    end
%     
%    
% end
% 
% %% Make the movie, also adapted from PIV2Doppler/mkmovframebyframe
% 
% aviname2 = 'LCS_reverse.avi';
% 
% framesPerSec = 4;
% 
% movie2avi(R,aviname2,'compression','none','quality',100,'fps',framesPerSec);
% 
% disp(['LCS movies saved']);
% 
% return
% 
% 
%     
