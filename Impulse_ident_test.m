
clear
clc
%%%%%%%%获得输入输出%%%%%%%%%%%%%%

num=1.2;
den=[51.46,14.5,1];

G=tf(num,den) 

a=2;
Np=511;
[~,M,~]=M_sequence(2*Np,a);
dt=1;
t=0:dt:dt*2*Np-1;


g=impulse(num,den,t);
y=lsim(G,M,t);

g_hat=Correlation_Analysis(M,Np,a,y,dt);

%%%%%%画图%%%%%%%%
figure(2);
plot(g_hat,'r.');
hold on;
plot(g,'b-');
hold off;
%%%传递函数辨识%%%%%
sysz=c2d(G,1)
% g_hat=impulse(sysz,t);%用真实的脉冲响应验证算法准确性
n=length(den)-1;
[fenzi,fenmu]=Hankel_Ident(g_hat,n)

% d2c(GZ)