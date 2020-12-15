# Ball-on-Plate
-----------------------------------------------------------------------------------------
## 1. Introduction
The 2 DOF Ball Balancer or Project 2 is a system that will recognize the ball's motion on the plate and adjust its orientation to ensure that the ball is in control. MATLAB/Simulink will use a PD based control with multiple loops to control the system which will then be tested in CoppeliaSim. The system is a vision based control experiment that will communicate the balls position and two rotary servo motors will act on this to ensure that the ball will not fall off the plate.
### 1.1 Objectives
1. Create a mathematical model of the system using MATLAB/Simulink
2. Design a proportional-derivative control that will balance the ball on the plate
3. Simulate the MATLAB/Simulink control in CoppeliaSim to prove our PD control works 
4. Build a web page on GitHub that explains how the system works
### 1.2 Equipment
- 2 DOF Ball Balancer made by Quanser
- MATLAB/Simulink
- CoppeliaSim
- GitHub

## 2. Modeling
### 2.1 Background
<p align='center'>
  <img src="Images/ball.jpg">
  Figure 1. One Dimensional View of the Free Body Diagram
  </p>
Figure 1 shows the one dimensional view of the FBD of the ball and plate design. It includes a rotary servo motor that adjusts the plate to keep the ball on. The ball is allowed to move freely and the purpose of this program is to adjust and maintain stability. 

### 2.2 Nonlinear Equation of Motion
Force due to gravity: 

<p align='center'>
  <img src="Equations/Equation 1.gif">
  </p>

Force cause by ball rotation:  
<p align='center'>
  <img src="Equations/Equations 2.png">
  </p>

Where, rb  = J,bᵝdot(t)

Force on ball in x-direction: Fx,r = (J,b^xdoubledot(t))/(r,b^2)


Non-linear equation of motion: m,b*x,double dot(t) = m,b*g*sin𝛼(t) - (J,b^xdouble dot(t))/r,b^2

Acceleration of the ball: x,doubledot(t) = (m,b*g*sin𝛼(t)*rb2)/(m,b r,b^2 + J,b)
### 2.3 Relative Servo 
Relate motor angle to beam angle: sin𝛼(t) = (2*h)/(L,plate)

Take sine of motor shaft: sin𝛼(t) = (2*r,arm*sinθ,1(t))/(L,plate)

Equation of motion relating motor to ball: xdoubledot = (2*m,b*g*r,arm*r,b^2)/(L,plate*(m,b r,b^2+Jb)) * sinθ,1(t)

Approximation that sinθ,l(t) ≈ θ,l(t) yields linearized equation of motion:

xdoubledot = (2m,b*g*r,arm*r,b^2)/(L,plate*(mb rb2 + Jb)) * θl(t)

Tables of Variables 

<p align='center'>
  <img src="Images/table.GIF">
  </p>
  
## 3. Sensor Calibration
### 3.1 Background
### 3.2
### 3.3
## 4. Controller Design and Simulations
### 4.1 Background
### 4.2
### 4.3
## 5. Optional: Controller Design and Simulations

## 6. Checklist
