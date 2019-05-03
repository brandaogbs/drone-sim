% Plot dos ângulos
figure(1)
subplot(1,2,1);

plot(ss_drone.z,    'LineWidth', 2, 'color', [0, 0.6, 1] );
hold on;
plot(ss_drone.phi,  'LineWidth', 2, 'color', [1, 0.36, 0.2]);
hold on;
plot(ss_drone.theta,'LineWidth', 2, 'color', [1, 0.6, 0]);
hold on;
plot(ss_drone.psi,  'LineWidth', 2, 'color', [0.4, 0, 0.8]);
lgd = legend({'Z','Phi', 'Theta','Psi'},'FontSize',12);

axis([30 1000 -0.1 0.6]);

legend('boxoff')
xlabel('Tempo (s)')
ylabel('Altura (m) / Angulos (rad)')
title('Resposta do Controlador 4DoF');
set(gca, 'FontSize', 18);

grid on;

% Plot das velocidades dos motores
subplot(1,2,2);
plot(w.om_1, 'LineWidth',2, 'color', [0, 0.6, 1]);
hold on;
plot(w.om_2, 'LineWidth',2, 'color', [1, 0.36, 0.2]);
hold on;
plot(w.om_3, 'LineWidth',2, 'color', [1, 0.6, 0]);
hold on;
plot(w.om_4, 'LineWidth',2, 'color', [0.4, 0, 0.8]);

axis([30 1000 450 520]);

lgd = legend({'Motor 1', 'Motor 2', 'Motor 3', 'Motor 4'}, 'FontSize', 12);

legend('boxoff')
xlabel('Tempo (s)')
ylabel('Velocidade de Rotacao dos Motores (rad/s)')
title('Resposta do Motor');
grid on;

set(gca, 'FontSize', 18);

