% @brief: Performs recursive algorithm using M-sequence input and discrete
%         correlation analysis to estimate the impulse response of a system.
%
% @param M: The M-sequence input vector.
% @param Np: The period of the M-sequence.
% @param a: The amplitude of the M-sequence.
% @param y: The output vector of the system to be identified.
% @param dt: The sampling interval (time step between measurements).
%
% @retval g_hat: The estimated impulse response vector.
%
% @note: This function constructs the autocorrelation matrix of the M-sequence 
%       and performs recursive analysis to estimate the impulse response.

function g_hat=Correlation_Analysis(M,Np,a,y,dt)
%构造M序列自相关函数矩阵
Inv_RM=Np/((Np+1)*a^2)*(ones(Np)+diag(1+zeros(1,Np)));
% Inv_RM=(-Np/a^2)*inv(ones(Np)+diag(-Np-1+zeros(1,Np)));
Y=y(Np+1:2*Np);%取对应周期的输出
%build m
for j=1:Np
    for i=1:Np
        m(i,j)=M(Np+j-i+1);
    end
end
ghat=zeros(Np); %ghat0=0

for i=2:Np
    ghat(:,i)=i/(i+1)*ghat(:,i-1)+1/((i+1)*dt)*Inv_RM*m(:,i)*Y(i);
end
% Take the final column as the estimated response
g_hat=ghat(:,end);
end


