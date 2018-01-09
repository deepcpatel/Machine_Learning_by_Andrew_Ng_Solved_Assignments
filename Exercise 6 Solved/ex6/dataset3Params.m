function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;
vec = [0.01,0.03,0.1,0.3,1,3,10,30];
error_vec=zeros(size(vec,1).^2,3);

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

for i=1:8
	for j=0:7
	
		C=vec(i);
		sigma=vec(j+1);
		
		model=svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
		predictions = svmPredict(model, Xval);
		
		error_vec(i+j,1)=C;
		error_vec(i+j,2)=sigma;
		error_vec(i+j,3)=mean(double(predictions ~= yval));
	
	end

end

[V I]=min(error_vec(:,3),[],1);

C=error_vec(I,1);
sigma=error_vec(I,2);

% =========================================================================

end
