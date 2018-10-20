addpath '../'

t = importdata('small_expression_dataset.txt');
%t = importdata('CHOL.txt');
disp('Loaded...');
numberOfComponents = 15;
X = t.data;
% exclude empty rows
ind = setdiff(1:size(X,1),find(mean(X,2)==0));
X = X(ind,:);

[Xn,U,V] = norm_doublemean(X);
[Xnr] = norm_row_mean(X);
disp('Normalized...');

m1 = mean(X,2);
mc = mean(X,1);

disp('Computing NMF...');
disp('Initial matrix...'); [W,H] = nnmf(X,numberOfComponents);
disp('Normalized...');  [Wn,Hn] = nnmf(Xn,numberOfComponents);
disp('Norm by row...');  [Wnr,Hnr] = nnmf(Xnr,numberOfComponents);
[v,u,s] = pca(X,'NumComponents',numberOfComponents);
disp('Done.');

st = std(X');
stn = std(Xn');
stnr = std(Xnr');

subplot(1,3,1);
%plot(m1,st./m1','k.'); xlabel('Mean expression'); ylabel('Coeff.variation'); title('Initial matrix');
plot(m1,st,'k.'); xlabel('Mean expr (before normaliz.)'); ylabel('Std.deviation'); title('Initial matrix');
set(gcf,'Position',[147   298   820   232]);

subplot(1,3,2);
plot(m1,stn,'k.'); xlabel('Mean expr (before normaliz.)'); ylabel('Std.deviation'); title('Double stochastic');

subplot(1,3,3);
plot(m1,stnr,'k.'); xlabel('Mean expr(before normaliz.)'); ylabel('Std.deviation'); title('Mean=1 in rows');

figure;

plot(corr(W,m1),'ro-'); hold on; plot(corr(Wn,m1),'bo-'); plot(corr(Wnr,m1),'mo-'); plot(corr(u,m1),'go-');  
legend('NMF:Initial matrix','NMF:DoubleStoch','NMF:mean=1 in rows','pca'); 
title('correlation of components with mean row means'); xlabel('component rank'); ylabel('Correlation');
plot([1 size(W,2)],[0 0],'k--');

figure;

num = 5;
k = 1;
for i=1:num
	subplot(num,3,k);	
	dscatter(m1,W(:,i));
	xlabel('Mean expr (before normaliz.)'); ylabel(['NMF ' int2str(i) ' ']); title('Initial matrix');
	k = k+1;
	subplot(num,3,k);	
	dscatter(m1,Wn(:,i));
	xlabel('Mean expr (before normaliz.)'); ylabel(['NMF ' int2str(i) ' ']); title('Double stochastic');
	k = k+1;
	subplot(num,3,k);	
	dscatter(m1,Wnr(:,i));
	xlabel('Mean expr (before normaliz.)'); ylabel(['NMF ' int2str(i) ' ']); title('Mean=1 in rows');
	k = k+1;
end
