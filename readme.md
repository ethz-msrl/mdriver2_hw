# MDriver2 Hardware
This repository contains the hardware design files of the `MDriver2` project.
## Control Hardware
![alt text](img/mdriver_control_hardware.png)
## Power Hardware
![alt text](img/mdriver_power_hardware.png)
## Experimental Setup Overview
![alt text](img/mdriver2_exp_setup.png)
![alt text](img/exp_setup_mdriver2.png)
- The input diode `D1` is optional and used to protect the supply `V1`.
- The charge resistor `R1` is used to limit excessive inrush current to the capcacitor bank but may not be needed for all supplies.
- The DC link voltage `VH` is monitored using an isolated DC measurement from the `capbank` PCB. Voltage values are transmitted via delta-sigma modulation to the microcontroller.