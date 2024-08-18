% Figure 5
% Define the function inline for partial pressure (given) 

f = @(t, p) (0.008889 * (100 - p)) ./ (0.00003 + (14636.7 * (p.^2 + 50) ./ ((p.^3 + 150 * p + 23400).^2))); 

 

% Initial condition and time vector 

p0 = 39; % Initial oxygen partial pressure (mmHg) 

tspan = [0 0.75]; % Time span (seconds) 

 

% Solve differential equations for different situations 

[t_exercise, p_exercise] = ode45(f, tspan, p0); 

[t_normal, p_normal] = ode45(f, tspan, p0 - 5); % Slightly lower initial pressure for normal 

[t_rest, p_rest] = ode45(f, tspan, p0 - 10); % Lower initial pressure for rest 

 

% Plot 

figure; 

plot(t_exercise, p_exercise, 'g-', 'LineWidth', 2); hold on; 

plot(t_normal, p_normal, 'b-', 'LineWidth', 2); 

plot(t_rest, p_rest, 'r-', 'LineWidth', 2); 

grid on; 

xlabel('Time in capillary (sec)'); 

ylabel('Oxygen Partial Pressure (mmHg)'); 

legend('Exercise', 'Normal', 'Rest'); 

title('Oxygen Partial Pressure in Various Situations'); 