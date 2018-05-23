function [y_pred] = svm_predict(alpha, b, X_train, y_train, kernel, X_test, sigma)
% predict function
    m = size(X_train,1);
    N = size(X_test,1);
    y_pred = zeros(N, 1);
    if strcmp(kernel,'linear')
        for i = 1:N
            kernel = X_train * X_test(i,:)';
            y_pred(i) = b + alpha' * (y_train.*kernel);
        end
    elseif strcmp(kernel,'rbf')
        for i = 1:N
            kernel = zeros(m, 1);
            for j = 1:m
                kernel(j) = rbf_kernel(X_test(i,:), X_train(j,:), sigma);
            end
            y_pred(i) = b + alpha' * (y_train.*kernel);
        end
    end
end

