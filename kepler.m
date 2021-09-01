a=load('kepler.txt');

figure(1)
plot(a(:,1).^3,a(:,1).^3,'-x')

y = a(:,1).^3;

X=[];

for i = 1 : size(a,1)
  aux_x=[ 1 a(i,2) a(i,2)^2 ];
  X(i,:)=aux_x;
end

G=X'*X;

size(G)
rank(G)

m = inv(X'*X)*X'*y;

y_ajust = X*m;

residuo = y - y_ajust;

figure(2)
plot(residuo,'-x')