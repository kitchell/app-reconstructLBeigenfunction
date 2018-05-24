function [transformed] = meshMHT(vertices, mhb, M, spectrum_size)



    [numVertices, dim] = size(vertices);

    [nVertices, numHarmonics] = size(mhb);

    numHarmonics = spectrum_size;

    assert(dim == 3 && nVertices == numVertices);

    

    transformed = zeros(numHarmonics, dim);

    

    for coord=1:3

        for k=1:numHarmonics

            for i=1:numVertices

                transformed(k,coord) = transformed(k, coord) + vertices(i,coord) * mhb(i, k) * M(i,i);

            end

        end

    end

    

end