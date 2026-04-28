% User input (as requested)
symbols = input('Enter symbols as cell array (e.g., {''A'',''B'',''C''}): ');
p = input('Enter probabilities as vector (e.g., [0.5 0.3 0.2]): ');
% Validation
if length(symbols) ~= length(p)
    error('Number of symbols and probabilities must be equal');
end
if abs(sum(p) - 1) > 1e-6
    error('Probabilities must sum to 1');
end
% CDF
F = cumsum(p);
% Midpoint
F_bar = F - p/2;
% Code length
l = ceil(log2(1./p)) + 1;
% Precision
precision = max(l) + 5;
fprintf('%-8s %-8s %-8s %-10s %-15s %-6s %-10s\n', ...
    'Symbol','p(x)','F(x)','F_bar(x)','F_bar(Binary)','l(x)','Codeword');
fprintf('-----------------------------------------------------------------------\n');
avg_length = 0;
entropy = 0;
for i = 1:length(symbols)
    value = F_bar(i);
    binary = '';
    % Binary conversion
    for j = 1:precision
        value = value * 2;
        if value >= 1
            binary = [binary '1'];
            value = value - 1;
        else
            binary = [binary '0'];
        end
    end
    % Codeword
    codeword = binary(1:l(i));
    % Average length
    avg_length = avg_length + p(i) * l(i);
    % Entropy
    entropy = entropy - p(i) * log2(p(i));
    fprintf('%-8s %-8.3f %-8.3f %-10.4f %-15s %-6d %-10s\n', ...
        symbols{i}, p(i), F(i), F_bar(i), ...
        ['0.' binary(1:l(i))], l(i), codeword);
end
fprintf('\nAverage Codeword Length = %.3f bits\n', avg_length);
fprintf('Entropy H = %.3f bits\n', entropy);