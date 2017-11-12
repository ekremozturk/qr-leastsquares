load('hw2_data.mat');

X = [ones(100, 1) X];

[Q, R] = qr(X, 0);

Rm = qr_householder(X);

[m, n] = size(X);

b = X(:,3);

for k=1:n
    v = Rm(k+1:m+1, k);
    b(k:m) = b(k:m) - 2*v*(v'*b(k:m));
end

Rnew = zeros(n);

for i=1:n
    for j=i:n
        Rnew(i,j) = Rm(i,j);
    end
end

x = inv(Rnew)*b(1:3);

xreal = inv(R)*(Q'*X(:,3));


