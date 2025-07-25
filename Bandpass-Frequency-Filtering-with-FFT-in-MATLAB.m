clc
clear all

imGray=imread("face.bmp");
one_c=rgb2gray(imGray);

figure;
imshow(imGray);
title("Original Image");

fou_trans=fft2(one_c);
figure;
imshow(uint8(10*log(abs(fftshift(fou_trans)))) );
title("Fourier Transform");

shift=fftshift(fft2(one_c));
figure;
imagesc(log(abs(shift))); % Magnitude
title("Magnitude");
figure;
imagesc(angle(shift)); % Phase
title("Phase");

[r_max, c_max] = size(shift);
r_cen = r_max / 2;
c_cen = c_max / 2;

low_pass_box = 80;
low_pass_filter = ones(r_max, c_max);
for i = r_cen - low_pass_box:r_cen + low_pass_box
    for j = c_cen - low_pass_box:c_cen + low_pass_box
        low_pass_filter(i, j) = 0;
    end
end

shift_low_pass = shift .*(1-low_pass_filter);
figure;
imagesc(log(abs(shift_low_pass)));
title("Low Pass Filter");

high_pass_box = 10;
high_pass_filter = ones(r_max, c_max);
for i = r_cen - high_pass_box:r_cen + high_pass_box
    for j = c_cen - high_pass_box:c_cen + high_pass_box
        high_pass_filter(i, j) = 0;
    end
end

shift_high_pass = shift .* high_pass_filter;
figure;
imagesc(log(abs(shift_high_pass)));
title("High Pass Filter");

bandpass_filter = low_pass_filter - high_pass_filter;
shift_bandpass = shift .* bandpass_filter;
figure;
imagesc(log(abs(shift_bandpass)));
title("Bandpass Filter");

figure;
imagesc(log(abs(shift_bandpass)));
imshow(one_c);
title("Modified Frequency Representation");

result=ifft2(ifftshift(shift_bandpass));
image2=uint8(abs(result));
figure
imshow(image2);
title("Spatial Domain");
