% import data by import tool first, columns delimiters [Space,:]
% load data
y = breastcancerscale(:,1)-3;
X = breastcancerscale(:,3);
[m,n] = size(X);
for i = 5:2:n
    X = [X,breastcancerscale(:,i)];
end


X_train = X(1:floor(0.8*m),:);
y_train = y(1:floor(0.8*m),:);
X_test = X(floor(0.8*m):m,:);
y_test = y(floor(0.8*m):m,:);

% set param
kernel = 'rbf';
sigma = 1;
C = 1;

% train SVM model
% [alpha, b] = svmHardMargin_train(X_train, y_train, kernel, sigma);
[alpha, b] = svmSoftMargin_train(X_train, y_train, C, kernel, sigma);

% test SVM model
[y_pred] = svm_predict(alpha, b, X_train, y_train, kernel, X_test, sigma);
acc = evaluate(y_test,y_pred);