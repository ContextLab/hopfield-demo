function[W] = add_memory(W, m)

W = W + m*m';
W = rmdiag(W);

