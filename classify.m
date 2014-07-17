function [c, centroids, X] = classify(XTrain, yTrain, XTest, h)
nbClusters = 322;

%Remove zero-columns
zeroCols = any(XTrain,1);
XTrain( :, ~zeroCols) = [];  %columns
XTrain = tfidf(XTrain);
XTest(:, ~zeroCols) = [];  %columns
XTest = tfidf(XTest);

%[IDX, clus] = kmeans(yTrain, nbClusters, 'emptyaction', 'drop');
%load('/home/beyer/self/MLSS/parameters.txt', '-mat');
load('parameters.txt', '-mat');

centroids = zeros(nbClusters, size(XTrain, 2));
for i=1:nbClusters
    centroids(i,:) = mean(XTrain(find(IDX == i), :), 1);
end

nbDoc = size(XTest, 1);

c = zeros(nbDoc, 500);

return
centroids = normr(centroids);
X = normr(XTest);

for i = 1:nbDoc
    dist = zeros(nbClusters, 1);
    x = X(i,:);
    dist = x * centroids';
    [val, clusterid] = max(dist);
    c(i, find(C(clusterid,:) > 0)) = 1;
    i
end
