function [X,y] = generate_dataset(data_requirement)
% randomly generated some dataset for testing the performance of the SVM
% model.
    m = 1000;
    n = 2;

    X = -2 + 4*rand([m, n]); 
    if strcmp(data_requirement, 'linear')
        y = 2*(X(:,1)>X(:,2)) - 1; % Linear separable dataset
    elseif strcmp(data_requirement, 'sub-linear')
        y = 2*(X(:,1)>X(:,2)) - 1;
        for i = 1:m/50             % add not linear separable points
            y(i) = - y(i);
        end
    elseif strcmp(data_requirement, 'nonlinear')
        y = 2*(sum(abs(X), 2) <= 1) - 1;
    end
