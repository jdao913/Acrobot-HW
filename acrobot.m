%acrobot dynamics:  xdot = a(x) + B(x)*u
% x: [theta1; theta2; theta1dot; theta2dot]
% u: scalar control (torque applied to joint 2)

function [xdot, a, B] = acrobot(x, u)

damping = 0.1;
gravity = 9.8;

% inertia matrix
M = [3 + 2*cos(x(2)), 1+cos(x(2)); 1+cos(x(2)), 1];

% Coriolis, centripetal and graviational forces
c1 = x(4)*(2*x(3)+x(4))*sin(x(2)) + 2*gravity*sin(x(1)) + gravity*sin(x(1)+x(2));
c2 = -x(3)^2*sin(x(2)) + gravity*sin(x(1)+x(2));
 
% passive dynamics
a = [x(3:4); M \ [c1-damping*x(3); c2-damping*x(4)]];

% control gain; use B = [0;0; inv(M)] to allow control of both joints
B = [0;0; M \ [0;1]];

xdot = a + B*u;
