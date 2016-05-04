function filemanagement(bag, speed, oldbag, oldspeed)
try
    system('rm ./bin/*.txt'); % Copy data into /bin
    system(['cp -a -rf ''./bin/',bag,'/',speed,'/.''' ' ./bin/']);
    % Change the output folder in 'copyfolder' file
    system(['sed -i -- ''s/',oldbag,'/',bag,'/g'' copyfolder']);
    system(['sed -i -- ''s/',oldspeed,'/',speed,'/g'' copyfolder']);
    % Run data
    visualize(bag, speed);  
catch
    fprintf(fileID, ['Error in ' bag ', ' speed '. \n']);
end
return