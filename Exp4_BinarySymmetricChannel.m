clc;

clear;

close all;
%Error Probability P
p = 0:0.01:1;
%Channel Capacity 
C = zeros(size(p));

disp('   p      Channel Capacity (C)');

disp('---------------------------------');

for i = 1:length(p)

if p(i) == 0 || p(i) == 1

    H = 0;

else

    H = -p(i)*log2(p(i)) - (1-p(i))*log2(1-p(i));

end



C(i) = 1 - H;



fprintf('%.2f      %.4f\n', p(i), C(i));

end

figure;

plot(p, C, 'b', 'LineWidth', 2);

grid on;

title('Binary Symmetric Channel Capacity');

xlabel('Error Probability (p)');

ylabel('Channel Capacity (C)');