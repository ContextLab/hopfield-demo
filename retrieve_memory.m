function[m, mhist] = retrieve_memory(W, m, async, maxiter)

if ~exist('async', 'var')
    async = false;
end
    
if ~exist('maxiter', 'var') || isempty(maxiter)
    maxiter = 100;
end
i = 1;

if async
    mhist = zeros([size(m, 1) maxiter*size(m, 1)]);
else
    mhist = zeros([size(m, 1) maxiter]);
end

mhist(:, 1) = m;
stable = false;
while ~stable && (i <= maxiter)
    mstart = m;
    
    if async
        order = randperm(size(m, 1));
        for n = 1:size(m, 1)
            next = order(n);
            m(next) = sign(m'*W(:, next));
            mhist(:, size(m, 1)*(i - 1) + n) = m;
        end
    else %synchronous update
        m = sign(W*m);
        mhist(:, i + 1) = m;
    end
    stable = all(mstart == m);
    i = i + 1;    
end
i = i - 1;
if async
    mhist = mhist(:, 1:(i*size(m, 1)));
else
    mhist = mhist(:, 1:(i + 1));
end

