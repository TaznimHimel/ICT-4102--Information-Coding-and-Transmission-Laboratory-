import numpy as np
import matplotlib.pyplot as plt

# Number of bits
N = 1000

# Generate random binary input bits (0 or 1)
input_bits = np.random.randint(0, 2, N)

# Noiseless channel (output = input)
output_bits = input_bits.copy()

# Display first 20 bits
print("First 20 Input Bits:")
print(input_bits[:20])

print("First 20 Output Bits (After Noiseless Channel):")
print(output_bits[:20])

# Error calculation
errors = np.sum(input_bits != output_bits)

# Bit Error Rate (BER)
ber = errors / N

# Display results
print(f"\nTotal Bits Transmitted: {N}")
print(f"Number of Errors      : {errors}")
print(f"Bit Error Rate (BER)  : {ber:.6f}")

# Visualization (first 50 bits)
plt.figure(figsize=(10, 6))

# Input bits
plt.subplot(2,1,1)
plt.stem(range(50), input_bits[:50], basefmt=" ")
plt.title("Input Binary Signal (First 50 Bits)")
plt.xlabel("Bit Index")
plt.ylabel("Bit Value")
plt.ylim(-0.2, 1.2)
plt.grid()

# Output bits
plt.subplot(2,1,2)
plt.stem(range(50), output_bits[:50], linefmt='r-', markerfmt='ro', basefmt=" ")
plt.title("Output Binary Signal (Noiseless, First 50 Bits)")
plt.xlabel("Bit Index")
plt.ylabel("Bit Value")
plt.ylim(-0.2, 1.2)
plt.grid()

plt.tight_layout()
plt.show()