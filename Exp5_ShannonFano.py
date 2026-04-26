# Shannon-Fano Coding Algorithm
# Step 1: Define the Shannon-Fano function

def shannon_fano(symbols, probabilities):
    # Base case
    if len(symbols) == 1:
        return {symbols[0]: ''}

    # Step 2: Sort symbols and probabilities in descending order
    sorted_indices = sorted(range(len(probabilities)), key=lambda k: probabilities[k], reverse=True)
    sorted_symbols = [symbols[i] for i in sorted_indices]
    sorted_probabilities = [probabilities[i] for i in sorted_indices]

    # Step 3: Divide into two parts
    total_probability = sum(sorted_probabilities)
    cumulative_probability = 0

    for i in range(len(sorted_probabilities)):
        cumulative_probability += sorted_probabilities[i]
        if cumulative_probability >= total_probability / 2:
            break

    left_symbols = sorted_symbols[:i+1]
    left_probabilities = sorted_probabilities[:i+1]
    right_symbols = sorted_symbols[i+1:]
    right_probabilities = sorted_probabilities[i+1:]

    # Step 4: Assign codes recursively
    code_dict = {}

    for symbol, code in shannon_fano(left_symbols, left_probabilities).items():
        code_dict[symbol] = '0' + code

    if right_symbols:
        for symbol, code in shannon_fano(right_symbols, right_probabilities).items():
            code_dict[symbol] = '1' + code

    return code_dict


# Step 5: Input the symbols and their corresponding probabilities
symbols = ['A', 'B', 'C', 'D', 'E']
probabilities = [0.4, 0.3, 0.2, 0.05, 0.05]

# Step 6: Call the Shannon-Fano function
codes = shannon_fano(symbols, probabilities)

# Step 7: Display result
print("Shannon-Fano Codes:")
print("Symbol\tProbability\tCode")

for i in range(len(symbols)):
    symbol = symbols[i]
    print(f"{symbol}\t{probabilities[i]}\t\t{codes[symbol]}")