addpath(pwd, 'FaceLib');
% FLibdir = dir(['FaceLib' '/*.jpg']);

addpath(pwd, 'Facetmp');
% FLibdir = dir(['Facetmp' '/*.jpg']);

f1 = rgb2gray(imread('Facetmp\face43.jpg'));
f2 = rgb2gray(imread('FaceLib\face19.jpg'));

f1r = detectBRISKFeatures(f1);
f2r = detectBRISKFeatures(f2);

f1features = extractFeatures(f1,f1r);
f2features = extractFeatures(f2,f2r);

indexPairs = matchFeatures(f1features,f2features);

matchedPoints1 = vpts1(indexPairs(:,1));
matchedPoints2 = vpts2(indexPairs(:,2));

[F,inliersIndex,status] = estimateFundamentalMatrix(matchedPoints1,matchedPoints2);
