% Run all the scripts in a row
% Start in PIVdata

% Make a copy of 'copyfolder template' called 'copyfolder' to prevent the
% find/replace operations later on from failing. Always have the same start
% point.
tic
cd('/home/biolab/Desktop/Brian/FTLE/PIVdata');
system('cp ''copyfolder template'' copyfolder');
fileID = fopen('Run errors.txt', 'wt');


%% Normal Bag
bag = 'Normal Bag';

%% LVAD off
speed = 'LVAD off';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system('cp -a -rf ./bin/Normal/LVADoff/. ./bin/');
    % Change the output folder in 'copyfolder' - not needed for first case
    % Run data
    %visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end
    

%% 8k
speed = '8k';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    pwd
    system('cp -a -rf ./bin/Normal/8k/. ./bin/');
    pwd
    % Change the output folder in 'copyfolder'
    system('sed -i -- ''s/LVADoff/8k/g'' copyfolder');
    % Run data
    %visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end


%% 11k
speed = '11k';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system('cp -a -rf ./bin/Normal/11k/. ./bin/');
    % Change the output folder in 'copyfolder'
    system('sed -i -- ''s/8k/11k/g'' copyfolder');
    % Run data
    visualize(bag, speed);
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end

%% Small Clot
system('sed -i -- ''s/Normal/SmallClot/g'' copyfolder');
bag = 'Small Clot';

%% LVAD off
speed = 'LVAD off';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system('cp -a -rf ./bin/SmallClot/LVADoff/. ./bin/');
    % Change the output folder in 'copyfolder'
    system('sed -i -- ''s/11k/LVADoff/g'' copyfolder');
    % Run data
    %visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end

%% 8k
speed = '8k';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system('cp -a -rf ./bin/SmallClot/8k/. ./bin/');
    % Change the output folder in 'copyfolder'
    system('sed -i -- ''s/LVADoff/8k/g'' copyfolder');
    % Run data
    %visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end

%% 11k
speed = '11k';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system('cp -a -rf ./bin/SmallClot/11k/. ./bin/');
    % Change the output folder in 'copyfolder'
    system('sed -i -- ''s/8k/11k/g'' copyfolder');
    % Run data
    visualize(bag, speed);
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end

%% Cannula 1 Large
system('sed -i -- ''s/SmallClot/cannula1large/g'' copyfolder');
bag = 'Cannula 1 Large';

%% 1.8k
speed = '1.8k';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system('cp -a -rf ./bin/cannula1large/1.8k/. ./bin/');
    % Change the output folder in 'copyfolder'
    system('sed -i -- ''s/11k/1.8k/g'' copyfolder');
    % Run data
    %visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end

%% 2.3k
speed = '2.3k';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system('cp -a -rf ./bin/cannula1large/2.3k/. ./bin/');
    % Change the output folder in 'copyfolder'
    system('sed -i -- ''s/1.8k/2.3k/g'' copyfolder');
    % Run data
    %visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end


%% off
speed = 'LVAD off';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system('cp -a -rf ./bin/cannula1large/off/. ./bin/');
    % Change the output folder in 'copyfolder'
    system('sed -i -- ''s/2.3k/off/g'' copyfolder');
    % Run data
    %visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end


%% Cannula 1 Zoomed
system('sed -i -- ''s/cannula1large/cannula1zoomed/g'' copyfolder');
bag = 'Cannula 1 Zoomed';

%% 1.8k
speed = '1.8k';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system('cp -a -rf ./bin/cannula1zoomed/1.8k/. ./bin/');
    % Change the output folder in 'copyfolder'
    system('sed -i -- ''s/off/1.8k/g'' copyfolder');
    % Run data
    visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end


%% 2.3k
speed = '2.3k';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system('cp -a -rf ./bin/cannula1zoomed/2.3k/. ./bin/');
    % Change the output folder in 'copyfolder'
    system('sed -i -- ''s/1.8k/2.3k/g'' copyfolder');
    % Run data
    visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end

%% off
speed = 'LVAD off';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system('cp -a -rf ./bin/cannula1zoomed/off/. ./bin/');
    % Change the output folder in 'copyfolder'
    system('sed -i -- ''s/2.3k/off/g'' copyfolder');
    % Run data
    visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end

%% Cannula 2 Large
system('sed -i -- ''s/cannula1zoomed/cannula2large/g'' copyfolder');
bag = 'Cannula 2 Large';

%% 1.8k
speed = '1.8k';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system('cp -a -rf ./bin/cannula2large/1.8k/. ./bin/');
    % Change the output folder in 'copyfolder'
    system('sed -i -- ''s/off/1.8k/g'' copyfolder');
    % Run data
    visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end

%% 2.3k
speed = '2.3k';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system('cp -a -rf ./bin/cannula2large/2.3k/. ./bin/');
    % Change the output folder in 'copyfolder'
    system('sed -i -- ''s/1.8k/2.3k/g'' copyfolder');
    % Run data
    visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end

%% off
speed = 'LVAD off';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system('cp -a -rf ./bin/cannula2large/off/. ./bin/');
    % Change the output folder in 'copyfolder'
    system('sed -i -- ''s/2.3k/off/g'' copyfolder');
    % Run data
    visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end

%% Cannula 2 Zoomed
system('sed -i -- ''s/cannula2large/cannula2zoomed/g'' copyfolder');
bag = 'Cannula 2 Zoomed';

%% 1.8k
speed = '1.8k';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system('cp -a -rf ./bin/cannula2zoomed/1.8k/. ./bin/');
    % Change the output folder in 'copyfolder'
    system('sed -i -- ''s/off/1.8k/g'' copyfolder');
    % Run data
    visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end

%% 2.3k
speed = '2.3k';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system('cp -a -rf ./bin/cannula2zoomed/2.3k/. ./bin/');
    % Change the output folder in 'copyfolder'
    system('sed -i -- ''s/1.8k/2.3k/g'' copyfolder');
    % Run data
    visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end

%% off
speed = 'LVAD off';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system('cp -a -rf ./bin/cannula2zoomed/off/. ./bin/');
    % Change the output folder in 'copyfolder'
    system('sed -i -- ''s/2.3k/off/g'' copyfolder');
    % Run data
    visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end

%% Cannula 2 Large
system('sed -i -- ''s/cannula2zoomed/cannula3large/g'' copyfolder');
bag = 'Cannula 2 Large';

%% 1.8k
speed = '1.8k';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system('cp -a -rf ./bin/cannula3large/1.8k/. ./bin/');
    % Change the output folder in 'copyfolder'
    system('sed -i -- ''s/off/1.8k/g'' copyfolder');
    % Run data
    visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end

%% 2.3k
speed = '2.3k';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system('cp -a -rf ./bin/cannula3large/2.3k/. ./bin/');
    % Change the output folder in 'copyfolder'
    system('sed -i -- ''s/1.8k/2.3k/g'' copyfolder');
    % Run data
    visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end

%% off
speed = 'LVAD off';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system('cp -a -rf ./bin/cannula3large/off/. ./bin/');
    % Change the output folder in 'copyfolder'
    system('sed -i -- ''s/2.3k/off/g'' copyfolder');
    % Run data
    visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end

%% Cannula 3 Zoomed
system('sed -i -- ''s/cannula3large/cannula3zoomed/g'' copyfolder');
bag = 'Cannula 3 Zoomed';

%% 1.8k
speed = '1.8k';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system('cp -a -rf ./bin/cannula3zoomed/1.8k/. ./bin/');
    % Change the output folder in 'copyfolder'
    system('sed -i -- ''s/off/1.8k/g'' copyfolder');
    % Run data
    visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end

%% 2.3k
speed = '2.3k';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system('cp -a -rf ./bin/cannula3zoomed/2.3k/. ./bin/');
    % Change the output folder in 'copyfolder'
    system('sed -i -- ''s/1.8k/2.3k/g'' copyfolder');
    % Run data
    visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end

%% off
speed = 'LVAD off';

try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system('cp -a -rf ./bin/cannula3zoomed/off/. ./bin/');
    % Change the output folder in 'copyfolder'
    system('sed -i -- ''s/2.3k/off/g'' copyfolder');
    % Run data
    visualize(bag, speed); 
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end

fclose(fileID);
toc