function message = decoding(codedImage, Mapset)
    codedImage = double(codedImage);
    message = '';
    [rows, cols] = size(codedImage);
    message_bin = zeros(rows*cols, 1);
    for i = 1:rows*cols
        row = ceil(i / cols);
        col = mod(i-1, cols) + 1;
        message_bin(i) = bitget(codedImage(row, col), 1);
        if mod(i, 5) == 0
            chars = '';
            str = message_bin(i-4:i);
            for j = 1:5
                chars = [chars, num2str(str(j))];
            end
            index = find(strcmp(Mapset(2,:), chars));
            message = [message, Mapset{1, index}];
            if all(str == 1)
                break;
            end
        end
        
    end
end
