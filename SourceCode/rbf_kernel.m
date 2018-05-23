function[ k ] = rbf_kernel(X1, X2, sigma)
%The rbf kernel function
    k = exp(-norm(X1 - X2)^2/sigma);
end