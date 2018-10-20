function [Xnorm,U,V] = norm_doublemean(X)
% Represents a non-negative matrix X as X = UX'V, where U,V are diagonal
% matrices and X' is a matrix with unity mean value along each column and
% row


MaxNumIterations = 100;

U = diag(ones(size(X,1),1));
V = diag(ones(size(X,2),1));

Xnorm = X;


% first check if the table contains zero columns or zero rows
if(sum(mean(X,1)==0)>0)
    error('ERROR: The matrix contains zero colums!');
    return;
end
if(sum(mean(X,2)==0)>0)
    error('ERROR: The matrix contains zero rows!');
    return;
end

eps = sum(sum(X));

for i=1:MaxNumIterations
    Xold = Xnorm;
    [Xnorm,columnmeans] = normalizeByColumns(Xnorm);
    %disp(Xnorm)
    V = diag(columnmeans)*V;
    [Xnorm,rowmeans] = normalizeByRows(Xnorm);
    U = U*diag(rowmeans);
    eps = sum(sum(abs(Xnorm-Xold)));
    display(sprintf('%i:%f',i,eps));
    if(eps<0.001)
        break;
    end
end

end

function [X1,columnmeans] = normalizeByColumns(X)
    columnmeans = mean(X,1);
    X1 = X./repmat(columnmeans,size(X,1),1);
end

function [X1,rowmeans] = normalizeByRows(X)
    rowmeans = mean(X,2);
    X1 = X./repmat(rowmeans,1,size(X,2));
end
