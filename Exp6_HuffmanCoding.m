clc;
clear;

symbols = {'A', 'B', 'C', 'D', 'E'};
frequencies = [0.4, 0.3, 0.2, 0.05, 0.05];

nodes = cell(1, length(symbols));
for i = 1:length(symbols)
    nodes{i} = struct('symbol', symbols{i}, 'freq', frequencies(i), ...
                      'left', [], 'right', []);
end

while length(nodes) > 1
    % Sort nodes by frequency
    freqs = cellfun(@(x) x.freq, nodes);
    [~, idx] = sort(freqs);

    nodes = nodes(idx);

    left = nodes{1};
    right = nodes{2};

    newNode = struct('symbol', '', ...
                     'freq', left.freq + right.freq, ...
                     'left', left, ...
                     'right', right);

    nodes = [{newNode}, nodes(3:end)];
end

root = nodes{1};
codes = {};
symbols_out = {};
[codes, symbols_out] = generateCodes(root, '', codes, symbols_out);

disp('Huffman Codes:');
for i = 1:length(symbols_out)
    fprintf('Symbol: %s, Code: %s\n', symbols_out{i}, codes{i});
end

function [codes, symbols_out] = generateCodes(node, currentCode, codes, symbols_out)
    if isempty(node.left) && isempty(node.right)
        symbols_out{end+1} = node.symbol;
        codes{end+1} = currentCode;
        return;
    end

    if ~isempty(node.left)
        [codes, symbols_out] = generateCodes(node.left, [currentCode '0'], codes, symbols_out);
    end

    if ~isempty(node.right)
        [codes, symbols_out] = generateCodes(node.right, [currentCode '1'], codes, symbols_out);
    end
end