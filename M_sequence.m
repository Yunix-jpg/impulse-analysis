% @brief: Generates an M-sequence of length Np = 511 and its inverse M-sequence.
% @param N: Length of the output sequence.
% @param a: Amplitude of the M-sequence values.
% @retval [M, u, IM]: M is the generated M-sequence, 
%                     u is the corresponding input sequence, 
%                     and IM is the inverse M-sequence.

function [M, u, IM] = M_sequence(N, a)
    % Generate an M-sequence of length Np = 511
Np=2^9-1;
M=[];
M=0;
M(2)=1;
M(3)=1;
M(4)=1;
M(5)=0;
M(6)=0;
M(7)=1;  
M(8)=0;
M(9)=1;


%初始状态为011100101
for i=10:N   %i=p+1,p+2,.....
    M(i)=xor(M(i-4),M(i-9));      %产生M序列
end
%产生逆M序列
x=[];
IM=[];
for j=1:N
    if mod(j,2)==1
        x(j)=1;
    else
        x(j)=0;
    end
    IM(j)=xor(M(j),x(j));   %M序列与方波复合，产生M逆序列
end
u=[];
for i=1:N
    u(i)=a*(-1)^(M(i)+1);
end
end