% Run all the scripts in a row
% Start in PIVdata

% Make a copy of 'copyfolder template' called 'copyfolder' to prevent the
% find/replace operations later on from failing. Always have the same start
% point.
tic
system('cp ''copyfolder template'' copyfolder');

%% Normal Bag

%% LVAD off

% Copy data into /bin
system('cp -a -rf ./bin/Normal/LVADoff/. ./bin/');
% Change the output folder in 'copyfolder' - not needed for first case
% Run data
visualize

%% 8k
% Copy data into /bin
system('cp -a -rf ./bin/Normal/8k/. ./bin/');
% Change the output folder in 'copyfolder'
system('sed -i -- ''s/LVADoff/8k/g'' copyfolder');
% Run data
visualize


% 11k
% Copy data into /bin
system('cp -a -rf ./bin/Normal/llk/. ./bin/');
% Change the output folder in 'copyfolder'
system('sed -i -- ''s/8k/11k/g'' copyfolder');
% Run data
visualize

%% Small Clot
system('sed -i -- ''s/Normal/SmallClot/g'' copyfolder');

%% LVAD off

% Copy data into /bin
system('cp -a -rf ./bin/SmallClot/LVADoff/. ./bin/');
% Change the output folder in 'copyfolder'
system('sed -i -- ''s/11k/LVADoff/g'' copyfolder');
% Run data
visualize

%% 8k

% Copy data into /bin
system('cp -a -rf ./bin/SmallClot/8k/. ./bin/');
% Change the output folder in 'copyfolder'
system('sed -i -- ''s/LVADoff/8k/g'' copyfolder');
% Run data
visualize

%% 11k

% Copy data into /bin
system('cp -a -rf ./bin/SmallClot/llk/. ./bin/');
% Change the output folder in 'copyfolder'
system('sed -i -- ''s/8k/11k/g'' copyfolder');
% Run data
visualize

%% Cannula 1 Large
system('sed -i -- ''s/SmallClot/cannula1large/g'' copyfolder');

%% 1.8k

% Copy data into /bin
system('cp -a -rf ./bin/cannula1large/1.8k/. ./bin/');
% Change the output folder in 'copyfolder'
system('sed -i -- ''s/11k/1.8k/g'' copyfolder');
% Run data
visualize

%% 2.3k

% Copy data into /bin
system('cp -a -rf ./bin/cannula1large/2.3k/. ./bin/');
% Change the output folder in 'copyfolder'
system('sed -i -- ''s/1.8k/2.3k/g'' copyfolder');
% Run data
visualize

%% off

% Copy data into /bin
system('cp -a -rf ./bin/cannula1large/off/. ./bin/');
% Change the output folder in 'copyfolder'
system('sed -i -- ''s/2.3k/off/g'' copyfolder');
% Run data
visualize

%% Cannula 1 Zoomed
system('sed -i -- ''s/SmallClot/cannula1zoomed/g'' copyfolder');

%% 1.8k

% Copy data into /bin
system('cp -a -rf ./bin/cannula1zoomed/1.8k/. ./bin/');
% Change the output folder in 'copyfolder'
system('sed -i -- ''s/off/1.8k/g'' copyfolder');
% Run data
visualize

%% 2.3k

% Copy data into /bin
system('cp -a -rf ./bin/cannula1zoomed/2.3k/. ./bin/');
% Change the output folder in 'copyfolder'
system('sed -i -- ''s/1.8k/2.3k/g'' copyfolder');
% Run data
visualize

%% off

% Copy data into /bin
system('cp -a -rf ./bin/cannula1zoomed/off/. ./bin/');
% Change the output folder in 'copyfolder'
system('sed -i -- ''s/2.3k/off/g'' copyfolder');
% Run data
visualize

%% Cannula 2 Large
system('sed -i -- ''s/SmallClot/cannula2large/g'' copyfolder');

%% 1.8k

% Copy data into /bin
system('cp -a -rf ./bin/cannula2large/1.8k/. ./bin/');
% Change the output folder in 'copyfolder'
system('sed -i -- ''s/off/1.8k/g'' copyfolder');
% Run data
visualize

%% 2.3k

% Copy data into /bin
system('cp -a -rf ./bin/cannula2large/2.3k/. ./bin/');
% Change the output folder in 'copyfolder'
system('sed -i -- ''s/1.8k/2.3k/g'' copyfolder');
% Run data
visualize

%% off

% Copy data into /bin
system('cp -a -rf ./bin/cannula2large/off/. ./bin/');
% Change the output folder in 'copyfolder'
system('sed -i -- ''s/2.3k/off/g'' copyfolder');
% Run data
visualize

%% Cannula 2 Zoomed
system('sed -i -- ''s/SmallClot/cannula2zoomed/g'' copyfolder');

%% 1.8k

% Copy data into /bin
system('cp -a -rf ./bin/cannula2zoomed/1.8k/. ./bin/');
% Change the output folder in 'copyfolder'
system('sed -i -- ''s/off/1.8k/g'' copyfolder');
% Run data
visualize

%% 2.3k

% Copy data into /bin
system('cp -a -rf ./bin/cannula2zoomed/2.3k/. ./bin/');
% Change the output folder in 'copyfolder'
system('sed -i -- ''s/1.8k/2.3k/g'' copyfolder');
% Run data
visualize

%% off

% Copy data into /bin
system('cp -a -rf ./bin/cannula2zoomed/off/. ./bin/');
% Change the output folder in 'copyfolder'
system('sed -i -- ''s/2.3k/off/g'' copyfolder');
% Run data
visualize

%% Cannula 2 Large
system('sed -i -- ''s/SmallClot/cannula3large/g'' copyfolder');

%% 1.8k

% Copy data into /bin
system('cp -a -rf ./bin/cannula3large/1.8k/. ./bin/');
% Change the output folder in 'copyfolder'
system('sed -i -- ''s/off/1.8k/g'' copyfolder');
% Run data
visualize

%% 2.3k

% Copy data into /bin
system('cp -a -rf ./bin/cannula3large/2.3k/. ./bin/');
% Change the output folder in 'copyfolder'
system('sed -i -- ''s/1.8k/2.3k/g'' copyfolder');
% Run data
visualize

%% off

% Copy data into /bin
system('cp -a -rf ./bin/cannula3large/off/. ./bin/');
% Change the output folder in 'copyfolder'
system('sed -i -- ''s/2.3k/off/g'' copyfolder');
% Run data
visualize

%% Cannula 2 Zoomed
system('sed -i -- ''s/SmallClot/cannula2zoomed/g'' copyfolder');

%% 1.8k

% Copy data into /bin
system('cp -a -rf ./bin/cannula3zoomed/1.8k/. ./bin/');
% Change the output folder in 'copyfolder'
system('sed -i -- ''s/off/1.8k/g'' copyfolder');
% Run data
visualize

%% 2.3k

% Copy data into /bin
system('cp -a -rf ./bin/cannula3zoomed/2.3k/. ./bin/');
% Change the output folder in 'copyfolder'
system('sed -i -- ''s/1.8k/2.3k/g'' copyfolder');
% Run data
visualize

%% off

% Copy data into /bin
system('cp -a -rf ./bin/cannula3zoomed/off/. ./bin/');
% Change the output folder in 'copyfolder'
system('sed -i -- ''s/2.3k/off/g'' copyfolder');
% Run data
visualize