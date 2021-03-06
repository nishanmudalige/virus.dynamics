lambda = 5;
delta = 0.5;
bs = 0.25;
br = 0.24;
mu = 10^(-5);
a = 1;
epsilon = 0.9;

% x(1) = target cells (T)
% x(2) = infected sensitive (Is)
% x(3) = infected resistant (Ir)

g = @(t,x) [lambda - delta*x(1) - ((1-epsilon)*bs*x(2) + br*x(3))*x(1) ; 
    (1-epsilon)*(1-mu)*bs*x(2)*x(1) - a*x(2) ;
    br*x(1)*x(3) - a*x(3) + (1-epsilon)*mu*bs*x(2)*x(1)] ;
    
%[t,xa] = ode45(g,[0 20],[lambda/delta 1]);
[t,xa] = ode45(g,[0 20],[4 3 0]);

plot(t,xa(:,1), 'k', t, xa(:,2), 'g', t, xa(:,3), 'r', 'LineWidth', 1.2)

legend('     Target', '     Sensitive', '     Resistant')
legend('Location', 'NorthEast') % move legend to upper left