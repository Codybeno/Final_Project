function randomTraj()
    % Define global variables and constants
    global CL CD S m g rho	
    S = 0.017;				% Reference Area, m^2
    AR = 0.86;				% Wing Aspect Ratio
    e = 0.9;				% Oswald Efficiency Factor
    m = 0.003;				% Mass, kg
    g = 9.8;				% Gravitational acceleration, m/s^2
    rho = 1.225;			% Air density at Sea Level, kg/m^3	
    CLa = 3.141592 * AR / (1 + sqrt(1 + (AR / 2)^2));
    CDo = 0.02;				% Zero-Lift Drag Coefficient
    epsilon = 1 / (3.141592 * e * AR);	% Induced Drag Factor	
    CL = sqrt(CDo / epsilon);		% CL for Maximum Lift/Drag Ratio
    CD = CDo + epsilon * CL^2;		% Corresponding CD
    LDmax = CL / CD;			% Maximum Lift/Drag Ratio
    H = 2;					% Initial Height, m
    R = 0;					% Initial Range, m
    tspan = linspace(0, 6, 100);	% Time span for simulation with uniform time steps

    % Ranges for initial conditions
    velocityRange = [2, 7.5];  % Adjusted range for initial velocity
    gammaRange = [-0.5, 0.4];   % Range for initial flight path angle

    % Initialize figure
    figure;
    hold on;
    

    % Perform 100 simulation runs with random initial conditions
    for i = 1:100
        % Randomly select initial conditions within the specified ranges
        V = velocityRange(1) + (velocityRange(2) - velocityRange(1)) * rand(1);
        Gam = gammaRange(1) + (gammaRange(2) - gammaRange(1)) * rand(1);

        % Initial state vector
        xo = [V; Gam; H; R];

        % Solve the equations of motion using ODE solver
        [t, x] = ode23(@EqMotion, tspan, xo);

        % Plot the trajectory
        plot(x(:,4), x(:,3),'LineStyle', '-');
    end

    % Configure plot
    xlabel('Range, m');
    ylabel('Height, m');
    title('Randomized Initial Conditions Trajectories');
    grid on;

end