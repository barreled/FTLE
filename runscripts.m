% % % Run all the scripts in a row
% % % Start in PIVdata
% % 
% % % Make a copy of 'copyfolder template' called 'copyfolder' to prevent the
% % % find/replace operations later on from failing. Always have the same start
% % % point.
clc
tic
cd('/home/biolab/Desktop/Brian/FTLE/PIVdata');
system('cp ''copyfolder template'' copyfolder');
fileID = fopen('Run errors.txt', 'wt');
bag = 'Normal Bag';
speed = 'LVAD off';
oldbag = 'Normal Bag';
oldspeed = 'LVAD off';

%% 100 ml
oldbag = bag;
bag = '100 ml';


    %% LVAD off
    speed = 'LVAD off';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;


    %% 8k
    speed = '8k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

    %% 11k
    speed = '11k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;
        
%% 150ml
oldbag = bag;
bag = '150 ml';


    %% LVAD off
    speed = 'LVAD off';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;


    %% 8k
    speed = '8k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

    %% 11k
    speed = '11k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

% Tilting Disc - Free wall
oldbag = bag;
bag = 'Tilting Disc - Free Wall';


    %% LVAD off
    speed = 'LVAD off';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;    

    %% 8k
    speed = '8k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

    %% 11k
    speed = '11k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

%% Bileaflet
oldbag = bag;
bag = 'Bileaflet';


    %% LVAD off
    speed = 'LVAD off';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;


    %% 8k
    speed = '8k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

    %% 11k
    speed = '11k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

%% Tilting Disc - Septum
oldbag = bag;
bag = 'Tilting Disc - Septum';

    %% LVAD off
    speed = 'LVAD off';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;    

    %% 8k
    speed = '8k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;


    %% 11k
    speed = '11k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

%% Normal Bag
oldbag=bag;
bag = 'Normal';

    %% LVAD off
    speed = 'LVAD off';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;    

    %% 8k
    speed = '8k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

    %% 11k
    speed = '11k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

%% Small Clot
oldbag = bag;
bag = 'Small Clot';


    %% LVAD off
    speed = 'LVAD off';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

    %% 8k
    speed = '8k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

    %% 11k
    speed = '11k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

%% Cannula 1 Large
oldbag=bag;
bag = 'Cannula 1 Large';

    %% 1.8k
    speed = '1.8k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

    %% 2.3k
    speed = '2.3k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

    %% off
    speed = 'LVAD off';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

%% Cannula 1 Zoomed
oldbag = bag;
bag = 'Cannula 1 Zoomed';

    %% 1.8k
    speed = '1.8k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

    %% 2.3k
    speed = '2.3k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

    %% off
    speed = 'LVAD off';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

%% Cannula 2 Large
oldbag = bag;
bag = 'Cannula 2 Large';

    %% 1.8k
    speed = '1.8k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

    %% 2.3k
    speed = '2.3k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

    %% off
    speed = 'LVAD off';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

%% Cannula 2 Zoomed
oldbag = bag;
bag = 'Cannula 2 Zoomed';

    %% 1.8k
    speed = '1.8k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

    %% 2.3k
    speed = '2.3k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

    %% off
    speed = 'LVAD off';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

%% Cannula 3 Large
oldbag = bag;
bag = 'Cannula 3 Large';

    %% 1.8k
    speed = '1.8k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

    %% 2.3k
    speed = '2.3k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

    %% off
    speed = 'LVAD off';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

%% Cannula 3 Zoomed
oldbag = bag;
bag = 'Cannula 3 Zoomed';

    %% 1.8k
    speed = '1.8k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

    %% 2.3k
    speed = '2.3k';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

    %% off
    speed = 'LVAD off';

        filemanagement(bag,speed,oldbag,oldspeed);
        oldspeed=speed;

fclose(fileID);
toc
return