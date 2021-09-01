close all
clear all
a=load('tidalM2.txt');

%%plot(a(1,:),a(2,:))

wm2=(2*pi/12.42);

col_sen=sin(wm2*a(1,:))';
col_cos=cos(wm2*a(1,:))';

G=[col_sen col_cos];

%
% Gm=d
% m=inv(GT*G)*GT*d

m=inv(G'*G)*G'*a(2,:)';

y_t = m(1)*sin(wm2*a(1,:)) + m(2)*cos(wm2*a(1,:));

subplot(2,1,1)
plot(a(1,:),a(2,:),'r',a(1,:),y_t,'k')
subplot(2,1,2)
plot(a(1,:),a(2,:)-y_t)


