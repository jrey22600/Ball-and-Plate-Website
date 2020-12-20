clear all
close all
clc
sim=remApi('remoteApi');
sim.simxFinish(-1);
clientID=sim.simxStart('127.0.0.1',19999,true,true,5000,5);
if (clientID>-1)  
     disp('Connected to remote API server');
     
     set_param('ball_on_plate_simulink','SimulationCommand','start') 
    
     a=[0,0];
     [r,a(1)]=sim.simxGetObjectHandle(clientID, 'RotateX',sim.simx_opmode_blocking); %connects to the x-axis servo to control
     [r,a(2)]=sim.simxGetObjectHandle(clientID, 'RotateY0',sim.simx_opmode_blocking); %connects to the y-axis servo to control
       
     while true
     [res,retInts,retFloats,retStrings,retBuffer]=sim.simxCallScriptFunction(clientID,'Cam',sim.sim_scripttype_childscript,'CoordCalc',[],[],[],'',sim.simx_opmode_blocking);
     %recieves data from the Camera in Coppelia
     xcoord=retFloats(1); %x-coordinate of the ball on the plate
     ycoord=retFloats(2); %y-coordinate of the ball on the plate
 
     set_param('ball_on_plate_simulink/xcoord','Value',num2str(xcoord)); %sends the x-coordinate value to the xcoord variable constant block in simulink 
     pause(0.005); %always time to send data before recieving data
    
     set_param('ball_on_plate_simulink/ycoord','Value',num2str(ycoord)); %sends the y-coordinate value to the xcoord variable constant block in simulink
     pause(0.005); %always time to send data before recieving data
         
     thetax1 = get_param('ball_on_plate_simulink/thetax','RuntimeObject'); %recieves the desired angle of x-axis in radians as a matrix
     angleX1 = (thetax1.InputPort(1).Data) %takes the thetax 1x1 handle and converts it to a value
     
     thetay1 = get_param('ball_on_plate_simulink/thetay','RuntimeObject'); %recieves the desired angle of y-axis in radians as a matrix
     angleY1 = (thetay1.InputPort(1).Data); %takes the thetay 1x1 handle and converts it to a value
     
     sim.simxSetJointTargetPosition(clientID,a(1),angleX1,sim.simx_opmode_streaming); %sends the desired angle of x-axis in radians
     sim.simxSetJointTargetPosition(clientID,a(2),angleY1,sim.simx_opmode_streaming); %sends the desired angle of y-axis in radians
     
     
     end
else
      disp('Failed connecting to remote API server');
end
    sim.delete(); % call the destructor!
    
    disp('Program ended');