function u = regGoalAcrobot(x) 

gravity = 9.8;

A = [0, 0, 1, 0; 0, 0, 0, 1; gravity, -gravity, 0, 0; -gravity, 3*gravity, 0, 0];
B = [0;0; -2; 5];
Q = diag([1;1;1;1]);

[X, L, G] = care(A, B, Q);
u = -G*x;
