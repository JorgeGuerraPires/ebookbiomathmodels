##%% Solving ordinary differential equations numerically
##% See: https://it.mathworks.com/help/matlab/ref/ode45.html
##
##%% Simple ODE
####tspan = [0 5];
####y0 = 0;
####[t,y] = ode45(@(t,y) 2*t, tspan, y0);
####plot(t,y,'-o')
##
##
##% Second example
##[t,y] = ode45(@vdp1,[0 20],[2; 0]);
##plot(t,y(:,1),'-o',t,y(:,2),'-o')
##title('Solution of van der Pol Equation (\mu = 1) with ODE45');
##xlabel('Time t');
##ylabel('Solution y');
##legend('y_1','y_2')

##
##
##%% Third example
A = 1;
B = 2;
tspan = [0 5];
y0 = [0 0.01];
[t,y] = ode45(@(t,y) odefcn(t,y,A,B), tspan, y0);
plot(t,y(:,1),'-o',t,y(:,2),'-.')

##
##
##%% pk model
##T=20;
##clearance=0.1;
##input=10;
##tspan=[0,1];
##x0=0;
##
##[t,y] = ode45(@(t,x) pk_model(x,clearance, input), tspan, x0);
##
##input=0;
##tspan=[1,T];
##x0=y(end);
##
##[t2,y2] = ode45(@(t,x) pk_model(x,clearance, input), tspan, x0);
##
##
##t=[t; t2];
##y=[y; y2];
##
##plot(t,y)
##
##
##%% %% pk model 2
##T=80;
##clearance=[0.1 0.1];
##input=10;
##tspan=[0,1];
##x0=[0 0];
##
##
##[t,y] = ode45(@(t,x) pk_model_2(x,clearance, input), tspan, x0);
##
##
##input=0;
##tspan=[1,T];
##x0=y(end,:);
##
##[t2,y2] = ode45(@(t,x) pk_model_2(x,clearance, input), tspan, x0);
##
##
##t=[t; t2];
##y=[y; y2];
##
##plot(t,y(:,2))
##
##
