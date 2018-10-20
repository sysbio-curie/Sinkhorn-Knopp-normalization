function [Xn] = norm_row_mean(X)

mn = mean(X,2);
Xn = X./repmat(mn,1,size(X,2));

end

