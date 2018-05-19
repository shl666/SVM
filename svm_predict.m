function [y] = svm_predict(w, b, X)
% predict function
    y = sign(X * w' + b);
end

