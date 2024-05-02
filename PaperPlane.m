%   Example 1.3-1 Paper Airplane Flight Path
%	Copyright 2005 by Robert Stengel
%	August 23, 2005
    
    clear;
    clc;

	global CL CD S m g rho	
	S		=	0.017;			% Reference Area, m^2
	AR		=	0.86;			% Wing Aspect Ratio
	e		=	0.9;			% Oswald Efficiency Factor;
	m		=	0.003;			% Mass, kg
	g		=	9.8;			% Gravitational acceleration, m/s^2
	rho		=	1.225;			% Air density at Sea Level, kg/m^3	
	CLa		=	3.141592 * AR/(1 + sqrt(1 + (AR / 2)^2));
							% Lift-Coefficient Slope, per rad
	CDo		=	0.02;			% Zero-Lift Drag Coefficient
	epsilon	=	1 / (3.141592 * e * AR);% Induced Drag Factor	
	CL		=	sqrt(CDo / epsilon);	% CL for Maximum Lift/Drag Ratio
	CD		=	CDo + epsilon * CL^2;	% Corresponding CD
	LDmax	=	CL / CD;			% Maximum Lift/Drag Ratio
	Gam		=	-atan(1 / LDmax);	% Corresponding Flight Path Angle, rad
	V		=	sqrt(2 * m * g /(rho * S * (CL * cos(Gam) - CD * sin(Gam))));
							% Corresponding Velocity, m/s
	Alpha	=	CL / CLa;			% Corresponding Angle of Attack, rad
	
%	a) Equilibrium Glide at Maximum Lift/Drag Ratio
	H		=	2;			% Initial Height, m
	R		=	0;			% Initial Range, m
	to		=	0;			% Initial Time, sec
	tf		=	6;			% Final Time, sec
	tspan	=	[to tf];
	xo		=	[V;Gam;H;R];
	[ta,xa]	=	ode23('EqMotion',tspan,xo);
	
%	b) Oscillating Glide due to Zero Initial Flight Path Angle
	xo		=	[V;0;H;R];
	[tb,xb]	=	ode23('EqMotion',tspan,xo);

%	c) Effect of Increased Initial Velocity
	xo		=	[1.5*V;0;H;R];
	[tc,xc]	=	ode23('EqMotion',tspan,xo);

%	d) Effect of Further Increase in Initial Velocity
	xo		=	[3*V;0;H;R];
	[td,xd]	=	ode23('EqMotion',tspan,xo);
	
	figure
	plot(xa(:,4),xa(:,3),xb(:,4),xb(:,3),xc(:,4),xc(:,3),xd(:,4),xd(:,3))
	xlabel('Range, m'), ylabel('Height, m'), grid

	figure
	subplot(2,2,1)
	plot(ta,xa(:,1),tb,xb(:,1),tc,xc(:,1),td,xd(:,1))
	xlabel('Time, s'), ylabel('Velocity, m/s'), grid
	subplot(2,2,2)
	plot(ta,xa(:,2),tb,xb(:,2),tc,xc(:,2),td,xd(:,2))
	xlabel('Time, s'), ylabel('Flight Path Angle, rad'), grid
	subplot(2,2,3)
	plot(ta,xa(:,3),tb,xb(:,3),tc,xc(:,3),td,xd(:,3))
	xlabel('Time, s'), ylabel('Altitude, m'), grid
	subplot(2,2,4)
	plot(ta,xa(:,4),tb,xb(:,4),tc,xc(:,4),td,xd(:,4))
	xlabel('Time, s'), ylabel('Range, m'), grid


    %% Case A Variations
    
    init_velo_low = 2;      % m/s
    init_velo_high = 7.5;   % m/s
    init_velo_nom = 3.55;   % m/s
    
    init_flight_path_ang_low = -0.5;    % rad
    init_flight_path_ang_high = 0.4;    % rad
    init_flight_path_ang_nom = -0.18;   % rad

    % Plot Velocity Variations

    xo_low = [init_velo_low;Gam;H;R];
    xo_high = [init_velo_high;Gam;H;R];
    xo_nom = [init_velo_nom;Gam;H;R];

    [ta_low_velo, xa_low_velo] = ode23('EqMotion', tspan, xo_low);
    [ta_high_velo, xa_high_velo] = ode23('EqMotion', tspan, xo_high);
    [ta_nom_velo, xa_nom_velo] = ode23('EqMotion', tspan, xo_nom);
    
    figure;
    subplot(2,1,1);
    hold on;
    plot(xa_low_velo(:,4),xa_low_velo(:,3),'r',xa_high_velo(:,4),...
        xa_high_velo(:,3),'g',xa_nom_velo(:,4),xa_nom_velo(:,3),'k');
    xlabel('Range, m'), ylabel('Height, m'), grid
    title("Initial Velocity Variations");

    % Plot Flight Path Angle Variations
    
    xo_low = [V;init_flight_path_ang_low;H;R];
    xo_high = [V;init_flight_path_ang_high;H;R];
    xo_nom = [V;init_flight_path_ang_nom;H;R];

    [ta_low_flight_angle, xa_low_flight_angle] = ode23('EqMotion', ...
                                                        tspan, xo_low);
    [ta_high_flight_angle, xa_high_flight_angle] = ode23('EqMotion', ...
                                                          tspan, xo_high);
    [ta_nom_flight_angle, xa_nom_flight_angle] = ode23('EqMotion', ...
                                                        tspan, xo_nom);
    subplot(2,1,2);
    hold on;
    plot(xa_low_flight_angle(:,4),xa_low_flight_angle(:,3),'r',...
        xa_high_flight_angle(:,4),xa_high_flight_angle(:,3),'g',...
        xa_nom_flight_angle(:,4),xa_nom_flight_angle(:,3),'k');
    xlabel('Range, m'), ylabel('Height, m'), grid
    title("Initial Flight Path Angle Variations");

    %% Random Parameter Variations
