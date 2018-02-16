function[] = hopfield_simulation(D, N)

%encode N D-dimensional memories.  then show how one is retrieved
M = sign(randn([D N])); %the memories
W = zeros(D);
probe = sign(randn([D 1]));

update_plot(W, M, probe); pause;

W = add_memory(zeros(D), M);

update_plot(W, M, probe); pause;

[~, updates] = retrieve_memory(W, probe, true, 1000);
for i = 1:size(updates, 2)
    update_plot(W, M, updates(:, i), i);
    pause(0.01);
    drawnow;
end

function[s] = sim(a, b)
TAU = 0.5;
s = exp(-TAU*sqrt(sum((a - b).^2)));

function[] = update_plot(W, M, probe, i) %#ok<INUSD>
warning('off', 'MATLAB:polyfit:PolyNotUnique');

dists = cellfun(@(x)(sim(x, probe)), slices(M, 2));

a = size(W, 1); %number of neurons
b = size(M, 2); %number of memories

clf;
p = get(gcf, 'Position');
p(3) = 800;
p(4) = 800;
set(gcf, 'Position', p);

subplots = reshape(1:((a+b)*(a+1)), [(a+1) (a+b)])';

subplot(a+b, a+1, subplots(1:a, 1));
imagesc(probe); axis off; colormap linspecer;

subplot(a+b, a+1, reshape(subplots(1:a, 2:(a+1)), [1 a^2]));
imagesc(W); axis off; colormap linspecer;

subplot(a+b, a+1, subplots((a+1):(a+b), 1));
barh(dists(end:-1:1), 'k'); %ylim([1 b]);
axis off;

subplot(a+b, a+1, reshape(subplots((a+1):(a+b), 2:(a+1)), [1 a*b]));
imagesc(M'); axis off; colormap linspecer;


