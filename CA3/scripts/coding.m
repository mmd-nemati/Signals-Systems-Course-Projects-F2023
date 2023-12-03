function enhancedImage = coding(image, message, Mapset)
    binaryMessage = '';
    for i = 1:length(message)
        index = find(strcmp(Mapset(1,:), message(i)));
        if isempty(index)
            error("Character not found inside mapset.");
        end
        binaryMessage = [binaryMessage, Mapset{2, index}];
    end

    if size(image, 3) == 3
        image = myGrayFunc(image);
    end
    enhancedImage = image;
    binaryImage = dec2bin(image, 8);
    [rows, cols] = size(image);
    if length(binaryMessage) > rows*cols
        error('The message is too long to fit in the image.');
    end

    for i = 1:length(binaryMessage)
        row = ceil(i / cols);
        col = mod(i-1, cols) + 1;
        
        enhancedImage(row, col) = bitset(image(row, col), 1, str2num(binaryMessage(i)));
    end

    enhancedImage = uint8(enhancedImage);
end
