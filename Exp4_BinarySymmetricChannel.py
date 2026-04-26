import numpy as np
import matplotlib.pyplot as plt

# Binary entropy function
def binary_entropy(p):
    p = np.clip(p, 1e-10, 1 - 1e-10)
    return -p * np.log2(p) - (1 - p) * np.log2(1 - p)

# Channel capacity function
def bsc_capacity(p):
    return 1 - binary_entropy(p)

# Input
p = float(input("Enter the probability of error (p) between 0 and 1: "))

# Validation
if p < 0 or p > 1:
    raise ValueError("p must be between 0 and 1")

# Calculation
capacity = bsc_capacity(p)

print(f"Channel Capacity of BSC with error probability {p}: {capacity:.4f} bits/channel use")

# Plot
p_values = np.linspace(0, 1, 200)
capacity_values = bsc_capacity(p_values)

plt.plot(p_values, capacity_values, label="Channel Capacity")
plt.title("Binary Symmetric Channel Capacity")
plt.xlabel("Error Probability (p)")
plt.ylabel("Channel Capacity (C)")
plt.grid(True)
plt.legend()
plt.show()





# ✅ Example 1

# Input:

# Enter the probability of error (p) between 0 and 1: 0.1

# Output:

# Channel Capacity of BSC with error probability 0.1: 0.5310 bits/channel use
# ✅ Example 2

# Input:

# Enter the probability of error (p) between 0 and 1: 0.2

# Output:

# Channel Capacity of BSC with error probability 0.2: 0.2781 bits/channel use
# ✅ Example 3 (Important Case)

# Input:

# Enter the probability of error (p) between 0 and 1: 0.5

# Output:

# Channel Capacity of BSC with error probability 0.5: 0.0000 bits/channel use

# 👉 Explanation: Channel becomes completely noisy

# ✅ Example 4 (Perfect Channel)

# Input:

# Enter the probability of error (p) between 0 and 1: 0

# Output:

# Channel Capacity of BSC with error probability 0.0: 1.0000 bits/channel use
# ✅ Example 5 (Always Flipped)

# Input:

# Enter the probability of error (p) between 0 and 1: 1

# Output:

# Channel Capacity of BSC with error probability 1.0: 1.0000 bits/channel use
# 🎯 Exam Tip (Write This Line)

# 👉 “Capacity is maximum (1 bit) at p = 0 and p = 1, and minimum (0 bit) at p = 0.5.”