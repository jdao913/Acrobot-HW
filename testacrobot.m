% test acrobot
clear all;

Duration = 20;
FPS = 30;

N = round(Duration*FPS);
xinit = zeros(4,1)+0.05*randn(4,1);

%u = regGoalAcrobot(xinit);

acrobotode = @(t,x) acrobot(x,regGoalAcrobot(x));

[t,y] = ode45(acrobotode,linspace(0,Duration,N),xinit);

figure(1);
clf;
tic;
for k = 1:N
    x1 = cos(y(k,1)+pi/2);
    y1 = sin(y(k,1)+pi/2);
    x2 = x1 + cos(y(k,1)+y(k,2)+pi/2);
    y2 = y1 + sin(y(k,1)+y(k,2)+pi/2);
    plot([0 x1 x2], [0 y1 y2], 'o-');
    axis([-2.2 2.2 -2.2 2.2]);
    title(sprintf('%.2f sec', toc));
    drawnow;
    pause(k/FPS - toc);
end
