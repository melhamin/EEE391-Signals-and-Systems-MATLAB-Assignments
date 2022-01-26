

function [ output ] = cust_conv2(img, filter) 
  % Create padded matrix and copy the image to it.
  new_img = zeros(size(img, 1) + 2, size(img, 2) + 2);
  new_img = cast(new_img, class(img));  
  new_img(2:end-1, 2:end-1) = img;

  % Create output image matrix
  output = zeros(size(new_img));
  output = cast(output, class(img));

  for i = 2:1:size(img, 1)+1 
    for j = 2:1:size(img, 2)+1 
      avg = 0;
      for k = -1:1:1
        for l = -1:1:1
          avg = avg + new_img(i + k, j + l) * filter(k + 2, l + 2);
        end
      end
     output(i, j) = avg;
    end
  end
end