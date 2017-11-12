function [X_out] = qr_householder(X)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[m,n] = size(X);

X_out=zeros(m+1,n);

for k=1:n
    
    a = X(k:m,k);
    
    e1 = zeros(101-k,1);
    
    e1(1)=1;
    
    v = sign(a(1))*norm(a)*e1+a;
    
    v = v/norm(v);
    
    X(k:m,k:n) = X(k:m,k:n)-2*v*(v'*X(k:m,k:n));
    
    X_out(k+1:m+1,k)=v;
    
end

for i=1:n
    for j=i:n
        X_out(i,j) = X(i,j);
    end
end

end

