function [alpha, b] = svmSoftMargin_train(X, y, C, kernel, sigma)

    m = size(X,1);
    K = X * X'; % linear kernel for default
        
    if strcmp(kernel,'rbf')
        for i = 1:m
            for j = 1:m
                K(i,j) = rbf_kernel(X(i,:), X(j,:), sigma);
            end
        end
    end

    one = ones(m,1);
    alpha = zeros(m,1);
    
    cvx_begin
        variables alpha(m)
        maximize(one'*alpha -1/2 * (alpha.*y)'*K*(alpha.*y))
        subject to
            0 <= alpha <= C %different from hard-margin
            alpha'*y == 0
    cvx_end
    
    alpha_support = find(alpha>0.00001 & alpha<=C*(1-0.00001)); %different from hard-margin
    index = alpha_support(1);

    b = y(index) - alpha' * (y .* K(:,index));
    
end