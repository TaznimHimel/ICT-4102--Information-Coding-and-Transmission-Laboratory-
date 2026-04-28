import numpy as np
import matplotlib.pyplot as plt

# Parameters
N = 10000
means = [0, 2, -2]
variances = [0.5, 1, 2]
colors = ['r', 'm', 'b']

plt.figure(figsize=(10, 8))

for i in range(len(means)):
    for j in range(len(variances)):

        mu = means[i]
        sigma = np.sqrt(variances[j])

        # Gaussian random noise generate
        noise = mu + sigma * np.random.randn(N)

        # Plot histogram
        plt.subplot(len(means), len(variances), i*len(variances) + j + 1)
        plt.hist(noise, bins=50, color=colors[i])

        plt.title(f'μ = {mu}, σ² = {variances[j]}')
        plt.xlabel('Amplitude')
        plt.ylabel('Frequency')

plt.tight_layout()
plt.show()