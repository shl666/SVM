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
[alpha, b] = svmHardMargin_train(X_train, y_train, kernel, sigma);
% [alpha, b] = svmSoftMargin_train(X_train, y_train, C, kernel, sigma);

% test SVM model
[y_pred] = svm_predict(alpha, b, X_train, y_train, kernel, X_test, sigma);
acc = evaluate(y_test,y_pred);

%plot
figure;
gscatter(X_test(:,1),X_test(:,2),y_test,'br','xo')
title('Ground-truth targets');
% savefig('../fig/NonLinearDataset_GroundTruth')

h = 0.05; % Mesh grid step size
[X1,X2] = meshgrid(min(X_test(:,1)):h:max(X_test(:,1)),...
    min(X_test(:,2)):h:max(X_test(:,2)));
[score] = svm_predict(alpha, b, X_train, y_train, kernel, [X1(:),X2(:)], sigma);
X1 = reshape(X1,size(X1,1)*size(X1,2),1);
X2 = reshape(X2,size(X2,1)*size(X2,2),1);


figure;
hold all
gscatter(X_test(:,1),X_test(:,2),sign(y_pred),'rb','xo')
gscatter(X1,X2,sign(score),'gy','.')
legend('1 label','-1 label','1 regoin','-1 regoin')
% legend('1 label','1 regoin')
hold off
title('Predicted targets');
% savefig('../fig/HardMargin/RbfKernel/NonLinear')