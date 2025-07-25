# Bandpass Frequency Filtering with FFT in MATLAB

This MATLAB script demonstrates how to apply frequency domain analysis using Fast Fourier Transform (FFT). It focuses on filtering specific frequency bands using bandpass filtering and visualizing results both in the frequency and spatial domains.

## Features

- Reads and displays a grayscale version of the input image.
- Computes the Fourier Transform using `fft2`.
- Visualizes both the magnitude and phase of the transformed image.
- Applies:
  - Low-pass filtering
  - High-pass filtering
  - Bandpass filtering
- Converts the filtered frequency data back into the spatial domain using `ifft2`.

## How to Run

1. Open the script file `Bandpass-Frequency-Filtering-with-FFT-in-MATLAB.m` in MATLAB.
2. Make sure the file `face.bmp` is in the same directory.
3. Run the script. It will display multiple figures showing different stages of frequency processing.

## Requirements

- MATLAB R2018 or newer
- Image Processing Toolbox

## License

Copyright (c) 2025 [Seda Yalçin]  
This project is for educational purposes only and may not be copied, modified, distributed, or used for any commercial or academic purpose without explicit written permission from the author.  
All rights reserved.
