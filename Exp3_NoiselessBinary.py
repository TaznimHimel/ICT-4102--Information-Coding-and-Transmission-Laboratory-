import numpy as np
import matplotlib.pyplot as plt

# Simulate a noiseless binary channel

# Step 1: Generate random binary data
data_length = 100  # Length of the binary data
transmitted_data = np.random.randint(0, 2, data_length)  # Generate random binary data (0s and 1s)

# Step 2: Simulate transmission over a noiseless channel
received_data = transmitted_data  # In a noiseless channel, transmitted and received data are the same

# Step 3: Display the transmitted and received data
print("Transmitted Data: ", transmitted_data)
print("Received Data:   ", received_data)

# Step 4: Visualize the data
plt.figure(figsize=(10, 2))
plt.subplot(1, 2, 1)
plt.plot(transmitted_data, label="Transmitted Data", color='blue')
plt.title("Transmitted Data")
plt.ylim(-0.5, 1.5)
plt.xlabel("Time")
plt.ylabel("Data (0 or 1)")

plt.subplot(1, 2, 2)
plt.plot(received_data, label="Received Data", color='green')
plt.title("Received Data")
plt.ylim(-0.5, 1.5)
plt.xlabel("Time")
plt.ylabel("Data (0 or 1)")

plt.tight_layout()
plt.show()