function [] = main()
% 
% switch getenv('ENV')
%     case 'IUHPC'
%         disp('loading paths (HPC)')
%         addpath(genpath('/N/u/brlife/git/jsonlab'))
%         addpath(genpath('/N/u/brlife/git/geom3d'))
%         addpath(genpath('/N/u/kitchell/Carbonate/github_repos/export_fig'))

%     case 'VM'
%         disp('loading paths (VM)')
%         addpath(genpath('/usr/local/jsonlab'))
% end

mkdir('images');
mkdir('surfaces');

config = loadjson('config.json');

if config.single_surf
    sprintf(config.singlesurf_filename)
    [V,F] = read_vtk([config.surfaces '/' config.singlesurf_filename]);
    filename = strrep(config.singlesurf_filename(1:end-4),'-', '_');

    [evecs, evals, error, M] = laplace_beltrami_spectrum_reconstruct(V,F,config.spectrum_size);
    if error == 0
        [origiminfo, reconiminfo] = reconstruct_surface_from_eigenfunction(V, F, evecs, M, config.spectrum_size, filename);

    else
       sprintf(config.singlesurf_filename, ' is too small') 
    end
    for im = 1:12
        if im < 7
            json.images(im) = origiminfo(im);
        else
            json.images(im) = reconiminfo(im-6);
        end
    end
    
else
    filelist = dir([config.surfaces '/*.vtk']);
    for file = 1:size(filelist)
        sprintf(filelist(file).name)
        [V,F] = read_vtk([config.surfaces '/' filelist(file).name]);
        filename = strrep(filelist(file).name(1:end-4),'-', '_');

        [evecs, evals, error, M] = laplace_beltrami_spectrum_reconstruct(V,F,config.spectrum_size);
        if error == 0
            [origiminfo, reconiminfo] = reconstruct_surface_from_eigenfunction(V, F, evecs, M, config.spectrum_size, filename);

        else
           sprintf(filelist(file).name, ' is too small') 
        end
        for im = 1:12
            if im < 7
                json.images(((file-1) * 12) + im) = origiminfo(im);
            else
                json.images(((file-1) * 12) + im) = reconiminfo(im-6);
            end
        end
    end
end
savejson('', json, 'images.json');
% savejson('', eval_json, 'spectrum.json');
% save('Mmatrix.mat', 'M_matrix', '-v7.3');
% save('eigenvectors.mat', 'evecs_struct', '-v7.3');
end
%h5create('eigenvectors.h5', '/eigenvectors', size(evecs_struct))
%h5write('eigenvectors.h5', '/eigenvectors', evecs_struct)
%save 'eigenvectors.mat' evecs_struct
%config.surfaces
%config.spectrum_size
%config.evecs
%config.Mmatrix
% 
% if isfield(config, 'evecs_folder') && isfield(config, 'Mmatrix_folder') 
%     load(fullfile(config.evecs_folder, 'eigenvectors.mat'))
%     load(fullfile(config.Mmatrix_folder, 'Mmatrix.mat'))
%     evecsMmatrixexist = 1;
% else
%     evecsMmatrixexist = 0;
% end
    
% if evecsMmatrixexist
%         if isfield(evecs_struct, filename)
%             [origiminfo, reconiminfo] =reconstruct_surface_from_eigenfunction(V, F, evecs_struct.(filename), M_matrix(filename), config.spectrum_size, filename);
%         end
%     else

