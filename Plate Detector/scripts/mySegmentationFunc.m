function [labeledComponents, numOfObjects] = mySegmentationFunc(picture)
    [rows, cols] = size(picture);
    visited = false(size(picture));
    labeledComponents = zeros(size(picture));
    numOfObjects = 0;
    
    neighbors = [-1 -1; -1 0; -1 1; 0 -1; 0 1; 1 -1; 1 0; 1 1];
        for j = 1:cols
    for i = 1:rows
            if picture(i, j) && ~visited(i, j)
                numOfObjects = numOfObjects + 1;
                stack = [i j];
                
                while ~isempty(stack)
                    pixel = stack(end, :);
                    stack(end, :) = [];
                    if ~visited(pixel(1), pixel(2))
                        visited(pixel(1), pixel(2)) = true;
                        labeledComponents(pixel(1), pixel(2)) = numOfObjects;
                        
                        for k = 1:size(neighbors, 1)
                            neighbor = pixel + neighbors(k, :);
                            if neighbor(1) >= 1 && neighbor(1) <= rows && neighbor(2) >= 1 && ...
                                    neighbor(2) <= cols && picture(neighbor(1), neighbor(2)) && ...
                                    ~visited(neighbor(1), neighbor(2))
                                stack(end + 1, :) = neighbor;
                            end
                        end
                    end
                end
            end
        end
    end
end
