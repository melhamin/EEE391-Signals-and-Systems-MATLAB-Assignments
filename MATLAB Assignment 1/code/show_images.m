function show_images(img1, img2)
 subplot(1, 2, 1); 
 imshow(img1);
 title('Original Image');
 subplot(1, 2, 2); 
 imshow(img2);
 title('Filtered Image');
end
