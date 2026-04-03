
superheated_Table = readtable('Homework_5_Superheated_Water_Prop_Table.xlsx');

T_table = [150; 200; 250; 300; 400; 500; 600; 700; 800; 900; 1000; 1100; 1200; 1300];
P_table = [0.01, 0.05, 0.10, 0.20, 0.30, 0.40];

specific_Volume = superheated_Table(2:15 , 2:7);
internal_Energy = superheated_Table(20:33 , 2:7);

specific_Volume = table2array(specific_Volume);
internal_Energy = table2array(internal_Energy);

Tq = linspace(150,1300,30); % Temperature, degC
Pq = linspace(0.01,0.4,6); % Pressure, MPa

v_data = zeros(length(Pq),length(Tq));
u_data = zeros(length(Pq),length(Tq));

tic
for i = 1:length(Pq)
    for j = 1:length(Tq)
        v_data(i,j) = interp2(P_table,T_table,specific_Volume,Pq(i),Tq(j),'linear');
        u_data(i,j) = interp2(P_table,T_table,internal_Energy,Pq(i),Tq(j),'linear');
    
    end
end
time = toc;

save("p2_v_and_u_data.mat","v_data",'u_data')

f1 = figure('Name','Specific Volume');
plot(Tq,v_data,'LineWidth',2)
xlabel('Temperature (C)')
ylabel('Specific Volume (𝑚^3/𝑘𝑔)')
title('Specific Volume v Temperature')
legend(compose('P: %.2f' , Pq),'Location','best')
grid on
box on

f2 = figure('Name','Internal Energy');
plot(Tq,u_data,'LineWidth',2)
xlabel('Temperature (C)')
ylabel('Internal Energy(𝑘𝐽/𝑘𝑔)')
title('Internal Energy v Temperature')
legend(compose('P: %.2f' , Pq),'Location','best')
grid on
box on

saveas(f1,'p2_specific_volume_plot.png');
saveas(f2,'p2_internal_energy_plot.png');