% @brief: Identifies the impulse transfer function using Hankel matrix method.
%         This method estimates the transfer function 
%         by analyzing the impulse response.
%
% @param g_hat: The impulse response vector.
% @param n: The model order (order of the transfer function).
% @retval fenzi: The numerator coefficients of the transfer function.
% @retval fenmu: The denominator coefficients of the transfer function.
%

function [fenzi,fenmu]=Hankel_Ident(g_hat,n)
Np=length(g_hat);
L=Np-n-1;

Hg=Bulid_Hankel(g_hat(2:end),L,n);
% Calculate the system coefficients [an ...a2 a1]
a=inv(Hg'*Hg)*Hg'*(-g_hat(n+2:n+L+1));

A=eye(n+1);
for i=1:n
    A=A+diag(a(i)*ones(i,1),-n+i-1);
end

b=A*g_hat(1:n+1);

fenzi=b';
fenmu=[1,flip(a')];
GZ=tf(fenzi,fenmu,1)
end