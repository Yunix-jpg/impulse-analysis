% @brief: Construct a block Hankel matrix from vector y 
%         with i block-rows and j columns.
% 
% @param y: A vector to be used for constructing the Hankel matrix.
% @param i: The number of block rows in the Hankel matrix.
% @param j: The number of columns in the Hankel matrix.
% 
% @retval H: The block Hankel matrix of size (l * i) x j, where l is the 
%            length of the input vector y.
%
% @note: The input vector y should have at least (i + j - 1) elements.
%        The function assumes y is a row vector; 
%        if it's a column vector, it transposes it.
  
function H = Bulid_Hankel(y,i,j)  % i=k=R is an abritary positive 

% Ensure the input vector is a row vector
[l,nd] = size(y);
if nd < l;y = y';[l,nd] = size(y);end

% Check dimensions
if i < 0;error('Bulid_Hankel: i should be positive');end
if j < 0;error('Bulid_Hankel: j should be positive');end
if j > nd-i+1;error('Bulid_Hankel: j too big');end % j is less or equal nd-i+1

% Initialize the Hankel matrix
H=zeros(l*i,j);
for k=1:i
	H((k-1)*l+1:k*l,:)=y(:,k:k+j-1);
end