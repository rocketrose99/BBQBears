% plotting

figure(1)
plot(tout, om)
grid on
xlabel('time [s]')
ylabel('angular velocity of spacecraft [rad/s]')

figure(2)
plot(tout, eta(:,1))
hold on
grid on
plot(tout, eta(:,2))
plot(tout, eta(:,3))
xlabel('time [s]')
ylabel('wheels accelerations [rad/s^2]')

figure(3)
plot(tout, eta(:,4)*60/(2*pi))
hold on
grid on
plot(tout, eta(:,5)*60/(2*pi))
plot(tout, eta(:,6)*60/(2*pi))
xlabel('time [s]')
ylabel('gimbals rates [RPM]')

figure(4)
plot(tout, omW*60/(2*pi))
hold on
grid on
xlabel('time [s]')
ylabel('wheels rates [RPM]')

figure(5)
plot3(orb(:,1), orb(:,2), orb(:,3))
grid on
xlabel('X_{ECI} [km]')
ylabel('Y_{ECI} [km]')
zlabel('Z_{ECI} [km]')
hold on
plot3(orb(1,1), orb(1,2), orb(1,3),'k*')
axis equal
load('topo.mat', 'topo', 'topomap1');
[X,Y,Z] = sphere;
props.FaceColor= 'texture';
props.EdgeColor = 'none';
props.FaceLighting = 'phong';
props.CData = topo;
s=surface(6378*X,6378*Y,6378*Z,props);

figure(6)
plot(tout, omerr)
grid on
xlabel('time [s]')
ylabel('angular velocity error[rad/s]')

figure(7)
plot(tout, qdes, 'r*')
hold on
plot(tout, q, 'k--')
grid on
xlabel('time [s]')
ylabel('quaternions (actual and desired)')