function kilosort2_5_preprocessing(fpath, kilosortPath)
    try
        set(groot,'defaultFigureVisible', 'off');

        if ~isdeployed
            % prepare for kilosort execution
            addpath(genpath(kilosortPath));

            % add npy-matlab functions (copied in the output folder)
            addpath(genpath(fpath));
        end

        % Load channel map file
        load(fullfile(fpath, 'chanMap.mat'));

        % Load the configuration file, it builds the structure of options (ops)
        load(fullfile(fpath, 'ops.mat'));

        % preprocess data to create temp_wh.dat
        rez = preprocessDataSub(ops);
        maindir = fileparts(ops.fproc)
        save(fullfile(maindir,'rez.mat'), 'rez')
    catch
        fprintf('----------------------------------------');
        fprintf(lasterr());
        quit(1);
    end
    quit(0);
end