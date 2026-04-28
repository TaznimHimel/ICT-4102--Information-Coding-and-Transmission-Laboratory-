import numpy as np
import matplotlib.pyplot as plt

# Error Probability p
p = np.arange(0, 1.01, 0.01)

# Channel Capacity array
C = np.zeros_like(p)

print("   p      Channel Capacity (C)")
print("---------------------------------")

for i in range(len(p)):

    if p[i] == 0 or p[i] == 1:
        H = 0
    else:
        H = -p[i]*np.log2(p[i]) - (1-p[i])*np.log2(1-p[i])

    C[i] = 1 - H

    print(f"{p[i]:.2f}      {C[i]:.4f}")

# Plot
plt.figure(figsize=(8,5))
plt.plot(p, C, linewidth=2)
plt.grid()

plt.title("Binary Symmetric Channel Capacity")
plt.xlabel("Error Probability (p)")
plt.ylabel("Channel Capacity (C)")

plt.show()