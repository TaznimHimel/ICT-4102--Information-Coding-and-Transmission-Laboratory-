import numpy as np

# ---- Input ----
symbols = ['x1','x3','x5','x2','x4']
prob = np.array([0.4, 0.2, 0.2, 0.15, 0.05])

# ---- Normalize ----
prob = prob / np.sum(prob)

# ---- Initialize nodes ----
nodes = []
for i in range(len(symbols)):
    nodes.append({
        "symbols": [symbols[i]],
        "prob": prob[i]
    })

# ---- Code storage ----
codes = {s: "" for s in symbols}

# ---- Huffman Tree Construction ----
while len(nodes) > 1:

    # Sort nodes by probability (ascending)
    nodes = sorted(nodes, key=lambda x: x["prob"])

    left = nodes[0]
    right = nodes[1]

    # Assign 0 and 1
    for s in left["symbols"]:
        codes[s] = '0' + codes[s]

    for s in right["symbols"]:
        codes[s] = '1' + codes[s]

    # Merge nodes
    new_node = {
        "symbols": left["symbols"] + right["symbols"],
        "prob": left["prob"] + right["prob"]
    }

    # Remove two smallest and add merged node
    nodes = nodes[2:]
    nodes.append(new_node)

# ---- Results ----
avg_length = 0
entropy = 0

print("Symbol   Prob     Code    Length")
print("--------------------------------")

for i in range(len(symbols)):
    code = codes[symbols[i]]
    L = len(code)

    avg_length += prob[i] * L
    entropy -= prob[i] * np.log2(prob[i])

    print(f"{symbols[i]:<8}{prob[i]:<8.3f}{code:<8}{L}")

# ---- Final Metrics ----
print(f"\nAverage Length = {avg_length:.3f} bits")
print(f"Entropy = {entropy:.3f} bits")
print(f"Efficiency = {(entropy/avg_length)*100:.2f} %")