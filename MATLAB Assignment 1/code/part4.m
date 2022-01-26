% ------------------- Part 4 I ----------------------
img = im2double(imread("grayscale_ii.jpg"));
noise = normrnd(0, 0.5, size(img));
noise = noise * 0.2;
noisy = img + noise;

smoothened_7 = m_point_avg(noisy, 7);
show_images(noisy, smoothened_7);

smoothened_21 = m_point_avg(noisy, 21);
show_images(noisy, smoothened_21);

smoothened_41 = m_point_avg(noisy, 41);
show_images(noisy, smoothened_41);