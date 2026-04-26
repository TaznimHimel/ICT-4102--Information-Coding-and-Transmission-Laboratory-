import numpy as np
import matplotlib.pyplot as plt

# Simulate a clean signal (a simple sine wave)
fs = 1000  # Sampling frequency
t = np.linspace(0, 1, fs)  # Time vector
freq = 5  # Frequency of the sine wave
clean_signal = np.sin(2 * np.pi * freq * t)

# Noise Characteristics
means = [0, 1, -1]  # Different means of noise
variances = [0.1, 1, 10]  # Different variances of noise

# Plot the clean signal and noisy signals
plt.figure(figsize=(12, 12))

for i, mean in enumerate(means):
    for j, variance in enumerate(variances):
        # Add random noise with specified mean and variance
        noise = np.random.normal(mean, np.sqrt(variance), fs)
        noisy_signal = clean_signal + noise
        
        # Plot each noisy signal
        plt.subplot(len(means), len(variances), i * len(variances) + j + 1)
        plt.plot(t, noisy_signal)
        plt.title(f"Mean: {mean}, Variance: {variance}")
        plt.xlabel("Time")
        plt.ylabel("Amplitude")

plt.tight_layout()
plt.show()

# Calculate Signal-to-Noise Ratio (SNR) for each combination of mean and variance
for mean in means:
    for variance in variances:
        noise = np.random.normal(mean, np.sqrt(variance), fs)
        snr = 10 * np.log10(np.var(clean_signal) / np.var(noise))
        print(f"SNR for Mean {mean} and Variance {variance}: {snr:.2f} dB")