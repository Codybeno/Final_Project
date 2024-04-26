function simVariations()
    % Initialize global variables and constants
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
    V = sqrt(2 * m * g /(rho * S * (CL * cos(-atan(1 / LDmax)) - CD * sin(-atan(1 / LDmax)))));
    H = 2;					% Initial Height, m
    R = 0;					% Initial Range, m
    tspan = [0 6];			% Time span for simulation

    % Adjusted parameters for variation
    initialVelocities = [2, 3.55, 7.5]; % lower, nominal, higher velocities
    initialGammas = [-0.4, -0.18, 0.5]; % lower, nominal, higher angles

    % Setup for plots
    figure;
    colors = ['r', 'k', 'g']; % Colors for lower, nominal, and higher conditions

    % Loop for varying initial velocity
    subplot(2,1,1);
    hold on;
    for i = 1:length(initialVelocities)
        xo = [initialVelocities(i); -atan(1 / LDmax); H; R];
        [t, x] = ode23(@EqMotion, tspan, xo);
        plot(x(:,4), x(:,3), 'Color', colors(i));
    end
    xlabel('Range, m'), ylabel('Height, m'), title('Initial Velocity Variations'), grid;
    legend('Lower', 'Nominal', 'Higher');

    % Loop for varying initial flight path angle
    subplot(2,1,2);
    hold on;
    for i = 1:length(initialGammas)
        xo = [V; initialGammas(i); H; R];
        [t, x] = ode23(@EqMotion, tspan, xo);
        plot(x(:,4), x(:,3), 'Color', colors(i));
    end
    xlabel('Range, m'), ylabel('Height, m'), title('Initial Flight Path Angle Variations'), grid;
    legend('Lower', 'Nominal', 'Higher');
end