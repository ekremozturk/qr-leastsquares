load('hw2_data.mat');

%% Forming data

[m, ~] = size(X);

Xnew = zeros(m-3, 3);

for i=1:(m-3) 
    for j=1:3 
        Xnew(i,j) = X(i+j-1,2);
    end
end

Xnew = [ones(97,1) Xnew];

[m, n] = size(Xnew);

%% Computing QR

X_modified = qr_householder(Xnew);

%% Computing Q'b

b = X(4:end,2);

for k=1:n
    v = X_modified(k+1:m+1, k);
    b(k:m) = b(k:m) - 2*v*(v'*b(k:m));
end

%% Extracting R

R = zeros(n);

for i=1:n
    for j=i:n
        R(i,j) = X_modified(i,j);
    end
end

%% Solving Rx=Q'b

beta = R\b(1:4);

%% Prediction and error

predX = Xnew*beta;

prederror = sqrt(sum(power(predX-X(4:end,2),2)));
