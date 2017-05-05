#!/usr/bin/python
import matplotlib.pyplot as plt

sensor1 = open("./mnt/average/master/1/sensor1.csv").read().splitlines()
sensor2 = open("./mnt/average/master/1/sensor2.csv").read().splitlines()
sensor3 = open("./mnt/average/1/sensor3.csv").read().splitlines()

label1, = plt.plot(sensor1, label="sensor1")
label2, = plt.plot(sensor2, label="sensor2")
label3, = plt.plot(sensor3, label="sensor3")
plt.legend(handles=[label1, label2, label3])
plt.title('Average')
plt.draw()
plt.show()
plt.savefig("average.png")
