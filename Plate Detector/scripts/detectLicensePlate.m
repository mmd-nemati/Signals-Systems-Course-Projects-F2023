function [rectanglePosition, licensePlate] = detectLicensePlate(image, template)
    % Convert the images to double
    image = im2gray(image);
    template = im2gray(image);
    image = im2double(image);
    template = im2double(template);
    
    % Compute the Normalized Cross-Correlation
    ncc = normxcorr2(template, image);
    
    % Find the position of the maximum value of NCC
    [maxNcc, imax] = max(abs(ncc(:)));
    [ypeak, xpeak] = ind2sub(size(ncc), imax(1));
    
    % The position of the top-left corner of the rectangle
    rectanglePosition = [xpeak, ypeak];
    
    % Assume that the license plate extends a certain distance to the right of the rectangle
    licensePlateWidth = size(template, 2);  % Adjust this value based on your specific images
    licensePlateHeight = size(template, 1);
    
    % Extract the license plate from the image
    licensePlate = imcrop(image, [rectanglePosition(1), rectanglePosition(2), licensePlateWidth, licensePlateHeight]);
end