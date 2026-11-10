clear;
clc;
if winsid() ~= [] then
    close(winsid());
end

img_input = imread("images.jpg");

if size(img_input, 3) == 3 then
    img_gray = rgb2gray(img_input);
else
    img_gray = img_input;
end

hist_vals = imhist(img_gray);
img_eq = imhistequal(img_gray);

h_blur = ones(5, 5) / 25;
img_blur = imfilter(img_gray, h_blur);

[rows, cols] = size(img_gray);
wm_mask = zeros(rows, cols);

r_start = round(rows * 0.35);
r_end   = round(rows * 0.65);
c_start = round(cols * 0.20);
c_end   = round(cols * 0.80);
wm_mask(r_start:r_end, c_start:c_end) = 255;

img_wm = uint8(0.85 * double(img_gray) + 0.15 * double(wm_mask));

scf(1);
subplot(2, 2, 1); imshow(img_gray); title("Anh xam goc (images.jpg)");
subplot(2, 2, 2); imshow(img_eq);   title("2. Can bang Histogram");
subplot(2, 2, 3); imshow(img_blur); title("3. Anh lam mo (Blur 5x5)");
subplot(2, 2, 4); imshow(img_wm);   title("4. Anh chen Thuy van");

scf(2);
plot(0:255, hist_vals'); xgrid();
xlabel("Muc xam (0 - 255)");
ylabel("So luong diem anh");
title("Luoc do muc xam (Histogram) cua anh images.jpg");

imwrite(img_eq, "images_equalized.jpg");
imwrite(img_blur, "images_blur.jpg");
imwrite(img_wm, "images_watermarked.jpg");
disp("--- HOÀN THÀNH BÀI TẬP 5 ---");
disp("Đã xuất thành công các tệp ảnh kết quả!");
