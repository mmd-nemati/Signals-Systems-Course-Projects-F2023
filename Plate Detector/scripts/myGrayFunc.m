function grayPicture = myGrayFunc(picture)
    redChannel = picture(:, :, 1);
    greenChannel = picture(:, :, 2);
    blueChannel = picture(:, :, 3);
    
    grayPicture = 0.299 * double(redChannel) + 0.578 * double(greenChannel) + 0.114 * double(blueChannel);
    grayPicture = uint8(grayPicture);
end