function[x] = rmdiag(x)

assert(ismatrix(x), 'x must be a matrix');
x(1:size(x, 1)+1:end) = 0;
