import numpy as np

# User input
symbols = input("Enter symbols (comma separated, e.g., A,B,C): ").split(',')
p = list(map(float, input("Enter probabilities (space separated, e.g., 0.5 0.3 0.2): ").split()))

# Validation
if len(symbols) != len(p):
    raise ValueError("Number of symbols and probabilities must be equal")

if abs(sum(p) - 1) > 1e-6:
    raise ValueError("Probabilities must sum to 1")

p = np.array(p)

# CDF
F = np.cumsum(p)

# Midpoint
F_bar = F - p/2

# Code length
l = np.ceil(np.log2(1/p)).astype(int) + 1

# Precision
precision = max(l) + 5

print(f"{'Symbol':<8}{'p(x)':<8}{'F(x)':<8}{'F_bar(x)':<10}{'F_bar(Binary)':<15}{'l(x)':<6}{'Codeword':<10}")
print("-"*75)

avg_length = 0
entropy = 0

for i in range(len(symbols)):
    value = F_bar[i]
    binary = ""

    # Binary conversion
    for j in range(precision):
        value *= 2
        if value >= 1:
            binary += '1'
            value -= 1
        else:
            binary += '0'

    # Codeword
    codeword = binary[:l[i]]

    # Average length
    avg_length += p[i] * l[i]

    # Entropy
    entropy -= p[i] * np.log2(p[i])

    print(f"{symbols[i]:<8}{p[i]:<8.3f}{F[i]:<8.3f}{F_bar[i]:<10.4f}{('0.' + binary[:l[i]]):<15}{l[i]:<6}{codeword:<10}")

print(f"\nAverage Codeword Length = {avg_length:.3f} bits")
print(f"Entropy H = {entropy:.3f} bits")