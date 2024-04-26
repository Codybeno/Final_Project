function derivatives()
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

    % Initialize arrays to store all data points
    allTimes = [];
    allRanges = [];
    allHeights = [];

    % Perform 100 simulation runs with random initial conditions
    for i = 1:100
        V = 2 + (10.5 - 2) * rand(1); % Random velocity within range
        Gam = -0.5 + (0.4 + 0.5) * rand(1); % Random flight path angle within range

        % Initial state vector
        xo = [V; Gam; H; R];

        % Solve the equations of motion using ODE solver
        [t, x] = ode23(@EqMotion, tspan, xo);

        % Concatenate data points
        allTimes = [allTimes; t];
        allRanges = [allRanges; x(:,4)];
        allHeights = [allHeights; x(:,3)];
    end

    % Polynomial fitting
    pRange = polyfit(allTimes, allRanges, 3); % 3rd degree polynomial for range
    pHeight = polyfit(allTimes, allHeights, 3); % 3rd degree polynomial for height

    % Compute derivatives
    dpRange = polyder(pRange);
    dpHeight = polyder(pHeight);

    % Time vector for plotting derivatives
    tFine = linspace(0, 6, 200);

    % Plot the derivatives
    figure;
    subplot(2,1,1);
    plot(tFine, polyval(dpRange, tFine), 'r-');
    title('d(Range)/d(Time)');
    xlabel('Time, s');
    ylabel('Range rate, m/s');
    grid on;

    subplot(2,1,2);
    plot(tFine, polyval(dpHeight, tFine), 'b-');
    title('d(Height)/d(Time)');
    xlabel('Time, s');
    ylabel('Height rate, m/s');
    grid on;
end