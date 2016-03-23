% Run all the scripts in a row
% Start in PIVdata

% Make a copy of 'copyfolder template' called 'copyfolder' to prevent the
% find/replace operations later on from failing. Always have the same start
% point.
tic
cd('/home/biolab/Desktop/Brian/FTLE/PIVdata');
system('cp ''copyfolder template'' copyfolder');
fileID = fopen('Run errors.txt', 'wt');
bag = 'Normal Bag'

%% Tilting Disc - Free wall
oldbag = bag;
bag = 'Tilting Disc - Free Wall';


%% LVAD off
speed = 'LVAD off';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system(['cp -a -rf ''./bin/',bag,'/LVAD off/.''' ' ./bin/']);
    % Change the output folder in 'copyfolder'
    system(['sed -i -- ''s/',oldbag,'/',bag,'/g'' copyfolder']);
    oldspeed=speed;
    % Run data
    visualize(bag, speed);  
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end
    

%% 8k
speed = '8k';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system(['cp -a -rf ''./bin/',bag,'/8k/.''' ' ./bin/']);
    % Change the output folder in 'copyfolder'
    system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
    oldspeed=speed;
    % Run data
   visualize(bag, speed);  
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end


%% 11k
speed = '11k';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system(['cp -a -rf ''./bin/',bag,'/11k/.''' ' ./bin/']);
    % Change the output folder in 'copyfolder'
    system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
    oldspeed=speed;
    % Run data
    visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end

%% Bileaflet
oldbag = bag;
bag = 'Bileaflet';


%% LVAD off
speed = 'LVAD off';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system(['cp -a -rf ''./bin/',bag,'/LVAD off/.''' ' ./bin/']);
    % Change the output folder in 'copyfolder'
    system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
    system(['sed -i -- ''s/',oldbag,'/',bag,'/g'' copyfolder']);
    oldspeed=speed;
    % Run data
    visualize(bag, speed);  
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end
    

%% 8k
speed = '8k';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system(['cp -a -rf ''./bin/',bag,'/8k/.''' ' ./bin/']);
    % Change the output folder in 'copyfolder'
    system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
    oldspeed=speed;
    % Run data
   visualize(bag, speed);  
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end


%% 11k
speed = '11k';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system(['cp -a -rf ''./bin/',bag,'/11k/.''' ' ./bin/']);
    % Change the output folder in 'copyfolder'
    system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
    oldspeed=speed;
    % Run data
    visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end

%% Tilting Disc - Septum
oldbag = bag;
bag = 'Tilting Disc - Septum';

%% LVAD off
speed = 'LVAD off';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system(['cp -a -rf ''./bin/',bag,'/LVAD off/.''' ' ./bin/']);
    % Change the output folder in 'copyfolder'
    system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
    system(['sed -i -- ''s/',oldbag,'/',bag,'/g'' copyfolder']);
    oldspeed=speed;
    % Run data
    visualize(bag, speed);  
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end
    

%% 8k
speed = '8k';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system(['cp -a -rf ''./bin/',bag,'/8k/.''' ' ./bin/']);
    % Change the output folder in 'copyfolder'
    system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
    oldspeed=speed;
    % Run data
   visualize(bag, speed);  
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end


%% 11k
speed = '11k';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system(['cp -a -rf ''./bin/' bag '/11k/.''' ' ./bin/']);
    % Change the output folder in 'copyfolder'
    system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
    oldspeed=speed;
    % Run data
    visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end

% %% Normal Bag
% bag = 'Normal Bag';
% oldbag = bag;
% 
% %% LVAD off
% speed = 'LVAD off';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/Normal/LVADoff/. ./bin/');
%     % Change the output folder in 'copyfolder' - not needed for first case
%     oldspeed=speed;
%     % Run data
%     visualize(bag, speed);  
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end
%     
% 
% %% 8k
% speed = '8k';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/Normal/8k/. ./bin/');
%     % Change the output folder in 'copyfolder'
%     system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
%     oldspeed=speed;
%     % Run data
%    visualize(bag, speed);  
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end
% 
% 
% %% 11k
% speed = '11k';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/Normal/11k/. ./bin/');
%     % Change the output folder in 'copyfolder'
%     system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
%     oldspeed=speed;
%     % Run data
%     visualize(bag, speed); 
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end

% 
% %% Small Clot
% bag = 'Small Clot';
% system(['sed -i -- ''s/',oldbag,'/',bag,'/g'' copyfolder']);
% oldbag=bag;
% 
% %% LVAD off
% speed = 'LVAD off';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/SmallClot/LVADoff/. ./bin/');
%     % Change the output folder in 'copyfolder'
%     system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
%     oldspeed=speed;
%     % Run data
%    visualize(bag, speed);  
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end
% 
% %% 8k
% speed = '8k';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/SmallClot/8k/. ./bin/');
%     % Change the output folder in 'copyfolder'
%     system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
%     oldspeed=speed;
%     % Run data
%    visualize(bag, speed);  
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end
% 
% %% 11k
% speed = '11k';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/SmallClot/11k/. ./bin/');
%     % Change the output folder in 'copyfolder'
%     system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
%     oldspeed=speed;
%     % Run data
%     visualize(bag, speed); 
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end
% 
% %% Cannula 1 Large
% bag = 'Cannula 1 Large';
% system(['sed -i -- ''s/',oldbag,'/',bag,'/g'' copyfolder']);
% oldbag=bag;
% 
% %% 1.8k
% speed = '1.8k';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/cannula1large/1.8k/. ./bin/');
%     % Change the output folder in 'copyfolder'
%     system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
%     oldspeed=speed;
%     % Run data
%    visualize(bag, speed);  
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end
% 
% %% 2.3k
% speed = '2.3k';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/cannula1large/2.3k/. ./bin/');
%     % Change the output folder in 'copyfolder'
%     system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
%     oldspeed=speed;
%     % Run data
%    visualize(bag, speed);  
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end
% 
% 
% %% off
% speed = 'LVAD off';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/cannula1large/off/. ./bin/');
%     % Change the output folder in 'copyfolder'
%     system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
%     oldspeed=speed;
%     % Run data
%    visualize(bag, speed);  
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end
% 
% 
% %% Cannula 1 Zoomed
% bag = 'Cannula 1 Zoomed';
% system(['sed -i -- ''s/',oldbag,'/',bag,'/g'' copyfolder']);
% oldbag=bag;
% 
% %% 1.8k
% speed = '1.8k';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/cannula1zoomed/1.8k/. ./bin/');
%     % Change the output folder in 'copyfolder'
%     system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
%     oldspeed=speed;
%     % Run data
%     visualize(bag, speed);  
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end
% 
% 
% %% 2.3k
% speed = '2.3k';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/cannula1zoomed/2.3k/. ./bin/');
%     % Change the output folder in 'copyfolder'
%     system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
%     oldspeed=speed;
%     % Run data
%     visualize(bag, speed);  
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end
% 
% %% off
% speed = 'LVAD off';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/cannula1zoomed/off/. ./bin/');
%     % Change the output folder in 'copyfolder'
%     system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
%     oldspeed=speed;
%     % Run data
%     visualize(bag, speed);  
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end
% 
% %% Cannula 2 Large
% bag = 'Cannula 2 Large';
% system(['sed -i -- ''s/',oldbag,'/',bag,'/g'' copyfolder']);
% oldbag=bag;
% 
% %% 1.8k
% speed = '1.8k';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/cannula2large/1.8k/. ./bin/');
%     % Change the output folder in 'copyfolder'
%     system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
%     oldspeed=speed;
%     % Run data
%     visualize(bag, speed);  
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end
% 
% %% 2.3k
% speed = '2.3k';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/cannula2large/2.3k/. ./bin/');
%     % Change the output folder in 'copyfolder'
%     system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
%     oldspeed=speed;
%     % Run data
%     visualize(bag, speed);  
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end
% 
% %% off
% speed = 'LVAD off';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/cannula2large/off/. ./bin/');
%     % Change the output folder in 'copyfolder'
%     system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
%     oldspeed=speed;
%     % Run data
%     visualize(bag, speed);  
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end
% 
% %% Cannula 2 Zoomed
% bag = 'Cannula 2 Zoomed';
% system(['sed -i -- ''s/',oldbag,'/',bag,'/g'' copyfolder']);
% oldbag=bag;
% 
% %% 1.8k
% speed = '1.8k';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/cannula2zoomed/1.8k/. ./bin/');
%     % Change the output folder in 'copyfolder'
%     system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
%     oldspeed=speed;
%     % Run data
%     visualize(bag, speed); 
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end
% 
% %% 2.3k
% speed = '2.3k';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/cannula2zoomed/2.3k/. ./bin/');
%     % Change the output folder in 'copyfolder'
%     system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
%     oldspeed=speed;
%     % Run data
%     visualize(bag, speed);  
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end
% 
% %% off
% speed = 'LVAD off';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/cannula2zoomed/off/. ./bin/');
%     % Change the output folder in 'copyfolder'
%     system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
%     oldspeed=speed;
%     % Run data
%     visualize(bag, speed);  
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end
% 
% %% Cannula 3 Large
% bag = 'Cannula 3 Large';
% system(['sed -i -- ''s/',oldbag,'/',bag,'/g'' copyfolder']);
% oldbag=bag;
% 
% %% 1.8k
% speed = '1.8k';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/cannula3large/1.8k/. ./bin/');
%     % Change the output folder in 'copyfolder'
%     system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
%     oldspeed=speed;
%     % Run data
%     visualize(bag, speed); 
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end
% 
% %% 2.3k
% speed = '2.3k';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/cannula3large/2.3k/. ./bin/');
%     % Change the output folder in 'copyfolder'
%     system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
%     oldspeed=speed;
%     % Run data
%     visualize(bag, speed); 
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end
% 
% %% off
% speed = 'LVAD off';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/cannula3large/off/. ./bin/');
%     % Change the output folder in 'copyfolder'
%     system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
%     oldspeed=speed;
%     % Run data
%     visualize(bag, speed); 
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end
% 
% %% Cannula 3 Zoomed
% bag = 'Cannula 3 Zoomed';
% system(['sed -i -- ''s/',oldbag,'/',bag,'/g'' copyfolder']);
% oldbag=bag;
% 
% %% 1.8k
% speed = '1.8k';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/cannula3zoomed/1.8k/. ./bin/');
%     % Change the output folder in 'copyfolder'
%     system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
%     oldspeed=speed;
%     % Run data
%     visualize(bag, speed); 
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end
% 
% %% 2.3k
% speed = '2.3k';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/cannula3zoomed/2.3k/. ./bin/');
%     % Change the output folder in 'copyfolder'
%     system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
%     oldspeed=speed;
%     % Run data
%     visualize(bag, speed); 
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end
% 
% %% off
% speed = 'LVAD off';
% 
% try
%     system('rm ./bin/*.txt'); % Copy data into /bin
%     system('cp -a -rf ./bin/cannula3zoomed/off/. ./bin/');
%     % Change the output folder in 'copyfolder'
%     system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
%     oldspeed=speed;
%     % Run data
%     visualize(bag, speed); 
% catch
%     fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
% end

fclose(fileID);
toc