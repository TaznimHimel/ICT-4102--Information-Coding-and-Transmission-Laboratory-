import numpy as np
import matplotlib.pyplot as plt

# Signal Parameters
fs = 2000                     # Sampling frequency
t = np.arange(0, 0.5, 1/fs)   # Time vector
f_sig = 10                    # Signal frequency (10 Hz)
signal = np.sin(2*np.pi*f_sig*t)   # Clean sine wave
N = len(t)

# -------------------------------
# 1. Random Noise (Uniform)
noise_random = 0.5 * (2 * np.random.rand(N) - 1)
sig_random = signal + noise_random

# -------------------------------
# 2. Thermal Noise (Gaussian)
thermal_std = 0.1
noise_thermal = thermal_std * np.random.randn(N)
sig_thermal = signal + noise_thermal

# -------------------------------
# 3. Impulse Noise (Spikes)
noise_impulse = np.zeros(N)
spike_locations = np.random.choice(N, 15, replace=False)
noise_impulse[spike_locations] = 1.5 * np.sign(np.random.randn(15))
sig_impulse = signal + noise_impulse

# -------------------------------
# 4. AWGN (Manual implementation)
snr_db = 5

# Signal power
signal_power = np.mean(signal**2)

# Convert SNR from dB to linear
snr_linear = 10**(snr_db/10)

# Noise power
noise_power = signal_power / snr_linear

# Generate noise
noise_awgn = np.sqrt(noise_power) * np.random.randn(N)
sig_awgn = signal + noise_awgn

# -------------------------------
# Visualization
plt.figure(figsize=(10, 10))

# Original Signal
plt.subplot(5,1,1)
plt.plot(t, signal, 'k')
plt.title("Original Clean Signal (Sine Wave)")
plt.grid()

# Random Noise
plt.subplot(5,1,2)
plt.plot(t, sig_random, 'r')
plt.title("Signal + Random (Uniform) Noise")
plt.grid()

# Thermal Noise
plt.subplot(5,1,3)
plt.plot(t, sig_thermal, 'm')
plt.title("Signal + Thermal Noise (Gaussian)")
plt.grid()

# Impulse Noise
plt.subplot(5,1,4)
plt.plot(t, sig_impulse, 'b')
plt.title("Signal + Impulse Noise (Spikes)")
plt.grid()

# AWGN
plt.subplot(5,1,5)
plt.plot(t, sig_awgn, 'g')
plt.title(f"Signal + AWGN (SNR = {snr_db} dB)")
plt.xlabel("Time (s)")
plt.grid()

plt.tight_layout()
plt.show()