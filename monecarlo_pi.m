%by Davide Di Gloria
%
%Simple example of a Montecarlo method of pi calculation
%
%This script generates a figure in which pi value is plotted versus
%number of iterations needet to obtain it.
%
%

clear all;
close all
clc

from=1;
to  =1000;

p(to-from)=0;

h=waitbar(0,'¡Lanzando dardos!');

for i=from:to-1   
    x=2*rand(i,1)-1;
    y=2*rand(i,1)-1;
    R = x.^2 + y.^2 < 1;    
    p(i-from+1)=4*sum(R)/(i);
    waitbar(i/(to-from),h)  
end
    X=x;
    Y=y;


m=1;
for i=0:0.03:2*pi
  xc(m)=sin(i);
  yc(m)=cos(i);
  m=m+1;
end 
close(h)

subplot(2,2,1)
plot(p,'.b')
hold on
plot([0 to],[pi pi],'r','linewidth',3)
xlabel('# dardos')
ylabel('Valor estimado de \pi')
legend({'Estimaciones','Valor Real'},'Location','SouthEast')
axis([0 to 2 4])
hold off
subplot(2,2,2)
plot(p-pi,'xg')
xlabel('# dardos')
ylabel('Error')
axis([0 to -1 1])
subplot(2,2,3)
hist(p-pi,100,100)
xlabel('Error')
ylabel('%')
axis([-0.5 0.5 0 25])
subplot(2,2,4)
plot([-1 1],[-1 -1],'-k')
hold on
plot([1 1],[-1 1],'-k')
plot([-1 1],[1 1],'-k')
plot([-1 -1],[-1 1],'-k')
plot(X,Y,'.b')
plot(xc,yc,'.-k')
axis equal
title('Caso de 1000 dardos')
print -dpng 'valor_de_pi.png'

