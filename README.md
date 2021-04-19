# ICIP2021_IQE-CNN

The manuscript entitled "CNN-based Post-filtering for Image Quality Enhancement" was submitted for publication to IEEE International Conference on Image Processing (IEEE ICIP) 2021. 

Extensive efforts were invested to provide a comparison with the following IEEE TIP 2020 article:
J. Li, Y. Wang, H. Xie and K. -K. Ma, "Learning a Single Model With a Wide Range of Quality Factors for JPEG Image Artifacts Removal," in IEEE Transactions on Image Processing, vol. 29, pp. 8842-8854, 2020, doi: 10.1109/TIP.2020.3020389.

Please run mainText.m to show demonstrate the diffrence between the compression results for the JPEG codec using:
  1) The Python Imaging Library (PIL) library following the information from the authors: "In this article, Python Image Library (PIL) is adopted to encode  images into JPEG format for conducting all simulation experiments."
  2) The MATLAB impmenetation available using the imwrite function.
  3) The results reported on Table II on page 8/13.

By runing mainTest.m in MATLAB the following output will be generated:

>> mainTest
Encoding using PIL library ...
Encoding using MATLAB and computing metrics (PSNR and SSIM)...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PSNR Results:
 MATLAB: 25.6925      28.0607      29.3659      30.2803      31.0267
 PIL:    25.6925      28.0607      29.3659      30.2803      31.0267
 TIP:    25.6        27.96        29.25        30.16        30.91
SSIM Results:
 MATLAB: 0.81527     0.88868     0.91494     0.92983      0.9395
 PIL:    0.81527     0.88868     0.91494     0.92983      0.9395
 TIP:    0.7454      0.8288      0.8642      0.8846       0.889
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Since the PSNR values differ and very large SSIM differences are observed between our and reported JPEG compression results, a fair comparison cannot be provided.

