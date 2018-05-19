function[ k ] = rbf_kernel(X, y, sigma)
%The rbf kernel function
    k = exp(-norm(X - y)^2/sigma);
end