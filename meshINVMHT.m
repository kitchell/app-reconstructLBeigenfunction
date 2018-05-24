function [vertices] = meshINVMHT(transformed, mhb, spectrum_size, filter)



    [numHarmonics, dim] = size(transformed);

    [numVertices, nHarmonics] = size(mhb);

    nHarmonics = spectrum_size;

    assert(dim == 3 && nHarmonics == numHarmonics);

    

    vertices = zeros(numVertices, dim);

    

    for coord=1:3

        for i=1:numVertices

            for k=1:numHarmonics

                if nargin == 3

                    vertices(i,coord) = vertices(i, coord) + transformed(k,coord) * mhb(i, k);

                else

                    vertices(i,coord) = vertices(i, coord) + transformed(k,coord) * mhb(i, k) * filter(k);

                end

            end

        end

    end

    

end