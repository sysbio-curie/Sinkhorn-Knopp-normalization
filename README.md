# Sinkhorn-Knopp (double stochastic, unity mean by rows and columns) normalization of a matrix

Each non-negative matrix X without columns or rows summing to zero can be uniquely represented in the form

X = UX'V

where U,V are diagonal matrices and X' is a matrix with unity mean value along each column and row (double stochastic matrix).
This repository contains implementation of the simple algorithm for performing such decomposition.
The algorithm was first suggested in [Sinkhorn, Richard, & Knopp, Paul. (1967). "Concerning nonnegative matrices and doubly stochastic matrices". Pacific J. Math. 21, 343–348].

Use of the algorithm:

     [X1,U,V] = norm_doublemean(X);


## Effect of unity mean normalization on application of Non-negative matrix factorization to gene expression data

A simple test of how unity mean (of a row, or simulnateously row and column) normalization affects application of NMF 
to gene expression data : 

     addpath .\test_normalization_on_NMF\; 
     test_normalization1;

The test produces three figures, showing 1) dependence of standard deviation on mean value; 2) correlation of NMF and PCA metagenes
on average gene expression profile; 3) dependence of first 5 NMF components on average gene expression profile.