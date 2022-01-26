% Read the image
img = imread("grayscale_ii.jpg");
sharpening_filter = [0, -1, 0; -1, 5, -1; 0, -1, 0];
  
convolved_img = conv2(img, sharpening_filter);
% Normalize intensified pixels
convolved_img = uint8(convolved_img);

% Plot
imshow(convolved_img);
title('Sharepened Image')

[h, w] = freqz2(sharpening_filter);

plot(w, abs(h));
title('Frequency Response of Sharpening Filter')
