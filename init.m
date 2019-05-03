clear all
clc

%% Parametros do drone
g 	= -9.81;    	 				% Gravidade 						(m/s^2)
Jx 	= 0.0107;    					% Inércia eixo z					(kg*m^2)	
Jy 	= 0.0107;    					% Inércia eixo y					(kg*m^2)
Jz 	= 0.0209;	    				% Inércia eixo z 					(kg*m^2)
Jm 	= 5.41e-5;      				% Inércia do rotor					(kg*m^2)
Km 	= 1.465e-6;                     % Coef de torque			 		(Nm s^2/rad^2) 
Kf 	= 1.341e-5;                     % Coef de empuxo					(N  s^2/rad^2)  
m 	= 1.3;        					% Massa do drone					(kg)
L 	= 0.235;        				% Distância do centro ao motor		(m)

%% Redução de variáveis
a(1) = (Jy - Jz)/Jx;	
a(2) = Jm/Jx;
a(3) = (Jz - Jx)/Jy;
a(4) = Jm/Jy;
a(5) = (Jx - Jy)/Jz;

b(1) = 1/Jx; 
b(2) = 1/Jy;
b(3) = 1/Jz;

%% Comandos
cmd_z 		= 0;
cmd_phi 	= 0;
cmd_theta 	= 0;
cmd_psi 	= 0;

%% Ganhos dos controladores
% Proporcional
kp_z 		= 8;
kp_phi		= 1;
kp_theta	= 1;
kp_psi		= 1;

% Derivativo
kd_z 		= 10;
kd_phi		= 0.5;
kd_theta	= 0.5;
kd_psi		= 0.5;

% Integrativo
ki_z 		= 1;
ki_phi		= 0.1;
ki_theta	= 0.1;
ki_psi		= 0.2;

%% Parâmetros Limitantes
% Omega mínimo pro estado de Hover
omega_hover 	= sqrt((m*(-g))/(4*Kf));
omega_hover_max	= omega_hover + omega_hover*0.20;
omega_hover_min = omega_hover - omega_hover*0.10;

% Limitantes da saida do PID
deltaU1_max 	= Kf*4	*omega_hover_max^2;
deltaU1_min 	= Kf*4	*omega_hover_min^2;

deltaU2_max 	= Kf	*omega_hover^2;
deltaU3_max 	= Kf	*omega_hover^2;
deltaU4_max 	= Km*2	*omega_hover^2; 

% Limitates T%
%kth 	= 0.10705;
kth = 0.153;
bth = -17.276;
T_max 	= kth*omega_hover_max+bth;
T_min 	= kth*omega_hover_min+bth;
