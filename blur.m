function output = blur(img,w)

img_copy = double(img);
img_mean_values = zeros(size(img_copy));

% Adding zero padding around the image. The w variable specfies the amount
% of blur. w = 0, no blur. Higher values increase blurring of the priginal
% image
img_copy_padded =   [nan(size(img_copy,1)+2*w, w)   [nan(w, size(img_copy,2)); img_copy; nan(w, size(img_copy,2))]  nan(size(img_copy,1)+2*w, w)];


for ii = (1+w) : (size(img_copy_padded,1)-w)
    for jj = (1+w) : (size(img_copy_padded,2)-w)
         %test_img(ii-w, jj-w) = img_copy_padded(ii,jj); % <- used for checking

          % Now to geta submatrix of 2w+1 x 2w+1
          %fprintf("\n\nii: %d\t\tjj: %d\n", ii, jj); % <- used for checking
          square_submatrix = (img_copy_padded(ii-w : ii+w, jj-w : jj+w));
          array = 0; count = 0;
          %fprintf("\n..........next square submatrix...........\n")
          for kk = 1:size(square_submatrix,1)
              for ll = 1:size(square_submatrix,1)
                  if ~isnan(square_submatrix(kk,ll))
                      count = count + 1;
                      array = array + (square_submatrix(kk,ll));
                  end
              end              
          end
        img_mean_values(ii-w, jj-w) = array/count;
        %fprintf("\narray total: %d \t\t count: %d \t\t mean: %.2f", array, count, array/count) 
    end
end
% Output of result
fprintf("\n\n")
output = uint8(img_mean_values);
end









%     img_copy = double(img);
%     [rows, columns] = size(img_copy);
%     B = nan(size(img_copy) + 2 * w);
%     B(w + 1 : end - w, w + 1 : end - w) = img_copy;
%     output = 0 * img_copy;
% 
%     for i = w + 1 : rows + w
%       for j = w + 1 : columns + w
%         tmp = B(i - w : i + w, j - w : j + w);
%         output(i - w, j - w) = mean(tmp(~isnan(tmp)));
%       end
%     end
% end