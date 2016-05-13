#!/usr/bin/python
import matplotlib.pyplot as plt
import numpy as np

c1 = [-5, 5]
c2 = [-2, 1]

# Question 1
plt.figure(1)
plt.clf()
plt.plot(c1, [0, 0], 'ob', c2, [0, 0], 'og')
plt.show()

# Question 2
plt.figure(2)
plt.clf()
plt.plot(c1, np.power(c1, 2), 'ob', c2, np.power(c2, 2), 'og')
plt.hold()
plt.axis([-6, 6, -1, 26])
plt.plot([-6, 6], [25, 25], 'r--', [-6, 6], [4, 4], 'r--', [-6, 6], [14.5, 14.5], 'r-')
plt.text(-4, 15, 'Margin = 14.5')
plt.plot([-5, -2, 5], [25, 4, 25], 'r+')
plt.show()

# Question 3
plt.figure(3)
plt.clf()
plt.plot(c1, [0, 0], 'ob', c2, [0, 0], 'og')
plt.hold()
plt.plot([-3.8, 3.8], [0, 0], 'ro')
plt.axis([-6, 6, -0.06, 0.06])
plt.plot([-3.8, -3.8], [-0.06, 0.06], 'r--')
plt.plot([3.8, 3.8], [-0.06, 0.06], 'r--')
plt.text(-5.5, 0.02, 'Class 1')
plt.text(4.2, 0.02, 'Class 1')
plt.text(-1, 0.02, 'Class 2')
plt.text(-3.6, 0.04, '-3.8')
plt.text(3.2, 0.04, '3.8')
plt.show()

