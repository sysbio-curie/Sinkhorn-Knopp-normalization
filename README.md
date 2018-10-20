# Sinkhorn-Knopp normalization

Each non-negative matrix X without columns or rows summing to zero can be uniquely represented in the form

X = UX'V

where U,V are diagonal matrices and X' is a matrix with unity mean value along each column and row (double stochastic matrix).
This repository contains implementation of the simple algorithm for performing such decomposition.
The algorithm was first suggested in [Sinkhorn, Richard, & Knopp, Paul. (1967). "Concerning nonnegative matrices and doubly stochastic matrices". Pacific J. Math. 21, 343–348].

Use of the algorithm:

     [X1,U,V] = norm_doublemean(X);

