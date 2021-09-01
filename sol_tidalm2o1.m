close all
clear all
a=load('tidalM2O1.txt');

%%plot(a(1,:),a(2,:))

wm2=(2*pi/12.42);
wo1=(2*pi/24);

col_senm2=sin(wm2*a(1,:))';
col_cosm2=cos(wm2*a(1,:))';
col_seno1=sin(wo1*a(1,:))';
col_coso1=cos(wo1*a(1,:))';

G=[col_senm2 col_cosm2 col_seno1 col_coso1];

%
% Gm=d
% m=inv(GT*G)*GT*d

m=inv(G'*G)*G'*a(2,:)';

y_t = m(1)*sin(wm2*a(1,:)) + m(2)*cos(wm2*a(1,:)) ...
     +m(3)*sin(wo1*a(1,:)) + m(4)*cos(wo1*a(1,:));

subplot(2,1,1)
plot(a(1,:),a(2,:),'r',a(1,:),y_t,'k')
subplot(2,1,2)
plot(a(1,:),a(2,:)-y_t)

sigma=0.5;
mmc=[];
for i = 1:1000
  ruido = sigma*randn(length(a(1,:)),1)';
  ymc = y_t+ ruido;
  maux = inv(G'*G)*G'*ymc';
  mmc = [mmc maux];
end

figure
hist(mmc(1,:),100,100)
figure
plot(mmc(1,:),mmc(2,:),'.')
figure 
plot3(mmc(1,:),mmc(2,:),mmc(3,:),'.')


