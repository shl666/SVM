clearvars;
% set param
data_requirement = 'nonlinear';
kernel = 'rbf';
sigma = 1;
C = 1;
% generate dataset
[X_train,y_train] = generate_dataset(data_requirement);
[X_test,y_test] = generate_dataset(data_requirement);
% train SVM model
% [alpha, b] = svmHardMargin_train(X_train, y_train, kernel, sigma);
[alpha, b] = svmSoftMargin_train(X_train, y_train, C, kernel, sigma);
% test SVM model
[y_pred] = svm_predict(alpha, b, X_train, y_train, kernel, X_test, sigma);

figure;
gscatter(X_test(:,1),X_test(:,2),y_test,'br','xo')
title('Ground-truth targets');
figure;
gscatter(X_test(:,1),X_test(:,2),sign(y_pred),'br','xo')
title('Predicted targets');