clc;
clear;
close all;

% ---- Input (edit here if needed) ----
symbols = {'x1','x3','x5','x2','x4'};
prob = [0.4 0.2 0.2 0.15 0.05];

% ---- Normalize probability (for correctness) ----
prob = prob / sum(prob);

% ---- Initialize nodes ----
nodes = cell(1,length(symbols));
for i = 1:length(symbols)
    nodes{i}.symbols = {symbols{i}};
    nodes{i}.prob = prob(i);
end

% ---- Initialize code storage ----c
codes = containers.Map(symbols, repmat({''},1,length(symbols)));

% ---- Huffman Tree Construction ----
while length(nodes) > 1
    
    probs = cellfun(@(x) x.prob, nodes);
    [~, idx] = sort(probs, 'ascend');
    nodes = nodes(idx);

    left = nodes{1};
    right = nodes{2};

    % Assign 0 and 1
    for i = 1:length(left.symbols)
        codes(left.symbols{i}) = ['0' codes(left.symbols{i})];
    end
    for i = 1:length(right.symbols)
        codes(right.symbols{i}) = ['1' codes(right.symbols{i})];
    end

    % Merge nodes
    newNode.symbols = [left.symbols right.symbols];
    newNode.prob = left.prob + right.prob;

    nodes = nodes(3:end);
    nodes{end+1} = newNode;
end

% ---- Results ----
avg_length = 0;
entropy = 0;

fprintf('Symbol   Prob     Code   Length\n');
fprintf('--------------------------------\n');

for i = 1:length(symbols)
    code = codes(symbols{i});
    L = length(code);

    avg_length = avg_length + prob(i)*L;
    entropy = entropy - prob(i)*log2(prob(i));

    fprintf('%-8s %-8.3f %-6s %d\n', symbols{i}, prob(i), code, L);
end

% ---- Final Metrics ----
fprintf('\nAverage Length = %.3f bits\n', avg_length);
fprintf('Entropy = %.3f bits\n', entropy);
fprintf('Efficiency = %.2f %%\n', (entropy/avg_length)*100);