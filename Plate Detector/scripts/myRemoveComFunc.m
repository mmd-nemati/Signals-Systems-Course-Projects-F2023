function outputPicture = myRemoveComFunc(picture, n)
    [rows, cols] = size(picture);
    
    outputPicture = false(size(picture));
    visited = false(size(picture));
    
    neighbors = [-1 -1; -1 0; -1 1; 0 -1; 0 1; 1 -1; 1 0; 1 1];
    for i = 1:rows
        for j = 1:cols
            if picture(i, j) && ~visited(i, j)
                component = false(size(picture));
                queue = [i j];
                
                while ~isempty(queue)
                    pixel = queue(1, :);
                    queue(1, :) = [];
                    
                    if ~visited(pixel(1), pixel(2))
                        visited(pixel(1), pixel(2)) = true;
                        component(pixel(1), pixel(2)) = true;
                        
                        for k = 1:size(neighbors, 1)
                            neighbor = pixel + neighbors(k, :);
                            if neighbor(1) >= 1 && neighbor(1) <= rows && neighbor(2) >= 1 &&...
                                    neighbor(2) <= cols && picture(neighbor(1), neighbor(2)) && ...
                                    ~visited(neighbor(1), neighbor(2))
                                queue(end + 1, :) = neighbor;
                            end
                        end
                    end
                end
                if nnz(component(:)) >= n
                    outputPicture = outputPicture | component;
                end
            end
        end
    end
end

