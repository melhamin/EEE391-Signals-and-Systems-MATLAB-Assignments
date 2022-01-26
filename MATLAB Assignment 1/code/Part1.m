% Read image
img = imread('dog.jpg');

% % Individual Channels
r_channel = img(:,:,1); 
g_channel = img(:,:,2); 
b_channel = img(:,:,3); 
% 
% % ------------------------- PART 1 I -------------------------
% 
% % Black color to replace channels with
% no_color = zeros(size(img, 1), size(img, 2), 'uint8');
% 
% % Individual color
only_red = cat(3, r_channel, no_color, no_color);
only_green = cat(3, no_color, g_channel, no_color);
only_blue = cat(3, no_color, no_color, b_channel);
% 
% % Plot
% 
% Only red channel is not zero
imshow(only_red);
title('Only Red', 'FontSize', fontSize)

% Only green channel is not zero
imshow(only_green)
title('Only Green', 'FontSize', fontSize)

% Only blue channel is not zero
imshow(only_blue);
title('Only Blue', 'FontSize', fontSize)
% % 
% 
% % ------------------------- PART 1 II -------------------------
gray = 0.299 * r_channel + 0.587 * g_channel + 0.114 * b_channel;
imwrite(gray, "grayscale_ii.jpg", "Quality", 100);

% Plot
fontSize = 20;
imshow(gray);
title('Grayscale Image', 'FontSize', fontSize)

% ------------------------- PART 1 III -------------------------
upside_down = flipud(img);
trp = pagectranspose(img);
rotated_90 = flipud(trp);

% % Plot
imshow(rotated_90);
title('Flipped Image')

% ------------------------- PART 1 IV -------------------------
cropped = img(25:775, 50:750, :);
% imwrite(cropped, "cropped.jpg", "Quality", 100);

% % Plot
% 
imshow(cropped);
title('Cropped Image')

% ------------------------- PART 1 V -------------------------
new_img = im2double(imread("cropped.jpg"));
new_img = new_img(:,:,1);
% 
img_zeroed = new_img;
img_zeroed(new_img < 0.2) = 0;


% % Plot
imshow(img_zeroed, []);
title('Pixelx < 0.2 Set to 0')