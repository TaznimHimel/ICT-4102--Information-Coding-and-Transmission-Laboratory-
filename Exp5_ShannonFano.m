clc;
clear;

symbols = {'A', 'B', 'C', 'D', 'E'};
probabilities = [0.4, 0.3, 0.2, 0.05, 0.05];

codes = shannonFano(symbols, probabilities);

disp('Shannon-Fano Codes:');
for i = 1:length(symbols)
    fprintf('Symbol: %s, Code: %s\n', symbols{i}, codes{i});
end

function codes = shannonFano(symbols, probabilities)
    n = length(symbols);
    codes = repmat({''}, 1, n);

    % Sort by descending probability
    [probabilities, idx] = sort(probabilities, 'descend');
    symbols = symbols(idx);

    codes_sorted = shannonFanoRecursive(symbols, probabilities);

    % Restore original order
    temp_codes = repmat({''}, 1, n);
    for i = 1:n
        temp_codes{idx(i)} = codes_sorted{i};
    end
    codes = temp_codes;
end

function codes = shannonFanoRecursive(symbols, probabilities)
    n = length(symbols);
    codes = repmat({''}, 1, n);

    if n == 1
        codes{1} = '';
        return;
    end

    total = sum(probabilities);
    cumulative = cumsum(probabilities);
    [~, split_idx] = min(abs(cumulative - total/2));

    left_symbols = symbols(1:split_idx);
    left_prob = probabilities(1:split_idx);

    right_symbols = symbols(split_idx+1:end);
    right_prob = probabilities(split_idx+1:end);

    left_codes = shannonFanoRecursive(left_symbols, left_prob);
    right_codes = shannonFanoRecursive(right_symbols, right_prob);

    for i = 1:length(left_codes)
        left_codes{i} = ['0', left_codes{i}];
    end

    for i = 1:length(right_codes)
        right_codes{i} = ['1', right_codes{i}];
    end

    codes = [left_codes, right_codes];
end