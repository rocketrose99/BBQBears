%initialize file for HW2 - VSCMG tracking
close all
clc
clear all

K = 10^(1)*eye(3); %gain matrix for omega error
mu = 10^(-20); %coefficient for exponential decay in wheels' gains
Ws0 = 200; %gain for wheels
Wg0 = 1; %gain for gimbal

%J = [0.6, 0, 0; 0, 0.5, 0; 0, 0, 0.2]; %ADAMUS values
J = [87.252, 0, 0; 0, 85.07, 0; 0, 0, 113.565];
Isw = 0.1;
Y = [0.03, 0, 0; 0, 0.13, 0; 0, 0, 0.04];
om0 = [0; 0; 0]*(2*pi/60); % S/C initial rates in RPM
q0 = [0; 0; 0; 1]; %S/C initial quaternion 

%VSCMGs initial conditions
Om0 = [500; 500; 500]*2*pi/60; % wheels' initial spin rates in RPM
g10 = [1; 0; 0];
s10 = [0; 1; 0];
t10 = [0; 0; 1];
g20 = [0; 1; 0];
s20 = [1; 0; 0];
t20 = [0; 0; -1];
g30 = [0; 0; 1];
s30 = [0; 1; 0];
t30 = [-1; 0; 0];
gamma10 = 0;
gamma20 = 0;
gamma30 = 0;

%%%ORBIT VALUES
G = 6.6742*10^(-20); %km^3/(kg*s^2) gravitational constant
m1 = 5.972*10^24; %kg mass of Earth
m2 = 1000; %kg mass of S/C
mugrav = G*(m1+m2); %km^3/s^2 gravitational parameter

%ECI initial conditions of S/C
r0 = [8000; 0; 6000]; %km 
v0 = [0; 8.5; 0]; %km/s
%v0 = [0; sqrt(mu/norm(r0)); 0]; %to have circular

h = cross(r0, v0); %km^2/s angular momentum vector
e = cross(v0, h)/mugrav - r0/norm(r0); %[-] eccentricity vector
enorm = norm(e); %printing norm of e vector
rp = (norm(h)^2/mugrav)*(1/(1+norm(e))); %km perigee
ra = (norm(h)^2/mugrav)*(1/(1-norm(e))); %km apogee
a = (rp+ra)/2; %km semi-major axis
T = (2*pi/sqrt(mugrav))*a^(3/2); %s period

tf = T;
