% Example 5.3 - Constructing a confidence ellipse for mean vector mu
clear all;
load example_5_3.dat;

% transform 1st and 2nd columns of example_5_3 matrix to near normality 
X1 = example_5_3(:,1).^(1/4);
X2 = example_5_3(:,2).^(1/4);

% put X1, X2 into matrix X
X = [X1, X2];

% n is number of observations,  p is number of features/variables
[n,p] = size(X);

% compute sample mean vector X_bar and sample covariance matrix S
X_bar = mean(X)';
S = cov(X);
S_inv = inv(S);

% V store eigen-vectors , diagonal elements of D are eigen values
[V D] = eig(S);

% compute 95% confidence region
critvalue = (p*(n-1)/(n-p)) * finv(.95,p,n-p);

% Calculate T_sq to see if [.562, .589 ]' is in the confidence region?
mu = [.562, .589 ]';
T_sq = n*(X_bar-mu)'*S_inv*(X_bar-mu);

mu
if T_sq <= critvalue  
    sprintf('IN confidence region. T square = %.2f <= %.2f', T_sq, critvalue)
else   
    sprintf('NOT in confidence region. T square = %.2f > %.2f', T_sq, critvalue)
end        