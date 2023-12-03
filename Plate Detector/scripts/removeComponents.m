function outputPicture = removeComponents(labeledComponets, numOfComps, P)
    outputPicture = false(size(labeledComponets));
    
    for i = 1:numOfComps
        component = (labeledComponets == i);
        if nnz(component(:)) >= P
            outputPicture = outputPicture | component;
        end
    end
end