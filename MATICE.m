function [A,D,N,T] = MATICE(n)
%ffdasf
%fdsafdsa
%fdfdfas
%peter ahahahha
% je ahahaha
time = 400;
p = 0.8;
T = cumsum(-log(rand(time,n))/p);
T = T(:);
[T,per] = sort(T);
T = T';

a = 1:n;
A = ones(time,n);

for k = 1:n
    A(1:time,k) = a(k)*A(1:time,k);
end

A = A(:);
A = A(per)';

D = ones(1,n*time);

N = 1:n;
