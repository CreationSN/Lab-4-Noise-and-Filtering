# Lab-4-Noise-and-Filtering

Introduction

In this lab, I learned how to add and remove noise from images using different filters.
I worked with two common noise types: Gaussian noise and Salt & Pepper noise.
I used different filters like mean, Gaussian, and median filters to clean the images and compared their performance using MSE and SNR values.

What I Have Done

I converted the original image into grayscale.

I added Gaussian noise and Salt & Pepper noise to the image.

I calculated Mean Square Error (MSE) and Signal-to-Noise Ratio (SNR) before and after filtering.

I applied three filters:

Mean filter (linear)

Gaussian filter (linear)

Median filter (non-linear)

I compared how well each filter reduced the noise.

Results
Noise Type	Filter Used	MSE (↓ Better)	Observation
Gaussian	Mean Filter	Medium	Smooths noise but blurs edges
Gaussian	Gaussian Filter	Low	Removes noise and keeps smoothness
Salt & Pepper	Mean Filter	High	Not good for this type of noise
Salt & Pepper	Median Filter	Lowest	Removes noise and keeps edges clear

What I Have Learned

I learned that median filters work best for Salt & Pepper noise because they remove the black and white outlier pixels.

I learned that Gaussian and mean filters work better for Gaussian noise, but they also blur the edges.

I understood that linear filters smooth the whole image, including the edges, while non-linear filters can clean the noise and still keep image details.

I also learned how to calculate and compare MSE and SNR to measure image quality.

Answers to Reflection Questions

Q1. Which noise is best removed by the median filter? Why?
→ The Salt & Pepper noise is best removed by the median filter because it replaces extreme pixel values with the median of the neighborhood, removing white and black spikes effectively.

Q2. Why does linear filtering blur edges more?
→ Linear filters (like mean and Gaussian) average nearby pixels. This averaging process smooths both noise and edges, so the image loses sharpness.

Q3. How could we design adaptive filters to preserve detail?
→ Adaptive filters change their behavior based on the local area. For example, they can reduce noise in flat areas but keep details near edges. Bilateral filters and adaptive median filters are examples that can keep edges sharp.

7. Conclusion

In this lab, I successfully added and removed different types of noise.
I learned how to use MATLAB functions like imnoise, imfilter, and medfilt2.
I also understood how to evaluate image quality using MSE and SNR.
This lab helped me understand how different filters work and which one is better for each type of noise.
