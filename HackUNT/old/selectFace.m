function Individual = selectFace(imFolder)

fs = length(imFolder);
c = 0;

for k= 1:fs-1
    f1 = imread(imFolder(k));
    for j= k+1:fs
        f2 = imread(imFolder(k+2));

        f1r = detectMSERFeatures(f1);
        f2r = detectMSERFeatures(f2);

        f1features = extractFeatures(f1,f1r);
        f2features = extractFeatures(f2,f2r);

        indexPairs = matchFeatures(f1features,f2features);
        try
            matchedPoints1 = vpts1(indexPairs(:,1));
            matchedPoints2 = vpts2(indexPairs(:,2));

            [F,inliersIndex,status] = estimateFundamentalMatrix(matchedPoints1,matchedPoints2);
        catch
        end
            
    end
    
end

        
end
    


    