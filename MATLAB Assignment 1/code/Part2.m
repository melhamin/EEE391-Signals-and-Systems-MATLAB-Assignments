img = im2double(imread("grayscale_ii.jpg"));
% Filters to be applied
vertical_filter = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
horizontal_filter = [-1, -2, -1; 0, 0, 0; 1, 2, 1];

% ------ Apply vertical filter with both cust_conv2 and conv2 ---------
% Apply vertical filter using cust_conv2
filtered_y = cust_conv2(img, vertical_filter);
imshow(filtered_y);
title('Vertical Filter (cust-conv2)')

% Apply vertical filter using conv2
filtered_y = conv2(img, vertical_filter);
imshow(filtered_y);
title('Vertical Filter (conv2)')


% ------ Apply horizontal filter with both cust_conv2 and conv2 ---------
filtered_x = cust_conv2(img, horizontal_filter);
imshow(filtered_x);
title('Horizontal Filter (cust-conv2)')

% Apply horizontal filter using conv2
filtered_x = conv2(img, horizontal_filter);
imshow(filtered_x);
title('Horizontal Filter (conv2)')

% Plot merged and filtered images
subplot(2, 2, 1);
imshow(filtered_x);
title('Horizontal Filter');

subplot(2, 2, 2);
imshow(filtered_y);
title('Vertical Filter');

merged = cat(2, filtered_x, filtered_y);
subplot(2, 1, 2);
imshow(merged);
title('Merged')


