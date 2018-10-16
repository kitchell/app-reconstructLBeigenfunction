function [origiminfo, reconiminfo] =  reconstruct_surface_from_eigenfunction(V, F, evecs, M, spectrum_size, filename)

az = [0 180 0 270 90 180];
el = [180 270 90 180 180 180];
v = {'front', 'top' ,'bottom', 'left' ,'right' ,'back'};

transformed = meshMHT(V', evecs, M, spectrum_size);

reconstructed = meshINVMHT(transformed, evecs, spectrum_size);

Vt = V';

vtkwrite(fullfile('surfaces',strcat(filename, '_recon_eigenfunction_', num2str(spectrum_size))), 'polydata', 'triangle', reconstructed(:,1), reconstructed(:,2), reconstructed(:,3), F')

for angle = 1:size(az, 2)
    %clf
    figure
    p=patch('Vertices', Vt, 'Faces', F', 'FaceVertexCData', Vt(:,3), 'FaceColor', 'interp', 'FaceLighting', 'gouraud', 'LineStyle', 'none');
    %p.FaceColor='interp';
    axis equal
    axis off
    view(az(angle), el(angle));
    camlight('headlight');
    set(gcf, 'Color', 'none');
    %colorbar
    figname = fullfile('images', strcat(filename, 'original_eigenfunction_', num2str(spectrum_size), '_', char(v(angle)), '.png'));
    export_fig(figname)
    origiminfo(angle).filename = figname;
    origiminfo(angle).name = filename;
    origiminfo(angle).desc = strcat(filename, ' original eigenfunction ', num2str(spectrum_size), ' ', char(v(angle)));
end

for angle = 1:size(az, 2)
    %clf
    figure
    p=patch('Vertices', reconstructed, 'Faces', F', 'FaceVertexCData', reconstructed(:,3), 'FaceColor', 'interp', 'FaceLighting', 'gouraud', 'LineStyle', 'none');
    %p.FaceColor='interp';
    axis equal
    axis off
    view(az(angle), el(angle));
    camlight('headlight');
    set(gcf, 'Color', 'none');
    %colorbar
    figname = fullfile('images', strcat(filename, 'recon_eigenfunction_', num2str(spectrum_size), '_', char(v(angle)), '.png'));
    export_fig(figname)
    reconiminfo(angle).filename = figname;
    reconiminfo(angle).name = filename;
    reconiminfo(angle).desc = strcat(filename, ' reconstructed eigenfunction ', num2str(spectrum_size), ' ', char(v(angle)));
end