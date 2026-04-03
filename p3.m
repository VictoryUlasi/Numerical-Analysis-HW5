superheated_Table = readtable('Homework_5_Superheated_Water_Prop_Table.xlsx');

T_table = [150; 200; 250; 300; 400; 500; 600; 700; 800; 900; 1000; 1100; 1200; 1300];
P_table = [0.01, 0.05, 0.10, 0.20, 0.30, 0.40];

specific_Volume = superheated_Table(2:15 , 2:7);
internal_Energy = superheated_Table(20:33 , 2:7);

specific_Volume = table2array(specific_Volume);
internal_Energy = table2array(internal_Energy);

Tq = linspace(150,1300,30); % Temperature, degC
Pq = linspace(0.01,0.4,6); % Pressure, MPa

[Tq_grid, Pq_grid] = meshgrid(Tq,Pq);

tic
v_data = interp2(P_table, T_table, specific_Volume,Pq_grid,Tq_grid,"linear");
u_data = interp2(P_table, T_table, internal_Energy,Pq_grid,Tq_grid,"linear");

time = toc;