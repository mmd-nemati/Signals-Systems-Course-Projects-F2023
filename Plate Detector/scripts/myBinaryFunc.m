function binaryPicture = myBinaryFunc(picture, threshold)
    if size(picture, 3) == 3
        picture = myGrayFunc(picture);
    end

    binaryPicture = im2double(picture) > threshold;
end