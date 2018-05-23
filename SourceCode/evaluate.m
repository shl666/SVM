function [acc] = evaluate(y,y_pred)
    
    acc = sum(y==sign(y_pred))/size(y,1);
    